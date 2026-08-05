#!/usr/bin/env python3

from __future__ import annotations

import argparse
import csv
import hashlib
import json
import os
from pathlib import Path
import re
import resource
import shutil
import subprocess
import sys
from datetime import datetime, timezone


REPO = Path(__file__).resolve().parents[1]
MANIFEST_PATH = Path(__file__).with_name("cases.json")
WORK_ROOT = Path(os.environ.get("CAMODEL_WORK_ROOT", REPO / ".camodel-work"))
DEFAULT_SOC_VERSION = "Ascend950PR_9599"
DEFAULT_AICORE_ARCH = "dav-c310-vec"

VARIANTS = {
    "ordinary": {
        "backend": "vpto",
        "flags": ("--enable-vmi=false", "--enable-op-fusion=false"),
    },
    "vmi_base": {
        "backend": "vpto",
        "flags": ("--enable-vmi=true", "--enable-op-fusion=false"),
    },
    "vmi_fused": {
        "backend": "vpto",
        "flags": ("--enable-vmi=true", "--enable-op-fusion=true"),
    },
}


def die(message: str) -> None:
    raise SystemExit(message)


def load_manifest() -> dict:
    manifest = json.loads(MANIFEST_PATH.read_text(encoding="utf-8"))
    if manifest.get("schema_version") != 1:
        die(f"unsupported manifest schema: {manifest.get('schema_version')}")
    return manifest


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def digest_mapping(values: dict[str, str]) -> str:
    payload = json.dumps(values, sort_keys=True, separators=(",", ":"))
    return hashlib.sha256(payload.encode("utf-8")).hexdigest()


def run(command: list[str], *, cwd: Path | None = None,
        env: dict[str, str] | None = None, log: Path | None = None) -> None:
    print("+", " ".join(command), flush=True)
    if log is None:
        subprocess.run(command, cwd=cwd, env=env, check=True)
        return
    log.parent.mkdir(parents=True, exist_ok=True)
    with log.open("w", encoding="utf-8") as stream:
        completed = subprocess.run(
            command,
            cwd=cwd,
            env=env,
            stdout=stream,
            stderr=subprocess.STDOUT,
            text=True,
        )
    if completed.returncode != 0:
        die(f"command failed ({completed.returncode}); see {log}")


def capture(command: list[str], *, cwd: Path | None = None) -> str:
    return subprocess.check_output(command, cwd=cwd, text=True).strip()


def capture_optional(command: list[str], *, cwd: Path | None = None) -> str:
    try:
        return subprocess.check_output(
            command, cwd=cwd, text=True, stderr=subprocess.DEVNULL
        ).strip()
    except (OSError, subprocess.CalledProcessError):
        return "unknown"


def required_path(env_name: str, description: str) -> Path:
    value = os.environ.get(env_name)
    if not value:
        die(f"set {env_name} to {description}")
    path = Path(value).expanduser().resolve()
    if not path.exists():
        die(f"{env_name} does not exist: {path}")
    return path


def ensure_open_file_limit(minimum: int = 65536) -> None:
    soft, hard = resource.getrlimit(resource.RLIMIT_NOFILE)
    if soft >= minimum:
        return
    if hard != resource.RLIM_INFINITY and hard < minimum:
        die(
            f"camodel requires RLIMIT_NOFILE >= {minimum}, but the hard limit "
            f"is {hard}"
        )
    try:
        resource.setrlimit(resource.RLIMIT_NOFILE, (minimum, hard))
    except (OSError, ValueError) as error:
        die(f"failed to raise RLIMIT_NOFILE from {soft} to {minimum}: {error}")


def compiler_env() -> dict[str, str]:
    env = os.environ.copy()
    roots = [
        os.environ.get("PTO_PYTHON_BUILD_ROOT"),
        os.environ.get("MLIR_PYTHON_ROOT"),
        os.environ.get("PTODSL_PKG_PATH"),
    ]
    python_path = [root for root in roots if root]
    if env.get("PYTHONPATH"):
        python_path.append(env["PYTHONPATH"])
    if python_path:
        env["PYTHONPATH"] = ":".join(python_path)
    return env


