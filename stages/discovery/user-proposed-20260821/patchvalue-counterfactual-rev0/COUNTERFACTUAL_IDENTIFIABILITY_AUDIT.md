# Counterfactual identifiability audit

## Target estimand and intervention

For a state `s` saved immediately after a complete call/tool boundary, define an arm by cloning the entire pre-branch state and applying either `A=0` (stop and evaluate the current patch) or `A=h` (execute exactly `h` further complete LLM calls with their native causally required tools, then evaluate).  The estimand is

`Delta_h(s) = E_omega[H(clone(s), do(A=h), omega)] - H(clone(s), do(A=0))`.

`omega` is an explicit, precommitted randomized decoder-seed schedule.  It is not an observed seed selected after the branch; it must be assigned independently of state features, repository, current public-test output, and final evaluation result.  This distinction is necessary because the archived PatchYield configuration used temperature zero and a deterministic request seed, under which repeated same-state calls do not create repeated samples of a probability.  PatchValue therefore cannot silently reuse that deterministic policy as if it identified a stochastic success probability.

## Required state identity

The branch key must include: task instance and base revision; immutable image digest; worktree/patch hash; full agent conversation and prompt/tool-output hashes; completed call index; context/tokenizer/model/server configuration; public tool state; decoder distribution and assigned seed; environment/reset transcript; and evaluator/harness revision.  The snapshot boundary is before the allocation decision and before the first arm-specific call.

## Identification conditions

| Threat | Required control | Failure meaning |
| --- | --- | --- |
| Post-treatment leakage | Features are read only from the common prefix; hidden tests and later branch outputs are labels only | Estimator is invalid, not merely low accuracy. |
| Interference | Copy-on-write worktree/container and independent evaluator run per branch; no shared writable cache/tool state | Same-state contrast is contaminated. |
| Decoder stochasticity | Fixed decoding distribution and seed schedule randomized independently before branch | A deterministic replay is a single outcome, not a probability estimate. |
| Censoring | Branch timeout, tool failure, evaluator failure, and missing result are retained as explicit arm outcomes with their cost | Dropping costly failures biases value upward. |
| Snapshot selection | State-sampling protocol is fixed before labels; repository groups do not cross folds | A predictor can overfit trajectory/repository identity. |
| Difficulty confounding | Comparator features include static difficulty, calls/tokens consumed, remaining-time, public-test count, and context length | Apparent progress value is not incremental. |
| Outcome contamination | Offline `H` never appears in online features, allocation inputs, threshold fitting, or state selection | It becomes a hidden-test oracle. |

## Consequence

Repeated branching can identify an *average under the declared decoder distribution* only if the above conditions are closed.  It cannot identify a metaphysical probability for one deterministic model call, and it cannot justify a success classifier trained on naturally completed trajectories.  This is a finite fidelity issue, not a result: the next admissible task is to prove the branch schema with a small witness before any experimental claim.
