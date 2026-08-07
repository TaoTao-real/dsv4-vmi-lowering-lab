#!/usr/bin/env python3

from __future__ import annotations

import argparse
import csv
import json
import os
import re
import signal
import shutil
import subprocess
import time
from pathlib import Path

from common import (
    DSV4_ROOT,
    KEY_PASSES,
    PTOAS,
    PTOAS_WORKTREE,
    REPO,
    command_env,
    compiler_command,
    compiler_flags,
    git_commit,
    safe_name,
    sha256,
)


def load_key_cases() -> list[tuple[str, Path]]:
    result = []
    with (REPO / "manifests/key_cases.tsv").open() as stream:
        for row in csv.DictReader(stream, delimiter="\t"):
            result.append((row["category"], Path(row["case"])))
    return result


def tilelib_pids_for_compiler(compiler_pid: int) -> set[int]:
    completed = subprocess.run(
        ("ps", "-axo", "pid=,ppid=,command="),
        stdout=subprocess.PIPE,
        text=True,
        check=True,
    )
    result = set()
    for line in completed.stdout.splitlines():
        fields = line.strip().split(maxsplit=2)
        if len(fields) != 3:
            continue
        if f"--socket /tmp/tilelib_daemon_{compiler_pid}.sock" in fields[2] and (
            "ptodsl.tilelib.serving.daemon" in fields[2]
            or "ptodsl.tilelib.serving.helper" in fields[2]
        ):
            result.add(int(fields[0]))
    return result


def cleanup_tilelib_processes(compiler_pid: int) -> None:
    tilelib_pids = tilelib_pids_for_compiler(compiler_pid)
    for sig in (signal.SIGTERM, signal.SIGKILL):
        for pid in tilelib_pids:
            try:
                os.kill(pid, sig)
            except ProcessLookupError:
                pass
        if sig == signal.SIGTERM and tilelib_pids:
            time.sleep(0.2)
            tilelib_pids = tilelib_pids_for_compiler(compiler_pid)


def run(command: list[str], log: Path, timeout: int) -> tuple[str, int, str]:
    start = time.monotonic()
    process = subprocess.Popen(
        command,
        env=command_env(),
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        start_new_session=True,
    )
    try:
        text, _ = process.communicate(timeout=timeout)
        status = "PASS" if process.returncode == 0 else "FAIL"
    except subprocess.TimeoutExpired:
        os.killpg(process.pid, signal.SIGKILL)
        text, _ = process.communicate()
        status = "TIMEOUT"
    finally:
        cleanup_tilelib_processes(process.pid)
    text = text or ""
    log.parent.mkdir(parents=True, exist_ok=True)
    log.write_text(text)
    normalize_text_artifact(log)
    elapsed = int(time.monotonic() - start)
    diagnostic = " ".join(text.splitlines()[-12:])[:800]
    return status, elapsed, diagnostic


def normalize_text_artifact(path: Path) -> None:
    """Remove compiler-printer whitespace noise from checked-in artifacts."""
    if not path.exists():
        return
    lines = path.read_text(errors="replace").splitlines()
    normalized = "\n".join(line.rstrip() for line in lines).rstrip("\n")
    path.write_text(normalized + "\n" if normalized else "")


def normalize_mlir_tree(root: Path) -> None:
    if not root.exists():
        return
    for path in root.glob("**/*.mlir"):
        normalize_text_artifact(path)


def is_successful_cached_run(output: Path, log: Path) -> bool:
    if not output.exists() or output.stat().st_size == 0 or not log.exists():
        return False
    log_text = log.read_text(errors="replace")
    return (
        "TileLib daemon stopped" in log_text
        and "Error:" not in log_text
        and "error:" not in log_text
    )


