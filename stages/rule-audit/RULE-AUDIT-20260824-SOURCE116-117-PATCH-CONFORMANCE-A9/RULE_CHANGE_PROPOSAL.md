# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260824-SOURCE116-117-PATCH-CONFORMANCE-A9`
- `proposal_id`: `A9-NO-CHANGE__EXACT-CARRIER-PRECISION-NOT-YIELD`
- `decision_label`: `NO_CHANGE`
- `user_policy_approval_required`: `false`
- `backtest_required`: `false`

## Problem statement

Source116 and Source117 tested two exact-carrier rotations. They improved the specificity of locators and missing-field diagnosis, but neither produced a complete tuple, evidence-qualified raw or clean brief. The evidence therefore supports exact-carrier ordering as a precision and claim-honesty mechanism, not as a demonstrated yield mechanism.

## Current rule

- File/heading: `AGENTS.md` current-upstream reality and scientific hard gates; `rules/ROLE_RULE_AUDIT.md` non-relaxable boundaries.
- Current behavior: exact patch/spec/test artifacts may serve as carriers, but raw still requires same-object current residual, non-generic action, comparator, endpoint, full-cost and finite falsifier.
- Why it is sufficient: the observed zero output is the correct consequence of incomplete or already-specified carriers, not evidence that admission should be relaxed.

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| None | None | Exact carriers support ordering and closure; scientific gates decide admission | No change |

No shared file patch or advisory diff is proposed.

## Safety invariants

- Q2 minimum preserved: yes
- Q1 priority preserved: yes
- Same-object preserved: yes
- Latest collision preserved: yes
- Fair current strong baseline preserved: yes
- Natural input/evidence preserved: yes
- Full-cost preserved: yes
- Reproducibility preserved: yes
- Claim ceiling preserved: yes
- STOP non-revival preserved: yes
- User StageB approval preserved: yes

## State and compatibility migration

- Existing states affected: none
- Existing assignments affected: none; Source118 remains independently frozen and mutually isolated
- Template compatibility: unchanged
- Old filename compatibility: not applicable
- One-time migration required: no
- Rollback path: not applicable

## Validation plan

- Historical/time-slice cases: none authorized by A9
- Negative controls: merged patch with no current residual; exact spec with no natural fixture/backend pair; selector or test boundary with no decision-changing endpoint
- Expected behavior changes: none
- Forbidden regressions: no novelty/fault presumption, admission shortcut, proposal quota, broad cooldown, outcome-aware backfill, gate relaxation, terminal revival or Source118 backwrite
- Acceptance threshold: MAINLINE confirms canonical hashes, `shared_files_modified=false`, no state/resource/science/backtest action and Source118 isolation

## Decision request

MAINLINE may accept A9 as `NO_CHANGE`, retain exact-carrier tuple contracts for source ordering and closure quality, explicitly avoid treating them as yield or admission rules, and return RULE_AUDIT to `IDLE_REUSABLE`. No patch is requested or authorized.

