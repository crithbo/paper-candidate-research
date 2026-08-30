# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260815-SOURCE53-54-R40-ZERO-BRIEF-R41`
- `proposal_id`: `R41-ANCHOR-FIRST-ENTRY-REBALANCE-V1`
- `decision_label`: `CLARIFY`
- `user_policy_approval_required`: `false`
- `backtest_required`: `false`

## Problem statement

After R40, Source53 S1/S3 and Source54 S3 ended before an exact public anchor was frozen. This is the earliest repeated transition loss. By contrast, most anchored routes reached an ordinary scientific subtraction and were correctly rejected as current-union, changed-object, or generic residual. Source54 S4 is transport-only and must not influence the diagnosis.

## Current rule

- File/heading: `research-topic-discovery/SKILL.md`, “Build a problem-first portfolio” and “Commit an anchor before deep search”; `references/source-portfolios.md`.
- Current behavior: seed portfolio precedes one exact public anchor, but no assignment-local prioritization explicitly focuses the repeatedly anchor-empty S1/S3 entry surfaces.
- Why clarification is sufficient: the current rule is scientifically correct; its source allocation can be sharpened without changing any admission criterion.

## Proposed minimum delta

No shared file patch is proposed. Mainline may freeze the following one-cycle control text only in a future assignment:

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| next S1/S3 assignment-local control | `source_entry_profile` | ordinary R40 seed-to-anchor ordering | `ANCHOR_FIRST_ENTRY_REBALANCE_V1`: use the existing seed/lookup ceiling to first associate each retained seed with one candidate exact primary anchor and date/version; if none can be fixed, record `NO_EXACT_ANCHOR` as non-evidence backlog; only then create a primary RQ. |

The profile expires after that assignment. It does not require more seeds, calls, bytes, lanes, strong slots, source roles, candidate quotas, or a new model route.

## Safety invariants

- Q2 minimum preserved: yes.
- Q1 priority preserved: yes.
- Same-object preserved: yes; a fixed anchor is required before RQ.
- Latest collision preserved: yes; existing identity/current union checks remain.
- Fair current strong baseline preserved: yes.
- Natural input/evidence preserved: yes.
- Full-cost preserved: yes.
- Reproducibility preserved: yes; anchor/version and `NO_EXACT_ANCHOR` are recorded.
- Claim ceiling preserved: yes.
- STOP non-revival preserved: yes.
- User StageB approval preserved: yes.

## State and compatibility migration

- Existing states affected: none.
- Existing assignments affected: none; Source53/54 remain immutable.
- Template compatibility: unchanged.
- Old filename compatibility: unchanged.
- One-time migration required: none.
- Rollback path: let the one-cycle profile expire and use ordinary R40 ordering next cycle.

## Validation plan

- Historical/time-slice cases: not required; no historic claim classification is changed.
- Negative controls: Source54 S4 TLS failure remains `OPEN_BOUNDED`; no runtime event may be turned into a scientific category. `RELATED_ONLY` remains non-exclusion; `NO_EXACT_ANCHOR` remains neither DROP nor novelty evidence.
- Expected behavior changes: S1/S3 record anchor availability before RQ drafting; one or more seeds may remain non-evidence backlog rather than being described as vague RQs.
- Forbidden regressions: raw-gate relaxation, broad-category cooldown, forced proposal count, strong-slot revival/backfill, extra retrieval budget, blanket use across all lanes, or treating a missing anchor as a scientific failure.
- Acceptance threshold: audit the three stated denominators after one cycle; do not require raw or clean brief.

## Decision request

No user-policy decision is requested. Mainline may either apply this bounded, one-cycle S1/S3 source-entry profile at the next safe boundary under existing continuous Discovery authority, or keep ordinary R40 if a new frozen assignment cannot express the profile without changing budget. All scientific gates and prohibitions remain in force.
