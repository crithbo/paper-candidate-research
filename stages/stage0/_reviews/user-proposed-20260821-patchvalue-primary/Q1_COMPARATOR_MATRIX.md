# Q1/Q2 comparator matrix — PATCHVALUE-COUNTERFACTUAL-REV0

| Comparator / paper shape | Same fixed state and stop-vs-continue intervention | Main role | What it subtracts | Residual required for this topic |
|---|---:|---|---|---|
| Causal Agent Replay (CAR) | partial | strongest methodological subtractor | SCM `do` replay, stochastic reexecution, action attribution, confounding treatment | Future-compute allocation estimand, complete clone contract, and non-attribution identification argument |
| FailFast-RestartSmart | no | failure/restart baseline | prefix failure signal then restart/overlay | Must not reduce to failure classification or fresh restart |
| SWE-Router / routing | no | same-budget selection baseline | task/model/route choice | Must not use task-level difficulty as a proxy for state value |
| Agentic coding test-time scaling / rollout reuse | partial | compute/reuse baseline | multiple trajectories, reuse/voting/selection | Individual intervention units remain clone-isolated same states |
| BAGEN / MARS / SAGA / Cascade / FairBatching | no | allocation/value/fairness subtractors | rewards, budgets, routing and fairness objectives | No generic bandit or budget allocator may be the paper core |
| Fixed continue / fixed stop / registered random allocation | yes | mandatory fair controls | direct policy alternatives with same information | Must include all branch and evaluation cost |

## Q2 calibration

A credible Q2 measurement paper needs a named estimand, identification assumptions, an auditably faithful branch protocol, repository-disjoint calibration, harm/variance analysis, and full-cost same-information comparisons. A mere terminal-success classifier, restart policy, or one-off allocation heuristic is below the threshold. Q1 potential remains speculative because CAR is methodologically close and a generalizable natural-state corpus/result has not been established.

## Two candidate mechanisms

| Mechanism | Status | Assessment |
|---|---|---|
| Seed-randomized same-state continuation-effect measurement | primary | conditionally non-generic if the revision certificate differentiates future-compute effect from CAR attribution and completes clone fidelity |
| Fixed-budget allocation after common minimum | secondary | admissible only as downstream use of the measured effect; alone collapses to ordinary allocation/bandit work |