def export_all(
    commit: str,
    timeout: int,
    resume: bool,
    insert_sync: bool,
) -> list[dict[str, object]]:
    artifact_root = REPO / "artifacts" / commit
    final_root = artifact_root / "final-vpto"
    phase_root = artifact_root / "all-phase-ir"
    log_root = artifact_root / "logs/fusion-on"
    cases = sorted(DSV4_ROOT.glob("**/*.pto"))
    rows_by_case: dict[str, dict[str, object]] = {}
    result_path = artifact_root / "results.tsv"
    if resume and result_path.exists():
        with result_path.open() as stream:
            rows_by_case.update(
                (row["case"], dict(row))
                for row in csv.DictReader(stream, delimiter="\t")
            )
    for index, source in enumerate(cases, 1):
        relative = source.relative_to(DSV4_ROOT)
        output = final_root / f"{relative}.vpto.mlir"
        phase_tree = phase_root / relative.with_suffix("")
        output.parent.mkdir(parents=True, exist_ok=True)
        phase_tree.mkdir(parents=True, exist_ok=True)
        log = log_root / f"{relative}.log"
        if (
            resume
            and is_successful_cached_run(output, log)
            and any(phase_tree.glob("**/*.mlir"))
        ):
            normalize_text_artifact(output)
            normalize_mlir_tree(phase_tree)
            text = output.read_text()
            row = {
                "status": "PASS",
                "case": str(relative),
                "seconds": rows_by_case.get(str(relative), {}).get("seconds", "cached"),
                "input_sha256": sha256(source),
                "output": str(output.relative_to(REPO)),
                "phase_ir": str(phase_tree.relative_to(REPO)),
                "residual_vmi_ops": count_residual_vmi_ops(text),
                "diagnostic": "cached",
            }
            rows_by_case[str(relative)] = row
            print(f"ALL {index}/{len(cases)} CACHED {relative}", flush=True)
            continue
        output.unlink(missing_ok=True)
        shutil.rmtree(phase_tree)
        phase_tree.mkdir(parents=True)
        command = compiler_command(
            source, output, fusion=True, insert_sync=insert_sync
        )
        command[command.index("--emit-vpto"):command.index("--emit-vpto")] = [
            "--mlir-print-ir-after=pto-fusion-region-gen",
            f"--mlir-print-ir-tree-dir={phase_tree}",
        ]
        status, elapsed, diagnostic = run(
            command, log, timeout
        )
        residual = -1
        if status == "PASS":
            normalize_text_artifact(output)
            normalize_mlir_tree(phase_tree)
            text = output.read_text()
            residual = count_residual_vmi_ops(text)
        row = {
            "status": status,
            "case": str(relative),
            "seconds": elapsed,
            "input_sha256": sha256(source),
            "output": str(output.relative_to(REPO)) if output.exists() else "",
            "phase_ir": str(phase_tree.relative_to(REPO)) if phase_tree.exists() else "",
            "residual_vmi_ops": residual,
            "diagnostic": diagnostic,
        }
        rows_by_case[str(relative)] = row
        print(
            f"ALL {index}/{len(cases)} {status} {elapsed}s "
            f"residual={residual} {relative}",
            flush=True,
        )
        write_tsv(result_path, [rows_by_case[key] for key in sorted(rows_by_case)])
    rows = [rows_by_case[key] for key in sorted(rows_by_case)]
    write_tsv(result_path, rows)
    return rows


def count_residual_vmi_ops(text: str) -> int:
    count = 0
    for line in text.splitlines():
        stripped = line.lstrip()
        if stripped.startswith("pto.vmi.") or " = pto.vmi." in line:
            count += 1
    return count


CANONICAL_PHASES = (
    ("after-fusion-region-gen.mlir", "pto-fusion-region-gen", "After"),
    ("before-vmi-loop-fusion.mlir", "pto-vmi-loop-fusion", "Before"),
    ("after-vmi-loop-fusion.mlir", "pto-vmi-loop-fusion", "After"),
    (
        "after-vmi-load-store-elision.mlir",
        "pto-vmi-load-store-elision",
        "After",
    ),
)


IR_DUMP_HEADER = re.compile(
    r"^// -----// IR Dump (Before|After) (.+?) \((.*?)\) //----- //$"
)


