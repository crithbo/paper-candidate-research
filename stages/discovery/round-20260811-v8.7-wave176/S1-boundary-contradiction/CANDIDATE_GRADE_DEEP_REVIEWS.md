# CANDIDATE_GRADE_DEEP_REVIEW — OPA Wasm

## Current reality

Official CLI documentation states that the Wasm target emits a bundle containing a WebAssembly module compiled from input files **for each specified entrypoint**. The `-e` option identifies queried documents and interacts with optimization; the existing `-O` path already performs semantics-preserving rewriting, inlining and pruning. Official ABI documentation fixes required imports, built-in dispatch, memory, ABI-version globals/exports, evaluation context, input/data serialization, result behavior and heap handling.

## Candidate hypothesis red team

The only credible constructor-shaped hint is cross-entrypoint sharing of decision structure/data layout. The minimal witness is shared rules/data across two entrypoints. But current evidence does not freeze whether a shared artifact can retain the exact stock module/evaluator entrypoint interface and all result/undefined/builtin/memory behaviors, nor does it establish an algorithm distinct from the existing compiler's optimization union. A module that adds an entrypoint selector or changes host imports/evaluation calls changes the frozen artifact/evaluator contract; a post-build optimizer is forbidden wrapper behavior.

Therefore the required action-gap certificate cannot be made honestly. This is `NOT_ADMITTED_UNFROZEN`, not a claim that the construction is impossible and not a resource/readiness decision.

## Finite fidelity closure / killer

If later source evidence supplies a stock-compatible action, within 72h freeze two public Rego entrypoints with shared rules/data and their JSON inputs; compile against the pinned source; compare the stock evaluator's result sets, undefined outcomes, built-in map, ABI version and memory protocol; charge compiler, bundle bytes, instantiate/import, serialization, eval latency and RSS. Kill the claim if it needs a new evaluator selector/import, is reproduced by `-e/-O`/pruning, or changes any result/guarantee. No run is performed here.

No brief is emitted.
