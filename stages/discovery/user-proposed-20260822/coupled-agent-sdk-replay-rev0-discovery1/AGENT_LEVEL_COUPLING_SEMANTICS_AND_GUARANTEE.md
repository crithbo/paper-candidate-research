# CoARSE: Coupled Agent-State Replay semantics and conditional guarantee

## Complete action

At the fixed state boundary, CoARSE creates two branch-local state containers. At each next model token it applies the same indexed Gumbel noise field to each branch's own frozen transformed logits; this preserves each branch's categorical marginal even after prompts diverge. Equal generated tokens retain a shared conversation prefix; unequal tokens trigger divergence accounting, not invalidation. At a tool boundary, the method classifies the transition as:

1. **keep-shared** only for an immutable, content-addressed observation that is byte-identical in both branches;
2. **split** for mutable filesystem/workspace/process/tool state by restoring two independently writable copies from the pre-tool snapshot;
3. **stop-and-fallback** if the transition cannot be classified or restored: restart both arms from the same restored base snapshot with independent continuation noise, retain the pair in the independent estimator, and record the failure.

The two branches never receive one another's generated text, tool outputs, workspace state, tests, or evaluator information. I1 is only present in its own branch; neither branch observes hidden evaluator state. Native terminal states remain absorbing.

## Conditional target-specific guarantee

If (a) every split begins from a faithful copy of the boundary state, (b) each branch's Gumbel sampling maps its own logits to its specified categorical law, (c) keep-shared is used only for conditionally identical immutable observations, and (d) fallback produces independent valid marginal continuations rather than dropping a pair, then every retained pair has marginals `Y(I0)` and `Y(I1)`. Thus the sample mean paired difference is unbiased for the frozen estimand. This is a correctness guarantee, not a claim that variance is always lower.

A variance or sample-complexity improvement is an additional conditional theorem/empirical question: it can hold when coupling induces positive covariance of branch outcomes and fails to hold when divergence or fallback dominates. The pre-registered no-gain region is high early divergence, non-copyable state, or a fallback fraction that eliminates covariance.

## Minimal divergence witness

One public SDK conversation after the first native tool observation, with I0/I1 producing distinct next-token distributions, is sufficient to exercise: shared Gumbel sampling; a token divergence; an immutable observation keep-shared case; a mutable workspace split; and a fallback classification. It does not require hidden evaluator access.
