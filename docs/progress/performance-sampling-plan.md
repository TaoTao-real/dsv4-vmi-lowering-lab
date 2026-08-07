# DSv4 VMI VF Fusion 性能采样与静态分析计划

## 结论

120 个真实 PTO 文件不适合全部进行运行时采样。性能采样需要完整入口、可复现
输入、可信输出、明确计时边界和 Fusion OFF/ON 对照；不满足这些条件时，ticks
只能用于问题定位，不能用于性能验收。

当前将 120 个用例划分为：

```text
13 个性能候选：同时保留静态分析和运行时采样计划
107 个静态用例：只输出 lowering、fusion-ready 和拒绝原因
```

性能候选清单见 `manifests/performance_cases.tsv`，覆盖 120 个文件的机器可读矩阵
见 `reports/<ptoas-commit>/case_evaluation_matrix.tsv`。已有 camodel 单次诊断数据
汇总在 `reports/performance_baseline_20260803.tsv`，不得把其中 correctness 未闭环的
RoPE/RMSNorm 数值作为性能验收结论。

2026-08-04 的串行重复采样保存在
`reports/camodel-repeats-20260804-serial-r10/`。该批次共 80 次，使用 2026-08-03
构建的远端对象，仅用于历史对象的稳定性和瓶颈诊断；当前 PTOAS HEAD 的运行时
性能必须重建对象后重新采集。

## 性能候选分级

### P0：已有 camodel 路径

| 场景 | 当前状态 | 结论使用范围 |
|---|---|---|
| Prefill Softmax | OFF/ON 可运行且输出 byte-equal | 可以持续采样；补 CPU golden 后进入性能验收 |
| Prefill RoPE | OFF/ON 可运行 | 仅诊断；输出差异和 packing 解释未闭环 |
| Decode RMSNorm/RoPE | OFF/ON 可运行 | 仅诊断；存在非有限值和输出差异 |

### P1：下一批建设 harness

优先建设直接覆盖 VF Fusion 关键链的用例：

1. Decode `scatter_softmax_pool` 及其变体；
2. Prefill indexed Softmax；
3. Decode/Prefill `comb_sinkhorn` Online Softmax；
4. 独立 RMSNorm、Decode RMSNorm 和 Prefill merge norm。

这些用例包含 Reduce、Broadcast、Elementwise、Convert 和中间 UB 往返，是衡量
Region、Loop Fusion、Mem2Reg 和 candidate 质量的主要对象。

### P2：宏观 FA 采样

Decode/Prefill `qk_pv` 同时包含 Cube 和 Vector kernel。它适合观察端到端收益，
但无法单独归因于 VMI VF Fusion，因此应在 Softmax/RMSNorm 微基准稳定后再采样。

## 性能采样协议

每个候选至少保留三组结果：

```text
A: 普通 PTODSL candidate，Fusion OFF
B: 固定 VMI candidate，VMI Loop Fusion/Mem2Reg OFF
C: 同一 VMI candidate，VMI Loop Fusion/Mem2Reg ON
```

其中 `B -> C` 才是 VMI Fusion Pass 的净收益，`A -> B` 反映 candidate 和
VMIToVPTO code shape 的影响。所有组必须使用相同 shape、dtype、mask、输入、
编译器、启动配置和计时范围。

运行时报告必须包含：

- CPU/PyTorch golden、OFF、ON 三方数值结果；
- 预热后至少 10 次采样的 median、min、max 和离散度；
- VPTO/汇编中的 VLOOP、VLD、VST、membar、mask setup、spill 和代码大小；
- 实际消除的 UB store-load 对；
- candidate、Loop Fusion 和 Mem2Reg 各自的贡献；
- 回退时的依赖链、寄存器压力、同步或调度原因。

## 静态用例协议

未进入性能清单的 107 个文件继续参与 120/120 sweep，并输出：

- `emit-vpto` 是否通过，最终是否残留 VMI；
- VMI candidate、local boundary、hard boundary 数量及原因；
- FusionRegion 数量、成员数分布和 region 外 VMI 单元；
- Loop Fusion 前后主循环数量和稳定拒绝原因；
- Mem2Reg 前后 VMI load/store 数量；
- 动态 valid shape、tail/mask、未知 alias、sync、MTE、Cube 等边界分类。

静态结论只能说明 lowering 完整性和融合机会，不能据此声称运行时加速。

## 下一轮执行顺序

1. 在冻结的新 PTOAS commit 上刷新 120/120 静态矩阵；
2. 修复 P0 RoPE、RMSNorm/RoPE 的输入和 golden；
3. 建设 Decode Softmax、Online Softmax 和 standalone RMSNorm harness；
4. 对 P0/P1 执行 A/B/C 重复采样；
5. 根据结果选择 candidate code shape、物理调度或 Fusion legality 的下一批修改；
6. 微基准稳定后再测 `qk_pv` 端到端 FA。

## 首轮重复采样结论

| 场景 | 对照 | 中位 ticks | 结论 |
|---|---|---:|---|
| Softmax | ordinary / VMI base / VMI elide | 9085 / 9603 / 9528 | Elision 删除 64 VLD、62 VST，但最终仍比 ordinary 慢 4.9% |
| RoPE | VMI base / loop / elide | 10669 / 11952 / 10787 | 输出不一致；仅诊断，Loop Fusion 单独回退 12.0% |
| RMSNorm | off / on | 3810.5 / 4536.5 | 输出不一致；仅诊断，ON 增加 VLOOP/VLD/VST 并回退 19.1% |

这组结果说明：现有 Pass 已能聚合 region、减少循环和中间 UB 往返，但“融合成功”
不等于“性能提升”。下一轮必须优先审计 wide-vreg 展开、重复 load/store、寄存器压力、
mask setup 和物理调度，并先闭环 RoPE/RMSNorm 正确性。