def extract_phase_snapshots(log: Path, phase_root: Path) -> None:
    if phase_root.exists():
        shutil.rmtree(phase_root)
    phase_root.mkdir(parents=True)
    entries = []
    current = None
    ordinal = 0

    def close_current() -> None:
        nonlocal current
        if current is None:
            return
        stream, phase, pass_name, pass_arg, output = current
        stream.close()
        lines = output.read_text(errors="replace").splitlines()
        while lines and (
            not lines[-1].strip()
            or lines[-1].startswith("TileLib daemon ")
            or lines[-1].startswith("Info: ptodsl TileLib daemon")
        ):
            lines.pop()
        output.write_text("\n".join(line.rstrip() for line in lines) + "\n")
        entries.append((ordinal, phase, pass_name, pass_arg, output.name))
        current = None

    with log.open(errors="replace") as source:
        for line in source:
            match = IR_DUMP_HEADER.match(line.rstrip("\n"))
            if match:
                close_current()
                ordinal += 1
                phase, pass_name, pass_arg = match.groups()
                identity = re.sub(
                    r"[^A-Za-z0-9]+", "-", pass_arg or pass_name
                ).strip("-").lower()
                output = phase_root / (
                    f"{ordinal:04d}-{phase.lower()}-{identity}.mlir"
                )
                stream = output.open("w")
                stream.write(line)
                current = (stream, phase, pass_name, pass_arg, output)
            elif current is not None:
                current[0].write(line)
    close_current()

    with (phase_root / "index.tsv").open("w") as stream:
        stream.write("ordinal\tphase\tpass_name\tpass_arg\tfile\n")
        for number, phase, pass_name, pass_arg, output in entries:
            stream.write(
                f"{number}\t{phase}\t{pass_name}\t{pass_arg}\t{output}\n"
            )


def materialize_canonical_phase_snapshots(case_root: Path) -> None:
    phase_root = case_root / "phase-ir"
    snapshot_root = case_root / "snapshots"
    if snapshot_root.exists():
        shutil.rmtree(snapshot_root)
    snapshot_root.mkdir(parents=True)
    provenance = {}
    for alias, pass_name, when in CANONICAL_PHASES:
        matches = []
        for path in phase_root.glob(f"**/*{pass_name}.mlir"):
            first_line = path.read_text(errors="replace").splitlines()[0]
            if f"IR Dump {when}" in first_line:
                matches.append(path)
        if not matches:
            continue
        selected = []
        seen_hashes = set()
        for path in sorted(matches):
            digest = sha256(path)
            if digest in seen_hashes:
                continue
            seen_hashes.add(digest)
            selected.append(path)
        (snapshot_root / alias).write_text(
            "\n".join(path.read_text(errors="replace") for path in selected)
        )
        provenance[alias] = [
            str(path.relative_to(case_root)) for path in selected
        ]
    (snapshot_root / "provenance.json").write_text(
        json.dumps(provenance, indent=2) + "\n"
    )


def export_key_cases(
    commit: str,
    timeout: int,
    insert_sync: bool,
    resume: bool,
) -> list[dict[str, object]]:
    root = REPO / "artifacts" / commit / "key-cases"
    rows = []
    for category, relative in load_key_cases():
        source = DSV4_ROOT / relative
        case_root = root / relative.with_suffix("")
        case_root.mkdir(parents=True, exist_ok=True)

        fusion_off = case_root / "fusion-off.final.mlir"
        fusion_off_log = case_root / "fusion-off.log"
        if resume and is_successful_cached_run(fusion_off, fusion_off_log):
            status, elapsed, diagnostic = "PASS", "cached", "cached"
        else:
            fusion_off.unlink(missing_ok=True)
            status, elapsed, diagnostic = run(
                compiler_command(
                    source, fusion_off, fusion=False, insert_sync=insert_sync
                ),
                fusion_off_log,
                timeout,
            )
        if status == "PASS":
            normalize_text_artifact(fusion_off)
        rows.append({
            "category": category,
            "case": str(relative),
            "mode": "fusion-off",
            "status": status,
            "seconds": elapsed,
            "diagnostic": diagnostic,
        })

        fusion_on = case_root / "fusion-on.final.mlir"
        tree = case_root / "phase-ir"
        if tree.exists():
            shutil.rmtree(tree)
        snapshot_root = case_root / "snapshots"
        if snapshot_root.exists():
            shutil.rmtree(snapshot_root)
        command = compiler_command(
            source, fusion_on, fusion=True, insert_sync=insert_sync
        )
        fusion_on.unlink(missing_ok=True)
        command[command.index("--emit-vpto"):command.index("--emit-vpto")] = [
            "--mlir-print-ir-before=pto-vmi-loop-fusion",
            *(f"--mlir-print-ir-after={name}" for name in KEY_PASSES),
        ]
        fusion_on_log = case_root / "fusion-on.log"
        status, elapsed, diagnostic = run(
            command, fusion_on_log, timeout
        )
        if status == "PASS":
            normalize_text_artifact(fusion_on)
            extract_phase_snapshots(fusion_on_log, tree)
            materialize_canonical_phase_snapshots(case_root)
        rows.append({
            "category": category,
            "case": str(relative),
            "mode": "fusion-on-phases",
            "status": status,
            "seconds": elapsed,
            "diagnostic": diagnostic,
        })
        print(
            f"KEY {category} {status} {elapsed}s {relative}", flush=True
        )
    write_tsv(root / "results.tsv", rows)
    return rows


