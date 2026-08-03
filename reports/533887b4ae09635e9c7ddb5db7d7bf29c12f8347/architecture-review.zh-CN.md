# DSv4 TileLib Lowering 与 VMI VF Fusion 架构审视

基线 PTOAS commit：`533887b4ae09635e9c7ddb5db7d7bf29c12f8347`

## 结论

当前已经完成 DSv4 输入快照的 **lowering 覆盖闭环**，但尚未完成关键链的
**深融合闭环**：

- 120/120 个真实 `.pto` 用例均能在统一 `ptodsl` backend 下生成 VPTO；
- 0 个超时，0 个 lowering 失败，最终 VPTO 中 0 个残留 VMI op；
- Decode Attention 47 个、Prefill Attention 53 个、QKV/RoPE 18 个、
  RMSNorm 2 个用例均已覆盖；
- 源输入共包含 3280 个 TileOp instance、45 种 TileOp；
- FusionRegionGen 阶段有 1100 个 instance 选择 VMI candidate，649 个 local
  fallback，1486 个 hard fallback，另有 53 个直接控制/视图类 TileOp；
- 1056 个 FusionRegion 全部是单 TileOp region，8 个关键用例中 VMI Loop
  Fusion 没有消除循环，Mem2Reg 合计只消除 5 次 load、0 次 store。
- 8 个关键用例的 fusion-off 对照有 7/8 通过；`rmsnorm_rope` 的旧路径因
  `vecscope` 值逃逸到外部用户而在 VPTO emission 失败。该对照仅用于诊断，
  不作为严格的性能 baseline；其 fusion-on 阶段快照仍然通过并用于分析。

因此可以确认 Candidate 选择、fallback 协议和 VMIToVPTO 已经工作；不能据此
宣称 FA/Softmax 已经形成有效深融合或已经获得性能收益。

## 支持范围

按真实用例而不是按 op 名称统计：

| 用例族 | 数量 | Lowering | 最终残留 VMI |
|---|---:|---:|---:|
| Decode Attention / CSA | 47 | 47/47 | 0 |
| Prefill Attention / CSA | 53 | 53/53 | 0 |
| QKV Projection / RoPE | 18 | 18/18 | 0 |
| RMSNorm | 2 | 2/2 | 0 |
| 合计 | 120 | 120/120 | 0 |

在 120 个用例中：

- 6 个用例只有 VMI candidate 和允许的 hard boundary；
- 62 个用例包含 VMI candidate，但计算链中仍有 local boundary；
- 52 个用例只有 MTE、Cube、通信或其他 hard-boundary 路径，不构成 VMI
  fusion 候选。

后两类并不表示 lowering 失败。Hard boundary 本来就应该走 VPTO/普通 PTODSL
路径；真正需要继续补齐的是切断关键 vector 链的 local boundary。

## 真实 TileOp 落径

FusionRegionGen 阶段的主要 VMI candidate 已覆盖：

- Elementwise：`tadd/tadds/tsub/tmul/tmuls/tdiv/tmax/tmaxs/tmins`；
- Exp/Reciprocal/Rsqrt/Sqrt：`texp/trecip/trsqrt/tsqrt`；
- Reduce/Broadcast：部分 `trowmax/trowsum/trowexpandsub`，以及
  `tcolexpandmul/tcolexpandadd`；
- Convert/Move：部分 `tcvt/tmov`。

最大的 local-boundary 缺口是：

| TileOp | local fallback | 已走 VMI |
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

这里的数字是实际 instance 落径，不是“代码中存在一个 candidate”就算支持。
尤其 `tcvt`、RowExpand、RowReduce 正好处在 RMSNorm 和 Softmax 主链上，应优先
区分是 dtype/round/form/valid-shape 约束不匹配，还是确实缺少模板。

`tload/tstore/textract/tfillpad/tmatmul/tgather/sort` 等保留为 hard boundary
符合当前架构目标。`tpush/tpop/tfree/treshape/tgetval/tsetval` 等 53 个直接
控制、视图或标量访问 op 没有 TileLib candidate 分类，也不应为了统计比例被
伪装成 VMI candidate。

## 融合友好性判断

当前 IR **具备做融合分析的基本信息**：

- candidate 已在 FusionPlan/Region 前确定；
- VMI、local boundary、hard boundary 能在 IR 中区分；
- VMI 展开能进入 VMIToVPTO，最终不存在未处理 VMI；
- 关键用例保存了 RegionGen、Loop Fusion 前后及 Mem2Reg 后快照。

但当前结果还 **不利于形成深融合**：

1. 1056/1056 个 FusionRegion 都只有一个 VMI TileOp，依赖相邻的 VMI TileOp
   没有被聚集为多 op region。
2. 1100 个 VMI candidate 中有 44 个位于 FusionRegion 外，需要确认是合法豁免、
   控制流限制，还是 RegionGen 漏标。
3. 单 op region 展开后，Loop Fusion 没有可合并的同域 sibling loop；因此 8 个
   关键链循环数全部不变，不是 Mem2Reg 单独能够补救的问题。
4. local boundary 正好落在 Convert、RowExpand、Reduce 等主链节点，会把
   Softmax/RMSNorm phase 切碎。
5. Mem2Reg 目前只消除少量 load，没有消除 store，说明跨 TileOp 的 producer-
   consumer forwarding 尚未真正建立。

## 下一步优先级

1. **先修 Region 聚集**：FusionPlan 应按依赖、SCF phase、iteration domain 和
   boundary 构建 maximal eligible region，而不是每个 VMI TileOp 一个 group。
2. **细化拒绝原因**：把统一的 `non_vmi_local_boundary_fallback` 拆成
   `no_candidate/dtype_or_mode/tail/dynamic_valid_shape/form_mismatch`，才能针对
   真实缺口补模板。
3. **补关键链 local candidate**：优先 `tcvt` 转换矩阵、`trowexpandmul/div`、
   `trowsum/trowmax` 的缺失形态，再处理与主链无关的低频 op。
4. **诊断 44 个 region 外 VMI instance**：为每个 instance 输出函数、父控制流、
   domain 和拒绝原因。
5. **再验 Loop Fusion/Mem2Reg**：目标是关键 Softmax 链形成多 op region、同域
   row loop 数下降、中间 UB store-load 对明显消除；在此之前不要用最终 VPTO
   “无残留 VMI”代表融合成功。
6. **最后做性能闭环**：保留 fusion-on 各阶段 IR，并新增同 candidate、仅关闭
   VMI Loop Fusion/Mem2Reg 的控制组，再比较 VPTO、LLVM、汇编和 A5 latency。

## 证据索引

- `summary.md`：整体结果与 8 个关键链指标；
- `case_lowering_status.tsv`：120 个用例逐项状态；
- `tileop_lowering_class.tsv`：45 类 TileOp 的 VMI/local/hard 落径；
- `region_size_distribution.tsv`：FusionRegion 大小分布；
- `boundary_reasons.tsv`：边界原因统计；
- `key_case_fusion_metrics.tsv`：关键用例各阶段 loop/load/store 变化；
- `artifacts/<commit>/final-vpto/`：120 份最终 VPTO；
- `artifacts/<commit>/key-cases/`：关键链 fusion-on/off 和阶段 IR。
