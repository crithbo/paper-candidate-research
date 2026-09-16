# Source61 S6 — primary RQs frozen before source lookup

## S61-RQ01 — GCC switch representation constructor

- Exact object: fixed GIMPLE switch and target code-generation semantics, including default/case behavior, observable control flow and target cost contract.
- Primary RQ: Can a target-specific bounded constructor jointly select switch partitions and representations with an exact/FPT/certified Pareto guarantee beyond GCC's current conversion union, without changing program or target semantics?
- Excludes: code-size flag choice, generic decision-tree/jump-table selection, PGO/controller changes and emitter-only patches.
- Anchor question: does current GCC already compose the candidate representations through a target cost model, leaving only a generic combinatorial selector?
- Carrier/oracle: public GCC testsuite switch cases; stock execution/result equivalence and target assembly validity.
- Source route: official GCC current docs and `tree-switch-conversion` source; primary compiler-lowering literature only for subtracting coverage.
- Selected for ordinary closure: `YES`.

## S61-RQ02 — GHC worker/wrapper joint representation constructor

- Exact object: fixed typed Core binding, Haskell observable/laziness semantics and stock GHC Core/code result.
- Primary RQ: Can a bounded constructor jointly choose demand signatures, CPR/representation changes and worker/wrapper placement with a language-specific exact/FPT/certified guarantee beyond the current GHC worker/wrapper union?
- Excludes: changed strictness semantics, generic unboxing, inlining flags and local Core rewriting.
- Anchor question: does current GHC already integrate demand information and representation choice into its worker/wrapper constructor, leaving no target-specific residual?
- Carrier/oracle: public GHC testsuite/Core golden route and stock language semantics.
- Source route: official GHC current source/docs and the primary worker/wrapper literature.
- Selected for ordinary closure: `YES`.

No alternative same-object RQs were necessary.  The active/held identities named in the frozen assignment were not used as seeds or comparators.
