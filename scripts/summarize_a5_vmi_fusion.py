#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import statistics
from collections import defaultdict
from pathlib import Path


VARIANTS = ["ordinary", "vmi_candidate", "vmi_loop", "vmi_fused"]
EXPECTED_CASES = {
    "decode_comb_sinkhorn",
    "decode_rmsnorm",
    "decode_rmsnorm_rope",
    "prefill_comb_sinkhorn",
    "prefill_rope",
    "prefill_softmax",
}


def percentage(new: float, old: float) -> float:
    return (new / old - 1.0) * 100.0


def load_static_metrics(path: Path) -> dict[tuple[str, str], dict[str, str]]:
    with path.open(newline="") as stream:
        rows = list(csv.DictReader(stream, delimiter="\t"))
    return {(row["case"], row["variant"]): row for row in rows}


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Validate and summarize serial A5 A/B/C/D samples."
    )
    parser.add_argument("report_dir", type=Path)
    parser.add_argument(
        "--expected-case",
        action="append",
        default=[],
        help="expected case name; repeat for each case (defaults to the original six-case set)",
    )
    args = parser.parse_args()

    expected_cases = set(args.expected_case) or EXPECTED_CASES
    expected_samples = len(expected_cases) * len(VARIANTS) * 5

    samples_path = args.report_dir / "samples.tsv"
    with samples_path.open(newline="") as stream:
        rows = list(csv.DictReader(stream, delimiter="\t"))

    if len(rows) != expected_samples:
        raise SystemExit(
            f"expected {expected_samples} samples, found {len(rows)}"
        )
    cases = {row["case"] for row in rows}
    variants = {row["variant"] for row in rows}
    if cases != expected_cases:
        raise SystemExit(f"unexpected case set: {sorted(cases)}")
    if variants != set(VARIANTS):
        raise SystemExit(f"unexpected variant set: {sorted(variants)}")

    groups: dict[tuple[str, str], list[dict[str, str]]] = defaultdict(list)
    for row in rows:
        groups[(row["case"], row["variant"])].append(row)
    for key, values in groups.items():
        repeats = sorted(int(row["repeat"]) for row in values)
        if repeats != [1, 2, 3, 4, 5]:
            raise SystemExit(f"{key} has invalid repeats: {repeats}")

    summary: list[dict[str, object]] = []
    for (case, variant), values in groups.items():
        durations = [float(row["task_duration_us"]) for row in values]
        hashes = sorted({row["output_sha256"] for row in values})
        summary.append(
            {
                "case": case,
                "variant": variant,
                "n": len(durations),
                "median_us": statistics.median(durations),
                "min_us": min(durations),
                "max_us": max(durations),
                "stdev_us": statistics.pstdev(durations),
                "hashes": hashes,
            }
        )
    summary.sort(key=lambda item: (item["case"], VARIANTS.index(item["variant"])))

    with (args.report_dir / "summary.tsv").open("w", newline="") as stream:
        writer = csv.writer(stream, delimiter="\t", lineterminator="\n")
        writer.writerow(
            [
                "case",
                "variant",
                "n",
                "median_us",
                "min_us",
                "max_us",
                "stdev_us",
                "hash_count",
                "hashes",
            ]
        )
        for item in summary:
            writer.writerow(
                [
                    item["case"],
                    item["variant"],
                    item["n"],
                    f'{item["median_us"]:.3f}',
                    f'{item["min_us"]:.3f}',
                    f'{item["max_us"]:.3f}',
                    f'{item["stdev_us"]:.3f}',
                    len(item["hashes"]),
                    ",".join(item["hashes"]),
                ]
            )

    static = load_static_metrics(args.report_dir / "static_metrics.tsv")
    by_key = {(item["case"], item["variant"]): item for item in summary}
    with (args.report_dir / "comparison.tsv").open("w", newline="") as stream:
        fields = [
            "case",
            "ordinary_us",
            "candidate_us",
            "loop_us",
            "fused_us",
            "candidate_vs_ordinary_pct",
            "loop_vs_candidate_pct",
            "elision_vs_loop_pct",
            "fused_vs_ordinary_pct",
            "cross_variant_hash",
            "vmi_coverage",
            "acceptance",
        ]
        writer = csv.DictWriter(
            stream, fieldnames=fields, delimiter="\t", lineterminator="\n"
        )
        writer.writeheader()
        for case in sorted(cases):
            items = [by_key[(case, variant)] for variant in VARIANTS]
            medians = [float(item["median_us"]) for item in items]
            hashes = {digest for item in items for digest in item["hashes"]}
            candidate_metrics = static[(case, "vmi_candidate")]
            candidate_count = int(
                candidate_metrics.get(
                    "selected_vmi_candidates", candidate_metrics["vmi_candidates"]
                )
            )
            if candidate_count == 0:
                coverage = "fallback_only"
                acceptance = "no_vmi_fusion_conclusion"
            elif len(hashes) != 1:
                coverage = "vmi_active"
                acceptance = "diagnostic_correctness_mismatch"
            else:
                coverage = "vmi_active"
                acceptance = "cross_variant_pass"
            writer.writerow(
                {
                    "case": case,
                    "ordinary_us": f"{medians[0]:.3f}",
                    "candidate_us": f"{medians[1]:.3f}",
                    "loop_us": f"{medians[2]:.3f}",
                    "fused_us": f"{medians[3]:.3f}",
                    "candidate_vs_ordinary_pct": f"{percentage(medians[1], medians[0]):+.2f}",
                    "loop_vs_candidate_pct": f"{percentage(medians[2], medians[1]):+.2f}",
                    "elision_vs_loop_pct": f"{percentage(medians[3], medians[2]):+.2f}",
                    "fused_vs_ordinary_pct": f"{percentage(medians[3], medians[0]):+.2f}",
                    "cross_variant_hash": "PASS" if len(hashes) == 1 else "MISMATCH",
                    "vmi_coverage": coverage,
                    "acceptance": acceptance,
                }
            )

    with (args.report_dir / "run_manifest.tsv").open("w", newline="") as stream:
        fields = [
            "case",
            "variant",
            "repeat",
            "status",
            "task_time_evidence",
            "log_evidence",
            "output_sha256",
        ]
        writer = csv.DictWriter(
            stream, fieldnames=fields, delimiter="\t", lineterminator="\n"
        )
        writer.writeheader()
        for row in rows:
            base = f'${{RESULT_ROOT}}/{row["case"]}'
            sample = f'{row["variant"]}-{row["repeat"]}'
            writer.writerow(
                {
                    "case": row["case"],
                    "variant": row["variant"],
                    "repeat": row["repeat"],
                    "status": "pass",
                    "task_time_evidence": f"{base}/profiles/{sample}/**/task_time_*.csv",
                    "log_evidence": f"{base}/logs/{sample}.log",
                    "output_sha256": row["output_sha256"],
                }
            )

    print(
        f"validated {len(rows)} samples "
        f"({len(cases)} cases x {len(VARIANTS)} variants x 5 repeats)"
    )
    print(f"wrote {args.report_dir / 'summary.tsv'}")
    print(f"wrote {args.report_dir / 'comparison.tsv'}")
    print(f"wrote {args.report_dir / 'run_manifest.tsv'}")


if __name__ == "__main__":
    main()
