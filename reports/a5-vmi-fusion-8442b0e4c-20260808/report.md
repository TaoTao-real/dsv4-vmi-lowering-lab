# DSv4 关键 Vector 子图 A5 VMI VF Fusion 最新实验

## 结论

本轮基于 PR #51 的 narrow/grouped VMI candidate，统一重采 5 个真实 DSv4
vector 子图。每个子图构建 4 种编译模式、固定输入串行采样 5 次，共完成
`100/100` 条 A5 样本。

| DSv4 子图 | 普通 VPTO | VMI candidate | 完整 VMI Fusion | 完整融合相对普通 | 结论 |
|---|---:|---:|---:|---:|---|
| Decode Comb Sinkhorn | 59.262 us | 14.321 us | 14.486 us | 快 75.56%，4.09x | candidate 带来主要收益 |
| Prefill Comb Sinkhorn | 59.753 us | 14.569 us | 14.105 us | 快 76.39%，4.24x | candidate 与后续优化均有收益 |
| Prefill Softmax | 99.111 us | 99.833 us | 99.074 us | 快 0.04% | 当前持平 |
| Prefill RoPE | 81.902 us | 86.792 us | 73.819 us | 快 9.87% | fusion 覆盖 candidate 开销并产生净收益 |
| Decode RMSNorm | 29.696 us | 26.777 us | 25.906 us | 快 12.76% | candidate 与完整 fusion 均有收益 |

五个子图中，每个场景的 ordinary、candidate、loop 和 fused 输出均为同一个
组合 SHA-256，且每种模式的 5 次结果稳定。这个 PASS 证明 A5 上四条编译路径
byte-exact；它不是独立 CPU/PyTorch golden。

## 四种模式

| 模式 | 编译含义 | 用途 |
|---|---|---|
| A `ordinary` | 普通 PTODSL/VPTO，关闭 VMI 和 op fusion | 普通实现基线 |
| B `vmi_candidate` | 开启 VMI candidate 和 FusionRegion，关闭 VMI loop fusion 与 load/store elision | candidate 路径基线 |
| C `vmi_loop` | 在 B 上开启 VMI loop fusion | 隔离循环融合增量 |
| D `vmi_fused` | 在 C 上开启 VMI load/store elision | 当前完整 VMI VF Fusion |

B/A 同时包含 candidate 选择和建立 FusionRegion 的差异。C/B 与 D/C 分别隔离
PTOAS 的 VMI loop fusion 和保守的同迭代 load/store forwarding。

## 分阶段数据

百分比为耗时变化，负数表示更快。

| 子图 | B/A candidate 路径 | C/B loop fusion | D/C load/store elision | D/A 完整结果 |
|---|---:|---:|---:|---:|
| Decode Comb Sinkhorn | -75.83% | +0.04% | +1.11% | -75.56% |
| Prefill Comb Sinkhorn | -75.62% | -1.46% | -1.76% | -76.39% |
| Prefill Softmax | +0.73% | +0.85% | -1.60% | -0.04% |
| Prefill RoPE | +5.97% | -3.57% | -11.80% | -9.87% |
| Decode RMSNorm | -9.83% | +17.81% | -17.88% | -12.76% |

RMSNorm 的 loop-only 回退是稳定现象：C 的 5 次范围为
`31.407-32.429 us`，不是单点抖动。完整 load/store elision 能覆盖该回退，
但下一步仍需从寄存器压力、同步和指令调度解释 C/B 的 `+17.81%`。

## Sinkhorn 4x 的来源

两个 Sinkhorn 的 `SelectTemplateCandidate` dump 均显示：

```text
selected VMI candidates: 108
local boundaries:          0
hard-boundary TileOps:     21
```

grouped/narrow candidate 把多个窄行打包到 64-lane 向量并直线展开。由于这些
candidate 不生成 principal row loop，inline 后最终 VPTO 不再保留 candidate
loop provenance；因此只统计最终 `pto.tilelib.impl="vmi"` 会错误地把它们判成
fallback。报告使用 candidate-selection dump 判断覆盖率，使用最终 VPTO 判断物理
loop 和访存结构。

Decode Sinkhorn 的最终 VPTO 从 ordinary 到 candidate 变化为：

```text
scf.for: 113 -> 17
vlds:    172 -> 156
vsts:    124 -> 124
mem_bar: 233 -> 145
```

首个 profile 的 AIV 指标为：

