#!/usr/bin/env python3

from __future__ import annotations

import argparse
import csv
import json
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


def run(command: list[str], log: Path, timeout: int) -> tuple[str, int, str]:
    start = time.monotonic()
    try:
        completed = subprocess.run(
            command,
            env=command_env(),
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
            timeout=timeout,
        )
        text = completed.stdout or ""
        status = "PASS" if completed.returncode == 0 else "FAIL"
    except subprocess.TimeoutExpired as error:
        text = error.stdout or ""
        if isinstance(text, bytes):
            text = text.decode(errors="replace")
        status = "TIMEOUT"
    log.parent.mkdir(parents=True, exist_ok=True)
    log.write_text(text)
    elapsed = int(time.monotonic() - start)
    diagnostic = " ".join(text.splitlines()[-12:])[:800]
    return status, elapsed, diagnostic


def export_all(commit: str, timeout: int, resume: bool) -> list[dict[str, object]]:
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
        if resume and output.exists() and log.exists() and any(phase_tree.glob("**/*.mlir")):
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
        command = compiler_command(source, output, fusion=True)
        command[command.index("--emit-vpto"):command.index("--emit-vpto")] = [
            "--mlir-print-ir-after=pto-fusion-region-gen",
            f"--mlir-print-ir-tree-dir={phase_tree}",
        ]
        status, elapsed, diagnostic = run(
            command, log, timeout
        )
        residual = -1
        if status == "PASS":
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


def export_key_cases(commit: str, timeout: int) -> list[dict[str, object]]:
    root = REPO / "artifacts" / commit / "key-cases"
    rows = []
    for category, relative in load_key_cases():
        source = DSV4_ROOT / relative
        case_root = root / relative.with_suffix("")
        case_root.mkdir(parents=True, exist_ok=True)

        fusion_off = case_root / "fusion-off.final.mlir"
        status, elapsed, diagnostic = run(
            compiler_command(source, fusion_off, fusion=False),
            case_root / "fusion-off.log",
            timeout,
        )
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
        command = compiler_command(source, fusion_on, fusion=True)
        command[command.index("--emit-vpto"):command.index("--emit-vpto")] = [
            "--mlir-print-ir-before=pto-vmi-loop-fusion",
            *(f"--mlir-print-ir-after={name}" for name in KEY_PASSES),
            f"--mlir-print-ir-tree-dir={tree}",
        ]
        status, elapsed, diagnostic = run(
            command, case_root / "fusion-on.log", timeout
        )
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
        writer = csv.DictWriter(stream, fieldnames=list(rows[0]), delimiter="\t")
        writer.writeheader()
        writer.writerows(rows)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--all", action="store_true", help="export all 120 final VPTO files")
    parser.add_argument("--keys", action="store_true", help="export key-case phase snapshots")
    parser.add_argument("--timeout", type=int, default=1800)
    parser.add_argument("--resume", action="store_true")
    args = parser.parse_args()
    if not args.all and not args.keys:
        args.all = args.keys = True

    commit = git_commit()
    manifest = {
        "ptoas_worktree": str(PTOAS_WORKTREE),
        "ptoas_commit": commit,
        "ptoas_binary": str(PTOAS),
        "dsv4_root": str(DSV4_ROOT),
        "flags": [
            "--pto-arch=a5",
            "--pto-level=level3",
            "--pto-backend=vpto",
            "--tile-lib-backend=ptodsl",
            "--enable-vmi",
            "--enable-op-fusion",
            "--emit-vpto",
        ],
        "case_count": len(list(DSV4_ROOT.glob("**/*.pto"))),
    }
    artifact_root = REPO / "artifacts" / commit
    artifact_root.mkdir(parents=True, exist_ok=True)
    (artifact_root / "run_manifest.json").write_text(
        json.dumps(manifest, indent=2) + "\n"
    )
    input_manifest = REPO / "manifests" / f"{commit}-inputs.tsv"
    input_manifest.parent.mkdir(parents=True, exist_ok=True)
    with input_manifest.open("w", newline="") as stream:
        writer = csv.writer(stream, delimiter="\t")
        writer.writerow(("case", "bytes", "sha256"))
        for source in sorted(DSV4_ROOT.glob("**/*.pto")):
            writer.writerow((str(source.relative_to(DSV4_ROOT)), source.stat().st_size, sha256(source)))
    if args.all:
        export_all(commit, args.timeout, args.resume)
    if args.keys:
        export_key_cases(commit, args.timeout)


if __name__ == "__main__":
    main()