def select_names(selection: str, available: list[str]) -> list[str]:
    if selection == "all":
        return available
    names = [name.strip() for name in selection.split(",") if name.strip()]
    if not names:
        die("selection must not be empty")
    unknown = sorted(set(names) - set(available))
    if unknown:
        die(f"unknown selection {unknown}; choose from {available}")
    return names


def patch_scalar_overrides(main_cpp: Path, overrides: dict[str, int]) -> None:
    text = main_cpp.read_text(encoding="utf-8")
    for name, value in overrides.items():
        pattern = re.compile(
            rf"(?m)^(\s*(?:u?int(?:32|64)_t|size_t)\s+{re.escape(name)}\s*=\s*)"
            rf"[-+]?\d+(\s*;)"
        )
        text, count = pattern.subn(rf"\g<1>{value}\g<2>", text)
        if count != 1:
            die(f"expected one scalar declaration for {name} in {main_cpp}, found {count}")
    main_cpp.write_text(text, encoding="utf-8")


def link_vpto_object(cmake_file: Path, kernel_object: Path) -> None:
    text = cmake_file.read_text(encoding="utf-8")
    add_library = re.compile(
        r"(?m)^\s*add_library\((\S+)_kernel SHARED \1_kernel\.cpp launch\.cpp\)\s*$"
    )
    replacement = (
        f'set(VPTO_KERNEL_OBJECT "{kernel_object}")\n'
        "set_source_files_properties(${VPTO_KERNEL_OBJECT} PROPERTIES "
        "EXTERNAL_OBJECT TRUE GENERATED TRUE)\n"
        r"add_library(\1_kernel SHARED ${VPTO_KERNEL_OBJECT} launch.cpp)"
    )
    text, count = add_library.subn(replacement, text)
    if count != 1:
        die(f"expected one generated kernel target in {cmake_file}, found {count}")
    cmake_file.write_text(text, encoding="utf-8")


def materialize_entry_source(source: Path, output: Path, kernel: str) -> None:
    text = source.read_text(encoding="utf-8")
    pattern = re.compile(
        rf"(\bfunc\.func\s+@{re.escape(kernel)}\b.*?\battributes\s*\{{)"
        rf"([^}}]*)\}}",
        re.S,
    )
    match = pattern.search(text)
    if not match:
        die(f"cannot find function attributes for @{kernel} in {source}")
    attrs = match.group(2)
    if re.search(r"(?:^|,)\s*pto\.entry(?:\s|,|$)", attrs):
        output.write_text(text, encoding="utf-8")
        return
    replacement = f"{match.group(1)}pto.entry, {attrs}}}"
    output.write_text(
        text[:match.start()] + replacement + text[match.end():],
        encoding="utf-8",
    )


def case_dir(case_name: str, variant: str) -> Path:
    return WORK_ROOT / case_name / variant


def discover_generated_case_dir(generated_root: Path, testcase: str) -> Path:
    matches = sorted(
        metadata.parent
        for metadata in generated_root.rglob("validation_meta.env")
        if metadata.parent.name == testcase
    )
    if not matches:
        die(
            f"generated testcase {testcase} was not found under {generated_root}; "
            "run prepare first or inspect generate.log"
        )
    if len(matches) != 1:
        formatted = ", ".join(str(path) for path in matches)
        die(f"generated testcase {testcase} is ambiguous: {formatted}")
    return matches[0]


def generated_case_dir(case_name: str, variant: str) -> Path:
    testcase = f"{case_name}_{variant}"
    generated_root = case_dir(case_name, variant) / "generated"
    return discover_generated_case_dir(generated_root, testcase)


