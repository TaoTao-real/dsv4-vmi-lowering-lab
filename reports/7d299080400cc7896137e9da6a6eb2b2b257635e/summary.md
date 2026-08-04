# DSv4 VMI Lowering and Fusion Readiness (7d299080400c)

## Provenance

- PTOAS commit: `7d299080400cc7896137e9da6a6eb2b2b257635e`
- PTOAS worktree dirty at export: `True`
- Compiler: `$PTO_WORKSPACE/PTOAS_vmi_vf_next/build-llvm21/tools/ptoas/ptoas`
- Exact worktree status and key source hashes are recorded in `run_manifest.json`; a dirty export must not be attributed to the pure commit.

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
- Fusion regions: 328; singleton VMI regions: 151 (46.0%)
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
| `_jit_attention_csa_test_20260723_032646/ptoas/comb_sinkhorn.pto` | 4 | 56 | 52 | 21 | 113 -> 82 | 40 | 11 | deep_fusion_ready |
| `_jit_attention_csa_test_20260723_032646/ptoas/qk_pv.pto` | 2 | 8 | 1 | 45 | 6 -> 6 | 0 | 0 | fragmented_or_unoptimized |
| `_jit_attention_csa_test_20260723_032646/ptoas/rms_norm.pto` | 4 | 13 | 9 | 8 | 24 -> 22 | 4 | 0 | deep_fusion_ready |
| `_jit_attention_csa_test_20260723_032646/ptoas/rmsnorm_rope.pto` | 11 | 28 | 14 | 13 | 35 -> 26 | 12 | 5 | partially_optimized |
| `_jit_prefill_attention_csa_test_20260723_031246/ptoas/gather_kv.pto` | 2 | 2 | 1 | 3 | 4 -> 4 | 0 | 0 | fragmented_or_unoptimized |
| `_jit_prefill_attention_csa_test_20260723_031246/ptoas/merge_norm.pto` | 3 | 16 | 7 | 9 | 16 -> 16 | 16 | 6 | deep_fusion_ready |
| `_jit_prefill_attention_csa_test_20260723_031246/ptoas/prefill_c4_softmax_pool.pto` | 11 | 30 | 5 | 9 | 8 -> 8 | 12 | 5 | partially_optimized |
| `_jit_prefill_attention_csa_test_20260723_031246/ptoas/rope.pto` | 3 | 12 | 5 | 6 | 19 -> 13 | 6 | 3 | deep_fusion_ready |

## Reading the Result

- `deep_fusion_ready` requires a small region count and observable VMI memory elimination.
- `partially_optimized` lowers and removes some UB traffic but remains fragmented.
- `fragmented_or_unoptimized` reaches VMI/VPTO but does not yet demonstrate useful deep fusion.
- Hard boundaries are expected around MTE/Cube/communication operations. Local boundaries inside a vector compute chain are optimization gaps.
- Final VPTO must contain zero VMI operations; `pto.vmi.fusion.*` attributes are provenance and are not residual operations.
- Singleton regions account for 46.0% of current regions; larger regions are available to Loop Fusion, while singleton and region-external VMI units still expose aggregation gaps.
- Prioritize local-boundary reduction and the code shape of fused wide-vreg chains; region aggregation alone does not guarantee a runtime speedup.
