# Source93 S6 — primary RQs

## S93-01 LLVM loop vectorizer

For a fixed LLVM loop, target features, and generated-program semantics, is a target-specific joint legality/profitability vector-plan constructor with a non-generic formal guarantee left outside the current LoopVectorize/VPlan path?

Anchor: LLVM current `LoopVectorize.cpp`; current source explicitly describes legality, code generation, and profitability/cost-model components. Counterfactual: the proposed change is only standard vectorization planning or a target configuration.

## S93-02 V8 Turboshaft

For a fixed feedback graph, deoptimization behavior, target, and JavaScript semantics, is there a Turboshaft-specific schedule/representation constructor that is not ordinary instruction scheduling, RA, or phase ordering?

Anchor: V8 current upstream Turboshaft source route. Counterfactual: a whole-constructor claim collapses to the established compiler scheduling kernel.

## S93-03 Ninja incremental graph frontier

For a fixed Ninja manifest, observed file-state trace, and required target artifacts, does a non-generic build-frontier constructor exceed the current dependency execution model while preserving command and artifact semantics?

Anchor: Ninja official manual/source route. Counterfactual: all legal actions reduce to generic DAG scheduling or file-state policy.

The remaining seeds did not gain a committed RQ because their discriminating action and endpoint were already generic at anchor time.
