# Rule Audit Report

## Identity

- `audit_id`: `RULE-AUDIT-20260813-PRO-REVIEWED-DISCOVERY-CLAIMPACK-R9`
- `trigger`: user-approved implementation of the attached Pro review
- `requested_by`: user
- `date`: `2026-08-13`
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260813-PRO-REVIEWED-DISCOVERY-CLAIMPACK-R9/`
- `shared_files_modified: false`

## Question and scope

- User/process question: convert the reviewed AI topic-selection scheme into the project's operative rule architecture.
- Rules inspected: `AGENTS.md`, `plan.md`, relevant registry control/method sections, `ROLE_RULE_AUDIT`, `ROLE_MAINLINE`, `ROLE_DISCOVERY`, `ROLE_DISCOVERY_BACKTEST`, `ROLE_STAGE0_REVIEW`, candidate-owner boundary, and the Discovery/Stage0/handoff/backtest templates.
- External basis: formal/primary pages listed in `SOURCE_VERIFICATION.md`.
- Out of scope: running Discovery, Stage 0/A/B, experiments, downloads, automations, or changing an existing candidate's state.

## Current authoritative behavior

The current production method is v8.7 plus nonbehavioral funnel clarity; R7 is dormant and v8.8/R3R1 did not calibrate. Discovery is currently closed. Existing rules already preserve the key scientific gates and distinguish missing implementation from structural failure, but the production brief remains paper-entry centered and lacks a single operational contract for contribution type, opportunity-family relations, claim-level provenance, search stopping, style robustness and E1/E2 readiness.

The mainline and rule-audit roles correctly enforce single-writer control. Therefore this lane may produce and hand off an exact patch but cannot directly mutate the shared rules.

## Evidence of a problem or of correct behavior

| Observation | Source/artifact | Repeated? | Classification |
|---|---|---:|---|
| Funnel denominator mixes row events, repeats and opportunity families; proposal count alone is not recall. | registry R5/P0 telemetry | Yes | Measurement ambiguity partly fixed by P0. |
| Stage 0 repeatedly adds current source, generic kernel or atomic-action material that was available at cutoff. | registered repair-vector history and R5/R7 audits | Yes | Discovery evidence-package defect. |
| v8.8 failed minimum-set recall/structural-negative calibration, and R3R1 packer could not express the approved control arm. | registry v8.8/R3/R3R1 records | Yes | Method/evaluation-contract defect; not permission to weaken gates. |
| Existing brief has genealogy and facets but no typed opportunity graph or claim–source ledger. | `templates/TOPIC_BRIEF.md` | Yes | Template and decision-procedure gap. |
| Existing rules use one academic tier label before contribution-type completeness is made explicit. | Discovery/Stage0 roles | Yes | Cross-field comparability/readability gap. |
| Current six-lane policy is independently user-approved and seat count is confounded with method quality if changed together. | AGENTS/Mainline/registry override | Yes | Experimental-design constraint, not evidence that six is optimal. |

## Risk analysis

- False-negative risk: flat dedup, vague action names and incomplete current-source/contrary search can discard partially covered but distinct claims.
- False-positive/weak-paper risk: more retrieval without claim-level matching can inflate apparent novelty; optional E2 may be mistaken for scientific evidence.
- Scientific-integrity risk: direct coverage inferred from overlap rather than all eight predicates; claim wording not traceable to sources and versions.
- Resource/time risk: an unbounded literature rule or mandatory smoke run would make screening slower.
- State-migration risk: using A/C/D/E as formal registry state would conflict with the current lifecycle state machine.
- Terminal-revival risk: an unrestricted reopen rule would violate STOP finality.

## Recommendation

- Decision: `PATCH_RECOMMENDED + BACKTEST_REQUIRED`
- Minimum effective change: install one readable shared claim-pack protocol, concise role hooks, structured brief/evidence/backtest fields, and a fail-closed activation gate.
- Why a smaller operational fix is insufficient: the review changes the unit of work, collision semantics, evidence representation, stopping rule and evaluation design together; prompt wording alone would leave inconsistent role behavior.
- Non-relaxable gates preserved: all existing Q2, same-object, latest/current collision, strong-baseline, natural/canonical, full-cost, reproducibility, evidence honesty, claim-ceiling, STOP and user-approval gates remain.

## Validation and rollback

- Historical cases/backtest required: paired frozen-snapshot regression, a new blind holdout, contamination audit, contribution-type coverage, structural negatives and nonstructural unfinished cases.
- Shadow-run plan: two prospective noncanonical waves on the same source snapshot and budgets; Stage 0 independently records repair vectors.
- Success/failure criteria: preregistered noninferiority for critical-source recall and false structural DROP, no hard-gate leakage, improved or non-worse decision-ready precision/audit effort, stable decisions under style/evidence-order perturbations. Small sets are pilots, not calibration.
- Rollback condition: any hard-gate leak, contamination, terminal-revival attempt, E2 used as academic evidence, or failure of the preregistered paired endpoints returns `DISCOVERY_CLAIM_PACK_MODE=OFF` without candidate-state rollback.

## Mainline handoff

- User approval already present: yes; exact text in `USER_APPROVAL_DIRECTIVE.md`.
- Files proposed for change: `AGENTS.md`; four role files; four existing templates; one new shared protocol; one new Discovery evidence-ledger template.
- Registry migrations proposed: control metadata only; no candidate-state rewrite.
- Existing active/blocked/hold/terminal topics affected: none. Existing assignments keep frozen rules; terminal STOP remains unchanged.
- Shared files modified: `false`

