# Camodel Repeat Sampling

## Provenance

- Classification: historical-object repeat sampling.
- Remote objects were built on 2026-08-03; these timings are not current-HEAD runtime evidence.
- Remote Loop Fusion and Load/Store Elision source hashes match the local worktree; VecScope inference differs because the local worktree has an uncommitted Vbr fix.
- Runs are serial and instruction counts come from `instr_exe.csv` dynamic call counts.
- A nonzero host status means the result is diagnostic only unless separately accepted below.
- Collected rows: 80 across 8 variants.

## Variant Definitions

Latency change is `(new ticks / baseline ticks - 1) * 100%`. Positive means slower; negative means faster.

| Variant | Candidate/lowering path | Enabled VMI optimization |
|---|---|---|
| `softmax_off` | ordinary PTODSL candidates | none; end-to-end Fusion OFF control |
| `softmax_vmi_base` | fixed VMI candidates | no load/store elision; Loop Fusion has no extra merge in this Softmax IR |
| `softmax_vmi_elide` | same fixed VMI candidates | load/store elision enabled |
| `rope_vmi_base` | fixed VMI candidates | no VMI Loop Fusion or elision |
| `rope_vmi_loop` | same fixed VMI candidates | VMI Loop Fusion only |
| `rope_vmi_elide` | same fixed VMI candidates | VMI Loop Fusion plus load/store elision |
| `rmsnorm_off` | ordinary-candidate Fusion OFF control | none |
| `rmsnorm_on` | VMI-preferred end-to-end Fusion ON path | candidate change, Loop Fusion and elision together |

## Results

| Case | N | Exit 0 | Tick min | Median | Max | Stddev | VLOOP | VLD | VST | Stable hash |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---|
| `softmax_off` | 10 | 10 | 9056 | 9085.0 | 9103 | 14.7 | 66 | 324 | 343 | yes |
| `softmax_vmi_base` | 10 | 10 | 9584 | 9603.0 | 9637 | 13.5 | 16 | 340 | 374 | yes |
| `softmax_vmi_elide` | 10 | 10 | 9517 | 9528.0 | 9587 | 19.7 | 16 | 276 | 312 | yes |
| `rope_vmi_base` | 10 | 0 | 10642 | 10669.0 | 10676 | 10.5 | 49 | 5250 | 3697 | yes |
| `rope_vmi_loop` | 10 | 0 | 11926 | 11952.0 | 11988 | 15.8 | 30 | 5250 | 3688 | yes |
| `rope_vmi_elide` | 10 | 0 | 10749 | 10787.0 | 10802 | 14.7 | 30 | 4034 | 3045 | yes |
| `rmsnorm_off` | 10 | 0 | 3768 | 3810.5 | 3839 | 18.2 | 15 | 321 | 381 | yes |
| `rmsnorm_on` | 10 | 0 | 4479 | 4536.5 | 4552 | 22.1 | 22 | 466 | 499 | yes |

## Softmax Comparisons

- Candidate cost, ordinary -> VMI base: `9085 -> 9603`, latency +5.7% (5.7% slower). This is not a Fusion Pass gain.
- Elision gain, VMI base -> VMI elide: `9603 -> 9528`, latency -0.8% (0.8% faster). This isolates the useful load/store-elision effect.
- End-to-end result, ordinary -> VMI elide: `9085 -> 9528`, latency +4.9% (4.9% slower). The candidate/lowering cost is larger than the elision gain.

## Diagnostic-Only Comparisons

- RoPE Loop Fusion, VMI base -> loop only: `10669 -> 11952`, latency +12.0% (12.0% slower). VLOOP falls, but UB loads do not; outputs also differ, so this is a code-shape warning, not accepted performance evidence.
- RoPE adding elision, loop only -> loop plus elision: `11952 -> 10787`, latency -9.7% (9.7% faster). Elision recovers most of the Loop Fusion regression, but correctness remains unresolved.
- RoPE combined result, VMI base -> loop plus elision: `10669 -> 10787`, latency +1.1% (1.1% slower).
- RMSNorm end-to-end OFF -> ON: `3810.5 -> 4536.5`, latency +19.1% (19.1% slower). This changes candidates and several passes together and outputs differ, so it cannot isolate a Fusion Pass effect.

## Acceptance

- Softmax: OFF and VMI outputs have identical hashes across repeats; CPU golden is still missing.
- RoPE: output hashes differ between stages and host validation fails; performance is diagnostic only.
- RMSNorm: OFF/ON output hashes differ and host validation fails; performance is diagnostic only.
