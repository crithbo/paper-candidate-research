# CoupledAgentReplay research-question candidate

- RQ candidate ID: `CAR-RQ-01`
- Seed: `CAR-S01`
- Tentative anchor envelope: one official OpenHands upstream commit; one open-weight coding model with public logits/sampling controls; one versioned public SWE-bench Verified task-list subset; one completed tool-call boundary; two immutable, native-semantic interventions.
- Contribution type: `METHOD_ALGORITHM`
- Contribution route: `N2_AGENT_LEVEL_COUPLING_ALGORITHM_WITH_TARGET_SPECIFIC_GUARANTEE`

## Primary RQ

Can a divergence-aware, shared-exogenous-randomness coupling for two copy-isolated tool-using coding-agent continuations preserve a valid paired counterfactual terminal-outcome estimand and prove nontrivial variance or fixed-error sample-complexity improvement over independent real branches after token and tool-state divergence?

## Scope and answerability

- Estimand: `tau = E[Y(s, I1, U) - Y(s, I0, U)]`, with `Y` the native absorbing terminal task outcome, `U` the explicitly scoped exogenous variables, and one fixed `do_context` or `do_policy` pair.
- In scope: true live forward branch semantics, public logits, Gumbel/maximal token coupling, copy-isolated tool environments, evaluator firewall, and conservative uncoupling fallback.
- Out of scope: same-seed-only trials, static log splice, generic paired means/CIs, success classification, budget allocation, any exact-h call treatment, routing, restart, or hidden-evaluation online signal.
- Minimum falsifier: current literature/source already composes divergent token coupling and real copy-isolated tool-agent states with the same estimator guarantee and full-cost boundary; alternatively, coupling has zero nontrivial survival after the first divergence.

## FINER-lite

- Feasible: `CONDITIONAL` — requires a finite public state-fork and sampler-control witness, not this assignment's execution.
- Interesting: `CLEAR` — causal evaluation of agent interventions is otherwise dominated by noisy independent branches or invalid static replay.
- Novelty threat: `HIGH` — CAR and contemporary token-coupling work are deliberate direct subtractors.
- Ethical/scope fit: `PASS`; no security task.
- Relevant: `CONDITIONAL` — Q2 potential requires an actual target-specific guarantee, not a paired-statistics wrapper.

## Pre-evidence selection

- Selected for anchor/object freeze: `YES`
- Precommitted anchor route: official OpenHands repository/current source, one official open-weight model card/revision, official SWE-bench carrier source; then CAR, Coupled Token Generation, Counterfactual Token Generation/Gumbel-Max sources.
- Transport-only fallback: author artifact or official paper mirror for the same named source.
- Pre-RQ closure: `ORDINARY_CLOSURE`; no strong-model packet nominated.
- Forbidden outcome-aware reformulation: object, model, task-list rule, state boundary, intervention pair, and estimand will not change after collision evidence.
