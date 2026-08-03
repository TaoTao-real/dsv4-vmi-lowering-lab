# VMI VF Fusion Milestone 规划

## 总目标

在 DSv4 Decode/Prefill FA 的 Softmax/Online Softmax vector 主链上完成：

```text
候选实现确定
→ 合法多 TileOp FusionRegion
→ 同域 row-loop fusion
→ 同迭代 UB store-load forwarding
→ VMIToVPTO
→ 数值、汇编与 A5 性能验收
```

RMSNorm、RoPE 保证 lowering 和正确性回归；深融合为次级目标。动态 tail/mask、
high-precision `trsqrt`、Gather/ND2NZ 专项融合和 cost model 不进入本轮关键路径。

## M1：Region 聚集与可解释拒绝

目标：将当前“每个 VMI TileOp 一个 region”收敛为依赖驱动的 maximal eligible
region，同时严格保留 local/hard boundary。

输入：

- 已锁定的 TileLib candidate；
- `TileShapeStateAnalysis` 结果；
- Tile Buffer producer/consumer、DPS write instance 和 escape；
- local/hard boundary、SCF phase、iteration domain 与 memory effects。

工作：

1. 定位当前 1056 个 singleton region 的形成原因，确认 FusionPlan DFG edge、
   group merge 和 RegionGen result wiring 是否完整。
2. 以依赖闭包构建 maximal eligible group，不跨 local/hard boundary。
3. 给 44 个 region 外 VMI instance 输出函数、父控制流、domain 和拒绝原因。
4. 细化 local reason：`no_candidate`、`dtype_or_mode`、`form_mismatch`、
   `tail_valid_shape`、`dynamic_valid_shape`、`alias_unknown`。
5. 增加确定性测试，保证 FusionPlan 每次生成相同 group 和拒绝报告。

完成 gate：

- Softmax/RMSNorm 关键链出现至少一个包含 3 个以上 VMI TileOp 的 region；
- 可以形成合法 region 的相邻 producer-consumer 不再被拆成 singleton；
- local/hard boundary 负例均不被穿透；
- 44 个 region 外 instance 全部获得稳定分类；
- Fusion 失败保持原 IR，120/120 DSv4 emit-vpto 不回退。

交付：PTOAS Region/diagnostic PR、更新后的全量 artifact baseline 和 region-size
对比报告。

## M2：关键链 Candidate 收口

目标：只补会切断 FA/Softmax/RMSNorm vector 主链的真实 candidate/form 缺口，
不把 hard-boundary op 改造成 VMI。

优先顺序：

1. `tcvt`：按真实 dtype、round、sat、valid-shape form 归类 260 个 fallback；
2. `trowexpandmul/trowexpanddiv`；
3. `trowsum/trowmax` 的缺失 shape/dtype/form；
4. `texpands/tsubs/tabs/tneg/tcolexpand` 中实际位于关键链的部分。

每个新增 form 必须证明：

- 单 logical-row 主循环，无 physical-chunk 内层循环；
- logical lanes、dtype、round/sat 和 valid shape 语义完整；
- memory effects 和 mask obligation 可见；
- VMIToVPTO 无残留 VMI；
- fusion 关闭或拒绝时仍能稳定 fallback。

完成 gate：

- 关键 Softmax phase 内不再因已知静态 full-shape form 出现 local boundary；
- 关键 RMSNorm normalize chain 的 local boundary 显著下降；
- 不降低 120/120 lowering 通过率；
- 为新增 form 增加 lit、CPU golden 和 legacy unfused 对比。

交付：按 Convert、Reduce/Broadcast、Unary 分拆的 TileLib PR 和 instance 级覆盖报告。

## M3：Loop Fusion 与 Mem2Reg 深融合

目标：在 M1 产生的多 op region 内合法合并 row loop，并消除同迭代中间 UB
store-load 往返。

工作：

1. 统一 iteration domain、logical-row map 和 provenance；
2. 检查跨迭代 RAW/WAR/WAW、mask compatibility、escape 和 synchronization；
3. LocationKey 统一 storage root、数值基地址、静态 byte range、affine offset、
   dtype 与 mask；
4. 同 iteration、同 location、覆盖范围兼容时执行 forwarding；
5. region 外仍有消费者时保留 observable store，只消除 reload；
6. 为每次 fusion/elision 和拒绝生成统计与诊断。

关键链：

```text
RowMax
→ RowExpandSub
→ Exp
→ RowSum
→ RowExpandDiv/Mul
→ Convert
```

完成 gate：

- 同域关键链的主 row loop 数明显下降；
- 可提升的中间 UB store-load 对消除率达到 80% 以上；
- dynamic address、subview overlap、不同 byte type overlap、跨迭代依赖、
  mask 不兼容均有保守负例；
- 不误删 observable store，不产生 spill、错误 membar 或同步删除；
- 120/120 DSv4 lowering 和 PTOAS 全量 CI 继续通过。

交付：Loop Fusion PR、Mem2Reg PR、阶段 IR 和 UB traffic 报告。

## M4：正确性与 A5 性能验收

目标：证明深融合不仅改变 IR，而且数值正确、汇编符合预期并在 A5 获得收益。

实验控制：

- 保持同一 VMI candidate，只分别关闭 Region/Loop Fusion/Mem2Reg；
- 固定 shape、dtype、mask、输入、CANN/Bisheng 版本与 launch 配置；
- 不在被测融合链中插入 `TPRINT`。

验收：

1. CPU/PyTorch golden、VMI unfused、VMI fused 三方数值比较；
2. VPTO/LLVM/Bisheng diagnostics 对比；
3. 汇编检查 VLOOP、VLD/VST、membar、mask setup、spill 和 code size；
4. A5 预热后重复测量，报告 median 与离散度。

完成 gate：

- FP32 使用 `rtol/atol=1e-5`，FP16/BF16 使用 `1e-2`，特殊值单独验证；
- VMIToVPTO 后无残留 VMI；
- 汇编可观察到目标 UB load/store 对消除，无新增 spill 或错误同步；
- 关键 Softmax vector 段性能不回退，目标提升至少 10%；
- 未达到性能目标时提供寄存器压力、layout、同步或指令调度层面的原因。

交付：Decode/Prefill FA 验收报告、数值日志、VPTO/LLVM/汇编和 A5 latency 数据。

## 推荐 PR 顺序

1. Region 聚集与拒绝诊断；
2. 关键 local-boundary candidate 收口；
3. Loop Fusion legality 与多 op region 集成；
4. Mem2Reg/UB forwarding；
5. DSv4 数值、汇编和 A5 性能报告。

每个 PR 独立通过 targeted lit、PTODSL Python、`check-pto` 和 DSv4 关键 gate。
每次基线变化都在本仓库新增以 PTOAS commit 命名的 artifact/report 目录，不覆盖
历史结果。
