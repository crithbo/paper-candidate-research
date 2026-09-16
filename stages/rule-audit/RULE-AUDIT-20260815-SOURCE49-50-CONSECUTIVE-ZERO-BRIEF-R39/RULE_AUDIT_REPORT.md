# Rule Audit Report

## 中文摘要

- 发现的问题：Source49/50 的 typed routing 明显提高了反方优先级、历史身份和 ownership 可追溯性，但其完整 typed tuple 被放在 source closure 之前，导致 S3/S4/S5 连续两轮没有可执行 pre-RQ 调查分母。
- 对推进速度或研究质量的影响：弱 raw 没有进入 Stage0，过程更干净；但 Source49 为 0 raw，Source50 仅 2 raw 且均为 known fatal，0 clean brief。0/2 strong slots 反映 eligibility 空窗，不是强模型负结果。
- 建议修改：下一未冻结边界只运行一轮 `PRE_RQ_SINGLE_ANCHOR_CLOSURE_V1`，复用原有最多两个 sol/high slot，让一个预承诺的一手 anchor 问题闭合共同定义的 carrier/action/estimand bundle；之后仍走完整 typed/raw/Stage0 门。
- 是否需要用户批准：不需要新的 generic policy approval。既有持续 adaptive Discovery 与用户批准的最多两个 selective-depth packet 已覆盖相同模型、容量和 source-closure用途；仍由主线 single-writer 冻结下一 assignment。永久共享规则修改仍未获授权。

## Identity

- `audit_id`: `RULE-AUDIT-20260815-SOURCE49-50-CONSECUTIVE-ZERO-BRIEF-R39`
- `trigger`: Source49 and Source50 completed six-lane cycles with zero clean brief
- `requested_by`: MAINLINE
- `date`: `2026-08-15`
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260815-SOURCE49-50-CONSECUTIVE-ZERO-BRIEF-R39/`
- `shared_files_modified: false`

## Question and scope

- Questions: typed routing precision versus pre-RQ recall; zero-of-two strong-slot eligibility; one bounded next-boundary remedy.
- Rules inspected: `AGENTS.md`, `plan.md`, `registry.yaml`, `rules/ROLE_RULE_AUDIT.md`, `rules/RESOURCE_LOCALIZATION.md` and frozen Source49/50 controls.
- Instance material: Source49/50 six canonical handoffs, typed/eligibility decisions and Source50 slot ledger.
- Out of scope: Source51 outcomes/intervention, shared edits, candidate/Stage actions, retrieval, experiments, downloads, automation, V9 and scientific status changes.

## Current authoritative behavior

- Typed roles must be frozen before decisive evidence; no filler and no outcome-aware backfill are permitted.
- Source50 selective depth requires exact same-object RQ and public identity, no known fatal, a finite route, and at most one unresolved carrier/action/estimand member.
- Raw admission still requires exact identity, same-object question/estimand, endpoint/consequence, non-generic discriminator, current locus, falsifier, finite closure and full-cost boundary.
- Missing implementation/results/resources cannot support DROP/STOP; Stage0 independently owns exhaustive current union, strongest collision and Q2 judgment.

## Evidence of a problem or correct behavior

| Observation | Evidence | Repeated? | Classification |
|---|---|---:|---|
| Source49 0 raw/0 brief | six handoffs | full cycle | Precision/accountability gain with no usable recall denominator |
| Source50 2 raw, both known current-union fatal, 0 brief | S2 handoff | two families | Healthy scientific abstention; usable-raw precision remains 0/2 |
| S3 4 locators→0 RQ in both cycles | S3 handoffs | two cycles | Pre-RQ closure gap |
| S4 frames→0 exact RQ and 0 queue in both cycles | S4 artifacts | two cycles | Typed tuple scheduled too early |
| S5 3 RQs→0 answerable and 0 queue in both cycles | S5 artifacts | two cycles | Exact anchor/oracle closure gap |
| Strong slots 0/2 | slot ledger + six eligibility decisions | full cycle | Eligibility design did not expose a packet; not a model outcome |
| S1/S6 generic/current/history exclusions | handoffs and matrices | repeated | Healthy precision, no terminal revival |

## Risk analysis

- False-negative risk: medium process risk; no scientific false negative is proven, but repeated locator/RQ frames cannot reach bounded investigation.
- False-positive/weak-paper risk: low under the proposal because raw and Stage0 gates are unchanged.
- Scientific-integrity risk: controlled by precommitted exact anchor, immutable semantic envelope and outcome-blind closure question.
- Resource/time risk: unchanged global two-packet and existing assignment budgets.
- State-migration risk: none.
- Terminal-revival risk: none.

## Recommendation

- Decision: `PATCH_RECOMMENDED__ONE_CYCLE_ASSIGNMENT_LOCAL`
- Minimum change: move only a single-anchor factual closure before final exact typed-RQ freeze for at most two packets; retain typed routing after the anchor closure and before raw.
- Why smaller is insufficient: keeping current eligibility repeats the empty 0/2 trigger surface; removing typed routing entirely discards real generic/current/identity precision gains.
- Non-relaxable gates preserved: Q2, same-object, current/direct collision, fair strong baseline, natural/canonical carrier, full-cost, reproducibility, evidence honesty and claim ceiling.

## Validation and rollback

- Formal backtest: not required for this one-cycle assignment-local scheduling pilot because scientific admission semantics do not change.
- Prospective validation: two immutable anchor packets maximum; evaluate closure information gain, not proposal count.
- Stop: 0 eligible again, or two no-information/object-drift outputs.
- Rollback: omit the profile next cycle; keep all outputs immutable.

## Mainline handoff

- Existing approval: continuous adaptive Discovery, terra/high breadth and maximum two sol/high source-closure packets.
- Proposed shared-file changes: none from this lane; mainline may freeze only a future CONTROL/assignment at the first safe boundary after Source51.
- Existing states affected: none; Source49/50 remain complete, Source51 remains untouched, all STOP/bounded identities remain monotonic.
- Shared files modified: `false`.

## AI 与限制声明

本审计由 AI 基于本地冻结材料完成，没有外部检索。关于 recall 的结论是流程风险判断，不宣称 backlog 中存在真实可发表题目。
