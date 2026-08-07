# DSv4 VMI Lowering and Fusion Readiness (15eee8625f22)

## Provenance

- PTOAS commit: `15eee8625f223d9ec497744f49e38c0e294dc583`
- PTOAS worktree dirty at export: `False`
- Compiler: `$PTO_WORKSPACE/_codex_worktrees/vmi-vbr-vecscope-clone/build-llvm21/tools/ptoas/ptoas`
- Exact worktree status and key source hashes are recorded in `run_manifest.json`; a dirty export must not be attributed to the pure commit.

## Synchronization And Capture Contract

- Fusion OFF and ON both enable PTOAS synchronization insertion: `True`.
- Key pass dumps are extracted from the ordered compiler log, deduplicated by content, and aggregated into stable canonical snapshots. This preserves both anonymous AIC/AIV modules after `VPTOSplitCVModule`.
- A strict Prefill RoPE sync OFF/ON control at `67283e5e5039` produced identical normalized-snapshot SHA-256 hashes after both `InsertTemplateAttributes` (`f83f7726...`) and `SelectTemplateCandidate` (`1b26f116...`). Therefore synchronization does not remove VMI candidates; candidate differences come from form/shape/valid-shape eligibility.

## Lowering Coverage

- Real PTO cases: 120
- Compile results: {'PASS': 120}
- Cases with residual VMI operations: 0
- TileOp instances/kinds in source: 3280/45
- Workload families: {'_jit_attention_csa_test_20260723_032646': 47, '_jit_prefill_attention_csa_test_20260723_031246': 53, '_jit_qkv_proj_rope_test_20260723_031029': 9, '_jit_qkv_proj_rope_test_20260723_031234': 9, '_jit_rms_norm_test_20260723_030917': 1, '_jit_rms_norm_test_20260723_030929': 1}

## TileLib Selection At FusionRegionGen

- Selected VMI candidates: 1029
- Local fallback boundaries: 720
- Hard fallback boundaries: 1486
- Direct control/view TileOps without TileLib classification: 53
- Fusion regions: 283; singleton VMI regions: 110 (38.9%)
- Selected VMI TileOps outside a FusionRegion: 0

The FusionRegionGen snapshot is transformed IR, so its instance total can differ slightly from the 3280 source TileOps. Direct control/view operations such as `tpush`, `tpop`, `tfree`, `treshape`, `tgetval`, and `tsetval` are not VMI candidate gaps; they remain explicit pipeline or scalar/view boundaries.

## Largest Local-Boundary Gaps

| TileOp | Local instances | VMI instances |
|---|---:|---:|
| `tcvt` | 121 | 203 |
| `tadd` | 86 | 81 |
| `tadds` | 75 | 20 |
| `texpands` | 64 | 58 |
| `tmuls` | 48 | 102 |
| `tdiv` | 41 | 5 |
| `tmov` | 33 | 79 |
| `trowsum` | 32 | 50 |
| `trowexpanddiv` | 32 | 2 |
| `trowexpandmul` | 29 | 88 |
| `trsqrt` | 22 | 0 |
| `tmax` | 22 | 16 |

## Key Fusion Metrics

Across the eight key cases, Loop Fusion removes 27 loops and Mem2Reg removes 29 VMI loads plus 10 VMI stores.

| Case | Regions | VMI instances | Local | Hard | Loops after fusion | Loads elided | Stores elided | Assessment |
|---|---:|---:|---:|---:|---:|---:|---:|---|
| `_jit_attention_csa_test_20260723_032646/ptoas/comb_sinkhorn.pto` | 0 | 0 | 108 | 21 | 113 -> 113 | 0 | 0 | lowering_only |
| `_jit_attention_csa_test_20260723_032646/ptoas/qk_pv.pto` | 3 | 9 | 0 | 45 | 17 -> 16 | 1 | 1 | deep_fusion_ready |
| `_jit_attention_csa_test_20260723_032646/ptoas/rms_norm.pto` | 3 | 16 | 6 | 8 | 14 -> 12 | 6 | 2 | deep_fusion_ready |
| `_jit_attention_csa_test_20260723_032646/ptoas/rmsnorm_rope.pto` | 8 | 28 | 14 | 13 | 34 -> 24 | 11 | 4 | partially_optimized |
| `_jit_prefill_attention_csa_test_20260723_031246/ptoas/gather_kv.pto` | 3 | 3 | 0 | 3 | 3 -> 3 | 0 | 0 | fragmented_or_unoptimized |
| `_jit_prefill_attention_csa_test_20260723_031246/ptoas/merge_norm.pto` | 3 | 8 | 15 | 9 | 11 -> 8 | 2 | 0 | deep_fusion_ready |
| `_jit_prefill_attention_csa_test_20260723_031246/ptoas/prefill_c4_softmax_pool.pto` | 12 | 32 | 3 | 9 | 38 -> 27 | 9 | 3 | partially_optimized |
| `_jit_prefill_attention_csa_test_20260723_031246/ptoas/rope.pto` | 0 | 0 | 17 | 6 | 19 -> 19 | 0 | 0 | lowering_only |

## Reading the Result

- `deep_fusion_ready` requires a small region count and observable VMI memory elimination.
- `partially_optimized` lowers and removes some UB traffic but remains fragmented.
- `fragmented_or_unoptimized` reaches VMI/VPTO but does not yet demonstrate useful deep fusion.
- Hard boundaries are expected around MTE/Cube/communication operations. Local boundaries inside a vector compute chain are optimization gaps.
- Final VPTO must contain zero VMI operations; `pto.vmi.fusion.*` attributes are provenance and are not residual operations.
- Singleton regions account for 38.9% of current regions; larger regions are available to Loop Fusion, while singleton and region-external VMI units still expose aggregation gaps.
- Prioritize local-boundary reduction and the code shape of fused wide-vreg chains; region aggregation alone does not guarantee a runtime speedup.
