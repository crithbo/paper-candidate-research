# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260826-MODEL-REASONING-COST-ROUTING-R1`
- `proposal_id`: `COST_AWARE_MODEL_ROUTING_R1`
- `decision_label`: `PATCH_RECOMMENDED__USER_APPROVED`
- `user_policy_approval_required`: `false`; explicit approval is the triggering user message.
- `backtest_required`: `shadow telemetry`, not a scientific method backtest.

## Problem statement

Sol/high or Sol/xhigh is encoded as the default for multiple routine long-lived roles. This makes model cost depend on task-window inheritance rather than the actual risk of the current step. Mechanical and broad-search work does not justify frontier/high reasoning, while a small number of terminal reviews do.

## Proposed minimum delta

| File | Current | Proposed |
|---|---|---|
| `rules/ROLE_MAINLINE.md` model table | Stage A/gate Sol high; Stage B review Sol xhigh; mainline mechanical Sol medium | replace with R1 matrix and evidence-based one-assignment escalation |
| `rules/ROLE_DISCOVERY.md` | S1–S6 Terra high; up to 2 Sol/high depth packets | S1–S6 Terra medium; Terra/high depth; at most 1 Sol/high packet after evidence |
| `rules/ROLE_CANDIDATE_OWNER.md` | default Sol/high | phased Luna/medium for mechanics, Terra/high for claim work, bounded Sol/high escalation |
| `rules/ROLE_STAGEA_REVIEW.md` | default Sol/high | Terra/high; Sol/high only terminal conflict |
| `rules/ROLE_STAGEB_INDEPENDENT_REVIEW.md` | default Sol/xhigh | Sol/high; no automatic xhigh/max |
| `rules/ROLE_STAGE0_REVIEW.md` | Terra/high, complex dispute Sol high/xhigh | retain Terra/high; remove automatic xhigh |
| `rules/ROLE_RULE_AUDIT.md` | no explicit cheap default | Terra/medium; bounded escalation |
| `registry.yaml` | mixed/historical routes | add routing revision and `next_assignment_model_route` for all active long-lived roles |

## Compatibility

- Running turn: grandfathered until its next safe boundary.
- Frozen scientific assignment: scientific contract unchanged; model route may change only if the user-approved model policy is frozen in a mechanical compatibility addendum that does not expose forbidden inputs or change evidence.
- Dormant tasks: no wake-up; apply when resumed.
- Other projects: unchanged.

## Acceptance

- No default xhigh/max remains in active routing policy.
- No ordinary Stage A, gate, mainline, Discovery or backtest assignment defaults to Sol.
- Sol/high use includes a recorded escalation reason or is one of the two explicit final-review roles.
- First 20 completed assignments report route, corrections and reversals; no scientific quality gate is relaxed.

