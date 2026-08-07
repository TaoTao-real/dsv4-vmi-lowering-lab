#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


PATTERNS = {
    "vmi_candidates": r'pto\.tilelib\.impl\s*=\s*"vmi"',
    "principal_loops": r"pto\.vmi\.fusion\.principal_loop",
    "local_boundaries": r'pto\.vmi\.fusion\.boundary\s*=\s*"local"',
    "hard_boundaries": r'pto\.vmi\.fusion\.boundary\s*=\s*"hard"',
    "scf_for": r"\bscf\.for\b",
    "vecscope": r"\bpto\.vecscope\b",
    "vlds": r"\bpto\.vlds\b",
    "vsts": r"\bpto\.vsts\b",
    "mem_bar": r"\bpto\.mem_bar\b",
}

# Attributes such as pto.vmi.fusion.* remain as provenance after lowering. This
# pattern intentionally counts only operation syntax, not those attributes.
RESIDUAL_VMI_OP = re.compile(
    r'^\s*(?:%[-\w.]+\s*=\s*)?(?:pto\.vmi\.[-\w.]+\b|"pto\.vmi\.[-\w.]+")',
    re.MULTILINE,
)


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Extract stable structural metrics from A5 VPTO artifacts."
    )
    parser.add_argument("artifacts", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()

    paths = sorted(args.artifacts.glob("*/*/kernel.vpto.mlir"))
    if not paths:
        raise SystemExit(f"no VPTO artifacts found under {args.artifacts}")

    args.output.parent.mkdir(parents=True, exist_ok=True)
    fields = ["case", "variant", *PATTERNS, "residual_vmi_ops"]
    with args.output.open("w", newline="") as stream:
        writer = csv.DictWriter(
            stream, fieldnames=fields, delimiter="\t", lineterminator="\n"
        )
        writer.writeheader()
        for path in paths:
            text = path.read_text()
            row = {
                "case": path.parts[-3],
                "variant": path.parts[-2],
                **{
                    name: len(re.findall(pattern, text))
                    for name, pattern in PATTERNS.items()
                },
                "residual_vmi_ops": len(RESIDUAL_VMI_OP.findall(text)),
            }
            writer.writerow(row)

    print(f"wrote {len(paths)} rows to {args.output}")


if __name__ == "__main__":
    main()