def binary_hashes(directory: Path) -> dict[str, str]:
    hashes = {
        path.name: sha256(path)
        for path in sorted(directory.glob("*.bin"))
        if path.is_file()
    }
    if not hashes:
        die(f"fixture generator produced no .bin files in {directory}")
    return hashes


def verify_fixture_manifests(
    case_name: str, manifests: dict[str, dict[str, str]]
) -> str:
    if not manifests:
        die(f"{case_name}: no fixture manifests to compare")
    baseline_variant = next(iter(manifests))
    baseline = manifests[baseline_variant]
    for variant, candidate in manifests.items():
        if candidate == baseline:
            continue
        baseline_names = set(baseline)
        candidate_names = set(candidate)
        missing = sorted(baseline_names - candidate_names)
        extra = sorted(candidate_names - baseline_names)
        changed = sorted(
            name
            for name in baseline_names & candidate_names
            if baseline[name] != candidate[name]
        )
        die(
            f"{case_name}: fixture mismatch between {baseline_variant} and "
            f"{variant}; missing={missing}, extra={extra}, changed={changed}"
        )
    return digest_mapping(baseline)


def generate_shared_fixture(
    case_name: str, variants: list[str], result_root: Path
) -> str:
    manifests: dict[str, dict[str, str]] = {}
    for variant in variants:
        generated = generated_case_dir(case_name, variant)
        run([sys.executable, "golden.py"], cwd=generated)
        manifests[variant] = binary_hashes(generated)
    digest = verify_fixture_manifests(case_name, manifests)
    fixture_dir = result_root / "fixtures"
    fixture_dir.mkdir(parents=True, exist_ok=True)
    report = {
        "case": case_name,
        "fixture_sha256": digest,
        "variants": manifests,
    }
    (fixture_dir / f"{case_name}.json").write_text(
        json.dumps(report, indent=2) + "\n", encoding="utf-8"
    )
    return digest


