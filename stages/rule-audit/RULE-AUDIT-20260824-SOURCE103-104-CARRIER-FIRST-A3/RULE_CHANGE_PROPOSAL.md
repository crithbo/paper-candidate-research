# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260824-SOURCE103-104-CARRIER-FIRST-A3`
- `proposal_id`: `NO_CHANGE_CARRIER_FIRST_A3`
- `decision_label`: `NO_CHANGE`
- `user_policy_approval_required`: false
- `backtest_required`: false; no behavior change is proposed

## Problem statement

Source104 tested one bounded allocation-only change: freeze an exact public carrier before expanding generic/group-repository sketches. It improved the specificity of current-source subtraction but left the same first failed conversion and zero raw/brief yield as Source103.

## Current rule

- Carrier-first is an input/query-order advisory, not an admission gate.
- Evidence-qualified raw still requires same-object, non-generic action/estimand, current-source locus, falsifier, finite closure and full-cost boundary.
- Zero brief is legal; one-cycle non-yield is not evidence to relax gates or ban categories.

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| none | none | carrier-first remains allocation-only | no shared rule/template/skill change |

## Disposition

- `RETAIN`: exact-public-carrier-first as advisory source ordering and provenance discipline.
- `DOWNGRADE`: any claim that carrier-first improves candidate yield; unsupported in one cycle.
- `REMOVE / KEEP FORBIDDEN`: mandatory carrier admission, proposal quota, outcome-aware backfill or broad cooldown.

## Safety invariants

- Same-object/current collision/strong baseline/natural evidence/full-cost/reproducibility/claim ceiling: unchanged
- Q2 minimum/Q1 priority: unchanged
- STOP non-revival: unchanged
- Source105 isolation: preserved

## State and compatibility migration

- Existing states affected: none
- Existing assignments affected: none
- Source105 affected: no
- Migration: none
- Rollback: not applicable

## Validation plan

- Current evaluation uses only frozen Source103/104 artifacts.
- Source105 must complete independently; its results may be evaluated only by a future assignment.
- Any future mandatory carrier behavior would require separate historical backtest and prospective shadow.

## Decision request

MAINLINE should accept `NO_CHANGE`, close A3, retain carrier-first only as advisory ordering, and avoid modifying Source105 or shared files.
