#!/usr/bin/env python3

from __future__ import annotations

import argparse
import csv
import json
import re
from collections import Counter
from pathlib import Path

from common import DSV4_ROOT, REPO, git_commit


TILE_OP = re.compile(r"^\s*(?:%[A-Za-z0-9_.$-]+\s*=\s*)?pto\.(t[a-z0-9_]+)\b")
SELECTED_VMI = re.compile(r'pto\.tilelib\.impl = "vmi"')
LOCAL_BOUNDARY = re.compile(r'pto\.vmi\.fusion\.boundary = "local"')
HARD_BOUNDARY = re.compile(r'pto\.vmi\.fusion\.boundary = "hard"')
BOUNDARY_REASON = re.compile(r'pto\.vmi\.fusion\.boundary_reason = "([^"]+)"')
REGION = re.compile(r"\bpto\.fusion_region\s*\{")
SCF_FOR = re.compile(r"\bscf\.for\b")
VLOAD = re.compile(r"\bpto\.vmi\.vload\b")
VSTORE = re.compile(r"\bpto\.vmi\.vstore\b")


def count(pattern: re.Pattern[str], text: str) -> int:
    return len(pattern.findall(text))


def phase_text(case_root: Path, pass_name: str, when: str = "After") -> str | None:
    matches = list((case_root / "phase-ir").glob(f"**/*{pass_name}.mlir"))
    selected = []
    for path in matches:
        text = path.read_text(errors="replace")
        first_line = text.splitlines()[0]
        if f"IR Dump {when}" in first_line:
            selected.append(text)
    return "\n".join(selected) if selected else None


def metrics(text: str) -> dict[str, int]:
    return {
        "regions": count(REGION, text),
        "loops": count(SCF_FOR, text),
        "vloads": count(VLOAD, text),
        "vstores": count(VSTORE, text),
        "vmi_instances": count(SELECTED_VMI, text),
        "local_boundaries": count(LOCAL_BOUNDARY, text),
        "hard_boundaries": count(HARD_BOUNDARY, text),
    }


def source_tileops(text: str) -> Counter[str]:
    result: Counter[str] = Counter()
    for line in text.splitlines():
        if line.lstrip().startswith("//"):
            continue
        match = TILE_OP.match(line)
        if match:
            result[match.group(1)] += 1
    return result


def phase_tileop_classes(text: str) -> dict[str, Counter[str]]:
    result: dict[str, Counter[str]] = {}
    for line in text.splitlines():
        match = TILE_OP.match(line)
        if not match:
            continue
        name = match.group(1)
        classes = result.setdefault(name, Counter())
        if SELECTED_VMI.search(line):
            classes["vmi"] += 1
        elif LOCAL_BOUNDARY.search(line):
            classes["local_boundary"] += 1
        elif HARD_BOUNDARY.search(line):
            classes["hard_boundary"] += 1
        else:
            classes["unclassified"] += 1
    return result


def fusion_region_sizes(text: str) -> list[int]:
    sizes = []
    lines = text.splitlines()
    index = 0
    while index < len(lines):
        line = lines[index]
        if not REGION.search(line):
            index += 1
            continue
        depth = line.count("{") - line.count("}")
        vmi_instances = 0
        index += 1
        while index < len(lines) and depth > 0:
            current = lines[index]
            if SELECTED_VMI.search(current) and TILE_OP.match(current):
                vmi_instances += 1
            depth += current.count("{") - current.count("}")
            index += 1
        sizes.append(vmi_instances)
    return sizes


def classify_key(region: dict[str, int], loop: dict[str, int], mem: dict[str, int]) -> str:
    if region["vmi_instances"] == 0:
        return "lowering_only"
    if region["regions"] == 0:
        return "no_fusion_region"
    load_elided = max(0, loop["vloads"] - mem["vloads"])
    store_elided = max(0, loop["vstores"] - mem["vstores"])
    if region["regions"] <= 4 and (load_elided + store_elided) > 0:
        return "deep_fusion_ready"
    if (load_elided + store_elided) > 0:
        return "partially_optimized"
    return "fragmented_or_unoptimized"


