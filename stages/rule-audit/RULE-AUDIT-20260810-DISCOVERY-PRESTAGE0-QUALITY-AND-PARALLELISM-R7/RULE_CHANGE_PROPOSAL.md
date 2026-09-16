# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260810-DISCOVERY-PRESTAGE0-QUALITY-AND-PARALLELISM-R7`
- `proposal_id`: `COLLISION-FIRST-DEPTH-RESERVATION-R7`
- `decision_label`: `BACKTEST_REQUIRED__USER_APPROVED_STAGED_IMPLEMENTATION`
- `user_policy_approval_required`: `false_for_exact_staged_scope`
- `backtest_required`: `true`
- `production_cutover_before_pass`: `forbidden`

## Problem statement

Discovery raw throughput is adequate, but proposal-boundary precision is not. Six audited briefs all required material Stage0 source/action correction. The independent v8.8 failure further shows that citing a related source is not equivalent to naming and validating a decisive subtractor, and that incomplete realization must not be mislabeled as structural elimination.

The project should improve candidate-grade deep review while preserving broad recall. The current two hot Discovery slots are sufficient; their work mode should adapt to the existence of qualified near-misses instead of permanently adding raw lanes.

## Proposed minimum delta

| Package | File | Heading/field | Proposed semantics |
|---|---|---|---|
| P0 | `rules/ROLE_MAINLINE.md` | telemetry | Add `STAGE0_REPAIR_VECTOR` categories and `breadth/depth/failure-kernel/prebrief` counts. Telemetry only. |
| P0 | `rules/ROLE_STAGE0_REVIEW.md` | output | Stage0 reports whether it repaired a cutoff-available Discovery omission; `NO_MATERIAL_REPAIR` remains valid even on scientific STOP. |
| P0 | all affected roles | activation | Define `DISCOVERY_QUALITY_MODE=OFF/SHADOW/PRODUCTION`; default OFF. SHADOW cannot create/change canonical candidate decisions. |
| P1 | `rules/ROLE_DISCOVERY.md` | candidate-grade deep review | Add collision-first query pack, named decisive subtractor record, failure-kernel lookup safeguards and four-axis prebrief adversarial check. |
| P1 | `templates/TOPIC_BRIEF.md` | optional R7 sections | Render action signature, query log, subtractor facet table, failure-kernel references and prebrief disposition when the frozen assignment activates R7. |
| P2 | `rules/ROLE_MAINLINE.md` | two hot slots | backlog=0 → two orthogonal breadth；backlog≥1 → one breadth + one depth-redteam；StageA ready → at most one Discovery. No lane-count increase. |
| P2 | `rules/ROLE_MAINLINE.md` | cutover | Only an independently calibrated exact patch may switch SHADOW→PRODUCTION; one failure stops automatic progression. |

## Safety invariants

- Q2 minimum/Q1 priority: unchanged.
- Same-object/latest collision/current strong baseline: strengthened.
- Natural input/evidence/full-cost/reproducibility/claim ceiling: unchanged or made explicit.
- Missing implementation/result/resource: never structural solely for that reason.
- Failure-kernel similarity: query expansion only, never inherited verdict.
- Action-space overlap: never automatic algorithm absorption.
- STOP non-revival and per-topic StageB approval: unchanged.

## State and compatibility migration

- Existing states affected: none.
- Existing assignments affected: none; new semantics only at next frozen assignment boundary.
- Template compatibility: R7 sections are optional unless assignment activates SHADOW/PRODUCTION.
- One-time migration: none.
- Rollback: set quality mode OFF and depth reservation 0; retain compatible telemetry.

## Validation plan

1. Wait for the separately assigned v8.8 resolution audit and any user-approved calibrated rerun.
2. Run R7 independent PACKER→EXECUTOR→AUDITOR using existing long-lived lanes, known regression cases plus at least eight new blind holdouts.
3. If calibrated, run two noncanonical shadow waves with canonical production behavior unchanged.
4. If every frozen threshold passes, mainline may apply the exact pre-approved production delta at a safe assignment boundary and record hashes.
5. Any failed/unknown audit stops automatic progression and returns to the user; no second automatic revision.

## Parallel scheduling contract

- Base total seats remain 4; R4 maintenance coexistence burst remains 1.
- Hot Discovery slots remain 2 and rotate across S1–S6.
- `DEPTH_REDTEAM` is a mode of an existing Discovery slot, not a new role or task.
- One breadth slot remains whenever supply search is active.
- StageA owner/gate ready work preempts shallow breadth; Discovery contracts to at most one slot.
- Same-packet backtest roles remain serial and independent.

## Acceptance thresholds

- Known correction recall: all registered R5 material corrections recovered; AIGER stays eligible.
- Blind positive recovery: at least 2/3.
- Blind structural negatives: 3/3 abstain.
- Blind unfrozen/resource controls: 2/2 avoid unsupported structural drop.
- Named subtractor + facet match: 100% of structural collision decisions.
- Action-overlap false fatal, terminal revival, duplicate work, shared write conflict, rule drift: all 0.
- Two shadow waves: zero cutoff-available minimum-set omission first discovered by Stage0; no PASS quota.

## Decision request

The user has already approved this exact staged package. Mainline should not request the same generic approval again. Immediate shared edits are limited to P0 telemetry/dormant activation scaffolding and exact shadow/backtest material. Production behavior remains fail-closed until independent calibration and shadow acceptance. Any changed threshold, expanded source cap, extra lane, StageB/formal-project action, or weakened hard gate requires new user approval.

