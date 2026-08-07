# DSv4 VMI Lowering Lab

This repository keeps reproducible DSv4 TileLib lowering inputs, artifacts, and
reports for VMI VF Fusion development. It does not copy the PTOAS source tree.

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
inputs/dsv4/                checked-in DSv4 PTO compiler inputs
manifests/                  input provenance and case lists
scripts/                    reproducible export and analysis tools
artifacts/<ptoas-commit>/
  final-vpto/               final fusion-on VPTO for all cases
  key-cases/                fusion-off and phase snapshots
  results.tsv               per-case compilation results
reports/<ptoas-commit>/     machine-readable and Markdown analysis
docs/progress/              stage reports and milestone acceptance gates
```

The 120 PTO inputs used by the checked-in reports are available directly under
`inputs/dsv4/`. Verify them against the baseline manifest before reproducing a
run:

```bash
python3 scripts/verify_inputs.py
```

Set `DSV4_ROOT=/path/to/build_output` only when intentionally evaluating a
different generated snapshot. The export command records hashes for that run,
so results from different snapshots remain distinguishable.

## Reproduce

```bash
python3 scripts/verify_inputs.py
env PTOAS_WORKTREE=/path/to/clean/PTOAS \
  PTOAS_BIN=/path/to/clean/PTOAS/build-llvm21/tools/ptoas/ptoas \
  PTODSL_PYTHON=/path/to/python \
  MLIR_PYTHON_ROOT=/path/to/mlir_core \
  python3 scripts/export_lowering.py --all --keys --insert-sync
python3 scripts/analyze_lowering.py --commit <ptoas-commit>
python3 scripts/verify_artifacts.py --commit <ptoas-commit>
```

Run the heavy cases serially. `--resume` reuses only completed Fusion OFF
controls and completed full-case outputs. Every generated manifest records the
exact compiler commit, command-line flags, input hashes, and output paths.

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
`15eee8625f223d9ec497744f49e38c0e294dc583`:

- 120/120 real DSv4 PTO inputs reach final VPTO;
- the serial full run completes without timeout or confirmed failure;
- final VPTO contains no residual `pto.vmi` operation;
- 1029 TileOp instances select a VMI candidate at FusionRegionGen;
- 720 instances use local fallback and 1486 use expected hard-boundary fallback;
- 283 FusionRegions are generated; 110 are singleton regions (38.9%);
- the eight key FA/Softmax/RMSNorm/RoPE chains remove 27 loops, 29 VMI loads,
  and 10 VMI stores in total.

This means lowering coverage, Region aggregation, Loop Fusion, Mem2Reg, and
VMIToVPTO closure are all active. The optimization is still uneven: Softmax,
RMSNorm, and RMSNorm+RoPE show concrete loop and memory reduction, while
`comb_sinkhorn` and Prefill RoPE remain local-fallback-only and Gather KV has
no measurable loop or memory elimination. See `reports/<commit>/summary.md`
for the detailed evidence.

Current tracking material:

- [`docs/progress/2026-08-03-stage2-progress.md`](docs/progress/2026-08-03-stage2-progress.md)
- [`docs/progress/milestone-plan.md`](docs/progress/milestone-plan.md)
- [`docs/progress/performance-sampling-plan.md`](docs/progress/performance-sampling-plan.md)
- [`docs/progress/2026-08-04-static-and-performance-results.md`](docs/progress/2026-08-04-static-and-performance-results.md)
- [`manifests/performance_cases.tsv`](manifests/performance_cases.tsv)
- [`reports/performance_baseline_20260803.tsv`](reports/performance_baseline_20260803.tsv)
- [`reports/camodel-repeats-20260804-serial-r10/report.md`](reports/camodel-repeats-20260804-serial-r10/report.md)

The eight key-case Fusion OFF controls and all eight Fusion ON phase exports
pass on this baseline. These controls are structural diagnostics, not camodel
performance acceptance; numerical golden and identical-runtime-option gates
remain separate.
