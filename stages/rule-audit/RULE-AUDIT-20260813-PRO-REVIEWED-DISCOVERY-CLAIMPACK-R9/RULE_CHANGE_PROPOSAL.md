# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260813-PRO-REVIEWED-DISCOVERY-CLAIMPACK-R9`
- `proposal_id`: `DISCOVERY-CLAIM-PACK-V9-R0`
- `decision_label`: `USER_APPROVED__PATCH_RECOMMENDED__BACKTEST_REQUIRED`
- `user_policy_approval_required`: `SATISFIED_BY_USER_MESSAGE`
- `backtest_required`: `true`

## Problem statement

The project screens many heterogeneous rows, yet too few entries become decision-ready briefs and Stage 0 frequently repairs cutoff-available source/action gaps. Increasing shallow search volume or proposal quotas would not fix the causal problem. Discovery needs a better unit of work, stronger source-role and claim-level traceability, operational stopping, and evaluation that separates method quality from scheduling.

## Current rule

- File/heading: Discovery paper-opportunity package, three-pass method, R7 dormant module; Stage 0 repair vector; legacy 3-positive/1-negative backtest.
- Current behavior: lineage and current-upstream checks exist, but family relations, contribution-type contracts, claim–evidence locators, E1/E2 separation and robust paired calibration are not one authoritative procedure.
- Why insufficient: completeness and direct coverage remain too dependent on prose judgment, while the small legacy backtest cannot establish robustness or generalization.

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| `AGENTS.md` | core goal/minimal read | opportunity brief | opportunity family → falsifiable claim package; conditional read of shared protocol |
| `rules/DISCOVERY_CLAIM_PACK.md` | new | absent | canonical definitions, states, coverage, structural negatives, evidence, stopping, E1/E2, activation |
| `ROLE_DISCOVERY.md` | assignment mode/workflow | v8.7 with dormant R7 | V9 OFF/SHADOW/PRODUCTION; generator/auditor/synthesizer separation within six-lane ceiling |
| `ROLE_MAINLINE.md` | mode/dispatch/acceptance | R7 gate only | claim-pack activation, neutral packets, paired grouping, independent source audit, telemetry |
| `ROLE_DISCOVERY_BACKTEST.md` | calibration | 3 positive + 1 negative | paired regression + sequential blind holdout + robustness + prospective shadow |
| `ROLE_STAGE0_REVIEW.md` | independent audit/feedback | limited repair vector | contribution-contract, eight-predicate coverage, evidence-ledger and expanded repair audit |
| Discovery/Stage0/handoff/backtest templates | fields | prose-heavy partial structure | typed family, A/C/D/E audit axes, claims/sources, query log, E1/E2, robustness metrics |
| `DISCOVERY_EVIDENCE_LEDGER.yaml` | new | absent | reproducible query, version, relationship and claim-evidence record |

## Safety invariants

- Q2 minimum preserved: yes; type contract is evaluated before mapping to the unchanged tier floor.
- Q1 priority preserved: yes.
- Same-object preserved: strengthened to an eight-predicate direct-coverage test.
- Latest collision preserved: strengthened with independent current-source and contrary search.
- Fair current strong baseline preserved: yes.
- Natural input/evidence preserved: yes; E1/E2 cannot substitute.
- Full-cost preserved: explicit in claim package and coverage test.
- Reproducibility preserved: query/version/evidence ledgers added.
- Claim ceiling preserved: source relation and permitted conclusion are explicit.
- STOP non-revival preserved: reopen only nonterminal families; new object/problem gets new ID.
- User StageB approval preserved: unchanged.

## State and compatibility migration

- Existing states affected: none; A/C/D/E are Discovery-local audit coordinates.
- Existing assignments affected: none; frozen rules continue.
- Template compatibility: missing V9 fields are legal only for legacy frozen assignments.
- Old filename compatibility: unchanged canonical handoff/manifest names.
- One-time migration required: add method metadata and activation state to registry; do not rewrite candidate entries.
- Rollback path: set mode OFF and restore the listed old hashes; V9 shadow artifacts remain noncandidate audit evidence.

## Validation plan

- Historical/time-slice cases: paired current-vs-V9 on identical sealed snapshots, at least three contribution types, positives, direct negatives, partial-coverage negatives and unfinished/resource cases.
- Negative controls: current-feature stale-document traps, generic-kernel absorption, style-only attractive briefs, incomplete-but-nonstructural cases.
- Expected behavior changes: fewer late first-party/source repairs; fewer false structural drops; more complete decision-ready briefs; no forced proposal quota.
- Forbidden regressions: hard-gate leakage, higher false structural DROP, lower critical-source recall beyond the preregistered margin, E2 evidence leakage, contamination, terminal revival.
- Acceptance threshold: sequential blind holdout with preregistered paired noninferiority margins and uncertainty intervals, followed by two prospective shadow waves. A small fixed case set alone cannot establish calibration.

## Decision request

No further generic user approval is required. Mainline should apply the exact shared-file delta at a safe assignment boundary, record old/new hashes and keep `DISCOVERY_CLAIM_PACK_MODE=OFF` for canonical decisions until the independent validation gates pass. A separate user decision is required only for a later production cutover, a 3-vs-6 scheduling change, or resource-expanding E2 assignments.

