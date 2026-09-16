# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260815-SOURCE41-42-ZERO-YIELD-IDENTITY-QUEUE-R36`
- `proposal_id`: `RAW_TO_STAGE0_OWNERSHIP_BRIDGE_V1`
- `decision_label`: `PATCH_RECOMMENDED__ONE_CYCLE_ASSIGNMENT_LOCAL_PILOT`
- `user_policy_approval_required`: `false`
- `backtest_required`: `false`

## Problem statement

The current rules allow complete current-union, strongest direct-collision and formal Q1/Q2 work to remain bounded debt for independent Stage 0, but Source41's sole evidence-qualified raw was not routed because those items were still open. Source42 then showed that the new identity rule can remove exact/terminal repeats without excluding related-only families, while queue corrections exposed a separate first-pass route-concreteness defect. Weakening identity or queue controls would target the wrong bottleneck.

## Current rule

- File/heading: `rules/ROLE_DISCOVERY.md`, raw required fields, bounded closure debt, C0/D1 and current-union ownership.
- Current behavior: policy permits a finite raw to delegate exhaustive union/collision/Q2 work, but assignment handoffs do not have a mandatory ownership disposition separating Discovery-owned blockers from Stage 0 debt.
- Why clarification is needed: a lane can conservatively withhold every raw until it duplicates Stage 0, leaving no independent precision or Stage A-yield denominator.

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| Later assignment `CONTROL.yaml` only | `raw_to_stage0_ownership_bridge` | No explicit per-raw routing pass | Enable `RAW_TO_STAGE0_OWNERSHIP_BRIDGE_V1` for one prospective cycle after Source43 |
| Later lane handoff schema | `raw_ownership_disposition` | Free-text deep disposition can combine Discovery and Stage 0 debt | Require exactly one of `DISCOVERY_FIELD_MISSING`, `KNOWN_FATAL`, `CLEAN_BRIEF_WITH_STAGE0_DEBT`, with decisive fields/debts listed |
| Later cycle aggregate | bridge telemetry | No identified denominator | Count new raws, each disposition, briefs, and subsequent independent Stage 0 result; no quota |

No shared file is edited by this proposal. After the pilot, mainline may return observed data to RULE-AUDIT-SENTRY before considering a shared wording patch.

## Safety invariants

- Q2 minimum preserved: yes; only Stage 0 can accept Q2 viability.
- Q1 priority preserved: yes.
- Same-object preserved: yes.
- Latest collision preserved: yes; known direct fatal remains exclusion, full independent collision is Stage 0 debt.
- Fair current strong baseline preserved: yes.
- Natural input/evidence preserved: yes; exact natural/canonical/implementation carrier is mandatory before brief.
- Full-cost preserved: yes.
- Reproducibility preserved: yes.
- Claim ceiling preserved: yes; a brief is a review input, not novelty/Q2 evidence.
- STOP non-revival preserved: yes.
- User StageB approval preserved: yes.

## State and compatibility migration

- Existing states affected: none.
- Existing assignments affected: none; Source43 stays frozen and unchanged.
- Template compatibility: additive assignment-local fields only.
- Old filename compatibility: unchanged.
- One-time migration required: none.
- Rollback path: omit the bridge from the next assignment; retain identity and queue controls; keep all produced artifacts immutable.

## Validation plan

- Historical/time-slice cases: static routing-only review of the Source41 GC-statepoint raw; no relabelling or retrospective Stage 0 launch.
- Negative controls: Source42 exact terminal FPMR identity; related-only SME/ZA family; current-native, generic-solver and missing-carrier routes.
- Expected behavior changes: only a new raw whose Discovery-owned fields are complete may become a brief with explicit Stage 0 debt.
- Forbidden regressions: ambiguous carrier, known fatal, generic-only mechanism, full-cost omission, related-only false identity exclusion, quota/backfill, or pre-Stage0 Q2 claim.
- Acceptance threshold: all safety metrics zero violations; every new raw gets one disposition. Scientific yield is descriptive, never required.

## Decision request

Mainline may implement this one-cycle assignment-local bridge at Source44 or the first later safe boundary under the existing continuous adaptive-Discovery authority. It must not alter Source43, increase resource/model/lane capacity, reopen Source41/42 or any terminal identity, lower a scientific gate, or treat Stage 0 acceptance as guaranteed. A permanent shared-rule patch remains unapproved until the prospective pilot is audited.

