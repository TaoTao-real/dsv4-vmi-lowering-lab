# DSv4 关键 Vector 子图 A5 VMI VF Fusion 实验报告

## 一页结论

本轮在 `feature-vmi@b9a20b1ace5727139b8cea873b2c789e6124fb6c` 上测量
6 个真实 DSv4 vector 子图，
每个子图构建 4 种编译模式并串行执行 5 次，共完成 `120/120` 条 A5
采样。这里的用例是从真实 DSv4 流程提取的子图，不等同于完整 FA、QKV
或整网端到端性能。

在输出 hash 跨模式一致的场景中：

- Prefill RoPE 完整 VMI VF Fusion 比普通 VPTO 快 `8.16%`。
- Decode RMSNorm 完整 VMI VF Fusion 比普通 VPTO 快 `12.85%`。
- Prefill Softmax 最终慢 `0.16%`，在本轮噪声尺度内只能判定为持平。
- 两个 Comb Sinkhorn 子图没有选择任何 VMI candidate，结果只证明 fallback
  路径稳定，不能作为 VMI Fusion 收益。
- Decode RMSNorm+RoPE 虽显示快 `7.68%`，但普通与 VMI 输出不一致，不能验收
  该性能结果。

因此，当前可以确认 VMI VF Fusion 已在 RoPE 和 RMSNorm 子图产生实测收益；
Softmax 已消除部分循环和 UB 访存，但收益被 candidate 本身的开销抵消；
Sinkhorn 尚未进入 VMI 优化路径。

## 对比方法

为区分“candidate 实现差异”和“融合优化收益”，每个场景使用以下四档：

| 模式 | 含义 | 用途 |
|---|---|---|
| A `ordinary` | 普通 PTODSL/VPTO candidate，不启用 VMI | 性能基线 |
| B `vmi_candidate` | 选择 VMI candidate，保留 region planning，关闭 VMI loop fusion 和访存消除 | 衡量 candidate 路径基线 |
| C `vmi_loop` | 在 B 上开启 VMI loop fusion | 单独衡量循环合并 |
| D `vmi_fused` | 在 C 上开启保守的 load/store forwarding 与消除 | 完整 VMI VF Fusion 结果 |

表中耗时越低越好；“快/慢百分比”均以 A 的中位数为基准。

当前 driver 中 VMI candidate 选择依赖 op-fusion 流水线，因此 B 仍包含
FusionRegion planning 和 inline scaffolding。B/A 是“VMI candidate 路径”与普通
VPTO 的差异，不是脱离编译流水线的纯模板 micro-benchmark；C/B 和 D/C 才分别
隔离本地 VMI loop fusion 与 load/store elision 的增量效果。

## 性能与正确性

| 真实 DSv4 子图 | 普通 VPTO A | VMI candidate B | 完整融合 D | D 相对 A | 跨模式输出 | 可接受结论 |
|---|---:|---:|---:|---:|---|---|
| Prefill Softmax | 99.490 us | 101.753 us | 99.646 us | 慢 0.16% | PASS | 性能持平，尚无净收益 |
| Prefill RoPE | 87.832 us | 93.322 us | 80.665 us | 快 8.16% | PASS | VMI Fusion 有收益 |
| Decode RMSNorm | 30.256 us | 27.241 us | 26.369 us | 快 12.85% | PASS | VMI candidate 与 Fusion 均有收益 |
| Decode RMSNorm+RoPE | 11.600 us | 11.312 us | 10.709 us | 快 7.68% | MISMATCH | 仅诊断，不能验收性能 |
| Decode Comb Sinkhorn | 59.709 us | 59.571 us | 60.013 us | 慢 0.51% | PASS | 未选择 VMI，无 Fusion 结论 |
| Prefill Comb Sinkhorn | 59.541 us | 59.522 us | 59.801 us | 慢 0.44% | PASS | 未选择 VMI，无 Fusion 结论 |

`decode_rmsnorm_rope` 的 `v5.bin` 在普通路径与 VMI 路径之间不一致：

```text
ordinary:      5ed034d72e9904cb6579b95548429ca7920f394b9b5b67ba0ba66db52bda7bfb
VMI B/C/D:     ad2768c71558afa4e64ecb45bc3c5c0b7218a9289cde676b5f2fd8cc680042a5
```

当前首个 lowering 线索是普通 `f32 -> bf16` 转换带 `SAT`，VMI 路径对应转换
带 `NOSAT`。这只是待验证线索，尚不能据此认定根因。

本报告的 PASS 表示四种编译模式输出 byte hash 一致，并且每种模式 5 次输出稳定；
它不是独立 PyTorch/CPU golden 验收。后续最终数值验收仍需加入独立 golden 和特殊值输入。

## 优化实际发生了什么

下表从最终 VPTO 中统计带 provenance 的 VMI principal loop，以及物理
`vlds/vsts`。B 到 C 反映 loop fusion，C 到 D 反映当前保守的同迭代
load/store forwarding；它不是通用 SSA mem2reg。

