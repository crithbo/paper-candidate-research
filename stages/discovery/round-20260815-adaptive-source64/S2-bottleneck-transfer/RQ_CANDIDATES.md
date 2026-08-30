# Pre-evidence RQ candidates

## RQ-S64-01 — OpenMP target dependence construction

For a fixed OpenMP program, target device mapping, and observable task/dependence semantics, is there a non-separable target-lowering constructor that jointly selects data-environment and dependence representation to reduce end-to-end offload cost without changing program behavior?

Anchor question: which complete current LLVM/OpenMP lowering and runtime actions already construct target data environments and dependence state, and would the hypothesized joint move be more than scheduling/configuration?

## RQ-S64-02 — XLA buffer/copy construction

For a fixed HLO module, input/output semantics, target platform, and executable result, can a target-specific whole-program alias/copy/buffer construction algorithm improve allocation plus materialization full cost beyond the current XLA buffer-assignment union?

Anchor question: does the current XLA action union already encode the proposed placement/copy combination, leaving only generic graph packing or configuration?

## RQ-S64-03 — ORC materialization-state construction

For a fixed LLVM module set, target triple, symbol-resolution semantics, and native executable behavior, can an ORC JIT constructor jointly form lazy materialization and lookup state with a target-specific guarantee rather than selecting existing layers/options?

Anchor question: which current ORC layers and lazy/call-through materialization actions make the hypothesis a generic layer composition, scheduler, or cache policy?

All three are `RQ_READY_FOR_ORDINARY_CLOSURE` rather than raw or brief claims.  No same-object alternative was needed because their object/guarantee scopes are not ambiguous.