def prepare_case(case_name: str, case: dict, variant: str) -> None:
    ptoas_source = required_path("PTOAS_SOURCE", "the PTOAS source checkout")
    ptoas_bin = required_path("PTOAS_BIN", "the PTOAS launcher or executable")
    required_path("ASCEND_HOME_PATH", "the active CANN installation")
    generator = ptoas_source / "test/npu_validation/scripts/generate_testcase.py"
    if not generator.is_file():
        die(f"missing PTOAS testcase generator: {generator}")

    source = REPO / case["pto"]
    if not source.is_file():
        die(f"missing checked-in PTO input: {source}")

    root = case_dir(case_name, variant)
    root.mkdir(parents=True, exist_ok=True)
    compile_source = root / "input.pto"
    materialize_entry_source(source, compile_source, case["kernel"])
    scaffold_cpp = root / "scaffold.cpp"
    kernel_object = root / "kernel.o"
    testcase = f"{case_name}_{variant}"
    common_command = [
        str(ptoas_bin),
        "--pto-arch=a5",
        "--pto-level=level3",
        f"--pto-backend={VARIANTS[variant]['backend']}",
        "--tile-lib-backend=ptodsl",
        *VARIANTS[variant]["flags"],
    ]
    if os.environ.get("PTODSL_PYTHON"):
        common_command.append(
            f"--ptodsl-python-exe={os.environ['PTODSL_PYTHON']}"
        )
    ptodsl_path = os.environ.get("PTODSL_PKG_PATH", str(ptoas_source / "ptodsl"))
    common_command.append(f"--ptodsl-pkg-path={ptodsl_path}")
    ir_command = [
        *common_command, "--emit-vpto", str(compile_source),
        "-o", str(root / "kernel.vpto.mlir"),
    ]
    run(ir_command, env=compiler_env(), log=root / "emit-vpto.log")
    object_command = list(common_command)
    object_command.extend((str(compile_source), "-o", str(kernel_object)))
    run(object_command, env=compiler_env(), log=root / "compile.log")

    # The testcase generator currently parses EmitC C++, while the measured
    # variants are all VPTO objects. Generate a deterministic ordinary EmitC
    # scaffold only for signature, buffer-size, input, and launch metadata.
    scaffold_command = [
        str(ptoas_bin),
        "--pto-arch=a5",
        "--pto-level=level3",
        "--pto-backend=emitc",
        "--tile-lib-backend=ptodsl",
        "--enable-vmi=false",
        "--enable-op-fusion=false",
    ]
    if os.environ.get("PTODSL_PYTHON"):
        scaffold_command.append(
            f"--ptodsl-python-exe={os.environ['PTODSL_PYTHON']}"
        )
    scaffold_command.append(f"--ptodsl-pkg-path={ptodsl_path}")
    scaffold_command.extend((str(compile_source), "-o", str(scaffold_cpp)))
    run(scaffold_command, env=compiler_env(), log=root / "scaffold.log")

    generator_command = [
        sys.executable,
        str(generator),
        "--input", str(scaffold_cpp),
        "--testcase", testcase,
        "--output-root", str(root / "generated"),
        "--run-mode", "sim",
        "--soc-version", os.environ.get("SOC_VERSION", DEFAULT_SOC_VERSION),
        "--aicore-arch", os.environ.get("AICORE_ARCH", DEFAULT_AICORE_ARCH),
    ]
    run(generator_command, log=root / "generate.log")
    generated = generated_case_dir(case_name, variant)
    patch_scalar_overrides(generated / "main.cpp", case["scalar_overrides"])
    linked_object = generated / "kernel.o"
    shutil.copy2(kernel_object, linked_object)
    link_vpto_object(generated / "CMakeLists.txt", linked_object)

    provenance = {
        "created_utc": datetime.now(timezone.utc).isoformat(),
        "case": case_name,
        "variant": variant,
        "backend": VARIANTS[variant]["backend"],
        "kernel": case["kernel"],
        "pto": case["pto"],
        "pto_sha256": sha256(source),
        "materialized_pto_sha256": sha256(compile_source),
        "entry_contract": (
            "the experiment copy adds pto.entry to the manifest kernel; "
            "the checked-in DSv4 input is unchanged"
        ),
        "scalar_overrides": case["scalar_overrides"],
        "emit_vpto_command": ir_command,
        "compiler_command": object_command,
        "scaffold_command": scaffold_command,
        "generator_command": generator_command,
        "ptoas_source": str(ptoas_source),
        "ptoas_commit": capture_optional(
            ["git", "rev-parse", "HEAD"], cwd=ptoas_source
        ),
        "ptoas_bin": str(ptoas_bin),
        "ptoas_version": capture([str(ptoas_bin), "--version"]),
        "ascend_home_path": os.environ["ASCEND_HOME_PATH"],
        "ptodsl_python": os.environ.get("PTODSL_PYTHON"),
        "mlir_python_root": os.environ.get("MLIR_PYTHON_ROOT"),
        "soc_version": os.environ.get("SOC_VERSION", DEFAULT_SOC_VERSION),
        "aicore_arch": os.environ.get("AICORE_ARCH", DEFAULT_AICORE_ARCH),
        "fixture_contract": (
            "ordinary EmitC scaffold with deterministic generated inputs; "
            "measured kernel is the variant-specific VPTO object; "
            "OFF/ON equality only"
        ),
    }
    (root / "provenance.json").write_text(
        json.dumps(provenance, indent=2) + "\n", encoding="utf-8"
    )
    print(f"prepared {case_name}/{variant}: {generated}")


def runtime_env() -> dict[str, str]:
    env = os.environ.copy()
    pto_isa = required_path("PTO_ISA_ROOT", "the PTO-ISA checkout")
    env["PTO_ISA_ROOT"] = str(pto_isa)
    env.setdefault("RUN_MODE", "sim")
    env.setdefault("GOLDEN_MODE", "skip")
    return env