| 子图 | VMI principal loop B -> C | `vlds` B -> D | `vsts` B -> D | 剩余边界 | 解释 |
|---|---:|---:|---:|---|---|
| Prefill Softmax | 32 -> 21 | 40 -> 32 | 35 -> 32 | 0 | 循环和 UB 访存均下降，但 candidate 慢 2.27%，最终仅持平 |
| Prefill RoPE | 15 -> 9 | 23 -> 15 | 18 -> 15 | 1 hard | 访存消除覆盖 candidate 开销，形成 8.16% 净收益 |
| Decode RMSNorm | 12 -> 10 | 67 -> 63 | 50 -> 46 | 0 | loop-only 阶段变慢，访存消除后最终快 12.85% |
| Decode RMSNorm+RoPE | 27 -> 14 | 68 -> 54 | 60 -> 54 | 2 local + 1 hard | 结构优化明显，但受正确性问题阻塞 |
| 两个 Comb Sinkhorn | 0 -> 0 | 172 -> 172 | 124 -> 124 | 98 local + 16 hard | 全部走普通 fallback，没有 VMI 优化 |

所有 24 份最终 VPTO 的真实 `pto.vmi.*` operation 残留数均为 `0`；
`pto.vmi.fusion.*` provenance attribute 保留用于审计，不是未完成 lowering 的指令。

## 采样协议

- PTOAS：`b9a20b1ace5727139b8cea873b2c789e6124fb6c`，版本 `0.53`。
- 目标：`Ascend950PR_9599` / `dav-c310-vec`。
- CANN：`9.1.0-beta.3`。
- 最终采样设备：A5 device 7。
- 同一场景的输入、shape、scalar override 和输出集合在 A/B/C/D 间保持一致。
- PTOAS 开启 `--enable-insert-sync`；设备编译统一使用
  `--bisheng-vf-auto-sync=fused`。
- 每个场景/模式先 warmup 1 次，再串行采样 5 次，避免共享设备资源竞争。
- 每条延迟取 profiler `task_time` 中唯一的 measured kernel 行，汇总使用中位数。
- 每次运行计算全部输出文件的组合 SHA-256，检查重复稳定性和跨模式一致性。

早期在 device 1 上发现设备级异常：同一个 Prefill Softmax ordinary binary
中位数为 `1315.293 us`，而 device 7 为 `99.490 us`，相差约 `13.2x`。
因此 device 1 的整批结果只保留为诊断，不与 device 7 混合或平均。

## 复现与审计

重新汇总已提交数据：

```bash
python3 scripts/analyze_a5_vmi_fusion_ir.py \
  artifacts/b9a20b1ac-a5-vf-sampling \
  reports/a5-vmi-fusion-b9a20b1ac-20260807/static_metrics.tsv
python3 scripts/summarize_a5_vmi_fusion.py \
  reports/a5-vmi-fusion-b9a20b1ac-20260807
```

在 A5 上重新采样时，先准备同名的 6 个 case 和 4 个 variant，再执行：

```bash
WORK_ROOT=/path/to/generated-cases \
RESULT_ROOT=/path/to/results \
DEVICE_ID=7 REPEATS=5 \
scripts/collect_a5_vmi_fusion_samples.sh
```

证据文件：

- `samples.tsv`：120 条原始耗时和输出 hash。
- `summary.tsv`：每个场景/模式的中位数、范围和标准差。
- `comparison.tsv`：A/B/C/D 对比和可接受状态。
- `run_manifest.tsv`：每条样本对应的 profiler/log 位置协议。
- `static_metrics.tsv`：24 份 VPTO 的循环、边界和访存计数。
- `experiment_manifest.tsv`：编译器、目标、设备和采样参数。
- `device_anomaly.tsv`：被排除设备的可审计异常证据。
- `artifacts/b9a20b1ac-a5-vf-sampling/`：24 份最终 VPTO 和已匿名化 provenance。

完整 profiler 目录体积较大，未提交到 Git；它保留在 A5 实验机的本轮结果目录中。

## 下一步

1. 修复 Decode RMSNorm+RoPE 的 `f32 -> bf16` round/saturation 语义差异，
   用逐 op dump 和独立 golden 定位首个错误点。
2. 优化 Prefill Softmax candidate 基线；当前 B 比 A 慢 `2.27%`，融合消除的
   访存只够抵消该开销。
3. 分析 Decode RMSNorm 的 loop-only 回退；C 比 B 慢 `16.77%`，重点检查
   寄存器压力、membar 和最终指令调度。
4. 决定 Comb Sinkhorn 是否属于 VMI VF Fusion 目标；若属于，先补齐高频
   local-boundary candidate，再讨论融合收益。
5. 为三个跨模式 PASS 的 VMI 场景增加 PyTorch/CPU golden 和 NaN/Inf/边界值，
   完成最终数值验收。
