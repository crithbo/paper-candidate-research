# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260815-SOURCE55-56-ANCHOR-FIRST-EXPIRY-R42`
- `proposal_id`: `R42-NO-NEW-DISCOVERY-DELTA`
- `decision_label`: `NO_CHANGE`
- `user_policy_approval_required`: `false`
- `backtest_required`: `false`

## Problem statement

The only new one-cycle profile, `ANCHOR_FIRST_ENTRY_REBALANCE_V1`, yielded one exact anchor/RQ that correctly collapsed as generic and one honest `NO_EXACT_ANCHOR`. It did not produce raw or a clean brief. This is insufficient evidence to retain, expand, or replace ordinary R40 behavior.

## Current rule

- File/heading: installed `research-topic-discovery/SKILL.md`, “Avoid rule churn”; Source56 control `entry_rebalance.expires_after_cycle: SOURCE56`.
- Current behavior: one-cycle profiles expire; after a zero-yield diagnosis, do not stack a new production micro-rule.
- Why it is sufficient: the recorded prospective outcome matches the profile's precommitted expiry condition and preserves a clean causal boundary.

## Proposed minimum delta

No shared-file or assignment-local behavioral patch. Mainline should freeze the next canonical cycle with ordinary R40 only.

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| next canonical control | entry profile | Source56-only profile expired | ordinary R40 skill; no R42 successor profile |

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
- Existing assignments affected: none; Source55/56 remain immutable and MIPS closure stays separate.
- Template compatibility: unchanged.
- One-time migration required: none.
- Rollback path: not applicable; no change is introduced.

## Validation plan

- Historical/time-slice cases: none.
- Negative controls: Source56 S1 generic-policy shell remains excluded before raw; Source56 S3 `NO_EXACT_ANCHOR` remains non-evidence backlog; MIPS closure remains outside this audit.
- Expected behavior: ordinary R40 continues with existing telemetry and no profile carry-over.
- Forbidden regressions: reactivation/expansion of anchor-first without a fresh independent audit, strong-slot revival, quota, budget increase, or scientific-gate relaxation.
- Acceptance threshold: mechanical confirmation that Source56 profile is marked expired and no successor control cites it as active.

## Decision request

No user or mainline policy decision is requested. Continue canonical Discovery under the already-authorized ordinary R40 skill and accept this audit as a no-change result.
