# Batch 20260802-03-noncuda — 非 CUDA 多方向 Discovery

日期：2026-08-02。范围：NPU/AI 加速器、CXL/NDP、近似算法和 accelerator compiler/debug；不含 CUDA/GPU kernel 题。

## 两遍发现法摘要

| ID | 机会图（第一遍） | 竞争机制（第二遍） | 结论 |
|---|---|---|---|
| `CXL-KVADMIT` | CXL 扩容使 KV tier 成为尾延迟与容量的共同瓶颈；现有工作已覆盖 offload、prefetch、共享 cache | 风险/重算感知 admission；prefix-only admission；固定 LRU | `PROPOSE_STAGE0` |
| `NPU-SHAPEBUDGET` | 动态 shape 在 NPU 上同时产生编译延迟、碎片与 CPU fallback；不能只优化单 kernel | 编译预算 portfolio；region cut；buffer-reservation-aware specialization | `PROPOSE_STAGE0` |
| `ATTN-STABPARETO` | 长上下文 KV 的每层/每 token 精度预算仍与端到端可恢复性脱节 | margin certificate；residual predictor；固定 layer-wise mixed precision | `PROPOSE_STAGE0` |
| `ADL-SLACKCAUSE` | ADL 编译器调度常有不可解释的周期回归；单纯 profile 不提供可行动的因果决策 | dependency-slack counterfactual；resource shadow price；trace hotspot ranking | `PROPOSE_STAGE0` |
| `SOFTMAX-PARETO` | Softmax 是加速器瓶颈，但“更硬件友好的 softmax”赛道已有同对象软件/硬件协同 | LUT/低精度、在线归一化、可学习替代 | `DROP` |

## 排序与边界

1. `ADL-SLACKCAUSE`：公开 Calyx/Verilator 路径完整，且相对 Petal 的 residual（从归因到可证伪的调度反事实）最清楚。
2. `NPU-SHAPEBUDGET`：AI 路径较强，但须先排除 DISC 与现有 mobile-NPU runtime 已隐含的同一 portfolio 决策。
3. `ATTN-STABPARETO`：机制风险高但可用开源模型/LongBench；不能把 logit margin 伪装成端到端质量保证。
4. `CXL-KVADMIT`：重要且可模拟，但 2025–2026 CXL KV 文献增长很快，必须做严格同对象碰撞审计。

所有 `PROPOSE_STAGE0` 均为 `SEARCH_BOUNDED_OPEN`，而非新颖性或效果结论。每个目录含 source log 和 handoff；本会话未创建 Stage 0 目录、未改动主控文件。
