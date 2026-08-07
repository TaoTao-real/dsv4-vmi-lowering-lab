---
name: verify-dsv4-vmi-lowering
description: Reproduce and assess DSv4 PTOAS VMI TileLib lowering from the dsv4-vmi-lowering-lab repository. Use when validating the 120 checked-in DSv4 PTO inputs, exporting final VPTO or key FA/Softmax/RMSNorm/RoPE phase snapshots, checking FusionRegion and VMI fusion readiness, comparing a new PTOAS commit with an archived baseline, or explaining which static and Camodel conclusions are reproducible.
---

# Verify DSv4 VMI Lowering

Run this workflow from the `dsv4-vmi-lowering-lab` repository root. Treat the
checked-in `.pto` files as compiler inputs, not numerical runtime fixtures.

## Validation Contract

Keep these conclusions separate:

1. **Input integrity**: all 120 inputs match the recorded SHA256 manifest.
2. **Lowering closure**: a case reaches final VPTO with no residual `pto.vmi`.
3. **Fusion readiness**: candidate, boundary, region, row-loop, and memory
   metrics show whether the case can benefit from VMI VF Fusion.
4. **Runtime correctness/performance**: requires matching numerical fixtures,
   binaries, CANN/Camodel environment, and timing procedure. Static lowering
   does not prove this.

Never report `lowering_pass` as evidence of deep fusion or performance gain.

## Preflight

Inspect the lab and PTOAS worktrees before running anything:

```bash
git status --short --branch
git -C "${PTOAS_WORKTREE:-../PTOAS_vmi_vf_next}" status --short --branch
```

The scripts accept these environment variables:

```text
PTOAS_WORKTREE   PTOAS source/build worktree
PTOAS_BIN        ptoas executable
PTODSL_PYTHON    Python executable containing PTODSL dependencies
MLIR_PYTHON_ROOT MLIR Python package root
DSV4_ROOT        alternate generated input snapshot
```

Defaults are defined in `scripts/common.py`. Check all resolved paths before a
long run. If `DSV4_ROOT` is overridden, do not compare it with the checked-in
baseline until its own generated manifest and hashes have been recorded.

Record the PTOAS commit and dirty state. A dirty run is valid for development,
but its result must not be attributed solely to the commit hash.

## Step 1: Verify Inputs

```bash
python3 scripts/verify_inputs.py
```

The checked-in snapshot must report:

```text
expected files: 120
actual files:   120
total bytes:    2756593
input verification: PASS
```

Stop on any count, size, or hash mismatch. Do not silently replace the inputs.

## Step 2: Export Lowering Artifacts

First run the curated key cases:

```bash
python3 scripts/export_lowering.py --keys --timeout 1800
```

This exports fusion controls and phase snapshots for representative FA,
Softmax, RMSNorm, and RoPE cases.

Then run all 120 final-VPTO cases when full coverage is required:

```bash
python3 scripts/export_lowering.py --all --timeout 1800 --resume
```

Use `--resume` after an interrupted run. Avoid aggressive parallel execution:
large DSv4 cases compete for memory and may create misleading timeout results.
The exporter writes under `artifacts/<ptoas-commit>/` and records commands,
input hashes, compiler paths, source hashes, and dirty state in
`run_manifest.json`.

## Step 3: Analyze Fusion Readiness

```bash
PTOAS_COMMIT="$(git -C "${PTOAS_WORKTREE:-../PTOAS_vmi_vf_next}" rev-parse HEAD)"
python3 scripts/analyze_lowering.py --commit "$PTOAS_COMMIT"
python3 scripts/build_evaluation_matrix.py --baseline "$PTOAS_COMMIT"
python3 scripts/verify_artifacts.py --commit "$PTOAS_COMMIT"
```

Read these outputs before drawing conclusions:

```text
artifacts/<commit>/results.tsv
artifacts/<commit>/run_manifest.json
reports/<commit>/summary.md
reports/<commit>/case_lowering_status.tsv
reports/<commit>/tileop_lowering_class.tsv
reports/<commit>/boundary_reasons.tsv
reports/<commit>/key_case_fusion_metrics.tsv
reports/<commit>/region_size_distribution.tsv
reports/<commit>/case_evaluation_matrix.tsv
```

Evaluate in this order:

- Count actual pass, fail, and timeout cases from `results.tsv`.
- Confirm final VPTO has no residual VMI operations.
- Separate VMI candidates from local and hard boundaries.
- Check whether FusionRegions contain multiple dependent VMI TileOps; singleton
  regions are lowering coverage, not useful deep fusion.
- Compare row-loop counts before and after VMI Loop Fusion.
- Compare VMI loads/stores before and after load/store elision.
- Report stable rejection reasons for cases that do not fuse.

## Step 4: Compare With a Baseline

Compare reports only when the input hashes, compiler flags, and experiment
scope match. Use commit-keyed report directories rather than copying values
out of context.

Report at least:

```text
PTOAS commit and dirty state
input snapshot and verification result
lowering pass/fail/timeout counts
residual VMI count
VMI/local-boundary/hard-boundary instance counts
multi-op FusionRegion count and size distribution
row-loop and VMI load/store deltas for key cases
unresolved correctness or reproducibility limits
```

## Camodel Boundary

Historical Camodel measurements live under `reports/camodel-*`. Read each
directory's `provenance.txt`, `samples.tsv`, and summary together.

Do not claim that the repository can independently reproduce those numbers
unless all of the following are present and matched:

- runtime launcher and harness;
- numerical input fixtures and expected outputs;
- generated object or exact rebuild procedure;
- CANN/Camodel version and environment;
- warm-up, repeat count, timeout, and timing extraction command.

`scripts/collect_remote_camodel_repeats.sh` documents a historical remote
collection flow and may reference unavailable infrastructure or older binaries.
Do not run it blindly. Until the complete runtime bundle is archived, classify
Camodel data as historical evidence and limit this skill's reproducible claim
to static lowering and fusion-readiness analysis.

## Failure Triage

- **Input verification fails**: identify missing, added, or hash-mismatched
  files before compiling.
- **NoMatchingTemplate**: inspect TileOp form, dtype, layout, `valid_shape`,
  mask, and candidate/boundary classification.
- **Timeout**: rerun the individual case serially with a larger timeout; record
  peak resource pressure before calling it a compiler hang.
- **Residual VMI**: locate the first unsupported VMI-to-VPTO lowering and keep
  this distinct from TileLib candidate selection.
- **Singleton regions**: inspect FusionPlan boundaries, dependency grouping,
  and scheduling; adding more candidates alone may not solve region formation.
- **No loop or memory reduction**: inspect principal-loop provenance, alias and
  mask obligations, iteration-domain equivalence, and escaping stores.

## Reporting Language

Use precise statements such as:

```text
The checked-in 120-input snapshot passes integrity verification. At PTOAS
<commit>, X/120 cases reach final VPTO and Y contain no residual VMI. The key
cases form Z multi-op FusionRegions; row loops change from A to B and VMI
loads/stores change by C/D. Runtime performance was not remeasured because the
matching Camodel fixture bundle is not archived.
```

Do not substitute archived performance medians for a current run.
