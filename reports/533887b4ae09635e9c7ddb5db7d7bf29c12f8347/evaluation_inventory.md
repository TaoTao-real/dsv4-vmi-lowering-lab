# DSv4 Evaluation Inventory (533887b4ae09)

## Coverage

- Total real PTO cases: 120
- Performance and static cases: 13
- Static-only cases: 107
- Currently sampled A/B cases: 3
- Harness worklist cases: 8
- Macro cases deferred until micro-kernels stabilize: 2

The performance list is curated. A case is not performance-acceptance ready merely
because camodel returns ticks. Correct inputs, a trustworthy output contract, an
OFF/ON comparison with identical candidates where possible, and repeat sampling
remain mandatory.

## Performance Worklist

| Priority | Status | Workload | Case | Correctness gate |
|---|---|---|---|---|
| P0 | `sample_ready_ab` | prefill_softmax | `_jit_prefill_attention_csa_test_20260723_031246/ptoas/prefill_c4_softmax_pool.pto` | `cpu_golden_missing` |
| P0 | `sample_ready_diagnostic` | prefill_rope | `_jit_prefill_attention_csa_test_20260723_031246/ptoas/rope.pto` | `output_differs_and_packing_unresolved` |
| P0 | `sample_ready_diagnostic` | decode_rmsnorm_rope | `_jit_attention_csa_test_20260723_032646/ptoas/rmsnorm_rope.pto` | `nonfinite_and_output_differs` |
| P1 | `harness_required` | decode_softmax | `_jit_attention_csa_test_20260723_032646/ptoas/scatter_softmax_pool.pto` | `no_standalone_runtime_golden` |
| P1 | `harness_required` | decode_softmax_variant | `_jit_attention_csa_test_20260723_032646/ptoas/scatter_softmax_pool_0.pto` | `no_standalone_runtime_golden` |
| P1 | `harness_required` | prefill_indexed_softmax | `_jit_prefill_attention_csa_test_20260723_031246/ptoas/prefill_idx_c4_softmax_pool.pto` | `no_standalone_runtime_golden` |
| P1 | `harness_required` | decode_online_softmax | `_jit_attention_csa_test_20260723_032646/ptoas/comb_sinkhorn.pto` | `model_valid_dynamic_inputs_missing` |
| P1 | `harness_required` | prefill_online_softmax | `_jit_prefill_attention_csa_test_20260723_031246/ptoas/comb_sinkhorn.pto` | `model_valid_dynamic_inputs_missing` |
| P1 | `harness_required` | standalone_rmsnorm | `_jit_rms_norm_test_20260723_030929/ptoas/rms_norm.pto` | `standalone_golden_not_integrated` |
| P1 | `harness_required` | decode_rmsnorm | `_jit_attention_csa_test_20260723_032646/ptoas/rms_norm.pto` | `model_valid_inputs_missing` |
| P1 | `harness_required` | prefill_merge_norm | `_jit_prefill_attention_csa_test_20260723_031246/ptoas/merge_norm.pto` | `model_valid_inputs_missing` |
| P2 | `macro_after_micro` | decode_fa_qk_pv | `_jit_attention_csa_test_20260723_032646/ptoas/qk_pv.pto` | `full_pipeline_inputs_and_outputs_required` |
| P2 | `macro_after_micro` | prefill_fa_qk_pv | `_jit_prefill_attention_csa_test_20260723_031246/ptoas/qk_pv.pto` | `full_pipeline_inputs_and_outputs_required` |

## Static-Only Contract

Every other case is evaluated using compile status, VMI/local/hard classification,
FusionRegion count and size, loop-domain changes, VMI load/store elimination,
residual VMI operations, and a stable rejection reason. Compile time is not a
runtime performance metric.
