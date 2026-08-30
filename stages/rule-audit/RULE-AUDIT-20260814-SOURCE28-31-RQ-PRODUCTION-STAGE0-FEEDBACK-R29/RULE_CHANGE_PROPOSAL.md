# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260814-SOURCE28-31-RQ-PRODUCTION-STAGE0-FEEDBACK-R29`
- `proposal_id`: `SOURCE32_POST_FEEDBACK_NON_PRODUCT_COUPLING_SURVIVAL_V1`
- `decision_label`: `CLARIFY`
- `user_policy_approval_required`: `false`
- `backtest_required`: `false_for_one_assignment_local_clarification__true_if_promoted_to_new_shared_admission_semantics`

## Problem statement

Source28–31 的 4 个 production clean brief 全来自 S6。已由主线接受的 AMX 与 SME 两个独立 Stage 0 结果都发现同一种结构错误：target-specific 状态与 generic RA/allocation 没有不可分解的决策耦合。Discovery 已写出 generic-reduction falsifier，却把验证该 falsifier 的最小 action trace整体后移给 Stage 0。

## Current rule

- File/heading: `rules/ROLE_DISCOVERY.md / 第二层、第四层、三遍发现法`。
- Current behavior: raw 需要 non-generic discriminator；D1 前需要低成本 action/observation survival trace；完整 witness/current union/Q2 可后移；generic wrapper/solver 不得进入。
- Why clarification is needed: “target-specific state exists”与“target-specific non-product coupling exists”未被机械区分；“以后由 Stage 0 构造双计划”被当成已完成 survival trace。

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| Source32 assignment-local control only | `NON_PRODUCT_COUPLING_SURVIVAL_NOTE` | survival trace 可只写候选计划和后续 falsifier | composed/joint 卡在 clean brief 前给出 factor split、shared endogenous variable、一个 source-anchored dependency edge、state-erasure attack 和非终态 disposition |
| Source32 six lane assignments | Applicability | 所有卡使用同一泛化 non-generic 字段 | 仅对 joint/co-design/integrated/whole-constructor 且含 allocation/RA/scheduling/packing/placement/controller 因子的卡强制；其他卡 `NOT_APPLICABLE` |
| Shared `rules/` / `templates/` | none in R29 | authoritative production remains current | 不修改；Source32 后依据真实 Stage 0 反馈另行决定是否提永久 patch/backtest |

## Exact Source32 assignment-local directive

`SOURCE32_START_CONDITION`: 主线已接受 MVE 与 PPC-MMA 的 canonical PRIMARY handoff；结果方向不参与是否启动的判断。

`CAPACITY_AND_METHOD`: 六个长期 lane、各自 raw/deep 上限、v8.7、`DISCOVERY_RQ_FRONTEND_MODE=PRODUCTION / RQ_REFINEMENT_STAGED_EVIDENCE_V1`、`DISCOVERY_CLAIM_PACK_MODE=OFF`、V9 OFF 与网络安全排除全部继承 Source31；不新增 lane、配额、outcome-aware backfill 或额外检索预算。

`APPLICABILITY`: 当候选自称 joint/co-design/integrated/whole-constructor，且至少一个动作因子属于通用 allocation、RA、scheduling、packing、placement 或 controller 时，clean brief 前必须生成 note。

`NOTE_FIELDS`:

1. `factor_A`、`factor_B`、`strongest_sequential_composition`；
2. `shared_endogenous_variable_or_cross_term`；
3. `source_anchored_dependency_trace`，最多两个已选 current source/spec locus；
4. `state_erasure_result: SURVIVES / COLLAPSES_TO_GENERIC / UNRESOLVED_BOUNDED`；
5. `disposition`：`SURVIVES_TO_EXISTING_C0_DEEP`、`NOT_READY_FOR_CLEAN_BRIEF__NON_PRODUCT_UNPROVEN`、或现有证据已证明时的 `STRUCTURAL_DROP__GENERIC_PRODUCT`。

`NO_OVERREACH`: 不要求完整合法双计划、穷尽 action catalogue、完整 current union、论文新颖性终裁、Q2 判定、实现、主结果或实验。

`NO_OUTCOME_AWARE_BACKFILL`: 未通过 note 的卡不触发科学结果感知补位；预登记 reserve 仅按原重复/运输失败规则使用。零 brief 合法。

## Safety invariants

- Q2 minimum preserved: yes
- Q1 priority preserved: yes
- Same-object preserved: yes
- Latest collision preserved: yes; still owned by full Discovery/Stage 0 path
- Fair current strong baseline preserved: yes
- Natural input/evidence preserved: yes
- Full-cost preserved: yes; cross-term must name full-cost dependence when used
- Reproducibility preserved: yes; source loci and trace are recorded
- Claim ceiling preserved: yes; unresolved coupling is not a negative scientific conclusion
- STOP non-revival preserved: yes
- User StageB approval preserved: yes

## State and compatibility migration

- Existing states affected: none
- Existing assignments affected: none; Source28–31 remain frozen
- Template compatibility: note may be a small assignment-local section/file; no shared template edit
- Old filename compatibility: not applicable
- One-time migration required: none
- Rollback path: remove the assignment-local requirement from the next new Discovery assignment; do not rewrite Source32 artifacts or any candidate state

## Validation plan

- Historical/time-slice cases: not required for this one-cycle clarification; AMX and SME are explanatory cases, not replay labels.
- Negative controls: any Source32 measurement/characterization, single-action algorithm or formal question not framed as a composed constructor must be `NOT_APPLICABLE` and flow unchanged.
- Expected behavior changes: generic-product joint stories remain raw/debt or are structurally excluded when independence is already source-proven; genuine source-anchored coupling can still reach brief.
- Forbidden regressions: full Stage 0 moved into Discovery; result/implementation demanded; target nouns treated as automatic fail; AMX/SME STOP inherited by MVE/PPC/new IDs; proposal quota introduced.
- Acceptance threshold: all five success criteria in `RULE_AUDIT_REPORT.md` pass for Source32; no minimum brief or PASS count.

## Decision request

Mainline may, under the existing continuous adaptive Discovery authority, keep Source32 paused until it accepts both pending PRIMARY handoffs, then freeze exactly one Source32 assignment using the directive above. This package does not authorize a shared rule/template patch, V9, new lanes, larger budgets, Stage execution, retrieval by this audit lane, or any change to existing scientific states.

