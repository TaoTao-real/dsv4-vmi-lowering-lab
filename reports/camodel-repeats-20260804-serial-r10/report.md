# Camodel Repeat Sampling

## Provenance

- Classification: historical-object repeat sampling.
- Remote objects were built on 2026-08-03; these timings are not current-HEAD runtime evidence.
- Remote Loop Fusion and Load/Store Elision source hashes match the local worktree; VecScope inference differs because the local worktree has an uncommitted Vbr fix.
- Runs are serial and instruction counts come from `instr_exe.csv` dynamic call counts.
- A nonzero host status means the result is diagnostic only unless separately accepted below.
- Collected rows: 80 across 8 variants.

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

## Comparisons

- Softmax VMI base vs ordinary candidate: +5.7%.
- Softmax VMI elision vs VMI base: -0.8%.
- Softmax VMI elision vs ordinary candidate: +4.9%.
- RoPE loop fusion vs VMI base: +12.0%.
- RoPE loop plus elision vs VMI base: +1.1%.
- RMSNorm VMI on vs off: +19.1%.

## Acceptance

- Softmax: OFF and VMI outputs have identical hashes across repeats; CPU golden is still missing.
- RoPE: output hashes differ between stages and host validation fails; performance is diagnostic only.
- RMSNorm: OFF/ON output hashes differ and host validation fails; performance is diagnostic only.
