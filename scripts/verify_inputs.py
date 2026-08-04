#!/usr/bin/env python3

from __future__ import annotations

import argparse
import csv
from pathlib import Path

from common import DSV4_ROOT, REPO, sha256


DEFAULT_MANIFEST = (
    REPO
    / "manifests"
    / "533887b4ae09635e9c7ddb5db7d7bf29c12f8347-inputs.tsv"
)


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Verify the checked-in DSv4 PTO snapshot byte-for-byte"
    )
    parser.add_argument("--root", type=Path, default=DSV4_ROOT)
    parser.add_argument("--manifest", type=Path, default=DEFAULT_MANIFEST)
    args = parser.parse_args()

    root = args.root.resolve()
    with args.manifest.open(newline="") as stream:
        expected_rows = list(csv.DictReader(stream, delimiter="\t"))

    errors: list[str] = []
    expected_paths: set[Path] = set()
    total_bytes = 0
    for row in expected_rows:
        relative = Path(row["case"])
        expected_paths.add(relative)
        path = root / relative
        if not path.is_file():
            errors.append(f"missing: {relative}")
            continue

        expected_bytes = int(row["bytes"])
        actual_bytes = path.stat().st_size
        total_bytes += actual_bytes
        if actual_bytes != expected_bytes:
            errors.append(
                f"size mismatch: {relative}: expected {expected_bytes}, "
                f"found {actual_bytes}"
            )
            continue

        expected_hash = row["sha256"].strip()
        actual_hash = sha256(path)
        if actual_hash != expected_hash:
            errors.append(
                f"sha256 mismatch: {relative}: expected {expected_hash}, "
                f"found {actual_hash}"
            )

    actual_paths = {
        path.relative_to(root) for path in root.glob("**/*.pto") if path.is_file()
    }
    for relative in sorted(actual_paths - expected_paths):
        errors.append(f"unexpected: {relative}")

    print(f"input root:     {root}")
    print(f"manifest:       {args.manifest}")
    print(f"expected files: {len(expected_paths)}")
    print(f"actual files:   {len(actual_paths)}")
    print(f"total bytes:    {total_bytes}")
    if errors:
        for error in errors:
            print(f"ERROR: {error}")
        raise SystemExit(1)
    print("input verification: PASS")


if __name__ == "__main__":
    main()