def write_tsv(path: Path, rows: list[dict[str, object]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    if not rows:
        return
    with path.open("w", newline="") as stream:
        writer = csv.DictWriter(
            stream, fieldnames=list(rows[0]), delimiter="\t", lineterminator="\n"
        )
        writer.writeheader()
        writer.writerows(rows)


def worktree_provenance() -> dict[str, object]:
    status = subprocess.check_output(
        ("git", "status", "--porcelain"), cwd=PTOAS_WORKTREE, text=True
    ).splitlines()
    tracked_sources = (
        "lib/PTO/Transforms/PTOInferVPTOVecScope.cpp",
        "lib/PTO/Transforms/PTOViewToMemref.cpp",
        "lib/PTO/Transforms/PTOVmiLoopFusion.cpp",
        "lib/PTO/Transforms/PTOVmiLoadStoreElision.cpp",
    )
    return {
        "dirty": bool(status),
        "status": status,
        "source_sha256": {
            relative: sha256(PTOAS_WORKTREE / relative)
            for relative in tracked_sources
            if (PTOAS_WORKTREE / relative).exists()
        },
    }


def portable_path(path: Path) -> str:
    try:
        return "$PTO_WORKSPACE/" + str(path.resolve().relative_to(REPO.parent.resolve()))
    except ValueError:
        return str(path)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--all", action="store_true", help="export all 120 final VPTO files")
    parser.add_argument("--keys", action="store_true", help="export key-case phase snapshots")
    parser.add_argument("--timeout", type=int, default=1800)
    parser.add_argument("--resume", action="store_true")
    parser.add_argument(
        "--insert-sync",
        action="store_true",
        help="enable PTOAS automatic synchronization insertion",
    )
    args = parser.parse_args()
    if not args.all and not args.keys:
        args.all = args.keys = True

    commit = git_commit()
    manifest = {
        "ptoas_worktree": portable_path(PTOAS_WORKTREE),
        "ptoas_commit": commit,
        "ptoas_binary": portable_path(PTOAS),
        "dsv4_root": portable_path(DSV4_ROOT),
        "variants": {
            "fusion_off": compiler_flags(False, args.insert_sync),
            "fusion_on": compiler_flags(True, args.insert_sync),
        },
        "case_count": len(list(DSV4_ROOT.glob("**/*.pto"))),
        "worktree": worktree_provenance(),
    }
    artifact_root = REPO / "artifacts" / commit
    artifact_root.mkdir(parents=True, exist_ok=True)
    (artifact_root / "run_manifest.json").write_text(
        json.dumps(manifest, indent=2) + "\n"
    )
    input_manifest = REPO / "manifests" / f"{commit}-inputs.tsv"
    input_manifest.parent.mkdir(parents=True, exist_ok=True)
    with input_manifest.open("w", newline="") as stream:
        writer = csv.writer(stream, delimiter="\t", lineterminator="\n")
        writer.writerow(("case", "bytes", "sha256"))
        for source in sorted(DSV4_ROOT.glob("**/*.pto")):
            writer.writerow((str(source.relative_to(DSV4_ROOT)), source.stat().st_size, sha256(source)))
    if args.all:
        export_all(commit, args.timeout, args.resume, args.insert_sync)
    if args.keys:
        export_key_cases(commit, args.timeout, args.insert_sync, args.resume)


if __name__ == "__main__":
    main()
