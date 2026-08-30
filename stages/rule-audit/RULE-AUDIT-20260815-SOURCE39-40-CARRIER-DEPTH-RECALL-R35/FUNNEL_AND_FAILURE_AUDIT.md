# Source39 → Source40 漏斗与失败类型审计

## 1. 可比的最终结果

| 周期 | seeds | pre-reconciliation reported raw | canonical raw | clean brief |
|---|---:|---:|---:|---:|
| Source39 | 42 | 0 | 0 | 0 |
| Source40 | 42（容量不变） | 1 | 0 | 0 |

Source40 的唯一 reported raw 是 S1 FPMR/FP8 call-boundary family。主线与 Source19 D01 做五字段对账后，object、endpoint、guarantee 为 exact，action 与 full-cost 被 Source19 terminally contain；Source19 还冻结了 GCC `1886df...` 的直接碰撞。因此它不能计作独立 raw。规范比较是 **0→0 raw、0→0 clean brief**，不能把修正前数字包装成召回提升。

Source39 与 Source40 不是相同 seed 的 paired replay；即使 Source40 保留了 1 个 raw，也不能仅凭两轮数量差建立方法因果关系。

## 2. Source40 真正改善的部分

Source40 把“为什么没有 raw”从模糊早停变成了可审计的 carrier/source-closure 路径：

- S1 两个 RQ 均进入有限 queue，FPMR 关闭 carrier/oracle 后被历史身份对账排除，CUDA cluster 停在 configuration/scheduling-shaped locator。
- S2 对 OpenVINO RemoteTensor 留下具体 current official locus 缺口，而非宣称 absence。
- S4 预承诺一个固定 SPEC CPU 2017 artifact，并由 Depth-02 闭合 exact carrier、metric semantics 与 falsifier。
- S6 把 VE/XCore 两个具体缺口登记进 queue，而不是在 RQ 后静默消失。

因此调度改善了 **closure visibility、claim ceiling 和失败可恢复性**，但目前没有改善 canonical raw/clean-brief recall。

## 3. 健康 abstention

| 方向 | 判断 | 理由 |
|---|---|---|
| Source39 S1 CUDA CDP2 | 健康 | 只剩 dynamic controller/configuration，没有冻结非通用并发保证。 |
| Source39 S2/S6 | 健康 | current union、generic packing 或 native delay-slot action 已吸收。 |
| Source39 S5 SBY/MLIR | 健康 | generic formal wrapper/IR platform，缺 target-native action。 |
| Source40 S2 cuObject | 健康 | 当前 client/server API union 已表达拟议组合。 |
| Source40 S4 SPEC artifact | 健康且信息充分 | 固定 artifact 不暴露 build/setup duration、peak RSS、teardown，energy 为 `--`；扩大为新 instrumentation study 会换冻结对象。 |
| Source40 S5 Tree-sitter | 健康 | 当前 API 已表达 edited-old-tree reuse/unchanged-part reuse 的完整原生动作。 |
| Source40 S1 CUDA cluster | 健康 | 仍是配置/调度形状，没有非通用原子动作。 |

这些结论没有使用“缺实现、缺结果或下载失败”作为科学淘汰理由。

## 4. 执行、身份或遥测问题

### 4.1 Source40 S1 历史身份漏检

Source40 control 只显式冷却 `source25_through_39` 的 exact identity。FPMR 的决定性 predecessor 位于 Source19，滑动窗口没有覆盖它。S1 初始 `IDENTITY_PREFLIGHT.md` 只检查了“bounded project/assignment material”，因此先报 raw；主线随后机械 reconciliation 才发现重复和直接碰撞。

这是 **身份检索覆盖缺陷**，不是模型发现了新题后被科学门压掉。积极的一面是它在 Stage0 前被纠正，没有污染下游状态。

### 4.2 Source40 S6 的零尝试 exhaustion

S6 queue 为 VE/XCore 各列出三条确定性官方路线，却同时记录 `attempts_made: 0` 和 `SOURCE_CLOSURE_QUEUE_EXHAUSTED`。这两个字段不能同时成立。零尝试只能表示 `PENDING_UNEXECUTED`、`ROUTES_MECHANICALLY_UNAVAILABLE` 或 assignment budget 未实际调度；不能叫 exhausted。

这不证明两个题能进入 raw，但会制造“closure 已完成”的假象，并掩盖执行吞吐问题。

### 4.3 Source40 S2 的浅闭合需诚实标记

OpenVINO 只尝试了一条旧版官方文档路线，随后声称无剩余路线。现行规则是每 locator **最多**三条路线，并非必须用满；所以不能直接判越权。但 handoff 应说明其他路线为何不符合冻结确定性规则或受哪个 attempt/budget 边界阻止。缺少该解释时只能称 bounded unresolved，不能把它当充分 source closure。

## 5. Devil's Advocate 检查

最强反方是：“零 raw 恰好证明硬门有效，为什么还要改？”

回答：硬门确实挡住了弱题，但 S1 的历史重复先穿过 raw、S6 的零尝试被写成 exhausted，说明有两项与科学标准无关的控制错误。修正它们不会放松门，反而同时降低 false-positive 与 false-negative/未执行混淆。

另一反方是：“Source40 比 Source39 有更多 queue，说明 recall 已提高。”

不成立。queue 是中间可追踪状态，不是独立 opportunity，也不是 clean brief。它证明工作流更透明，不能替代最终分母。
