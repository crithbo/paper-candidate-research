# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260824-SOURCE108-109-DENYLIST-EVALUATION-A5`
- `proposal_id`: `EXPLICIT_PREDECESSOR_IDENTITY_DENYLIST_V1`
- `decision_label`: `PATCH_RECOMMENDED__BACKTEST_REQUIRED`
- `user_policy_approval_required`: no for proposal; production cutover requires normal MAINLINE/backtest gate
- `backtest_required`: true

## Problem statement

Source108 carried a hidden predecessor identity hold but still created 13 exact-repeat RQ rows. Source109 replaced it with a hash-pinned explicit denylist and prelookup checks, eliminating exact repeats from valid selected locators and increasing valid locators from 2 to about 10. Raw yield remained zero, so the change improves execution hygiene rather than scientific recall.

## Current rule

- Exact and provable contains identities are already excluded; related-only is not.
- The identity surface may be frozen only as registry/control prose, which is insufficiently actionable for every seed/RQ.
- No canonical assignment-local denylist template/check ledger exists.

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| `rules/ROLE_MAINLINE.md` | Discovery assignment freeze | hidden identity hold allowed | generate hash-pinned assignment-local denylist from registered exact/contains identities |
| `rules/ROLE_DISCOVERY.md` | seed/RQ identity check | query global surface before raw | record denylist verdict before lookup; exact/contains excluded, related-only allowed with discriminator |
| new template/control schema | `PREDECESSOR_IDENTITY_DENYLIST.yaml` | none | five-field identity, provenance/hash, scope, related-only safety and no-backfill rule |

## Safety invariants

- Q2/Q1, same-object, collision, baseline, natural evidence, full-cost, reproducibility and claim ceiling unchanged
- Exact/contains only; no broad category cooldown
- Related-only never automatically excluded
- Exclusion produces no scientific absence/STOP inference
- No outcome-aware replacement, quota or terminal revival
- Source110 unchanged

## State and compatibility migration

- Existing/active assignments: no retroactive effect
- Legacy records: `NOT_APPLICABLE_LEGACY`
- Existing states: unchanged
- Rollback: set mode OFF and keep telemetry only

## Validation plan

- Isolated historical PACKER→EXECUTOR→AUDITOR replay on Source108/109.
- Required: Source108 repeats detected 13/13; Source109 selected repeats 0; related-only false exclusions 0; all canonical scientific dispositions unchanged.
- One prospective shadow cycle before production.

## Decision request

MAINLINE should accept this as a backtest-required proposal, not apply mandatory shared behavior now, not modify Source110, and freeze a separate backtest only under explicit normal authority.
