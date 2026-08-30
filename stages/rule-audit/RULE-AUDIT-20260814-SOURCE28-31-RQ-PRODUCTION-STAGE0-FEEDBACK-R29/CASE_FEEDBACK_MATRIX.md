# Source28–31 clean brief → Stage 0 feedback matrix

## Cross-case result

四个 clean brief 的共同表面是“目标专用状态 + 另一个规划/分配动作 + exact/FPT/Pareto 叙事”。但只有 AMX 与 SME 已完成并被主线接受；它们共同暴露的是同一个更精确的错误：**目标专用状态出现在状态向量里，不等于两个动作之间存在不可分解的决策耦合。**

| Source / topic | Discovery 声称的联合动作 | Discovery 在 brief 前实际拥有的耦合证据 | 已接受 Stage 0 反馈 | 审计分类 |
|---|---|---|---|---|
| Source28 / AMX | config dominance/reload placement × physical TMM binding | current loci + “候选双计划”承诺；完整合法双计划和 union-external frontier 后移 | 冻结 witness 上 TMM 标签置换 full-cost 不变；配置/调用义务与普通 interference allocation 分解 | Confirmed pseudo-joint false positive |
| Source29 / SME | virtual tile-ID binding × SM/ZA/lazy-save ABI state | target-specific state tuple + 待构造 two-tile/one-call witness | 两侧在 current pipeline 中无信息通道；ABI whole-state construction × generic tile allocation | Confirmed pseudo-joint false positive |
| Source30 / MVE | multiblock tail-predicated region × fallback/native lowering | current source 有明确 single-block 边界，残差不是单纯 RA 标签；完整两计划仍后移 | 本审计冻结时未有主线接受的 PRIMARY 结果 | Pending discriminating case |
| Source31 / PPC-MMA | ACC/VSR binding × reassociation-pressure form × spill/restore | current native hints/forms 存在；最小两 accumulator witness 后移 | PRIMARY 排队 | Pending high-risk analogous case |

## What is and is not established

### 已建立

1. `2/2` 已接受结果重复同一 factorisation/generic-kernel 失败，足以触发流程修正；继续无条件堆积同构 brief 的机会成本已经不合理。
2. Source28、29 的 `non-generic discriminator` 主要证明“状态里有 AMX/SME 名词”，没有证明“一个子动作的选择会改变另一子动作的合法动作集或完整成本”。
3. Source28、29 的 deep review 都把决定性的两计划/耦合问题留给 Stage 0。现行规则允许完整 witness 后移，但同时要求进入 D1 前完成低成本 action survival trace；执行材料把“未来可以构造”当成了“已存活”，语义不够机械。
4. 4/4 brief 由 S6 产生，说明 S6 当前特别擅长把 target state 包装成算法形状；20 个 S1–S5 lane-round 的零 brief 也说明浓度不能只解释成 S6 错误，另有题源/证据闭合差异。

### 未建立

1. 不能从两个相关样本断言“所有 S6 题都是伪联合”或“RQ frontend 整体失效”。
2. 不能因 AMX/SME STOP 预判 MVE/PPC 的科学结论，更不能复用 STOP。
3. 不能把目标专用状态、FPT 或 Pareto 字样本身当作负面特征；真正判别项是不可分解的 native decision coupling。
4. 不能要求 Discovery 完成 exhaustive current union、完整合法 action catalogue、正式 Q2 判断或主结果。

## Root-cause classification

- Primary: `EXECUTION_SEMANTICS_AMBIGUITY` — survival trace 接受了“候选/待构造”的耦合，而非可定位的 action dependence。
- Secondary: `TEMPLATE_FIELD_WEAKNESS` — `Non-generic discriminator` 没有要求区分“target-specific legality label”和“target-specific non-product decision”。
- Not supported: quality gate too strict, Stage 0 too strict, lack of implementation/results, or V9 issue.

## Devil's-advocate check

最强反方是：Stage 0 本来就应该淘汰这些题，2 个假阳性并不证明 Discovery 有缺陷。这个观点部分正确——Stage 0 的科学判断工作正常；但它忽略了重复成本。当前修复不试图让 Discovery 下最终结论，只要求其执行已经写入规则的“最低 survival trace”，从而在不损失 recall 的前提下避免同一种可机械识别的直积故事反复占用 Stage 0。

