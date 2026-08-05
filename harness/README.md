# Reproducible Camodel Harness

This harness turns six representative DSv4 VMI VF Fusion `.pto` inputs into
runnable standalone kernels. It replaces the historical, unarchived
`vmi_camodel_harness` dependency used by the first sampling report.

## What Is Included

```text
prefill_softmax       prefill_c4_softmax_pool.pto
prefill_rope          rope.pto
decode_rmsnorm_rope   rmsnorm_rope.pto
decode_rmsnorm        standalone rms_norm.pto
decode_comb_sinkhorn  decode comb_sinkhorn.pto
prefill_comb_sinkhorn prefill comb_sinkhorn.pto
```

Each case supports three compiler variants:

| Variant | VMI candidate | PTOAS low-level fusion |
|---|---:|---:|
| `ordinary` | ordinary PTODSL candidate through VPTO | off |
| `vmi_base` | on | off |
| `vmi_fused` | on | on |

All three controls use the VPTO backend. Candidate-only experiments require a
PTOAS build in which VMI candidate selection is independently enabled by
`--enable-vmi=true` while `--enable-op-fusion=false` keeps FusionPlan, VMI loop
fusion, and load/store elision disabled. This is an experiment-only compiler
configuration; inspect final VPTO before accepting samples.

All variants are rebuilt from the same checked-in PTO input. The harness uses
PTOAS `test/npu_validation/scripts/generate_testcase.py` to infer pointer
buffer sizes and generate the ACL launcher, CMake project, deterministic input
files, and simulator executable.

Each variant runs TileLib/VMI lowering once to produce final VPTO. The object
is compiled from that saved VPTO, so large cases do not repeat candidate
selection and expansion merely to create the measured binary.

Before sampling, the harness regenerates every variant's binary fixture and
requires the complete filename-to-SHA256 mapping to match. It stores this proof
under `fixtures/<case>.json`, records the fixture digest in every TSV row, and
saves per-repeat output snapshots plus byte-exact A/B comparisons under
`outputs/` and `comparisons/`.

## Two Evidence Paths

The standalone fixture is intended for compiler A/B and performance sampling.
It proves that variants execute and allows byte-for-byte OFF/ON output
comparison. It is not a CPU model golden.

The `model-run` command invokes the original DSv4 PyPTO test, whose tensor
specifications, model-valid initializers, Torch golden, and tolerances are the
correctness authority. A performance result is accepted only after the model
path passes or an equivalent CPU golden is added to the standalone fixture.

## Prerequisites

Run on the Linux host that contains CANN camodel:

```bash
export PTOAS_SOURCE=/path/to/PTOAS
export PTOAS_BIN=$PTOAS_SOURCE/build-llvm21/tools/ptoas/ptoas
export PTO_ISA_ROOT=/path/to/pto-isa
export PTODSL_PYTHON=/path/to/python
export MLIR_PYTHON_ROOT=/path/to/mlir_core
source /usr/local/Ascend/cann/set_env.sh

python3 harness/camodel_harness.py doctor --runtime
```

`ASCEND_HOME_PATH` is required during `prepare`, because current PTOAS C++ and
fat-object emission resolves the installed CANN ABI even before runtime.

The default simulator target follows the shared A5 camodel environment:

```text
SOC_VERSION=Ascend950PR_9599
AICORE_ARCH=dav-c310-vec
```

Override these variables when using another installed simulator. PTOAS still
lowers the checked-in A5 VMI input with `--pto-arch=a5`.

## Prepare Variants

```bash
python3 harness/camodel_harness.py prepare \
  --case prefill_softmax --variant all

python3 harness/camodel_harness.py prepare --case all --variant all
```

Generated projects and compiler provenance are placed under
`.camodel-work/<case>/<variant>/`. This directory is intentionally ignored by
Git.

## Run And Sample

Build and execute one generated runner:

```bash
python3 harness/camodel_harness.py run \
  --case prefill_softmax --variant vmi_fused
```

Collect serial camodel samples:

```bash
python3 harness/camodel_harness.py sample \
  --case prefill_softmax \
  --variant ordinary,vmi_base,vmi_fused \
  --repeats 10
```

The command writes `samples.tsv`, raw logs, profiler output, output hashes, and
compiler provenance below `.camodel-work/results/<tag>/`. Cases and variants
run serially so large simulator tasks do not compete for memory or timeout
budget.

## Run The Model Golden

Point at a PyPTO library checkout containing the DSv4 model tests:

```bash
export PYPTO_LIB_ROOT=/path/to/pypto-lib
export PYPTO_PYTHON=/path/to/python3

python3 harness/camodel_harness.py model-run \
  --case prefill_softmax --platform a2a3sim --device 0
```

`prefill_softmax` and `prefill_rope` use the same full prefill CSA model test;
`decode_rmsnorm_rope` uses the decode CSA model test. This path may execute
other kernels because it validates model semantics, not isolated latency.

## Interpretation

- Do not compare newly rebuilt variants with the old 2026-08-03 remote object
  numbers as if they came from the same compiler.
- A matching standalone output hash is an OFF/ON consistency signal, not a CPU
  golden.
- Keep PTOAS commit, PTO input hash, CANN version, simulator target, scalar
  overrides, and exact command from `provenance.json` with every report.
- Use `ordinary -> vmi_base` to measure candidate cost and
  `vmi_base -> vmi_fused` to measure the fusion lifecycle.