| 指标 | Ordinary | VMI candidate |
|---|---:|---:|
| AIV total cycles | 95,387 | 21,709 |
| AIV vector time | 54.394 us | 8.713 us |
| AIV scalar time | 1.090 us | 1.028 us |
| AIV MTE2 time | 0.882 us | 1.127 us |
| AIV MTE3 time | 0.988 us | 1.015 us |

ordinary 与 VMI 都只有一个 A5 kernel task，MTE 时间也基本不变。因此 4x 不是
kernel launch 减少，也不是后续 mem2reg 产生的收益；主因是 packed candidate
消除了大量逐行/逐块 vector loop。Decode 的 C、D 与 B 基本持平，Prefill 的
C、D 在 B 基础上继续改善约 3.2%。

## 结构变化

| 子图 | selected candidate B | loop B -> D | `vlds` B -> D | `vsts` B -> D | `mem_bar` B -> D |
|---|---:|---:|---:|---:|---:|
| Decode Comb Sinkhorn | 108 | 17 -> 17 | 156 -> 156 | 124 -> 124 | 145 -> 145 |
| Prefill Comb Sinkhorn | 108 | 17 -> 17 | 156 -> 156 | 124 -> 124 | 145 -> 145 |
| Prefill Softmax | 20 | 38 -> 29 | 40 -> 33 | 35 -> 32 | 21 -> 12 |
| Prefill RoPE | 15 | 19 -> 13 | 23 -> 15 | 18 -> 15 | 27 -> 15 |
| Decode RMSNorm | 12 | 14 -> 12 | 61 -> 57 | 50 -> 45 | 25 -> 23 |

所有最终 VPTO 的真实 `pto.vmi.*` operation 残留数均为 `0`。表中的 Sinkhorn
selected candidate 数来自 selection dump；其他场景可从 candidate 版本最终
provenance 直接审计。

## 实验协议

- PTOAS 基线：`8442b0e4c746afdaa63de4c8cb1e5629359f6ba2`。
- vecscope follow-up：代码随后提交为 `ec32a80c3`；A5 二进制使用相同的编译器
  源码修复，测试文件不影响生成物。
- 目标：`Ascend950PR_9599` / `dav-c310-vec`。
- CANN：`9.1.0-beta.3`；A5 device 0。
- PTOAS 使用 `--enable-insert-sync`，设备编译统一使用
  `--bisheng-vf-auto-sync=fused`。
- 每个 case/variant 先 warmup 1 次，再串行 profile 5 次。
- 每次运行前恢复相同输入；每次运行后校验全部输出文件的组合 SHA-256。
- 延迟取 profiler `task_time` 中唯一 measured kernel 行，汇总使用中位数。

## 复现与证据

```bash
python3 scripts/analyze_a5_vmi_fusion_ir.py \
  artifacts/8442b0e4c-a5-vf-sampling \
  reports/a5-vmi-fusion-8442b0e4c-20260808/static_metrics.tsv

python3 scripts/summarize_a5_vmi_fusion.py \
  reports/a5-vmi-fusion-8442b0e4c-20260808 \
  --expected-case decode_comb_sinkhorn \
  --expected-case prefill_comb_sinkhorn \
  --expected-case prefill_softmax \
  --expected-case prefill_rope \
  --expected-case decode_rmsnorm
```

证据文件：

- `samples.tsv`：100 条原始耗时与输出 hash。
- `summary.tsv`：每组中位数、范围和标准差。
- `comparison.tsv`：A/B/C/D 的机器可读对比。
- `static_metrics.tsv`：22 份 VPTO 的 loop、访存、边界和残留 VMI 统计；额外
  两份 Sinkhorn diagnostic 变体用于拆分 pipeline。
- `candidate_selection.tsv`：Sinkhorn 中间候选选择结果。
- `run_manifest.tsv`：每条样本与远端 profiler/log 的对应协议。
- `artifacts/8442b0e4c-a5-vf-sampling/`：20 份采样 VPTO、2 份 diagnostic VPTO
  和 2 份已去除运行时路径信息的 selection dump。

## 下一步

1. 为五个场景接入独立 CPU/PyTorch golden，完成最终数值验收。
2. 定位 Softmax candidate 的 `+0.73%` 开销；当前完整融合只能做到持平。
3. 分析 RMSNorm loop-only 的 `+17.81%` 回退，重点检查寄存器压力和同步调度。
4. 为直线展开 candidate 保留稳定的 selection provenance，避免只能依赖中间 dump。
5. 在完整 Decode/Prefill FA 上复用同一 A/B/C/D 协议，而不是把子图收益外推到整算子。
