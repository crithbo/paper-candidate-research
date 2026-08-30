# CoupledAgentReplay divergence seed pool

- Assignment / lane: `DISCOVERY-S5-20260822-COUPLED-AGENT-REPLAY-REV0` / S5
- Frozen profile: v8.7 canonical; RQ frontend `PRODUCTION`; claim-pack and quality mode `OFF`
- Generated before external collision lookup: `YES`
- Network-security exclusion: `PASS`

## Seed records

### CAR-S01 — divergence-aware shared noise for true agent branches

- Engine: `BISOCIATION_STRUCTURAL_TRANSFER`
- Perspective: `THEORIST`
- Starting tension: causal agent replay needs live run-forward branches after intervention, while coupled autoregressive sampling can share random variates even when token distributions differ.
- Exact public anchor candidates: Causal Agent Replay; Coupled Token Generation; Counterfactual Token Generation/Gumbel-Max SCM; OpenHands; SWE-bench Verified.
- Sketch: Construct a whole-agent coupling that begins from one fully materialized state, uses shared Gumbel/exogenous noise while token contexts can be maximally coupled, and makes an explicit keep-shared/split/recouple/stop decision for tools, files, processes, tests and evaluator state. The output is a paired causal effect estimator, not a replay splice.
- Conclusion-first test: If successful, the cautious conclusion is a target-specific agent-branch coupling algorithm with stated unbiasedness/consistency conditions and a variance or sample-complexity advantage over independent live branch rollouts.
- Counterfactual consequence: an intervention comparison that currently needs two noisy, independent live continuations can meet a fixed error target with fewer branch pairs only while its legality checker preserves native terminal semantics.
- Generic/current-union risk: high — it is invalid if it merely shares a seed, composes existing token coupling without new tool-state semantics, or collapses after first divergent token/tool outcome.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### CAR-S02 — static trajectory pair reuse

- Engine: `COMPOSE_DECOMPOSE_SIMPLIFY`
- Perspective: `MEASUREMENT_REVIEWER`
- Sketch: Pair existing agent logs and estimate a treatment difference.
- Conclusion-first test: at most a lower-cost retrospective analysis.
- Generic/current-union risk: static splice has no true post-intervention state and is forbidden by the new-object contract.
- Preliminary disposition: `GENERIC_SHELL`

### CAR-S03 — progress-guided routing of agent calls

- Engine: `PROBLEM_REFRAMING`
- Perspective: `OPERATOR`
- Sketch: use an observed progress signal to decide which agent gets compute.
- Conclusion-first test: at most a scheduling or budget-allocation contribution.
- Generic/current-union risk: expressly outside the new estimand and terminal-topic boundary.
- Preliminary disposition: `ACTIVE_OR_STOP_IDENTITY`

## Convergence

| Cluster | Seed IDs | Representative | Reason |
| --- | --- | --- | --- |
| Agent-level counterfactual coupling | CAR-S01 | CAR-S01 | Keeps a new estimator/action/guarantee rather than a routing value claim. |
| Excluded static/routing variants | CAR-S02, CAR-S03 | n/a | Not independently candidate-grade. |

Only `CAR-S01` proceeds.  The others are non-evidence rejection records and do not count as opportunity families.