def execute_generated(case_name: str, variant: str, log: Path,
                      golden_mode: str | None = None) -> None:
    generated = generated_case_dir(case_name, variant)
    run_sh = generated / "run.sh"
    if not run_sh.is_file():
        die(f"case is not prepared: {generated}")
    env = runtime_env()
    if golden_mode is not None:
        env["GOLDEN_MODE"] = golden_mode
    run(["bash", str(run_sh)], cwd=generated, env=env, log=log)


def build_generated_sim(case_name: str, variant: str, log: Path) -> None:
    generated = generated_case_dir(case_name, variant)
    build_dir = generated / "build"
    build_dir.mkdir(parents=True, exist_ok=True)
    env = runtime_env()
    ascend = required_path("ASCEND_HOME_PATH", "the active CANN installation")
    host_include = ascend / "aarch64-linux/include"
    host_lib = ascend / "aarch64-linux/lib64"
    if host_include.is_dir():
        env["CPATH"] = ":".join(
            [str(host_include), *filter(None, [env.get("CPATH")])]
        )
        env["CPLUS_INCLUDE_PATH"] = ":".join(
            [str(host_include), *filter(None, [env.get("CPLUS_INCLUDE_PATH")])]
        )
    if host_lib.is_dir():
        env["PTO_CANN_EXTRA_LINK_DIRS"] = ":".join(
            [str(host_lib), *filter(None, [env.get("PTO_CANN_EXTRA_LINK_DIRS")])]
        )
        env["LIBRARY_PATH"] = ":".join(
            [str(host_lib), *filter(None, [env.get("LIBRARY_PATH")])]
        )
    run([sys.executable, "golden.py"], cwd=generated, env=env)
    commands = [
        [
            "cmake",
            f"-DSOC_VERSION={os.environ.get('SOC_VERSION', DEFAULT_SOC_VERSION)}",
            "-DENABLE_SIM_GOLDEN=ON",
            f"-DPTO_ISA_ROOT={env['PTO_ISA_ROOT']}",
            "..",
        ],
        ["cmake", "--build", ".", "-j"],
    ]
    log.parent.mkdir(parents=True, exist_ok=True)
    with log.open("w", encoding="utf-8") as stream:
        for command in commands:
            print("+", " ".join(command), flush=True)
            completed = subprocess.run(
                command,
                cwd=build_dir,
                env=env,
                stdout=stream,
                stderr=subprocess.STDOUT,
                text=True,
            )
            if completed.returncode != 0:
                die(f"command failed ({completed.returncode}); see {log}")


def output_hashes(generated: Path) -> str:
    outputs = generated / "outputs.txt"
    if not outputs.is_file():
        return "NA"
    hashes = []
    for name in outputs.read_text(encoding="utf-8").splitlines():
        path = generated / f"{name.strip()}.bin"
        if name.strip() and path.is_file():
            hashes.append(f"{name.strip()}={sha256(path)}")
    return ",".join(hashes) if hashes else "NA"


def output_paths(generated: Path) -> list[Path]:
    outputs = generated / "outputs.txt"
    if not outputs.is_file():
        die(f"generated case has no outputs.txt: {generated}")
    paths = [
        generated / f"{name.strip()}.bin"
        for name in outputs.read_text(encoding="utf-8").splitlines()
        if name.strip()
    ]
    missing = [str(path) for path in paths if not path.is_file()]
    if missing:
        die(f"generated outputs are missing: {missing}")
    return paths


def snapshot_outputs(generated: Path, destination: Path) -> None:
    destination.mkdir(parents=True, exist_ok=True)
    for path in output_paths(generated):
        shutil.copy2(path, destination / path.name)


