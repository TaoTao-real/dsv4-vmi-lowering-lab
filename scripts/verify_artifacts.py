#!/usr/bin/env python3

from __future__ import annotations

import argparse
import csv
import json
from pathlib import Path

from common import REPO, git_commit


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--commit", default=git_commit())
    args = parser.parse_args()

    artifact_root = REPO / "artifacts" / args.commit
    report_root = REPO / "reports" / args.commit
    with (artifact_root / "results.tsv").open() as stream:
        rows = list(csv.DictReader(stream, delimiter="\t"))

    outputs = list((artifact_root / "final-vpto").glob("**/*.vpto.mlir"))
    phase_case_roots = {
        row["phase_ir"] for row in rows
        if row["phase_ir"] and (REPO / row["phase_ir"]).exists()
    }
    summary = json.loads((report_root / "summary.json").read_text())
    manifest = json.loads((artifact_root / "run_manifest.json").read_text())

    errors = []
    if len(rows) != 120:
        errors.append(f"expected 120 result rows, found {len(rows)}")
    if any(row["status"] != "PASS" for row in rows):
        errors.append("not all result rows are PASS")
    if any(int(row["residual_vmi_ops"]) != 0 for row in rows):
        errors.append("at least one final VPTO contains a residual VMI operation")
    if len(outputs) != 120:
        errors.append(f"expected 120 final VPTO files, found {len(outputs)}")
    region_summary = summary["fusion_region_summary"]
    distribution = summary["fusion_region_size_distribution"]
    if sum(distribution.values()) != region_summary["regions"]:
        errors.append("region size distribution does not match region count")

    for variant in ("fusion_off", "fusion_on"):
        flags = manifest.get("variants", {}).get(variant, [])
        if "--enable-insert-sync" not in flags:
            errors.append(f"{variant} manifest does not enable synchronization insertion")

    key_results = artifact_root / "key-cases/results.tsv"
    if key_results.exists():
        with key_results.open() as stream:
            key_rows = list(csv.DictReader(stream, delimiter="\t"))
        if len(key_rows) != 16:
            errors.append(f"expected 16 key-case result rows, found {len(key_rows)}")
        fusion_on_rows = [
            row for row in key_rows if row["mode"] == "fusion-on-phases"
        ]
        if len(fusion_on_rows) != 8 or any(
            row["status"] != "PASS" for row in fusion_on_rows
        ):
            errors.append("not all eight key-case fusion-on phase exports passed")
        required_snapshots = {
            "after-fusion-region-gen.mlir",
            "before-vmi-loop-fusion.mlir",
            "after-vmi-loop-fusion.mlir",
            "after-vmi-load-store-elision.mlir",
        }
        snapshot_roots = list((artifact_root / "key-cases").glob("**/snapshots"))
        if len(snapshot_roots) != 8:
            errors.append(f"expected 8 key-case snapshot roots, found {len(snapshot_roots)}")
        for snapshot_root in snapshot_roots:
            present = {path.name for path in snapshot_root.glob("*.mlir")}
            if not required_snapshots.issubset(present):
                errors.append(f"incomplete key snapshots: {snapshot_root}")

    print(f"result rows:       {len(rows)}")
    print(f"final VPTO files:  {len(outputs)}")
    if len(phase_case_roots) != 120:
        errors.append(f"expected 120 phase case trees, found {len(phase_case_roots)}")

    print(f"phase case trees:  {len(phase_case_roots)}")
    print(f"fusion regions:    {region_summary['regions']}")
    print(f"residual VMI cases:{summary['cases_with_residual_vmi_ops']}")
    if errors:
        for error in errors:
            print(f"ERROR: {error}")
        raise SystemExit(1)
    print("artifact verification: PASS")


if __name__ == "__main__":
    main()
