# DSv4 VMI Lowering and Fusion Readiness (533887b4ae09)

## Lowering Coverage

- Real PTO cases: 120
- Compile results: {'PASS': 120}
- Cases with residual VMI operations: 0
- TileOp instances/kinds in source: 3280/45
- Workload families: {'_jit_attention_csa_test_20260723_032646': 47, '_jit_prefill_attention_csa_test_20260723_031246': 53, '_jit_qkv_proj_rope_test_20260723_031029': 9, '_jit_qkv_proj_rope_test_20260723_031234': 9, '_jit_rms_norm_test_20260723_030917': 1, '_jit_rms_norm_test_20260723_030929': 1}

## TileLib Selection At FusionRegionGen

- Selected VMI candidates: 1100
- Local fallback boundaries: 649
- Hard fallback boundaries: 1486
- Direct control/view TileOps without TileLib classification: 53
- Fusion regions: 1056; singleton VMI regions: 1056 (100.0%)
- Selected VMI TileOps outside a FusionRegion: 44

The FusionRegionGen snapshot is transformed IR, so its instance total can differ slightly from the 3280 source TileOps. Direct control/view operations such as `tpush`, `tpop`, `tfree`, `treshape`, `tgetval`, and `tsetval` are not VMI candidate gaps; they remain explicit pipeline or scalar/view boundaries.

## Largest Local-Boundary Gaps

| TileOp | Local instances | VMI instances |
|---|---:|---:|
| `tcvt` | 260 | 64 |
| `texpands` | 122 | 0 |
| `trowexpandmul` | 117 | 0 |
| `trowexpanddiv` | 34 | 0 |
| `trowsum` | 32 | 50 |
| `tsubs` | 20 | 0 |
| `tcolexpand` | 12 | 0 |
| `tabs` | 11 | 0 |
| `trowmax` | 9 | 16 |
| `tneg` | 9 | 0 |
| `tmuls` | 8 | 142 |
| `tadd` | 8 | 159 |

## Key Fusion Metrics

| Case | Regions | VMI instances | Local | Hard | Loops after fusion | Loads elided | Stores elided | Assessment |
|---|---:|---:|---:|---:|---:|---:|---:|---|
| `_jit_attention_csa_test_20260723_032646/ptoas/comb_sinkhorn.pto` | 56 | 56 | 52 | 21 | 113 -> 113 | 0 | 0 | fragmented_or_unoptimized |
| `_jit_attention_csa_test_20260723_032646/ptoas/qk_pv.pto` | 8 | 8 | 1 | 45 | 6 -> 6 | 0 | 0 | fragmented_or_unoptimized |
| `_jit_attention_csa_test_20260723_032646/ptoas/rms_norm.pto` | 12 | 13 | 9 | 8 | 24 -> 24 | 2 | 0 | partially_optimized |
| `_jit_attention_csa_test_20260723_032646/ptoas/rmsnorm_rope.pto` | 26 | 28 | 14 | 13 | 35 -> 35 | 1 | 0 | partially_optimized |
| `_jit_prefill_attention_csa_test_20260723_031246/ptoas/gather_kv.pto` | 2 | 2 | 1 | 3 | 4 -> 4 | 0 | 0 | fragmented_or_unoptimized |
| `_jit_prefill_attention_csa_test_20260723_031246/ptoas/merge_norm.pto` | 16 | 16 | 7 | 9 | 16 -> 16 | 1 | 0 | partially_optimized |
| `_jit_prefill_attention_csa_test_20260723_031246/ptoas/prefill_c4_softmax_pool.pto` | 30 | 30 | 5 | 9 | 8 -> 8 | 1 | 0 | partially_optimized |
| `_jit_prefill_attention_csa_test_20260723_031246/ptoas/rope.pto` | 12 | 12 | 5 | 6 | 19 -> 19 | 0 | 0 | fragmented_or_unoptimized |

## Reading the Result

- `deep_fusion_ready` requires a small region count and observable VMI memory elimination.
- `partially_optimized` lowers and removes some UB traffic but remains fragmented.
- `fragmented_or_unoptimized` reaches VMI/VPTO but does not yet demonstrate useful deep fusion.
- Hard boundaries are expected around MTE/Cube/communication operations. Local boundaries inside a vector compute chain are optimization gaps.
- Final VPTO must contain zero VMI operations; `pto.vmi.fusion.*` attributes are provenance and are not residual operations.
- All current FusionRegions are single-op regions, so VMI Loop Fusion has no multi-op region to merge in the measured key chains.
- The first optimization priority is region aggregation and local-boundary reduction in Softmax/RMSNorm chains; only then can Loop Fusion and Mem2Reg show their intended effect.
