#!/usr/bin/env python3

from __future__ import annotations

import argparse
import csv
from collections import Counter
from pathlib import Path


REPO = Path(__file__).resolve().parents[1]


def read_tsv(path: Path) -> list[dict[str, str]]:
    with path.open(newline="") as stream:
        return list(csv.DictReader(stream, delimiter="\t"))


def write_tsv(path: Path, rows: list[dict[str, str]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as stream:
        writer = csv.DictWriter(
            stream, fieldnames=list(rows[0]), delimiter="\t", lineterminator="\n"
        )
        writer.writeheader()
        writer.writerows(rows)


def markdown_table(rows: list[dict[str, str]]) -> str:
    lines = [
        "| Priority | Status | Workload | Case | Correctness gate |",
        "|---|---|---|---|---|",
    ]
    for row in rows:
        lines.append(
            f"| {row['priority']} | `{row['status']}` | {row['workload']} | "
            f"`{row['case']}` | `{row['correctness_gate']}` |"
        )
    return "\n".join(lines)


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Join the 120-case static report with the curated performance inventory."
    )
    parser.add_argument(
        "--baseline",
        default="533887b4ae09635e9c7ddb5db7d7bf29c12f8347",
        help="PTOAS commit whose static lowering report should be used",
    )
    args = parser.parse_args()

    report_root = REPO / "reports" / args.baseline
    static_path = report_root / "case_lowering_status.tsv"
    performance_path = REPO / "manifests" / "performance_cases.tsv"
    static_rows = read_tsv(static_path)
    performance_rows = read_tsv(performance_path)
    selected = {row["case"]: row for row in performance_rows}

    matrix = []
    for row in static_rows:
        performance = selected.get(row["case"])
        if performance:
            evaluation_mode = "performance_and_static"
            priority = performance["priority"]
            performance_status = performance["status"]
            workload = performance["workload"]
            correctness_gate = performance["correctness_gate"]
            next_action = performance["next_action"]
        else:
            evaluation_mode = "static_only"
            priority = "S"
            performance_status = "not_selected"
            workload = "-"
            correctness_gate = "not_required_for_static_conclusion"
            next_action = "refresh_static_metrics_on_new_baseline"

        matrix.append({
            "case": row["case"],
            "evaluation_mode": evaluation_mode,
            "priority": priority,
            "performance_status": performance_status,
            "workload": workload,
            "compile_status": row["status"],
            "residual_vmi_ops": row["residual_vmi_ops"],
            "vmi_instances": row["phase_vmi_instances"],
            "local_boundaries": row["phase_local_boundaries"],
            "hard_boundaries": row["phase_hard_boundaries"],
            "fusion_regions": row["phase_regions"],
            "source_tileop_instances": row["source_tileop_instances"],
            "static_assessment": row["assessment"],
            "correctness_gate": correctness_gate,
            "next_action": next_action,
        })

    missing = sorted(set(selected) - {row["case"] for row in static_rows})
    if missing:
        raise SystemExit(f"performance cases missing from static report: {missing}")
    if len(matrix) != 120:
        raise SystemExit(f"expected 120 cases, found {len(matrix)}")

    write_tsv(report_root / "case_evaluation_matrix.tsv", matrix)

    modes = Counter(row["evaluation_mode"] for row in matrix)
    statuses = Counter(row["performance_status"] for row in matrix)
    summary = f"""# DSv4 Evaluation Inventory ({args.baseline[:12]})

## Coverage

- Total real PTO cases: {len(matrix)}
- Performance and static cases: {modes['performance_and_static']}
- Static-only cases: {modes['static_only']}
- Currently sampled A/B cases: {statuses['sample_ready_ab'] + statuses['sample_ready_diagnostic']}
- Harness worklist cases: {statuses['harness_required']}
- Macro cases deferred until micro-kernels stabilize: {statuses['macro_after_micro']}

The performance list is curated. A case is not performance-acceptance ready merely
because camodel returns ticks. Correct inputs, a trustworthy output contract, an
OFF/ON comparison with identical candidates where possible, and repeat sampling
remain mandatory.

## Performance Worklist

{markdown_table(performance_rows)}

## Static-Only Contract

Every other case is evaluated using compile status, VMI/local/hard classification,
FusionRegion count and size, loop-domain changes, VMI load/store elimination,
residual VMI operations, and a stable rejection reason. Compile time is not a
runtime performance metric.
"""
    (report_root / "evaluation_inventory.md").write_text(summary)


if __name__ == "__main__":
    main()
