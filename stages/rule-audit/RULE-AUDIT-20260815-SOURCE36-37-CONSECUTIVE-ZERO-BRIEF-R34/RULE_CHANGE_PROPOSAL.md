# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260815-SOURCE36-37-CONSECUTIVE-ZERO-BRIEF-R34`
- `proposal_id`: `SOURCE40_CARRIER_COMMITMENT_AND_SELECTIVE_DEPTH_CLOSURE_V1`
- `decision_label`: `CLARIFY`
- `user_policy_approval_required`: `false`
- `backtest_required`: `false`
- `shared_patch_authorized`: `false`
- `assignment_local_mainline_implementation_authorized`: `true`
- `applies_to`: `SOURCE40_ONE_COMPLETE_SIX_LANE_CYCLE_ONLY`
- `source38_and_source39_affected`: `false`

## Problem statement

Source37 correctly records RQ-before-evidence for selected seeds, but S3 still applies exact carrier/version before seed selection, while S4 forms RQs then refuses to schedule the source lookup needed to instantiate their carrier/estimand. The one S5 raw was scientifically honest but remained bounded-unresolved after independent closure. The next highest-value change is to execute the already-authorized RQ→source-closure→raw transition, not to weaken raw or rotate to another abstract source mix.

## Current rule

- `ROLE_DISCOVERY.md`: evidence/version unknown is not a seed exclusion; selected seed forms RQ before evidence; specific public missing material routes to `SOURCE_CLOSURE_QUEUE`.
- `DISCOVERY_RQ_CANDIDATE.md`: RQ requires tentative public origin and minimum route, not exact versioned evidence.
- `DISCOVERY_QUESTION_CARD.md`: exact identity/current locus/full-cost belong to raw; specific missing public artifact can be queued.
- Source29-derived capacity already provides `C0_source_closures_per_lane_max=2`, `deterministic_routes_per_locator_max=3`, and unchanged per-lane byte budgets.

## Proposed minimum delta

No shared file is changed. Mainline may add the following fields to the Source40 assignment contract only:

| Assignment-local field | Exact semantics |
|---|---|
| `frontend_variant` | `SOURCE40_CARRIER_COMMITMENT_AND_SELECTIVE_DEPTH_CLOSURE_V1` |
| `pre_rq_zero_reason_certificate` | If selected seed count is zero, reasons may be out-of-scope, exact/terminal identity with certificate, definitional object/guarantee change, literal duplicate, generic shell, or RQ answerability failure. Missing exact version/current source/full-cost/witness/union is forbidden as a pre-RQ reason. |
| `identity_only_carrier_commitment` | Before scientific evidence outcome, selected seed freezes a tentative public object/origin or a deterministic first-eligible carrier selection rule. Metadata/identity may be read; result, union and collision outcomes may not be used to switch or backfill the RQ. |
| `rq_versions` | Form 2–3 same-object variants, select one, freeze contribution type, estimand/action family, minimum falsifier and evidence route before targeted result lookup. |
| `source_closure_trigger` | If an RQ is complete but raw is missing a specific public carrier/version, current locus or finite oracle route, it must enter `SOURCE_CLOSURE_QUEUE`; an empty queue plus “card incomplete” is invalid. |
| `source_closure_capacity` | Reuse existing max 2 closures per lane, max 3 deterministic routes per locator, existing byte/storage/deep caps; no increase or replacement batch. |
| `cheap_closure_questions` | At most three: exact carrier/version/current locus; strongest obvious generic/current-action adversary; finite oracle/falsifier route. Complete union, exhaustive literature, full witness, result and Q2 stay downstream debt. |
| `resource_attempt_counter` | One global pre-call monotonic counter per assignment/lane; auth reject, 404, zero-byte and unpersisted calls count; retry/fallback/tool changes cannot reset it. Cap exhaustion fails closed before the next call. |
| `inventory_finalization_gate` | Before handoff, root bytes, attempts, entries, `finalized_at`, validation and retained-file hashes must be internally consistent. A violation blocks further resource production but makes no scientific inference. |
| `model_route` | Six-lane breadth remains `gpt-5.6-terra / medium`; across the entire cycle, at most 2 precommitted carrier-closure packets may use `gpt-5.6-sol / high`. No new top-level lane/task. |
| `selective_depth_packet` | Freeze before targeted evidence outcome; include neutral RQ, identity commitment, sources, at most three closure questions, falsifier and full-cost boundary. Sol may assess carrier/action/estimand, generic/current adversary and finite oracle only; it may not change RQ, backfill, claim novelty/Q2 or write a brief. |

## Source-role handling

No new source distribution is introduced. Existing roles are executed more concretely:

