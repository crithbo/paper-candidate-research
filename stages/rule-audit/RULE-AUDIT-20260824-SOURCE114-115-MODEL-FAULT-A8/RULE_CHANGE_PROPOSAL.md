# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260824-SOURCE114-115-MODEL-FAULT-A8`
- `proposal_id`: `A8-NO-CHANGE__RETAIN-INDEPENDENT-LINEAGE-ORDERING-PILOT`
- `decision_label`: `NO_CHANGE`
- `user_policy_approval_required`: `false`
- `backtest_required`: `false`

## Problem statement

Source114 and Source115 both ended at zero raw/zero brief because exact carrier/source closure failed before scientific deep review. Source114 lacked a jointly frozen model object/estimand/units/decision/full-cost tuple or met current simulator coverage. Source115's issue-first records lacked the current docs/source/flags triad, exact commit/path/test and same-object negative endpoint.

Exact merged-patch + changed-test lineage is a plausible ordering improvement because it starts from a stronger artifact identity than an issue report. It is not evidence of a current residual, novelty, fault presence or paper quality.

## Current rule

- File/heading: `AGENTS.md` current-upstream reality gate and zero-yield diagnosis; `rules/ROLE_RULE_AUDIT.md` non-relaxable boundaries.
- Current behavior: require exact current identity, same-object action/endpoint, current collision, natural/canonical evidence, full-cost and finite falsifier before raw admission; source ordering cannot substitute for these gates.
- Why it is sufficient: the registered failures are correct abstentions under incomplete or absorbed carriers. The scientific gate does not need relaxation or expansion.

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| None | None | Existing gates plus independently frozen source-ordering pilot | No shared change; evaluate the already frozen pilot prospectively |

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
- Existing assignments affected: none; Source116 remains independently frozen and mutually isolated
- Template compatibility: unchanged
- Old filename compatibility: not applicable
- One-time migration required: no
- Rollback path: not applicable because no patch is installed

## Validation plan

- Historical/time-slice cases: none authorized by A8
- Negative controls: merged patches whose changed tests are obsolete, disabled, synthetic-only or fully absorbed by current source must remain nonadmitted unless a distinct current residual closes
- Expected behavior changes: none from A8
- Forbidden regressions: no current-fault presumption, novelty presumption, admission shortcut, quota/backfill, broad cooldown, gate relaxation, terminal revival or Source116 backwrite
- Acceptance threshold: MAINLINE confirms canonical hashes, `shared_files_modified=false`, no state/resource/science/backtest action and Source116 isolation

## Decision request

MAINLINE may accept A8 as `NO_CHANGE`, retain merged-patch/test lineage only as the already frozen bounded source-ordering pilot, and defer any shared or mandatory behavior decision until prospective registered outcomes exist. No patch is authorized or requested.