def compare_binary_files(baseline: Path, candidate: Path) -> dict[str, object]:
    baseline_bytes = baseline.read_bytes()
    candidate_bytes = candidate.read_bytes()
    common_size = min(len(baseline_bytes), len(candidate_bytes))
    first_mismatch = next(
        (
            index
            for index in range(common_size)
            if baseline_bytes[index] != candidate_bytes[index]
        ),
        None,
    )
    if first_mismatch is None and len(baseline_bytes) != len(candidate_bytes):
        first_mismatch = common_size
    return {
        "equal": baseline_bytes == candidate_bytes,
        "baseline_size": len(baseline_bytes),
        "candidate_size": len(candidate_bytes),
        "baseline_sha256": sha256(baseline),
        "candidate_sha256": sha256(candidate),
        "first_mismatch_byte": first_mismatch,
    }


def write_output_comparison(
    case_name: str, variants: list[str], repeats: int, result_root: Path
) -> None:
    if len(variants) < 2:
        return
    baseline_variant = variants[0]
    comparisons = []
    for repeat in range(1, repeats + 1):
        baseline_dir = (
            result_root / "outputs" / case_name / baseline_variant
            / f"repeat-{repeat:02d}"
        )
        baseline_files = {
            path.name: path for path in baseline_dir.glob("*.bin")
        }
        for variant in variants[1:]:
            candidate_dir = (
                result_root / "outputs" / case_name / variant
                / f"repeat-{repeat:02d}"
            )
            candidate_files = {
                path.name: path for path in candidate_dir.glob("*.bin")
            }
            if set(candidate_files) != set(baseline_files):
                die(
                    f"{case_name}: output set differs between "
                    f"{baseline_variant} and {variant}"
                )
            for name, baseline in sorted(baseline_files.items()):
                comparisons.append({
                    "repeat": repeat,
                    "baseline_variant": baseline_variant,
                    "candidate_variant": variant,
                    "output": name,
                    **compare_binary_files(baseline, candidate_files[name]),
                })
    comparison_dir = result_root / "comparisons"
    comparison_dir.mkdir(parents=True, exist_ok=True)
    (comparison_dir / f"{case_name}.json").write_text(
        json.dumps(comparisons, indent=2) + "\n", encoding="utf-8"
    )


def create_private_directory(path: Path) -> None:
    path.mkdir(parents=True, exist_ok=True)
    path.chmod(0o700)


def resolve_kernel_symbol(library: Path, kernel: str) -> str:
    nm_output = capture(["nm", "-D", str(library)])
    for line in nm_output.splitlines():
        fields = line.split()
        if len(fields) < 3 or fields[-2] not in {"T", "W"}:
            continue
        symbol = fields[-1]
        demangled = capture(["c++filt", symbol])
        if (
            symbol == kernel
            or demangled == kernel
            or demangled.startswith(f"{kernel}(")
        ):
            return symbol
    die(f"cannot resolve {kernel} symbol in {library}")


def parse_profile(
    profile_root: Path, profiler_log: Path | None = None
) -> tuple[str, int, int, int]:
    tick = "NA"
    logs = list(profile_root.rglob("*.log"))
    if profiler_log is not None and profiler_log.is_file():
        logs.append(profiler_log)
    for log in logs:
        matches = re.findall(r"Total tick:\s*(\d+)", log.read_text(errors="replace"))
        if matches:
            tick = matches[-1]
    counts = {"vloop": 0, "vld": 0, "vst": 0}
    csv_files = list(profile_root.rglob("core0.veccore0_instr_exe.csv"))
    if csv_files:
        with csv_files[-1].open(newline="", encoding="utf-8") as stream:
            for row in csv.DictReader(stream):
                instr = row.get("instr", "")
                calls = int(row.get("call_count", "0") or 0)
                if "VLOOP" in instr:
                    counts["vloop"] += calls
                if instr.startswith(("RV_VLD", "VLD")):
                    counts["vld"] += calls
                if instr.startswith(("RV_VST", "VST", "VSST")):
                    counts["vst"] += calls
    return tick, counts["vloop"], counts["vld"], counts["vst"]


