# Source60 S6 — Question Cards and bounded dispositions

## QC60-01 — GCC shrink-wrap frame-state placement

- Exact public identity: GCC `shrink-wrap.cc` rendered from `basepoints/gcc-16-1425-g0ede0508cc6`; GCC Optimize Options retrieved 2026-08-15.
- Same-object contract: fixed function CFG, target ABI, callee-save components, execution and DWARF-CFI unwind semantics.
- Proposed endpoint: a target-ABI-specific joint placement constructor with an exact/FPT or certified Pareto guarantee over prologue/epilogue component positions.
- Current source locus: `try_shrink_wrapping`, `try_shrink_wrapping_separate`, `place_prologue_for_one_component`, `targetm.shrink_wrap.components_for_bb`.
- Strong current action union observed: ordinary shrink-wrap; separate component shrink-wrap; dependence-releasing preparation; target hooks; dominator/post-dominator legality; profile cost; per-component DFS choice; CFI constraint for terminal paths; flags `-fshrink-wrap` and `-fshrink-wrap-separate`.
- Decisive falsifier: source places each component along dominator subtrees whenever it is cheaper than all descendants, and incorporates frame/CFI path constraints.
- Five-field identity relation: object `RELATED_ONLY`; action `TERMINAL_CONTAINS`; endpoint `TERMINAL_CONTAINS`; semantic guarantee `RELATED_ONLY`; cost `RELATED_ONLY`.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_UNION_ABSORPTION`.
- Reason: the proposed joint action is already expressed by the current separate-shrink-wrap component placement mechanism.  Recasting it as CFI-aware does not create a distinct action, endpoint, or target-specific guarantee.  No claim is made about all conceivable shrink-wrap algorithms.

## QC60-02 — GHC pattern-match decision / strictness construction

- Exact public identity: GHC 9.15-inplace `GHC.HsToCore.Pmc.Desugar`; GHC 9.14.1 User Guide pattern-match checking documentation.
- Tentative same-object contract: fixed typed pattern matrix and Haskell semantics.
- Source reality: the observed source is the pattern-match coverage checker/desugaring path, which builds guard-tree variants and uses `decideBangHood`; the user guide defines the checker in terms of symbolic models and `-fmax-pmcheck-models`.
- Critical objection: this is not the same output as the generated match-code decision tree proposed by S60-RQ02.  Jointly changing checker strictness and generated code would change the object/diagnostic endpoint; keeping only checker models leaves an unformed generic abstraction/constraint-solver question.
- Five-field identity relation: object `RELATED_ONLY`; action `NONE`; endpoint `NONE`; semantic guarantee `NONE`; cost `NONE`.
- Disposition: `LOCATOR_ONLY__RQ_BACKLOG__SAME_OBJECT_NOT_FIXED`.
- Reason: no raw is admitted.  The bounded material does not yet fix a single native producer/consumer/oracle and a non-generic action; it is not scientific negative evidence and is not queued as exhausted.
