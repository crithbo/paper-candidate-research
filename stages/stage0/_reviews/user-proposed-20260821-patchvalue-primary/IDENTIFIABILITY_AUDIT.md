# Identifiability audit

## Target trial

At a preselected complete-call boundary with prefix state `s`, produce two isolated replicas. Assign the continuation arm by an independent, precommitted schedule `omega`; control is absorbing stop. Let `H` be a sealed offline terminal label. Identification requires consistency, branch noninterference, positivity over registered decoder schedules, no hidden post-prefix treatment choice, complete accounting for censoring, and no evaluator input to treatment or features.

## What is identified if the certificate closes

For the frozen population of eligible snapshots and registered seed schedule, the contrast estimates the conditional effect of allocating exactly `h` future complete calls versus stopping. It does **not** identify general agent value, a production deadline policy, counterfactual effects of historical actions, or an optimal budget policy outside the frozen model/benchmark.

## Failure modes and disposition

| Threat | Why it breaks the estimand | Required closure |
|---|---|---|
| repository/container/history aliasing | arms are not alternative worlds from the same state | hashed copy or reset transcript per mutable component |
| seed chosen after an outcome cue | treatment is confounded | schedule commit before branch creation |
| evaluator-guided snapshot/policy | post-treatment label leakage | evaluator executable only after arm completion; access log |
| external/nonreplayable tool state | branch differences cannot be attributed to continuation | deterministic replay recording or explicit exclusion rule |
| timeout/cancelled arm deletion | selection changes the estimand | predeclared censoring estimand and all-arm ledger |
| CAR-equivalent action attribution | no distinct measurement contribution | facet proof: future resource allocation, absorbing stop, outcome unit, and estimator guarantee |

## Verdict

The upstream plan supplies the right target-trial direction but not yet the complete clone schema nor the CAR separation. Both are parts of one certifiable causal-value contract, so `REVISE_ONCE` is proportionate. A positive empirical result is not prerequisite to this Stage 0 finding.
