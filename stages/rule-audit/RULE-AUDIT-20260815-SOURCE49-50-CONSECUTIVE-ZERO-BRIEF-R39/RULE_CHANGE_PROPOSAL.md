# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260815-SOURCE49-50-CONSECUTIVE-ZERO-BRIEF-R39`
- `proposal_id`: `PRE_RQ_SINGLE_ANCHOR_CLOSURE_V1`
- `decision_label`: `PATCH_RECOMMENDED__ONE_CYCLE_ASSIGNMENT_LOCAL`
- `user_policy_approval_required`: `false`
- `backtest_required`: `false`

## Problem statement

Source49/50 made typed role, generic-kernel, identity and ownership decisions more auditable, but S3/S4/S5 repeatedly produced locators or RQ frames without any closure packet. Source50's strong route required an exact RQ/identity and at most one unresolved triplet field, while the actual closure need occurred before those prerequisites. The two reserved slots therefore had no eligible packet and yielded no model evidence.

## Current rule

- Current semantics: full exact same-object RQ and identity precede selective source closure; carrier/action/estimand may have at most one unresolved member.
- Insufficiency: this permits depth only after the hard part of exact-RQ formation has already been solved, and excludes co-defined multi-field gaps even when one official artifact could close them together.

## Proposed minimum delta

| Future assignment field | Current | One-cycle proposed semantics |
|---|---|---|
| `typed_role_before_exact_rq` | Complete tuple acts as practical eligibility prerequisite | Diagnostic checklist only; still mandatory before raw |
| `selective_depth_packet_kind` | Post-RQ single-field closure | Pre-RQ exact-anchor factual closure |
| `gap_count` | At most one triplet member unresolved | One co-defined bundle may contain multiple fields only if the same frozen anchor artifact defines them |
| `strong_slots` | Maximum two | Unchanged maximum two; chronological pre-evidence commitment; no replacement |
| `post_closure_route` | Strong result feeds closure | Only `CLOSED_TO_EXACT_TYPED_RQ / EARLY_FATAL / UNRESOLVED_BACKLOG`; no raw or brief authority |

The exact contract is in `NEXT_BOUNDARY_PROFILE.md`. No shared file is edited by this proposal.

## Safety invariants

- Q2/Q1, same-object, latest collision, fair current strong baseline, natural/canonical carrier, full-cost, reproducibility and claim ceiling: unchanged.
- STOP non-revival and StageB user approval: unchanged.
- No quota, outcome-aware backfill, new lane, additional strong slot, resource budget, V9 or network-security topic.

## State and compatibility

- Source49/50: immutable complete.
- Source51: no backwrite, pause, contact or outcome read.
- Future assignment: additive local fields only.
- Rollback: remove the profile next cycle; no migration or deletion.

## Validation plan

- Historical/static negative controls: Source50 S2 known-fatals and Source49/50 S6 collision remain ineligible; terminal identities remain excluded.
- Prospective metric: up to two precommitted packets; at least one exact typed RQ closure or named early fatal constitutes information gain.
- Forbidden regressions: anchor replacement, object/guarantee drift, cross-project bundle assembly, scientific conclusion from missing material, raw admission by strong model, or any hard-gate bypass.
- If no packet qualifies or both produce no information, stop selective depth and do not broaden it.

## Decision request

Mainline may implement this profile once at the first unfrozen full cycle after Source51 using existing user authority. No repeat generic approval is required. Permanent shared-rule installation, additional cycles, more than two strong packets, expanded budgets, or changed admission/Stage0 authority remain unauthorized.
