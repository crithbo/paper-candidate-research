# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260815-SOURCE56-57-QUEUE-SEPARATION-R43`
- `proposal_id`: `R43-RETAIN-ORDINARY-R40-QUEUE-SEPARATION`
- `decision_label`: `NO_CHANGE`
- `user_policy_approval_required`: `false`
- `backtest_required`: `false`

## Problem statement

Source56/57 have zero clean briefs, but the evidence separates structural absences, pre-anchor loss, and two concrete Wasmtime source-closure debts. A new Discovery policy would incorrectly collapse those different states and violate the R40 one-change/no-stacking discipline.

## Current rule

- File/heading: `rules/ROLE_DISCOVERY.md`, raw gate, `SOURCE_CLOSURE_QUEUE`, funnel accounting, and continuous-zero audit behavior; `research-topic-discovery/SKILL.md`, “Avoid rule churn”.
- Current behavior: canonical screening proceeds while audits run; queues are independent and bounded; unknown/transport/source gaps are not scientific outcomes.
- Why it is sufficient: the current rule already supplies exactly the required separation and closure lifecycle.

## Proposed minimum delta

No shared patch and no new assignment-local behavior. The next canonical control remains ordinary R40 and carries no Source57 queue result as an input.

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| next canonical control | Discovery profile | ordinary R40, queue results isolated | unchanged |
| existing queue assignments | closure lifecycle | bounded, parent-owned closure | unchanged; run only under their frozen contracts |

## Safety invariants

- Q2 minimum preserved: yes.
- Q1 priority preserved: yes.
- Same-object preserved: yes.
- Latest collision preserved: yes.
- Fair current strong baseline preserved: yes.
- Natural input/evidence preserved: yes.
- Full-cost preserved: yes.
- Reproducibility preserved: yes.
- Claim ceiling preserved: yes.
- STOP non-revival preserved: yes.
- User StageB approval preserved: yes.

## State and compatibility migration

- Existing states affected: none.
- Existing assignments affected: none; Source56/57 stay immutable and queues retain their own parent/owner.
- Template compatibility: unchanged.
- Migration or rollback: none required.

## Validation plan

- Negative controls: `PENDING_UNEXECUTED` is not exhausted; `OPEN_BOUNDED` is not a scientific negative; MIPS remains historical-only; current/generic abstentions stay excluded before raw.
- Forbidden regressions: profile stacking, anchor-first revival, strong-slot reactivation, budget/lane expansion, queue-to-brief shortcut, cross-wave outcome reuse, or direct edit of shared rules.
- Acceptance threshold: no change; mechanical queue isolation and ordinary-control freeze only.

## Decision request

No user decision is needed. Mainline may accept R43 and continue ordinary R40 screening and already-authorized source-closure work separately.