def simulator_env(build_dir: Path) -> dict[str, str]:
    env = runtime_env()
    ascend = required_path("ASCEND_HOME_PATH", "the active CANN installation")
    soc = os.environ.get("SOC_VERSION", DEFAULT_SOC_VERSION)
    candidates = [
        build_dir,
        ascend / "lib64",
        ascend / "devlib",
        ascend / "x86_64-linux/devlib",
        ascend / f"x86_64-linux/simulator/{soc}/lib",
        ascend / f"simulator/{soc}/lib",
    ]
    existing = [str(path) for path in candidates if path.is_dir()]
    if env.get("LD_LIBRARY_PATH"):
        existing.append(env["LD_LIBRARY_PATH"])
    env["LD_LIBRARY_PATH"] = ":".join(existing)
    return env


def sample_case(case_name: str, case: dict, variant: str, repeats: int,
                fixture_digest: str, result_root: Path,
                rows: list[list[str]]) -> None:
    ensure_open_file_limit()
    generated = generated_case_dir(case_name, variant)
    provenance = case_dir(case_name, variant) / "provenance.json"
    if not provenance.is_file():
        die(f"case is not prepared: missing {provenance}")
    provenance_dir = result_root / "provenance"
    provenance_dir.mkdir(parents=True, exist_ok=True)
    shutil.copy2(provenance, provenance_dir / f"{case_name}.{variant}.json")
    build_generated_sim(
        case_name, variant,
        result_root / "logs" / f"{case_name}.{variant}.build.log",
    )
    testcase = f"{case_name}_{variant}"
    build_dir = generated / "build"
    application = build_dir / f"{testcase}_sim"
    library = build_dir / f"lib{testcase}_kernel.so"
    if not application.is_file() or not library.is_file():
        die(f"generated run did not build {application} and {library}")
    symbol = resolve_kernel_symbol(library, case["kernel"])

    for repeat in range(1, repeats + 1):
        run([sys.executable, "golden.py"], cwd=generated)
        current_fixture = binary_hashes(generated)
        if digest_mapping(current_fixture) != fixture_digest:
            die(
                f"{case_name}/{variant}: fixture changed before "
                f"repeat {repeat}"
            )
        profile_root = result_root / "profiles" / case_name / variant / f"repeat-{repeat:02d}"
        create_private_directory(profile_root)
        log = result_root / "logs" / f"{case_name}.{variant}.{repeat:02d}.log"
        command = [
            "msprof", "op", "simulator",
            f"--application={application}",
            f"--kernel-name={symbol}",
            "--launch-count=1",
            f"--soc-version={os.environ.get('SOC_VERSION', DEFAULT_SOC_VERSION)}",
            f"--timeout={os.environ.get('CAMODEL_TIMEOUT', '300')}",
            f"--output={profile_root}",
        ]
        run(command, cwd=generated, env=simulator_env(build_dir), log=log)
        tick, vloop, vld, vst = parse_profile(profile_root, log)
        if tick == "NA":
            die(f"msprof produced no Total tick; see {log} and {profile_root}")
        snapshot_outputs(
            generated,
            result_root / "outputs" / case_name / variant
            / f"repeat-{repeat:02d}",
        )
        rows.append([
            case_name, variant, str(repeat), tick, str(vloop), str(vld),
            str(vst), fixture_digest, output_hashes(generated), str(log),
            str(profile_root),
        ])


