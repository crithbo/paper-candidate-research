# User Approval and Sequencing Directive

## Identity

- `audit_id`: `RULE-AUDIT-20260810-SCREENING-YIELD-INITIAL-TOPIC-QUALITY-R5`
- `proposal_id`: `DISCOVERY-SOURCE-QUALITY-FUNNEL-CLARITY-R5`
- `approved_by`: user
- `approval_received_at`: 2026-08-10（Asia/Shanghai）
- `shared_files_modified_by_audit_sentry`: `false`

## User approval text

> 批准无行为变化的 P0 漏斗指标澄清；P1/P2 文献策略和宽深调度，应等待当前冻结的 v8.8 回测完成后再做独立回测与两波 shadow。

## Immediately approved scope: P0 only

The user approves mainline implementation, at a safe assignment boundary, of the nonbehavioral funnel terminology and telemetry clarification proposed in R5:

1. distinguish `RAW_SCREEN_ROW_EVENT`, `UNIQUE_OPPORTUNITY_FAMILY`, `CANDIDATE_GRADE_DEEP_REVIEW`, `STAGE0_BRIEF`, `CLEAN_STAGE0_BRIEF`, `DECISIVE_STAGEA_OBSERVATION` and `STAGEA_PASS`;
2. stop summing mixed raw, repeat/deep-review, proposal and downstream units as a recall denominator;
3. clarify the ambiguous diagnostic `18–24 raw → 6–10 grounded briefs` as a nonquota two-lane funnel, consistent with existing top-k and per-lane brief caps;
4. record future-wave and R4-compatible telemetry using the distinct funnel units;
5. keep zero proposals legal and make no candidate admission, quality-gate, state-machine or scheduling-behavior change.

Mainline remains the sole shared-file writer. This approval does not authorize the audit sentry to edit `AGENTS.md`, `plan.md`, `history.md`, `registry.yaml`, `rules/` or `templates/`.

## Deferred conditional scope: P1/P2

P1/P2 are **not authorized for immediate execution or production use**. The user's sequencing instruction is frozen as follows:

1. the current consolidated v8.8 packet remains immutable and must complete independent `PACKER → EXECUTOR → AUDITOR` review first;
2. if the v8.8 auditor returns `CALIBRATED/PASS`, mainline may then use existing long-lived independent backtest lanes to run the bounded R5 historical replay, followed by two noncanonical shadow waves under the exact R5 scope;
3. if v8.8 returns `NOT_CALIBRATED`, `CONTAMINATION_UNKNOWN` or an integrity blocker, P1/P2 must not start; the v8.8 result must be reported and resolved first;
4. the two R5 shadow waves may log and compare the source-role passport, one-breadth/one-depth scheduling, temporary source-family saturation and phenomenon-first M1, but may not create candidates or alter canonical decisions;
5. no P1/P2 production behavior patch is authorized by this directive. After the independent replay and shadow results, an exact minimal production patch and regression evidence must return to the user for separate approval.

## Binding safety boundaries

- Q2 minimum and Q1 priority remain unchanged.
- Same-object, latest collision, fair current strong baseline, natural input/evidence, full-cost, fidelity, reproducibility and evidence/claim honesty remain unchanged or strengthened.
- No implementation, positive result or core conclusion is added to Discovery admission.
- No terminal STOP revival, candidate/state migration or per-topic task creation is allowed.
- No experiment, download, automation, Stage0/A/B assignment, StageB authorization or formal project is created by this directive.
- The existing v8.8 assignment retains its frozen rules, inputs, hashes and role independence.

## Mainline action

1. Apply P0 only at a safe shared-writer boundary and record the exact old/new hashes plus a mechanical consistency check.
2. Keep P1/P2 in `WAITING_FOR_V8_8_INDEPENDENT_AUDITOR_RESULT`.
3. Do not request the same generic P0 approval again.
4. Treat the future P1/P2 replay/shadow authority as conditional on v8.8 independent PASS; production cutover remains separately user-gated.

