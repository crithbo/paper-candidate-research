# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260823-STAGE0-ATOMIC-REPAIR-CONVERSION-A1`
- `proposal_id`: `STAGE0_ATOMIC_REPAIR_TRACE_AND_CONVERSION_TELEMETRY_V1`
- `decision_label`: `PATCH_RECOMMENDED__MANDATORY_BEHAVIOR_BACKTEST_REQUIRED`
- `user_policy_approval_required`: already present for this bounded proposal
- `backtest_required`: yes for any mandatory routing/gate behavior; no for telemetry-only optional P0

## Problem statement

Stage 0 revision outcomes are selected borderline cases, not a randomized denominator. Current rules protect the scientific gates, but no canonical object links the initial Stage 0 defect to the exact patch, Stage A implementation, full-cost denominator, and independent closing. Consequently Stage 0 pass-rate uplift can be mistaken for downstream improvement, while implementation/proxy defects are discovered late.

## Current rule

- `rules/ROLE_STAGE0_REVIEW.md` / `结论与输出`: requires one atomic `REVISE_ONCE`, but no machine-readable trace contract.
- `rules/ROLE_CANDIDATE_OWNER.md` / Stage A preclaim gate: requires fidelity, but does not consume a Stage 0 repair ID and item map.
- `rules/ROLE_STAGEA_REVIEW.md` / `必查` and `结论`: requires independent review, but does not record patch-participant exclusion or per-item verification.
- `rules/ROLE_MAINLINE.md` / telemetry and conversions: aggregates Stage A counts without an immutable Stage 0 repair cohort and censoring schema.
- Four templates lack the corresponding fields.

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| `rules/ROLE_STAGE0_REVIEW.md` | `结论与输出` | atomic revision in prose | for `REVISE_ONCE`, emit `ATOMIC_REPAIR_TRACE_V1`; no new eligibility or revision count |
| `templates/STAGE0_REPORT.md` | new `Atomic repair trace` | no canonical trace | optional in P0/SHADOW, mandatory only after backtest-backed cutover |
| `rules/ROLE_CANDIDATE_OWNER.md` | Stage A preclaim gate | check object/action/comparator | map every upstream repair item to implementation/evidence before claim-bearing work |
| `templates/STAGEA_REPORT.md` | new `Upstream repair traceability` | no item map | carry repair ID, patch/evidence locations, deviations and invalidated runs |
| `rules/ROLE_STAGEA_REVIEW.md` | `必查` | generic independence | closer must be outside repair participant set; verify every repair item independently |
| `templates/INDEPENDENT_REVIEW_REPORT.md` | new traceability matrix | generic revision section | closed verdict vocabulary and author-claim versus evidence verification |
| `rules/ROLE_MAINLINE.md` | control-cycle telemetry | aggregate counts | immutable original denominator, downstream outcomes, censoring and full-cost fields |
| `templates/HANDOFF.yaml` | new `atomic_repair_trace` and `conversion_telemetry_link` | only scalar revision consumed | cross-stage lineage with no state authority |

Do not edit shared files here. `DRAFT_PATCH.diff` is advisory only.

## Safety invariants

- Q2 minimum preserved: yes
- Q1 priority preserved: yes
- Same-object preserved: yes; exact object/RQ/claim endpoint are trace predicates
- Latest collision preserved: yes
- Fair current strong baseline preserved: yes
- Natural input/evidence preserved: yes
- Full-cost preserved: yes; positive conversion requires directional full-cost
- Reproducibility preserved: yes; patch/evidence locations and hashes required
- Claim ceiling preserved: yes
- STOP non-revival preserved: yes
- User StageB approval preserved: yes
- Revision count preserved: exactly one per stage

## State and compatibility migration

- Existing states affected: none.
- Existing assignments affected: none; active assignments retain frozen rules.
- Template compatibility: additive fields; P0/SHADOW permits `NOT_APPLICABLE_LEGACY` and `NOT_YET_MEASURABLE`.
- Old filename compatibility: unchanged.
- One-time migration required: no candidate migration; optional registry-side cohort snapshot may index legacy records without changing them.
- Rollback path: set trace mode `OFF`, stop mandatory validation, retain append-only telemetry artifacts.

## Validation plan

- Historical/time-slice cases: the six frozen cases only for this proposal; behavioral backtest must keep PACKER/EXECUTOR/AUDITOR isolated.
- Negative controls: `S4-SLO-PAGEPACK` and `PARQUET-PAGE-COSEGMENT` are direct Stage 0 PASS controls and must not enter the Stage 0 repair denominator.
- Expected behavior changes: none in P0/SHADOW; after a separate accepted backtest, missing or inconsistent trace may fail closed before claim-bearing Stage A work, not change Stage 0 science ex post.
- Forbidden regressions: extra revision, direct-fatal repair, object/guarantee change, owner self-pass, resource failure as STOP, terminal revival, zero imputation.
- Acceptance threshold: decision invariance 6/6; cohort/outcome classification 6/6; participant-conflict detection 100%; zero forbidden regressions.

## Decision request

MAINLINE may apply the additive telemetry/optional-field P0 at a safe boundary under the existing user approval. Before making any trace field mandatory or changing admission/repair/closing behavior, MAINLINE must freeze and run an independent SHADOW/BACKTEST assignment and record acceptance. No skill modification is requested.

