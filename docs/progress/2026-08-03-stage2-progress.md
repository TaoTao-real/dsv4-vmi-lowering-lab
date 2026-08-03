# VMI VF Fusion 阶段进展（2026-08-03）

## 阶段目标

本阶段将 DSv4 真实 TileLib 输入接入统一 `ptodsl` backend，完成 VMI candidate
选择、边界协议、VMI row-loop 合法性与 alias-aware load/store forwarding 的
基础实现，并建立可重复的全量 lowering 分析基线。

PTOAS 基线：`533887b4ae09635e9c7ddb5db7d7bf29c12f8347`

对应代码 PR：

- [PTOAS #26](https://github.com/TaoTao-real/PTOAS/pull/26)：candidate、shape-state 与 boundary 协议；
- [PTOAS #27](https://github.com/TaoTao-real/PTOAS/pull/27)：VMI loop fusion legality 与 alias boundary；
- [PTOAS #28](https://github.com/TaoTao-real/PTOAS/pull/28)：alias-aware load/store forwarding。

## 已完成

### DSv4 Lowering 闭环

使用固定命令：

```text
--pto-arch=a5
--pto-level=level3
--pto-backend=vpto
--tile-lib-backend=ptodsl
--enable-vmi
--enable-op-fusion
--emit-vpto
```

全量结果：

| 用例族 | 用例数 | 通过 | 失败/超时 | 最终残留 VMI |
|---|---:|---:|---:|---:|
| Decode Attention / CSA | 47 | 47 | 0 | 0 |
| Prefill Attention / CSA | 53 | 53 | 0 | 0 |
| QKV Projection / RoPE | 18 | 18 | 0 | 0 |
| RMSNorm | 2 | 2 | 0 | 0 |
| 合计 | 120 | 120 | 0 | 0 |

输入共包含 3280 个 TileOp instance、45 类 TileOp。全部最终 VPTO、逐用例
状态、输入哈希和 FusionRegionGen IR 已保存在本仓库。

### Candidate 与边界协议

FusionRegionGen 阶段实际落径：

| 分类 | Instance 数 | 语义 |
|---|---:|---|
| VMI candidate | 1100 | 可进入 VMI fusion legality 分析 |
| local boundary | 649 | 普通 PTODSL fallback，切断当前 VMI fusion run |
| hard boundary | 1486 | MTE/Cube/间接访问/通信等架构边界 |
| direct control/view op | 53 | 不属于 TileLib candidate 选择对象 |

已经做到：

- 统一使用 `--tile-lib-backend=ptodsl`，不增加第二套 backend；
- full-shape、语义 form 合法的 PIPE_V TileOp 优先选择 VMI candidate；
- candidate 在 FusionPlan 前锁定；
- local/hard boundary 在 inline 后仍可识别；
- VMIToVPTO 完成物理 lowering，最终 IR 不残留 VMI op；
- Loop Fusion/Mem2Reg 对 unknown alias、跨迭代依赖和 boundary 保守拒绝。

### 可重复实验基线

本仓库已经提供：

- 120 份最终 VPTO；
- 120 份 FusionRegionGen 快照；
- 8 个 FA/Softmax/RMSNorm/RoPE 关键场景的 Loop Fusion 和 Mem2Reg 阶段快照；
- `export_lowering.py`、`analyze_lowering.py` 和 `verify_artifacts.py`；
- TileOp 落径、boundary reason、region size 和关键场景融合效果报告。

验证命令：

```bash
python3 scripts/verify_artifacts.py \
  --commit 533887b4ae09635e9c7ddb5db7d7bf29c12f8347
```

## 当前尚未达成

Lowering 完成不等于深融合完成。当前证据显示：

- 1056/1056 个 `pto.fusion_region` 都只包含 1 个 VMI TileOp；
- 1100 个 VMI candidate 中有 44 个位于 FusionRegion 外；
- 8 个关键链中 VMI Loop Fusion 均未减少 loop；
- Mem2Reg 合计只消除 5 个 VMI load，未消除 VMI store；
- `tcvt`、`texpands`、`trowexpandmul/div` 和部分 `trowsum/trowmax`
  形成了 Softmax/RMSNorm 主链上的高频 local boundary；
- 尚未完成 CPU/unfused/fused 数值三方对比、A5 汇编对比和性能验收。

因此，本阶段最强的可证明结论是：

> DSv4 lowering、candidate/boundary 协议和 VMIToVPTO 已闭环；VMI 深融合的
> Region 聚集、Loop Fusion 与跨 TileOp Mem2Reg 尚未闭环。

## 风险与决策

1. 不把 hard boundary 数量当作 VMI 覆盖缺陷。MTE、Cube、通信与间接访问应
   保持边界，避免为了指标破坏架构分层。
2. 不继续以“增加 candidate 数量”为唯一进展指标。必须同时统计 region 大小、
   loop 消除、UB traffic 消除和 A5 latency。
3. fusion-off 当前会切换到 ordinary PTODSL candidate，不是同 candidate 的严格
   性能对照；另有一个 `rmsnorm_rope` fusion-off 控制在 legacy vecscope 路径失败。
   下一阶段需要提供只关闭 VMI 变换、但保持 candidate 不变的实验控制方式。
4. 动态 valid shape、tail mask、high-precision `trsqrt`、Gather/ND2NZ 专项融合和
   cost model 仍是后续项，不应阻塞静态主链深融合。

## 下一阶段入口

后续工作按照 [milestone-plan.md](./milestone-plan.md) 执行。第一优先级是让
FusionPlan/RegionGen 形成合法的多 TileOp region，并为每个拒绝点输出稳定原因；
只有这一 gate 通过后，才进入 Loop Fusion、Mem2Reg 和性能阶段。