def doctor(runtime: bool) -> None:
    manifest = load_manifest()
    required_path("PTOAS_SOURCE", "the PTOAS source checkout")
    required_path("PTOAS_BIN", "the PTOAS launcher or executable")
    required_path("ASCEND_HOME_PATH", "the active CANN installation")
    for name, case in manifest["cases"].items():
        source = REPO / case["pto"]
        if not source.is_file():
            die(f"{name}: missing {source}")
    if runtime:
        required_path("PTO_ISA_ROOT", "the PTO-ISA checkout")
        ensure_open_file_limit()
        for tool in ("cmake", "msprof", "nm", "c++filt"):
            if shutil.which(tool) is None:
                die(f"missing runtime tool: {tool}")
    print(f"doctor: PASS ({len(manifest['cases'])} cases)")


def model_run(case_name: str, case: dict, platform: str, device: int) -> None:
    pypto_lib = required_path("PYPTO_LIB_ROOT", "the pypto-lib checkout")
    script = pypto_lib / case["model_script"]
    if not script.is_file():
        die(f"missing model fixture source: {script}")
    python = os.environ.get("PYPTO_PYTHON", sys.executable)
    command = [
        python, str(script), "--platform", platform,
        "--device", str(device), *case["model_args"],
    ]
    run(command, cwd=script.parent, env=os.environ.copy())


def main() -> None:
    parser = argparse.ArgumentParser(description="DSv4 standalone camodel harness")
    subparsers = parser.add_subparsers(dest="command", required=True)

    doctor_parser = subparsers.add_parser("doctor")
    doctor_parser.add_argument("--runtime", action="store_true")

    for command in ("prepare", "run"):
        child = subparsers.add_parser(command)
        child.add_argument("--case", required=True)
        child.add_argument("--variant", required=True)

    sample_parser = subparsers.add_parser("sample")
    sample_parser.add_argument("--case", required=True)
    sample_parser.add_argument("--variant", required=True)
    sample_parser.add_argument("--repeats", type=int, default=10)
    sample_parser.add_argument("--tag", default=None)

    model_parser = subparsers.add_parser("model-run")
    model_parser.add_argument("--case", required=True)
    model_parser.add_argument(
        "--platform", default="a2a3sim", choices=("a2a3", "a2a3sim", "a5", "a5sim")
    )
    model_parser.add_argument("--device", type=int, default=0)

    args = parser.parse_args()
    if args.command == "doctor":
        doctor(args.runtime)
        return

    manifest = load_manifest()["cases"]
    cases = select_names(args.case, list(manifest))
    if args.command == "model-run":
        if len(cases) != 1:
            die("model-run accepts exactly one case")
        model_run(cases[0], manifest[cases[0]], args.platform, args.device)
        return

    variants = select_names(args.variant, list(VARIANTS))
    if args.command == "prepare":
        for case_name in cases:
            for variant in variants:
                prepare_case(case_name, manifest[case_name], variant)
        return
    if args.command == "run":
        for case_name in cases:
            for variant in variants:
                execute_generated(
                    case_name, variant,
                    case_dir(case_name, variant) / "standalone-run.log",
                )
        return

    if args.repeats < 1:
        die("--repeats must be positive")
    tag = args.tag or datetime.now().strftime("%Y%m%d-%H%M%S")
    result_root = WORK_ROOT / "results" / tag
    result_root.mkdir(parents=True, exist_ok=True)
    rows: list[list[str]] = []
    for case_name in cases:
        fixture_digest = generate_shared_fixture(
            case_name, variants, result_root
        )
        for variant in variants:
            sample_case(
                case_name, manifest[case_name], variant, args.repeats,
                fixture_digest, result_root, rows,
            )
        write_output_comparison(
            case_name, variants, args.repeats, result_root
        )
    output = result_root / "samples.tsv"
    with output.open("w", newline="", encoding="utf-8") as stream:
        writer = csv.writer(stream, delimiter="\t")
        writer.writerow([
            "case", "variant", "repeat", "total_tick", "vloop", "vld",
            "vst", "fixture_sha256", "output_sha256", "log", "profile_root",
        ])
        writer.writerows(rows)
    print(f"samples: {output}")


if __name__ == "__main__":
    main()
