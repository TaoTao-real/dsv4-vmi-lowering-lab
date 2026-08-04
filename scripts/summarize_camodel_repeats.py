#!/usr/bin/env python3

from __future__ import annotations

import argparse
import csv
import statistics
from collections import defaultdict
from pathlib import Path


def read_samples(path: Path) -> list[dict[str, str]]:
    with path.open(newline="") as stream:
        return list(csv.DictReader(stream, delimiter="\t"))


def fmt(value: float) -> str:
    return f"{value:.1f}"


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Summarize serial camodel repeat samples."
    )
    parser.add_argument("sample_dir", type=Path)
    args = parser.parse_args()

    sample_dir = args.sample_dir.resolve()
    samples = read_samples(sample_dir / "samples.tsv")
    if not samples:
        raise SystemExit("no samples found")
    grouped: dict[str, list[dict[str, str]]] = defaultdict(list)
    for row in samples:
        grouped[row["case"]].append(row)

    summary_rows: list[dict[str, str]] = []
    for case, rows in grouped.items():
        ticks = [int(row["total_tick"]) for row in rows if row["total_tick"].isdigit()]
        hashes = {row["output_sha256"] for row in rows if row["output_sha256"] != "NA"}
        if not ticks:
            continue
        summary_rows.append({
            "case": case,
            "samples": str(len(rows)),
            "exit_0": str(sum(row["status"] == "0" for row in rows)),
            "tick_min": str(min(ticks)),
            "tick_median": fmt(statistics.median(ticks)),
            "tick_max": str(max(ticks)),
            "tick_pstdev": fmt(statistics.pstdev(ticks)),
            "vloop": rows[0]["vloop"],
            "vld": rows[0]["vld"],
            "vst": rows[0]["vst"],
            "unique_output_hashes": str(len(hashes)),
            "output_sha256": ",".join(sorted(hashes)),
        })

    output_tsv = sample_dir / "summary.tsv"
    with output_tsv.open("w", newline="") as stream:
        writer = csv.DictWriter(
            stream, fieldnames=list(summary_rows[0]), delimiter="\t", lineterminator="\n"
        )
        writer.writeheader()
        writer.writerows(summary_rows)

    by_case = {row["case"]: row for row in summary_rows}

    def delta(new: str, old: str) -> str:
        if new not in by_case or old not in by_case:
            return "n/a"
        lhs = float(by_case[new]["tick_median"])
        rhs = float(by_case[old]["tick_median"])
        return f"{(lhs / rhs - 1.0) * 100:+.1f}%"

    lines = [
        "# Camodel Repeat Sampling",
        "",
        "## Provenance",
        "",
        "- Classification: historical-object repeat sampling.",
        "- Remote objects were built on 2026-08-03; these timings are not current-HEAD runtime evidence.",
        "- Remote Loop Fusion and Load/Store Elision source hashes match the local worktree; VecScope inference differs because the local worktree has an uncommitted Vbr fix.",
        "- Runs are serial and instruction counts come from `instr_exe.csv` dynamic call counts.",
        "- A nonzero host status means the result is diagnostic only unless separately accepted below.",
        f"- Collected rows: {len(samples)} across {len(summary_rows)} variants.",
        "",
        "## Results",
        "",
        "| Case | N | Exit 0 | Tick min | Median | Max | Stddev | VLOOP | VLD | VST | Stable hash |",
        "|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---|",
    ]
    for row in summary_rows:
        lines.append(
            f"| `{row['case']}` | {row['samples']} | {row['exit_0']} | "
            f"{row['tick_min']} | {row['tick_median']} | {row['tick_max']} | "
            f"{row['tick_pstdev']} | {row['vloop']} | {row['vld']} | {row['vst']} | "
            f"{'yes' if row['unique_output_hashes'] == '1' else 'no'} |"
        )

    lines.extend([
        "",
        "## Comparisons",
        "",
        f"- Softmax VMI base vs ordinary candidate: {delta('softmax_vmi_base', 'softmax_off')}.",
        f"- Softmax VMI elision vs VMI base: {delta('softmax_vmi_elide', 'softmax_vmi_base')}.",
        f"- Softmax VMI elision vs ordinary candidate: {delta('softmax_vmi_elide', 'softmax_off')}.",
        f"- RoPE loop fusion vs VMI base: {delta('rope_vmi_loop', 'rope_vmi_base')}.",
        f"- RoPE loop plus elision vs VMI base: {delta('rope_vmi_elide', 'rope_vmi_base')}.",
        f"- RMSNorm VMI on vs off: {delta('rmsnorm_on', 'rmsnorm_off')}.",
        "",
        "## Acceptance",
        "",
        "- Softmax: OFF and VMI outputs have identical hashes across repeats; CPU golden is still missing.",
        "- RoPE: output hashes differ between stages and host validation fails; performance is diagnostic only.",
        "- RMSNorm: OFF/ON output hashes differ and host validation fails; performance is diagnostic only.",
    ])
    (sample_dir / "report.md").write_text("\n".join(lines) + "\n")


if __name__ == "__main__":
    main()
