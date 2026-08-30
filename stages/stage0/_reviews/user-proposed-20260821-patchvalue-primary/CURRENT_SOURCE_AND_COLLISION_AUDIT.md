# Current-source and collision audit

## Pins and evidence

| Item | Status | Independent conclusion |
|---|---|---|
| OpenHands SDK commit `43376f1868ffd702746080714a59c16d3f69ec12`, `conversation/state.py` | locally pinned official source | `ConversationState` supplies persisted event/state surface, including persistent agent state; it supports a finite state schema but does not alone prove whole-environment cloning. |
| Same pin, `workspace/base.py` | locally pinned official source | Base workspace exposes sandbox file/command operations and pause/resume surface. The audited base interface exposes no clone/snapshot method. This is a fidelity debt, not a repository-wide absence claim. |
| [Causal Agent Replay](https://arxiv.org/abs/2606.08275) | primary methodological paper | Strong direct subtractor for stochastic agent counterfactual replay and causal action attribution; not all assignment facets align. |
| [FailFast-RestartSmart](https://arxiv.org/abs/2502.13847) | primary paper | Strong restart/failure-prediction comparator, not identical continuation intervention. |
| [Agentic coding test-time scaling](https://arxiv.org/abs/2504.15277) | primary paper | Compute/rollout/reuse comparator; not a sufficient same-state causal baseline by itself. |

## Current-union judgment

No retrieved source establishes a direct fatal that jointly covers: the exact frozen OpenHands state object; absorbing stop vs fixed-h complete continuation; precommitted seed intervention; copy-isolated branch contract; offline-only evaluator; a continuation-value estimand; full-cost inference; and the primary claim. `SEARCH_BOUNDED_OPEN` remains for unreviewed members of the named union, but it is not used as evidence of absence.

CAR is sufficiently close that the candidate cannot receive an unconditional pass: absent an explicit estimator/facet separation, its main method may be a narrow re-labeling of causal action replay. This is the scientific basis for the single revision gate.

## Fairness / non-leakage conditions

- Snapshot inclusion must be fixed without sealed evaluator labels.
- Calibration/training repositories must be disjoint from evaluation repositories.
- Decoder randomization must be assigned before outcomes; zero-temperature determinism does not estimate the stated stochastic expectation.
- Every branch has its own writable repo/container/tool transcript or a verified replay equivalent.
- Censoring, timeouts and external-tool failures must be reported as outcomes under a predeclared rule, not discarded post-treatment.
