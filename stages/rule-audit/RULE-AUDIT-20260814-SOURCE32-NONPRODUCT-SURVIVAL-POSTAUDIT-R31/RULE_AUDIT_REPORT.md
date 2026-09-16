# Source32 non-product coupling survival 后审计

## 结论

`NON_PRODUCT_COUPLING_SURVIVAL` 产生了有价值但范围有限的前端精度增益：它使两个“联合算法”表述先暴露可检验的因子、共享状态和状态擦除问题，没有把未闭合对象直接包装成 clean brief。独立闭合随后把两题正确分开：SystemZ 是健康的结构性淘汰；RVV 是尚未冻结、不得科学淘汰的有限债务。

这只能支持“送入完整 Stage 0 前的分流更准确、浪费更少”，不能声称 Stage0 PASS 率已经提高。Source32 没有 clean brief，因而没有 clean-brief→Stage0 的可识别精度分母，也没有正例可检验该检查的灵敏度。

唯一建议：**Source33 原样沿用一轮 `NON_PRODUCT_COUPLING_SURVIVAL_V1`，不收紧、不撤销、不写成共享永久规则。** Source33 完成后再用前瞻结果决定是否正式回测或规则化。

## 漏斗对账

Source32 六路共形成 2 个 evidence-qualified raw，恰好都收到 coupling note；覆盖率为 2/2。S1、S3、S4、S5 均在检查之前 raw=0，因此本检查没有机会影响这些 lane，也不能解释它们的源入口/locator 闭合不足。

两项被暂缓的 raw 后续结果如下：

| family | Discovery 行为 | 独立闭合 | 审计解释 |
|---|---|---|---|
| SystemZ | `UNRESOLVED_BOUNDED`，未送 clean brief，未科学 DROP | `STRUCTURAL_DROP__GENERIC_PRODUCT_OR_CURRENT_UNION_ABSORPTION` | 健康淘汰。packed-stack 是固定函数属性/调用约定；保存区间和偏移由 CSI 与 ABI 决定；剩余动作只是可分离的通用 frame ordering。前端暂缓避免了一个高概率的 Stage0 假阳性。 |
| RVV | action skeleton `SURVIVES`，但 current union、两计划 witness 与 target-specific residual 未闭合 | `NOT_ADMITTED_UNFROZEN__BOUNDED_SOURCE_OR_WITNESS_CLOSURE_INCOMPLETE` | 不是科学负例，也不是已证假阴性。源码确认 RA→vsetvli 的真实依赖骨架，但尚不能证明同对象的 union-external N2 动作。应保留可恢复债务，不能计作结构 DROP。 |

## 得到了什么精度增益

1. **假联合暴露得更早。** SystemZ 的“保存区间 × packed representation”在表面上像跨层联合；因子化和状态擦除把决定性问题缩成“packed-stack 是否是动作、是否存在同函数两个合法计划”。独立源码闭合证明答案是否定的。
2. **不确定性没有被伪装成科学失败。** RVV 的 source skeleton 确实存在，但同对象两计划和当前 union 外残差未冻结；流程保持 `NOT_ADMITTED_UNFROZEN`，没有把缺证据写成不存在贡献。
3. **Stage0 负载更干净。** SystemZ 不必进入完整论文潜力审查；RVV 只需窄 source/witness closure，而不是先写完整 Stage0 再发现对象未闭合。
4. **分母更诚实。** 2 个 raw、0 个 clean brief、1 个结构负例、1 个未决债务，不能包装成“0/2 科学失败”或“精度 100%”。

## 没有解决的问题

- 它不是提高 raw 召回率的题源策略。四路 raw=0 的瓶颈仍在 seed→locator→raw 之前。
- 它尚无正向 survivor。没有候选通过该检查并进入 Stage0，因此不能估计灵敏度或 Stage0 yield。
- RVV 若被无限期搁置、从账面消失或在下一轮被当作旧题跳过而无恢复入口，会形成**运营性假阴性**；但当前冻结结论本身不是科学假阴性。
- 检查若收紧为“Discovery 必须完成完整 current union、完整两计划 witness 或 target-specific guarantee”，会把 Discovery 前移成缩小版 Stage0，与现行分阶段规则冲突。

## 反方检查

最强反对意见是：Source32 为 0 brief，检查可能过严。现有数据不支持这一推断。四路没有 raw，与检查无关；两个适用对象中，一个经独立闭合确认应淘汰，另一个仍以非终态债务保存。真正尚未被检验的是“它会不会拦住正例”，所以合理动作是再做一轮前瞻沿用，而不是收紧或永久化。

另一个反对意见是：既然 RVV 已显示非乘积骨架，是否应该直接送 Stage0。当前材料仍缺一个固定语义的公共 IR/MIR witness、两套 native-legal 完整计划和当前 RA/feature/action envelope；无法区分真实 target-specific residual 与“现有 RA 后接 current vsetvli dataflow”的顺序组合。暂不送审是证据诚实，不是要求核心结果或实现。

## Source33 唯一安全边界

Source33 仅重复 R29 的原始 assignment-local 语义：

- 只对已经 evidence-qualified 且确属 joint/composed action 的 raw 应用；不新增 raw 录取门。
- 记录 Factor A/B、最强顺序组合、一个共享内生状态、最多两个 source loci 的依赖线索、state-erasure 结论。
- `SURVIVES` 进入现有 C0/deep；`UNRESOLVED_BOUNDED` 只保留 raw/debt；只有 source-proven independence/current-union absorption 才结构性 DROP。
- 不要求 Discovery 先完成完整 current union、完整 witness、Q2 终裁、实现或结果。
- 非 joint/composed 候选标记不适用，不得被阻塞。
- 不设 brief 配额，不补位，不因结果选择 source，不重筛 SystemZ/RVV 充当 Source33 新 raw。

只增加无行为变化的记账：在 handoff 报告 applicable raw 数、`SURVIVES/UNRESOLVED/source-proven drop` 数及后续闭合状态。它不改变任何科学门。

## 成功与停止指标

Source33 不以形成 brief 数为成功条件。机械验收为：适用 raw 的 note 覆盖率 100%；没有 `UNRESOLVED_BOUNDED` 被写成科学 DROP；没有非适用候选被阻塞；没有 outcome-aware backfill。

Source33 后的判断：

- 若出现一个 source-proven structural drop，继续增加“避免假阳性”的证据；
- 若出现一个 survivor 并进入独立 Stage0 且不因 generic-product/current-union 失败，才开始形成灵敏度正证据；
- 若只有未决债务累积，应审计 source-closure 吞吐，而不是收紧门；
- 一轮结束后仍不得仅凭本 R31 把该检查写成共享永久规则。

## 授权判断

`USER_POLICY_APPROVAL_REQUIRED=false`。R29 的一次性 Source32 合同已经结束，不能把它冒充为永久授权；但在 Source32 后完成独立复审、保持所有硬门和容量不变、仅在下一安全 assignment 边界再运行一轮同义 assignment-local 前端检查，属于现有 `USER_ADAPTIVE_DISCOVERY_CONTINUE_UNTIL_FIVE_STAGEA_PASS_20260814` 的持续自适应发现授权范围。主线可生成 Source33 冻结 assignment。

任何永久共享规则/template patch、检查语义收紧、容量变化、V9 切换或新的政策门仍需另行审计/授权。本包不授权这些动作。
