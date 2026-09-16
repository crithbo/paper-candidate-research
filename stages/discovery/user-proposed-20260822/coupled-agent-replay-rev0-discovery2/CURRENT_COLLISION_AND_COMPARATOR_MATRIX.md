# Current collision and comparator matrix

## Decisive current-source result

The official source pin is decisive before a collision comparison: its README identifies `OpenHands/OpenHands@4bf8dd3a…` as **Agent Canvas**, a developer control center that runs or connects to multiple agent backends. The README explicitly names the OpenHands agent as an external Agent Server/SDK; the package manifest is `@openhands/agent-canvas`, a UI package. Thus the pinned source does not implement the native coding-agent policy whose state, first tool action and I0/I1 branches are required by the frozen estimand.

| Comparator/source | Exact object/action | What it establishes | Effect on disposition |
|---|---|---|---|
| Frozen OpenHands official source | Exact object | The object is an Agent Canvas frontend/control surface, not the frozen native OpenHands agent policy. | Decisive same-object structural failure. |
| Causal Agent Replay, arXiv:2606.08275 | Related agent SCM/run-forward attribution | Defines interventions and stochastic future re-execution. | Cannot instantiate the frozen branch state when that state is absent from the frozen object. |
| Coupled Token Generation, arXiv:2502.01754 | Token-level coupled autoregressive evaluation | Demonstrates a distinct coupling object and sample-efficiency result for LLM evaluation. | Not a repair: it neither supplies a tool-agent state nor the frozen policy. |
| Counterfactual Token Generation, arXiv:2409.17027 | Token-sampler SCM | Gives Gumbel-Max counterfactual token semantics and RNG-state reuse. | Not a repair: filesystem, process, tool and evaluator state remain outside its object. |

## Eight-predicate direct-coverage audit

This audit is stopped at predicate 1. The candidate’s required “same frozen native agent function/protocol” cannot be stated against the official frozen source. No claim is made that CAR or token coupling directly absorbs a correctly specified future agent-level object; this assignment cannot create that object.

- Current collision classification: `STRUCTURAL_SAME_OBJECT_FAILURE`, not a novelty/absence verdict.
- Search boundary: 3 primary papers and the official source tree/README/package manifest; no further retrieval after the cheapest decisive falsifier.
