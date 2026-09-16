# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260824-SOURCE110-111-SOURCE-ROTATION-A6`
- `proposal_id`: `NO_CHANGE_AFTER_SOURCE110_111_ROTATIONS_A6`
- `decision_label`: `NO_CHANGE`
- `user_policy_approval_required`: false
- `backtest_required`: false for this audit; A5 denylist proposal remains separately backtest-required

## Problem statement

Edge CPU/runtime/compiler and kernel-corpus/DSL rotations both produced zero raw. Explicit denylists prevented predecessor repeats from contaminating valid denominators, but current implementation/corpus/DSL unions and missing exact actions/endpoints remained the scientific bottleneck.

## Current rule

Existing rules already allow source-family rotation and named-family temporary downweight while preserving exact/contains identity exclusion, related-only eligibility and honest zero brief.

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| none | none | canonical rules and gates unchanged | no shared patch |

## Pilot decisions

- Explicit denylist: retain assignment-local; do not install mandatory shared behavior before A5 backtest/shadow.
- Edge CPU rotation: retain strategic/resource value; downweight current named families for near-term allocation only.
- Kernel corpus/DSL rotation: retain measurement diversity; downgrade yield hypothesis.
- Raw gate/RQ frontend/honest abstention: retain.
- Quota/backfill/broad cooldown/terminal revival: keep forbidden.

## Safety invariants

- Q2/Q1, same-object, current collision, strong baseline, natural evidence, full-cost, reproducibility, claim ceiling and STOP non-revival preserved
- Source112 isolated
- No existing state changes

## State and compatibility migration

- Shared changes: none
- Active assignments affected: none
- Migration/rollback: none

## Validation plan

- No new behavior proposed.
- A5 denylist backtest remains a separate future assignment.
- Only a future audit may consume Source112 results.

## Decision request

MAINLINE should accept `NO_CHANGE`, close A6, return RULE_AUDIT idle, and leave Source112 and shared files untouched.
