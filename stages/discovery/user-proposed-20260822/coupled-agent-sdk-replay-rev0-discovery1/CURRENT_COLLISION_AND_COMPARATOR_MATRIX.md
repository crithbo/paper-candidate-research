# Current collision and comparator matrix

| Mechanism | What current material establishes | Relation to frozen object | Absorption decision |
|---|---|---|---|
| Independent real branch rollout | Correct marginal comparator with independent continuation noise | Exact object; strongest reference estimator | Required baseline, not the proposed action |
| Ordinary same seed | Shares a seed but has no specified divergent-logit or state coupling semantics | Insufficient action/guarantee | Not absorption |
| CAR | Uses SCM interventions and re-executes downstream stochastic trajectories; defines step intervention algebra and outcome-distribution estimators | Same general agent-replay setting, but inspected material does not specify shared exogenous randomness across divergent token/tool/workspace branches | Partial overlap only |
| Coupled Token Generation / Counterfactual Token Generation | Couples autoregressive categorical sampling with shared SCM noise; gives token-level variance arguments under stated conditions | Token subproblem only; no SDK tools, filesystem, processes, evaluator, or state-copy semantics | Partial overlap only |
| Proposed CoARSE | Divergent-logit coupling + recoupling/failure detection + keep-shared/split/fallback state-transition semantics with a conditional paired-estimator guarantee | Exact frozen SDK/model/state/intervention object | No direct absorption found in bounded primary/current-source review; `SEARCH_BOUNDED_OPEN`, not novelty proof |

Direct absorption remains a decisive independent Stage-0 review item. This package does not claim that a broad literature search proves absence.
