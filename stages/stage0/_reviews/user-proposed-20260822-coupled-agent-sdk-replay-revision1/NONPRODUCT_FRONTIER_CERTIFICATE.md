# Nonproduct frontier certificate — failure finding

## Attempted frontier

Let `C_c` and `C_i` be complete per-pair coupled and independent costs, including inference/logits, copying/reset, tool/process, fallback, evaluator, storage and uncomparable pairs. A future empirical claim would require both a confidence-supported covariance advantage and full-cost improvement:

`Cov(Y_0,Y_1) > 0` and `error_cost(coupled) < error_cost(independent)`.

The frozen state labels do not imply either inequality. In the all-fallback region the method is exactly independent rollouts plus coupling/copy overhead; this is a certified no-benefit region. In early divergence, negative or zero covariance is also allowed. These statements are generic properties of paired sampling.

## Missing target-specific residue

No new legal SDK action, optimization variable, recurrence objective, complexity bound, approximation guarantee or direct-effect theorem remains once each component is stripped:

| Component | Existing/general kernel |
|---|---|
| shared Gumbels over divergent logits | Coupled Token Generation / common-random-number coupling |
| per-arm agent intervention and forward replay | CAR |
| copied conversation state / re-executed actions | current SDK fork and `rerun_actions()` |
| mutable-state reset / copy-on-write | ordinary isolation/replay hygiene |
| retained independent fallback | standard unbiased paired-estimator safeguard |
| variance identity and no-gain region | generic paired statistics |

Renaming the composition as an “SDK-state frontier” does not introduce a nonproduct theorem. The object-specific labels are necessary safeguards but do not affect the equations except by switching back to the independent baseline.

## Disposition

`C5_nonproduct_frontier=FAIL` and `GENERIC_TOKEN_COUPLING_OR_PAIRED_STATISTICS_ONLY=TRIGGERED`. A positive benchmark outcome could not repair this structural contribution failure without a new union-external mechanism; it is therefore not deferred to Stage A.