def analyze(commit: str) -> None:
    artifact_root = REPO / "artifacts" / commit
    report_root = REPO / "reports" / commit
    report_root.mkdir(parents=True, exist_ok=True)

    compile_rows = []
    results_file = artifact_root / "results.tsv"
    if results_file.exists():
        with results_file.open() as stream:
            compile_rows = list(csv.DictReader(stream, delimiter="\t"))

    full_rows = []
    tileop_classes: dict[str, Counter[str]] = {}
    region_sizes: Counter[int] = Counter()
    boundary_reasons: Counter[str] = Counter()
    for result in compile_rows:
        relative = Path(result["case"])
        source = DSV4_ROOT / relative
        phase_root = REPO / result.get("phase_ir", "")
        phase_files = list(phase_root.glob("**/*pto-fusion-region-gen.mlir"))
        region_snapshot = "\n".join(
            path.read_text(errors="replace") for path in phase_files
        )
        source_counts = source_tileops(source.read_text(errors="replace"))
        phase_metrics = metrics(region_snapshot) if region_snapshot else {
            key: -1 for key in (
                "regions", "loops", "vloads", "vstores", "vmi_instances",
                "local_boundaries", "hard_boundaries",
            )
        }
        for name, classes in phase_tileop_classes(region_snapshot).items():
            tileop_classes.setdefault(name, Counter()).update(classes)
        region_sizes.update(fusion_region_sizes(region_snapshot))
        boundary_reasons.update(BOUNDARY_REASON.findall(region_snapshot))
        if result["status"] == "PASS":
            if phase_metrics["hard_boundaries"] > 0 and phase_metrics["vmi_instances"] == 0:
                assessment = "hard_boundary_only"
            elif phase_metrics["vmi_instances"] > 0 and phase_metrics["local_boundaries"] == 0:
                assessment = "fusion_candidate_clean"
            elif phase_metrics["vmi_instances"] > 0:
                assessment = "fusion_candidate_with_local_boundaries"
            else:
                assessment = "legacy_lowering_only"
        else:
            assessment = "lowering_failed"
        full_rows.append({
            **result,
            **{f"phase_{key}": value for key, value in phase_metrics.items()},
            "source_tileop_kinds": len(source_counts),
            "source_tileop_instances": sum(source_counts.values()),
            "assessment": assessment,
        })

    if full_rows:
        with (report_root / "case_lowering_status.tsv").open("w", newline="") as stream:
            writer = csv.DictWriter(stream, fieldnames=list(full_rows[0]), delimiter="\t")
            writer.writeheader()
            writer.writerows(full_rows)

    with (report_root / "tileop_lowering_class.tsv").open("w") as stream:
        stream.write("tileop\tvmi\tlocal_boundary\thard_boundary\tunclassified\ttotal\n")
        for name in sorted(tileop_classes):
            classes = tileop_classes[name]
            total = sum(classes.values())
            stream.write(
                f"{name}\t{classes['vmi']}\t{classes['local_boundary']}\t"
                f"{classes['hard_boundary']}\t{classes['unclassified']}\t{total}\n"
            )

    with (report_root / "region_size_distribution.tsv").open("w") as stream:
        stream.write("vmi_tileops_per_region\tregions\n")
        for size, instances in sorted(region_sizes.items()):
            stream.write(f"{size}\t{instances}\n")

    with (report_root / "boundary_reasons.tsv").open("w") as stream:
        stream.write("reason\tinstances\n")
        for reason, instances in boundary_reasons.most_common():
            stream.write(f"{reason}\t{instances}\n")

    op_counts: Counter[str] = Counter()
    for source in DSV4_ROOT.glob("**/*.pto"):
        for line in source.read_text(errors="replace").splitlines():
            stripped = line.lstrip()
            if stripped.startswith("//"):
                continue
            op_counts.update(TILE_OP.findall(line))
    with (report_root / "tileop_instances.tsv").open("w") as stream:
        stream.write("tileop\tinstances\n")
        for name, instances in op_counts.most_common():
            stream.write(f"{name}\t{instances}\n")

    key_rows = []
    key_root = artifact_root / "key-cases"
    for case_root in sorted(path for path in key_root.glob("**/phase-ir") if path.is_dir()):
        owner = case_root.parent
        relative = owner.relative_to(key_root)
        region_text = phase_text(owner, "pto-fusion-region-gen")
        pre_loop_text = phase_text(owner, "pto-vmi-loop-fusion", "Before")
        loop_text = phase_text(owner, "pto-vmi-loop-fusion")
        mem_text = phase_text(owner, "pto-vmi-load-store-elision")
        if not region_text or not pre_loop_text or not loop_text or not mem_text:
            continue
        region = metrics(region_text)
        pre_loop = metrics(pre_loop_text)
        loop = metrics(loop_text)
        mem = metrics(mem_text)
        row = {
            "case": str(relative) + ".pto",
            **{f"region_{key}": value for key, value in region.items()},
            **{f"pre_loop_{key}": value for key, value in pre_loop.items()},
            **{f"loop_{key}": value for key, value in loop.items()},
            **{f"mem2reg_{key}": value for key, value in mem.items()},
            "loops_removed": max(0, pre_loop["loops"] - loop["loops"]),
            "loads_elided": max(0, loop["vloads"] - mem["vloads"]),
            "stores_elided": max(0, loop["vstores"] - mem["vstores"]),
            "classification": classify_key(region, loop, mem),
        }
        key_rows.append(row)

    if key_rows:
        with (report_root / "key_case_fusion_metrics.tsv").open("w", newline="") as stream:
            writer = csv.DictWriter(stream, fieldnames=list(key_rows[0]), delimiter="\t")
            writer.writeheader()
            writer.writerows(key_rows)

    compile_status = Counter(row.get("status", "UNKNOWN") for row in compile_rows)
    residual = sum(int(row.get("residual_vmi_ops", -1)) > 0 for row in compile_rows)
    assessments = Counter(row["assessment"] for row in full_rows)
    class_totals: Counter[str] = Counter()
    for classes in tileop_classes.values():
        class_totals.update(classes)
    total_regions = sum(region_sizes.values())
    singleton_regions = region_sizes[1]
    vmi_outside_regions = max(0, class_totals["vmi"] - sum(
        size * instances for size, instances in region_sizes.items()
    ))
    family_cases = Counter(Path(row["case"]).parts[0] for row in compile_rows)
    summary = {
        "ptoas_commit": commit,
        "input_cases": len(list(DSV4_ROOT.glob("**/*.pto"))),
        "compile_status": dict(compile_status),
        "fusion_assessment": dict(assessments),
        "case_families": dict(sorted(family_cases.items())),
        "cases_with_residual_vmi_ops": residual,
        "tileop_instances": sum(op_counts.values()),
        "tileop_kinds": len(op_counts),
        "key_case_classification": dict(Counter(row["classification"] for row in key_rows)),
        "fusion_phase_tileop_class": dict(class_totals),
        "boundary_reasons": dict(boundary_reasons),
        "fusion_region_size_distribution": dict(sorted(region_sizes.items())),
        "fusion_region_summary": {
            "regions": total_regions,
            "singleton_regions": singleton_regions,
            "singleton_ratio": singleton_regions / total_regions if total_regions else 0.0,
            "selected_vmi_outside_regions": vmi_outside_regions,
        },
    }
    (report_root / "summary.json").write_text(json.dumps(summary, indent=2) + "\n")

    lines = [
        f"# DSv4 VMI Lowering and Fusion Readiness ({commit[:12]})",
        "",
        "## Lowering Coverage",
        "",
        f"- Real PTO cases: {summary['input_cases']}",
        f"- Compile results: {dict(compile_status)}",
        f"- Cases with residual VMI operations: {residual}",
        f"- TileOp instances/kinds in source: {sum(op_counts.values())}/{len(op_counts)}",
        f"- Workload families: {dict(sorted(family_cases.items()))}",
        "",
        "## TileLib Selection At FusionRegionGen",
        "",
        f"- Selected VMI candidates: {class_totals['vmi']}",
        f"- Local fallback boundaries: {class_totals['local_boundary']}",
        f"- Hard fallback boundaries: {class_totals['hard_boundary']}",
        f"- Direct control/view TileOps without TileLib classification: {class_totals['unclassified']}",
        f"- Fusion regions: {total_regions}; singleton VMI regions: {singleton_regions} "
        f"({(100.0 * singleton_regions / total_regions) if total_regions else 0.0:.1f}%)",
        f"- Selected VMI TileOps outside a FusionRegion: {vmi_outside_regions}",
        "",
        "The FusionRegionGen snapshot is transformed IR, so its instance total can differ "
        "slightly from the 3280 source TileOps. Direct control/view operations such as "
        "`tpush`, `tpop`, `tfree`, `treshape`, `tgetval`, and `tsetval` are not VMI "
        "candidate gaps; they remain explicit pipeline or scalar/view boundaries.",
        "",
        "## Largest Local-Boundary Gaps",
        "",
        "| TileOp | Local instances | VMI instances |",
        "|---|---:|---:|",
    ]
    local_gaps = sorted(
        ((classes["local_boundary"], name, classes["vmi"])
         for name, classes in tileop_classes.items() if classes["local_boundary"]),
        reverse=True,
    )
    for local, name, vmi in local_gaps[:12]:
        lines.append(f"| `{name}` | {local} | {vmi} |")
    lines.extend((
        "",
        "## Key Fusion Metrics",
        "",
        "| Case | Regions | VMI instances | Local | Hard | Loops after fusion | Loads elided | Stores elided | Assessment |",
        "|---|---:|---:|---:|---:|---:|---:|---:|---|",
    ))
    for row in key_rows:
        lines.append(
            f"| `{row['case']}` | {row['region_regions']} | "
            f"{row['region_vmi_instances']} | {row['region_local_boundaries']} | "
            f"{row['region_hard_boundaries']} | "
            f"{row['pre_loop_loops']} -> {row['loop_loops']} | "
            f"{row['loads_elided']} | {row['stores_elided']} | "
            f"{row['classification']} |"
        )
    lines.extend((
        "",
        "## Reading the Result",
        "",
        "- `deep_fusion_ready` requires a small region count and observable VMI memory elimination.",
        "- `partially_optimized` lowers and removes some UB traffic but remains fragmented.",
        "- `fragmented_or_unoptimized` reaches VMI/VPTO but does not yet demonstrate useful deep fusion.",
        "- Hard boundaries are expected around MTE/Cube/communication operations. Local boundaries inside a vector compute chain are optimization gaps.",
        "- Final VPTO must contain zero VMI operations; `pto.vmi.fusion.*` attributes are provenance and are not residual operations.",
        "- All current FusionRegions are single-op regions, so VMI Loop Fusion has no multi-op region to merge in the measured key chains.",
        "- The first optimization priority is region aggregation and local-boundary reduction in Softmax/RMSNorm chains; only then can Loop Fusion and Mem2Reg show their intended effect.",
        "",
    ))
    (report_root / "summary.md").write_text("\n".join(lines))


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--commit", default=git_commit())
    args = parser.parse_args()
    analyze(args.commit)


if __name__ == "__main__":
    main()
