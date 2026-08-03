# DSv4 VMI Lowering Lab

This repository keeps reproducible DSv4 TileLib lowering artifacts and reports
for VMI VF Fusion development. It intentionally does not copy the DSv4 source
dataset or PTOAS source tree.

## Scope

- All 120 real DSv4 `.pto` inputs are compiled with the unified `ptodsl`
  backend and VMI VF Fusion enabled.
- Final VPTO is retained for every case.
- Key FA, Softmax, RMSNorm, and RoPE cases additionally retain a legacy
  fusion-off control plus IR snapshots before/after VMI Loop Fusion and after
  VMI Mem2Reg.
- Reports distinguish successful lowering from actual fusion readiness and
  optimization effectiveness.

## Repository Layout

```text
manifests/                  input provenance and case lists
scripts/                    reproducible export and analysis tools
artifacts/<ptoas-commit>/
  final-vpto/               final fusion-on VPTO for all cases
  key-cases/                fusion-off and phase snapshots
  results.tsv               per-case compilation results
reports/<ptoas-commit>/     machine-readable and Markdown analysis
```

The reusable input snapshot remains outside this repository:

```text
/Users/lishengtao/Documents/PTO/_ptoas_tech_lab_materials/datasets/dsv4/build_output
```

## Reproduce

```bash
python3 scripts/export_lowering.py
python3 scripts/analyze_lowering.py
python3 scripts/verify_artifacts.py
```

The defaults target the local PTOAS VMI VF Fusion worktree. Every generated
manifest records the exact compiler commit, command-line flags, input hashes,
and output paths.

## Interpretation

`lowering_pass` means only that the case reaches final VPTO with no residual
VMI operation. It does not imply deep fusion. The fusion report separately
checks:

- selected VMI TileLib instances and local/hard boundaries;
- number and size of `pto.fusion_region` groups;
- row-loop count before and after VMI Loop Fusion;
- VMI load/store reduction after Mem2Reg;
- dynamic/tail valid-shape obligations and pressure-risk widths;
- residual VMI operations after VMIToVPTO.

The fusion-off control selects the ordinary PTODSL implementation because the
current driver couples VMI candidate selection to the VMI fusion pipeline. It
is useful as a lowering control, but is not an apples-to-apples performance
baseline. Loop and memory-elision effectiveness must be measured from the
phase snapshots of the fusion-on run.

## Current Baseline

The checked-in baseline is keyed by PTOAS commit
`533887b4ae09635e9c7ddb5db7d7bf29c12f8347`:

- 120/120 real DSv4 PTO inputs reach final VPTO;
- final VPTO contains no residual `pto.vmi` operation;
- 1100 TileOp instances select a VMI candidate at FusionRegionGen;
- 649 instances use local fallback and 1486 use expected hard-boundary fallback;
- all 1056 generated FusionRegions currently contain exactly one VMI TileOp;
- the eight key FA/Softmax/RMSNorm/RoPE chains remove no loops, five VMI loads,
  and no VMI stores in total.

This means lowering coverage and VMIToVPTO closure are complete for the input
snapshot, while deep fusion is not. The immediate target is to aggregate
dependent VMI TileOps into multi-op regions and reduce local fallback inside
the vector compute chain. See `reports/<commit>/summary.md` for the detailed
evidence.

The eight key-case controls are diagnostic only: 7/8 fusion-off controls pass;
the `rmsnorm_rope` fusion-off control independently fails at VPTO emission
because the legacy path exposes a vector-scope value to an external user. The
fusion-on phase snapshots for that case pass and are the source of its fusion
metrics. This is why the control is not used as a performance baseline.