- S3 may not demand an exact carrier before RQ. It commits a tentative versioned natural/canonical origin, forms RQ variants, then uses the queue to pin the carrier.
- S4 commits an exact benchmark/dataset selection rule before looking at results, then binds its measurement/benchmark/replication estimand through the queue.
- Other lanes may use the same queue when a specific public source field is the only raw blocker; no lane is required to consume its capacity.

## Disposition after bounded closure

- `EVIDENCE_QUALIFIED_RAW`: all unchanged RAW_REQUIRED fields are frozen; downstream debt is finite and declared.
- `EXCLUDED_BEFORE_RAW`: known direct fatal/current absorption/generic-only product/object or guarantee change/no finite route.
- `LOCATOR_ONLY` or `SOURCE_CLOSURE_QUEUE_EXHAUSTED`: bounded route ended without closure; no scientific STOP and no backfill.

## Safety invariants

- Q2 minimum preserved: `true`
- Q1 priority preserved: `true`
- Same-object preserved: `true`
- Direct fatal/current union preserved: `true`
- Fair strong baseline preserved: `true`
- Natural/canonical carrier preserved: `true`
- Full-cost preserved: `true`
- Reproducibility preserved: `true`
- Claim ceiling preserved: `true`
- STOP non-revival preserved: `true`
- Proposal quota: `none`
- Outcome-aware backfill: `forbidden`
- Six lanes/capacity/budgets: `unchanged`
- Strong-model depth packets per full cycle: `max 2`
- v8.7/RQ Production: `unchanged`
- V9/claim-pack: `OFF`
- Network security: `excluded`

## OFST boundary

OFST remains `NOT_ADMITTED_UNFROZEN__BOUNDED_SOURCE_OR_WITNESS_CLOSURE_INCOMPLETE`. R34 neither resumes it nor grants exception calls. A later mainline resource assignment may address its frozen source/carrier/oracle debts only within an independently frozen compliant envelope; any cap increase requires its own authority.

## Validation plan

- One prospective Source40 cycle; no historical replay and no yield threshold.
- Required mechanical pass:
  - 100% of selected=0 records use allowed pre-RQ reasons;
  - 100% of RQ-complete/specific-public-gap items are serviced or recorded in a nonempty bounded queue;
  - 100% acquisition calls counted before issue; `calls <= cap`;
  - 100% inventories finalized or explicitly fail closed;
  - at most 2 Sol/high packets, both frozen before evidence outcome and free of RQ drift;
  - 0 result-aware reformulation/backfill and 0 hard-gate relaxation.
- Scientific observation: report raw, bounded-unresolved, structural-drop, clean-brief and independent Stage0 outcomes separately; zero remains valid.
- Rollback: after the single cycle, revert the assignment-local scheduler if it creates unbounded retrieval, moves complete union/Q2 into Discovery, changes RQs after evidence, or fails resource counters.

## Authorization judgment

`USER_POLICY_APPROVAL_REQUIRED=false`. Existing `USER_ADAPTIVE_DISCOVERY_CONTINUE_UNTIL_FIVE_STAGEA_PASS_20260814`, `USER_BLOCKER_AUTONOMOUS_OPEN_SOURCE_ACQUISITION_20260814` and `USER_ASSIGNMENT_RESOURCE_LOCALIZATION_20260814` cover this one-cycle use of already-frozen capacities. They do not authorize more calls, more bytes, shared-rule changes, OFST exception recovery, Stage work or V9.

## Exact mainline directive

> Source38 已完成，Source39 继续按已冻结 base canonical 运行，均不得因 R34 回写或暂停。Source39 完成后的下一安全边界，主线可仅对 Source40 一个完整六路周期冻结 `SOURCE40_CARRIER_COMMITMENT_AND_SELECTIVE_DEPTH_CLOSURE_V1`：保留现行 stage separation；禁止用 exact version/current source/full-cost/witness/union 缺失作为 pre-RQ 淘汰理由；对已收敛 RQ 的具体公开缺件，必须使用现有每 lane 最多2个 closure、每 locator 最多3条确定性路线和原字节预算完成 carrier/current-locus/明显 generic adversary/finite-oracle 的最低闭合，或诚实返回 bounded unresolved。六路 breadth 继续使用 `gpt-5.6-terra / medium`；全周期仅最多2个在 targeted evidence outcome 前冻结的 neutral closure packet 可升级到 `gpt-5.6-sol / high`，不得改 RQ、补位、声称 novelty/Q2 或代替独立 Stage0。网络调用在发出前由一个不可重置全局计数器计数，auth reject、404、零字节和未持久化响应均消耗 attempt；达到 cap 即 fail closed。handoff 前完成资源 inventory 最终化。不得增加 lane、容量、预算、配额或回填，不得降低 same-object/current union/full-cost/Q2 等门，不得改共享文件、V9、既有状态或复活 STOP。

## Decision request

No fresh user decision is required for the exact one-cycle directive. A permanent shared template/rule patch is deferred until Source40 telemetry and relevant independent closure feedback are audited.
