# Current upstream audit — JavaScriptCore bytecode/OSR retry1

## Frozen boundary

- Project pin: `WebKit/WebKit@f157dd8681ebabd624b90a8069080b87c7938187`, independently proven by the official commit API response.
- Object: one fixed ECMAScript program and input under stock JavaScriptCore target/options, preserving language result, legal tier transitions, OSR behavior, profile premise and the frozen full-cost endpoint.
- No WebKit build, test, JavaScript execution, benchmark or claim observation occurred.

## Positive current-union findings

1. The selected bytecode source, `BytecodeGeneratorification.cpp`, constructs a bytecode graph and runs a liveness fixpoint at generator merge/yield points. Its stated question is which variables should be saved and resumed; it then rewrites bytecode, state dispatch and resume sequences. This is a current source-level bytecode/liveness/state action, though it concerns generatorification.
2. `DFGOSRExit.cpp` provides current DFG exit handling. It reconstructs operands through the CodeBlock's variable-event stream, applies recovery, restores frame state where required and materializes checkpoint side state with bytecode indices. The code also records profiler-related and option-gated diagnostics. It is a strong stock OSR-state-map/reconstruction subtractor.
3. The deterministic stress carrier contains an explicit `OSRExit()` call. It establishes an in-tree stock OSR carrier, but alone does not expose two complete legal bytecode-plus-OSR-state-map plans for the same program.

## Bounded unknowns

- The contract's one-file-per-role selection chose `BytecodeGeneratorification.cpp`, `DFGOSRExit.cpp` and the lexicographically first matching stress test. It therefore does not deliver the complete `CodeBlock`/emitter/tiering configuration grammar or a complete action-composition proof.
- The acquired source does not show a same-program pair of complete stock-legal alternative encoding-plus-OSR-state-map plans, an action outside the current union, or a finite JSC-specific exact/FPT/Pareto/approximation guarantee.
- The generic encoding-plus-state-controller objection remains unresolved; no claim is made that it is sufficient or insufficient.

## Full-cost and finite falsifier

A later separately frozen closure must retain compiler CPU/RSS/temp, bytecode/metadata and code bytes, residency/tier-transition cost, OSR reconstruction/materialization cost, profile overhead and transform overhead. A minimal falsifier is one fixed in-tree program with two complete legal plans, unchanged result/profile/tier semantics and explicit bytecode-plus-OSR-state-map cost accounting. If the complete current `CodeBlock`/tier/OSR union already expresses the proposed action, the later route must report current-union absorption.

## Audit result

`CURRENT_UNION_PARTIALLY_CLOSED__BYTECODE_LIVENESS_AND_DFG_OSR_RECONSTRUCTION_CONFIRMED__COMPLETE_JOINT_ACTION_UNCLOSED`. No absence, novelty, candidate or stage inference follows.
