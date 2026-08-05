#!/usr/bin/env python3

from __future__ import annotations

import argparse
import csv
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
from datetime import datetime, timezone


REPO = Path(__file__).resolve().parents[1]
MANIFEST_PATH = Path(__file__).with_name("cases.json")
WORK_ROOT = Path(os.environ.get("CAMODEL_WORK_ROOT", REPO / ".camodel-work"))

VARIANTS = {
    "ordinary": {
        "backend": "emitc",
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


def required_path(env_name: str, description: str) -> Path:
    value = os.environ.get(env_name)
    if not value:
        die(f"set {env_name} to {description}")
    path = Path(value).expanduser().resolve()
    if not path.exists():
        die(f"{env_name} does not exist: {path}")
    return path


def compiler_env() -> dict[str, str]:
    env = os.environ.copy()
    mlir_root = os.environ.get("MLIR_PYTHON_ROOT")
    if mlir_root:
        env["MLIR_PYTHON_ROOT"] = mlir_root
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
    cpp = root / "kernel.cpp"
    testcase = f"{case_name}_{variant}"
    command = [
        str(ptoas_bin),
        "--pto-arch=a5",
        "--pto-level=level3",
        f"--pto-backend={VARIANTS[variant]['backend']}",
        "--tile-lib-backend=ptodsl",
        *VARIANTS[variant]["flags"],
    ]
    if os.environ.get("PTODSL_PYTHON"):
        command.append(f"--ptodsl-python-exe={os.environ['PTODSL_PYTHON']}")
    ptodsl_path = os.environ.get("PTODSL_PKG_PATH", str(ptoas_source / "ptodsl"))
    command.append(f"--ptodsl-pkg-path={ptodsl_path}")
    command.extend((str(source), "-o", str(cpp)))
    run(command, env=compiler_env(), log=root / "compile.log")

    generator_command = [
        sys.executable,
        str(generator),
        "--input", str(cpp),
        "--testcase", testcase,
        "--output-root", str(root / "generated"),
        "--run-mode", "sim",
        "--soc-version", os.environ.get("SOC_VERSION", "Ascend910_9599"),
        "--aicore-arch", os.environ.get("AICORE_ARCH", "dav-c220-vec"),
    ]
    run(generator_command, log=root / "generate.log")
    generated = generated_case_dir(case_name, variant)
    patch_scalar_overrides(generated / "main.cpp", case["scalar_overrides"])

    provenance = {
        "created_utc": datetime.now(timezone.utc).isoformat(),
        "case": case_name,
        "variant": variant,
        "backend": VARIANTS[variant]["backend"],
        "kernel": case["kernel"],
        "pto": case["pto"],
        "pto_sha256": sha256(source),
        "scalar_overrides": case["scalar_overrides"],
        "compiler_command": command,
        "generator_command": generator_command,
        "ptoas_source": str(ptoas_source),
        "ptoas_commit": capture(["git", "rev-parse", "HEAD"], cwd=ptoas_source),
        "ptoas_bin": str(ptoas_bin),
        "ptoas_version": capture([str(ptoas_bin), "--version"]),
        "ascend_home_path": os.environ["ASCEND_HOME_PATH"],
        "ptodsl_python": os.environ.get("PTODSL_PYTHON"),
        "mlir_python_root": os.environ.get("MLIR_PYTHON_ROOT"),
        "soc_version": os.environ.get("SOC_VERSION", "Ascend910_9599"),
        "aicore_arch": os.environ.get("AICORE_ARCH", "dav-c220-vec"),
        "fixture_contract": "deterministic generated inputs; OFF/ON equality only",
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


def execute_generated(case_name: str, variant: str, log: Path) -> None:
    generated = generated_case_dir(case_name, variant)
    run_sh = generated / "run.sh"
    if not run_sh.is_file():
        die(f"case is not prepared: {generated}")
    run(["bash", str(run_sh)], cwd=generated, env=runtime_env(), log=log)


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


def resolve_kernel_symbol(library: Path, kernel: str) -> str:
    nm_output = capture(["nm", "-D", str(library)])
    for line in nm_output.splitlines():
        fields = line.split()
        if len(fields) < 3 or fields[-2] not in {"T", "W"}:
            continue
        symbol = fields[-1]
        demangled = capture(["c++filt", symbol])
        if demangled.startswith(f"{kernel}("):
            return symbol
    die(f"cannot resolve {kernel} symbol in {library}")


def parse_profile(profile_root: Path) -> tuple[str, int, int, int]:
    tick = "NA"
    for log in profile_root.rglob("*.log"):
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
    soc = os.environ.get("SOC_VERSION", "Ascend910_9599")
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
                result_root: Path, rows: list[list[str]]) -> None:
    generated = generated_case_dir(case_name, variant)
    provenance = case_dir(case_name, variant) / "provenance.json"
    if not provenance.is_file():
        die(f"case is not prepared: missing {provenance}")
    provenance_dir = result_root / "provenance"
    provenance_dir.mkdir(parents=True, exist_ok=True)
    shutil.copy2(provenance, provenance_dir / f"{case_name}.{variant}.json")
    execute_generated(
        case_name, variant, result_root / "logs" / f"{case_name}.{variant}.build.log"
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
        profile_root = result_root / "profiles" / case_name / variant / f"repeat-{repeat:02d}"
        profile_root.mkdir(parents=True, exist_ok=True)
        log = result_root / "logs" / f"{case_name}.{variant}.{repeat:02d}.log"
        command = [
            "msprof", "op", "simulator",
            f"--application={application}",
            f"--kernel-name={symbol}",
            "--launch-count=1",
            f"--soc-version={os.environ.get('SOC_VERSION', 'Ascend910_9599')}",
            f"--timeout={os.environ.get('CAMODEL_TIMEOUT', '300')}",
            f"--output={profile_root}",
        ]
        run(command, cwd=generated, env=simulator_env(build_dir), log=log)
        tick, vloop, vld, vst = parse_profile(profile_root)
        rows.append([
            case_name, variant, str(repeat), tick, str(vloop), str(vld),
            str(vst), output_hashes(generated), str(log), str(profile_root),
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
        for variant in variants:
            sample_case(
                case_name, manifest[case_name], variant, args.repeats,
                result_root, rows,
            )
    output = result_root / "samples.tsv"
    with output.open("w", newline="", encoding="utf-8") as stream:
        writer = csv.writer(stream, delimiter="\t")
        writer.writerow([
            "case", "variant", "repeat", "total_tick", "vloop", "vld",
            "vst", "output_sha256", "log", "profile_root",
        ])
        writer.writerows(rows)
    print(f"samples: {output}")


if __name__ == "__main__":
    main()
