# DSv4 VMI VF Fusion 静态与性能采样结果

## 本轮结论

本轮完成了 120 个真实 DSv4 PTO 文件的静态 lowering 扫描，以及 8 个 camodel
变体、每个变体 10 次的串行重复采样。两类数据的代码来源不同，必须分开解读：

- 静态扫描使用 PTOAS `7d299080400c`，叠加本地 VecScope 和
  fusion-result subview 修复；精确状态和源码哈希记录在 `run_manifest.json`。
- camodel 使用 2026-08-03 已构建的远端对象。Loop Fusion 和 Load/Store
  Elision 源码哈希与本地一致，但它不是当前工作区重建后的运行时结果。

## 静态 Lowering

```text
真实 PTO 文件                 120
emit-vpto 通过                120
超时/失败                       0
最终 VPTO 残留 VMI              0
源 TileOp instance/kind       3280/45
FusionRegion                   328
单 VMI TileOp region           151 (46.0%)
多 VMI TileOp region           177 (54.0%)
VMI candidate                 1100
local boundary                 649
hard boundary                 1486
region 外 VMI TileOp             44
```

这说明统一 PTODSL backend 已经能够完整处理当前 120 个真实输入，并且 Region
聚集不再停留在 singleton：54% 的 region 包含至少两个 VMI TileOp。当前主要缺口
转为 local boundary 覆盖和融合后代码形态，而不是“没有可供 Loop Fusion 分析的
多 op region”。最大的 local gaps 是 `tcvt`、`texpands`、`trowexpandmul`、
`trowexpanddiv` 和部分 Reduce form。

关键场景已有以下静态变化：

| 场景 | Region | Loop 变化 | Load 消除 | Store 消除 |
|---|---:|---:|---:|---:|
| Decode Online Softmax (`comb_sinkhorn`) | 4 | 113 -> 82 | 40 | 11 |
| Decode RMSNorm | 4 | 24 -> 22 | 4 | 0 |
| Decode RMSNorm/RoPE | 11 | 35 -> 26 | 12 | 5 |
| Prefill MergeNorm | 3 | 16 -> 16 | 16 | 6 |
| Prefill Softmax | 11 | 8 -> 8 | 12 | 5 |
| Prefill RoPE | 3 | 19 -> 13 | 6 | 3 |

静态 loop/load/store 下降只能证明变换发生，不能替代数值和运行时验收。

## Camodel 重复采样

| 变体 | 中位 ticks | VLOOP | VLD | VST | 正确性状态 |
|---|---:|---:|---:|---:|---|
| Softmax ordinary | 9085 | 66 | 324 | 343 | 与 VMI 输出 hash 一致，缺 CPU golden |
| Softmax VMI base | 9603 | 16 | 340 | 374 | 与 ordinary 输出 hash 一致 |
| Softmax VMI elide | 9528 | 16 | 276 | 312 | 与 ordinary 输出 hash 一致 |
| RoPE VMI base | 10669 | 49 | 5250 | 3697 | host 校验失败，仅诊断 |
| RoPE loop | 11952 | 30 | 5250 | 3688 | 输出 hash 变化，仅诊断 |
| RoPE loop + elide | 10787 | 30 | 4034 | 3045 | 输出 hash 变化，仅诊断 |
| RMSNorm off | 3810.5 | 15 | 321 | 381 | host 校验失败，仅诊断 |
| RMSNorm on | 4536.5 | 22 | 466 | 499 | 输出 hash 变化，仅诊断 |

Softmax 中，Elision 相对 VMI base 消除了 64 次动态 VLD 和 62 次动态 VST，性能
改善 0.8%；但 VMI candidate 本身相对 ordinary 慢 5.7%，最终仍慢 4.9%。这说明
当前瓶颈主要位于 candidate 展开、wide-vreg 物理化和后端调度，不能只靠扩大
Region 或删除 UB 往返解决。

RoPE 的 Loop Fusion 单独回退 12.0%，Elision 能收回大部分损失，但输出尚未一致。
RMSNorm ON 回退 19.1%，同时增加了 VLOOP/VLD/VST。两者在正确性闭环前不得用于
性能宣称。

## 下一阶段

1. 用当前修复后的工作区重新构建 Softmax A/B/C 对象，补 CPU golden，再重复采样。
2. 修复 RoPE packing/输出契约与 RMSNorm 输入、非有限值和 golden，先完成正确性。
3. 对 Softmax VMI base 审计 wide-vreg 拆分、mask setup、地址更新、寄存器压力和
   物理调度，解释 `A -> B` 的 5.7% candidate 回退。
4. 补齐高频 local boundary form，优先保证 Reduce/Broadcast/Elementwise 主链连续。
5. 建设 Decode/Online Softmax 独立 harness，再采集端到端 FA；宏观 FA 数据必须在
   微基准稳定后使用。

## 证据位置

- 静态汇总：`reports/7d299080400c.../summary.md`
- 120 用例结果：`reports/7d299080400c.../case_lowering_status.tsv`
- 关键场景指标：`reports/7d299080400c.../key_case_fusion_metrics.tsv`
- camodel 报告：`reports/camodel-repeats-20260804-serial-r10/report.md`
- camodel 原始采样：`reports/camodel-repeats-20260804-serial-r10/samples.tsv`
