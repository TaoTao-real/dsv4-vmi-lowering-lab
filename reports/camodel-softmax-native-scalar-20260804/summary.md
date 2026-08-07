# Softmax VMI Native Scalar Candidate Baseline

## Scope

This experiment isolates three lowering modes for the same A5 FlashAttention
Softmax DN-init kernel (`[128, 64]xf32`):

1. `ordinary`: ordinary PTODSL/VPTO candidates, no VMI fusion.
2. `vmi_base`: VMI candidates, with VMI loop fusion and load/store elision off.
3. `vmi_fused`: the same VMI candidates, with VMI loop fusion and load/store
   elision on.

The PTOAS change preserves full-mask `pto.vmi.vadds`, `vmuls`, `vmaxs`, and
`vmins` until VMIToVPTO, where wide logical vectors are split into native
physical `pto.vadds`, `vmuls`, `vmaxs`, and `vmins` operations. Partial or
dynamic masks retain the existing broadcast plus vector-vector fallback.

## Results

| Mode | N | Tick min | Median | Max | Stddev | VLOOP | VLD | VST | Output |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---|
| ordinary | 10 | 5771 | 5805.0 | 5821 | 14.6 | 5 | 768 | 258 | stable |
| vmi_base | 10 | 5815 | 5815.0 | 5815 | 0.0 | 5 | 768 | 258 | stable |
| vmi_fused | 10 | 5406 | 5418.5 | 5431 | 6.9 | 2 | 256 | 240 | stable |

- VMI candidate cost after native scalar lowering:
  `5815 / 5805 - 1 = +0.17%` latency. Dynamic instruction counts are
  identical, so the candidate baseline is effectively aligned with ordinary
  VPTO.
- End-to-end VMI fusion result:
  `5418.5 / 5805 - 1 = -6.66%` latency, or `1.071x` speedup.
- All 30 samples have the same combined output SHA-256:
  `78bfa2006a927b1ae24f79aa48f39460a9856092a6d804d2ae9517d70d9886eb`.
- The four output files also match the historical ordinary and VMI outputs
  byte-for-byte.

## Interpretation

The previous Softmax regression was not an unavoidable wide-logical-vreg
cost. Full-mask vector-scalar operations were expanded into a scalar
broadcast followed by a vector-vector operation. Selecting the existing
native VPTO scalar instructions removes that candidate tax without changing
the logical-row abstraction.

The remaining `vdup` in the fused kernel belongs to an explicit reduction or
division broadcast, not to `vadds/vmuls/vmaxs/vmins`. `tdivs` is intentionally
not strength-reduced to reciprocal multiply because that can change rounding,
zero, infinity, and NaN behavior.

## Validation

- PTO regression tests: `1448/1448 PASS`.
- Native scalar protocol test covers 1VL, wide f32, integer, and partial-mask
  fallback paths.
- Camodel target: CANN 9.0.0, `Ascend950PR_9599`.
- Runs were serialized to avoid shared simulator resource contention.
