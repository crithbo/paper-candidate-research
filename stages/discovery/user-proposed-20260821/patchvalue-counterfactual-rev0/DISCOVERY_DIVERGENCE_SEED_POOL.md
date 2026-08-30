# PatchValue divergence seed pool

- Assignment / lane: `DISCOVERY-S5-20260821-PATCHVALUE-COUNTERFACTUAL-REV0` / S5
- Frozen profile: canonical v8.7; RQ frontend `PRODUCTION`; claim-pack `OFF`
- Seed ceiling: `<=12`; generated before targeted evidence lookup: `YES`
- Network-security exclusion check: `PASS`

## Seed records

### PV-S01 — state-level marginal continuation value

- Engine: `PROBLEM_REFRAMING`
- Perspective: `MEASUREMENT_REVIEWER`
- Exact public anchor candidate: SWE-bench Verified test carrier plus the frozen OpenHands/Qwen/vLLM identity recorded in the user-supplied archive, 2026-08-21 snapshot.
- Sketch: Instead of predicting whether a task will eventually pass, ask what an additional complete LLM call changes when begun from the *same* frozen intermediate agent state.  A repository-held-out conditional treatment-effect estimate may reveal whether public compile/test/patch progress contains incremental information about the value of another call.
- Conclusion-first test: If successful, the cautious conclusion is that a pre-dispatch public state can support calibrated estimates of one-to-h-call incremental sealed-evaluation success under one fixed agent and decoder policy; it is not a general agent success classifier.
- Counterfactual consequence: equal minimum budget plus finite extra calls can be allocated by lower-confidence marginal value rather than issue-only difficulty.
- Generic/current-union risk: high; it collapses if labels are terminal-success classification, branches share later information, or a known routing/restart controller already estimates this exact treatment effect.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### PV-S02 — queue scheduler with a progress score

- Engine: `NEGATION_OR_INVERSION`
- Perspective: `OPERATOR`
- Sketch: Rank ready coding-agent calls by compile/test progress under load.
- Conclusion-first test: At best it would improve scheduling order.
- Generic/current-union risk: direct return to the terminal PatchYield/scheduler family and to ordinary priority control.
- Preliminary disposition: `ACTIVE_OR_STOP_IDENTITY` — excluded before locator; not carried forward.

### PV-S03 — branch-reuse test-time scaling

- Engine: `COMPOSE_DECOMPOSE_SIMPLIFY`
- Perspective: `COMPILER_OR_BACKEND_ENGINEER`
- Sketch: Spawn and merge multiple repair trajectories from an intermediate state.
- Conclusion-first test: At best it would be a branching/reuse system.
- Generic/current-union risk: likely absorbed by rollout selection, representation/reuse, and test-time scaling work; it changes the atomic object away from a marginal-value measurement.
- Preliminary disposition: `GENERIC_SHELL` — excluded before locator.

## Clustering and convergence

| Cluster | Seed IDs | Shared surface | Representative |
| --- | --- | --- | --- |
| Counterfactual state value | PV-S01 | Same fixed coding-agent state; extra complete-call intervention | PV-S01 |
| Excluded scheduler/reuse variants | PV-S02, PV-S03 | Progress-guided resource use | n/a |

`PV-S01` is the sole selected seed.  The other two are retained only as non-evidence rejection records; they are not opportunity families or replacements.
