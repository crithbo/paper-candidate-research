# Current upstream audit — Swift SIL ARC/lifetime/layout retry1

## Frozen boundary

- Project and source pin: `swiftlang/swift@d056c33516f5c5e934dfc45bff945ef3bb2771b3`.
- Object: one fixed Swift module, ABI and target under stock ownership, lifetime, object-access, ARC, language and runtime semantics.
- This audit is source-only. No Swift compiler, SIL optimizer, test, runtime or benchmark was executed.

## Positive current-union findings

1. `ARCSequenceOpts.cpp` implements a current `SILFunctionTransform` which builds ARC matching sets, uses RC-identity and epilogue-ARC analyses, and performs block/global or loop ARC pairing. The source exposes `-enable-loop-arc` with default `true`, a function-size bailout because the optimization can be quadratic, and an ownership-function early return; these are current union controls, not candidate claims.
2. `ARCAnalysis.cpp` recognizes retain/release forms, models ARC-relevant uses and indirect-object accesses, and includes allocation forms such as `alloc_stack`, `alloc_ref` and `alloc_box` in its analysis. Its epilogue matching logic explicitly blocks or recomputes when lifetime evidence is insufficient.
3. The selected in-tree `allocbox_to_stack_ownership.sil` test fixes two stock transform flags and checks legal conversion of `alloc_box` to `alloc_stack`, deallocation placement, generic/capture cases and a noted `mark_uninitialized` preservation constraint. It is a valid current carrier for allocation promotion, not a demonstrated two-plan joint ownership/ARC/object-layout construction.

## Bounded unknowns and telemetry

- The frozen Transforms directory had none of `AllocBoxToStack.cpp`, `AllocStackHoisting.cpp` or `ObjectOutliner.cpp` as direct entries. Contract rules forbid recursive expansion; this is path-drift telemetry, not evidence that equivalent actions are absent.
- The fixed `docs/SIL.rst` raw endpoint returned HTTP 404. It was not retried or substituted and carries no scientific inference.
- The permitted artifacts do not provide a complete stock-native catalog jointly spanning ownership forwarding, ARC boundary placement and object-access/layout placement. They also provide no two complete stock-legal plans for the same fixed module, no union-external joint action, and no target-specific finite exact/FPT/Pareto/approximation guarantee.

## Full cost and finite falsifier

Any later closure must retain compiler CPU/RSS/temp, binary and metadata bytes, allocation cost, ARC traffic, cache/runtime cost and transform overhead. A smallest falsifier must fix a module/ABI/target and show two complete stock-legal ownership-plus-layout plans with unchanged runtime and access semantics. If the full current SIL transform union already expresses the proposed coupled action, that later route must classify it as current-union absorption.

## Audit outcome

`CURRENT_UNION_PARTIALLY_POSITIVE__JOINT_ACTION_AND_TWO_PLAN_CLOSURE_INCOMPLETE`. This result has no current-absence, candidate-grade, Q2, or stage authority.
