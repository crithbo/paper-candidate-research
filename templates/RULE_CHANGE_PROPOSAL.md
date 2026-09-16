# Rule Change Proposal

## Proposal identity

- `audit_id`:
- `proposal_id`:
- `decision_label`:
- `user_policy_approval_required`:
- `backtest_required`:
- `canonical_owner_to_modify`:
- `change_kind`: `REPLACES / MERGES / RETIRES / GENUINELY_ORTHOGONAL_NEW_RULE`

## Problem statement

Describe the exact recurring failure, ambiguity, or inefficiency and cite the registered evidence.

## Current rule

- File/heading:
- Current behavior:
- Why it is insufficient or why clarification is needed:
- Semantic-overlap search:
- Existing parallel or superseded definitions:
- Why in-place update is insufficient, if a new file is proposed:

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|

Do not edit shared files here. An optional `DRAFT_PATCH.diff` is advisory only.

## Replacement and retirement

- `supersedes_or_merges`:
- Exact existing ranges/fields replaced:
- `live_files_to_retire`:
- `reference_migration`:
- Active mode count before/after:
- `duplicate_field_delta`:
- `sunset_or_removal_gate`:
- Post-migration dead/zero-reference check:
- Historical bytes/archive compatibility:

## Safety invariants

- Q2 minimum preserved:
- Q1 priority preserved:
- Same-object preserved:
- Latest collision preserved:
- Fair current strong baseline preserved:
- Natural input/evidence preserved:
- Full-cost preserved:
- Reproducibility preserved:
- Claim ceiling preserved:
- STOP non-revival preserved:
- User StageB approval preserved:

## State and compatibility migration

- Existing states affected:
- Existing assignments affected:
- Template compatibility:
- Old filename compatibility:
- One-time migration required:
- Running assignments retain frozen hashes:
- Rollback path:

## Validation plan

- Historical/time-slice cases:
- Negative controls:
- Expected behavior changes:
- Forbidden regressions:
- Acceptance threshold:

## Decision request

State exactly what the user or mainline must approve, and what remains prohibited until approval.
