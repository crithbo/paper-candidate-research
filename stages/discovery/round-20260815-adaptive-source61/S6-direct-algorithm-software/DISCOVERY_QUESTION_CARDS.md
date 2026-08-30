# Source61 S6 — evidence-qualified Question Card decisions

## QC61-01 — GCC switch representation constructor

- Exact public identity: GCC `tree-switch-conversion.cc`, rendered current source (copyright through 2026), retrieved 2026-08-15; official GCC Optimize Options.
- Same-object: fixed GIMPLE switch, default/case semantics, target code-generation legality and stock execution result.
- Proposed residual: a joint target-cost-aware partition/representation constructor over bit tests, jump tables and decision-tree segments.
- Current union observed: `-ftree-switch-conversion`; bit-test cluster construction; jump-table cluster construction; decision-tree expansion; target address-space handling; case/range legality; size/speed benefit checks; bounded dynamic programming minimizing clusters.
- Decisive source fact: `bit_test_cluster::find_bit_tests` is explicitly a dynamic-programming algorithm; `switch_decision_tree::analyze_switch_statement` first forms bit-test clusters, then jump-table clusters, and expands the remaining sequence.
- Minimum falsifier: a fixed switch whose representation action is outside that pipeline.  The proposed action was already inside it, so no separate witness is needed.
- Five-field relation: object `EXACT`; action `TERMINAL_CONTAINS`; endpoint `TERMINAL_CONTAINS`; semantic guarantee `RELATED_ONLY`; full cost `RELATED_ONLY`.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_UNION_ABSORPTION`.
- Reason: a restatement as “joint representation selection” duplicates the native construction.  A distinct target-specific guarantee was not frozen before the union absorbed the proposed action.

## QC61-02 — GHC worker/wrapper joint representation constructor

- Exact public identity: GHC 9.15 current `GHC.Core.Opt.WorkWrap` and `GHC.Core.Opt.DmdAnal`; current GHC User Guide 9.15.20260306.
- Same-object: fixed typed Core binding, Haskell laziness/divergence semantics, demand/CPR facts and worker/wrapper output.
- Proposed residual: a bounded joint demand/CPR/boxity worker-wrapper constructor.
- Current union observed: demand analysis, CPR analysis, strictness/absence and boxity facts, worker/wrapper arity recomputation, join-point constraints, CorePrep call-by-value/name options, `-fworker-wrapper`, `-fworker-wrapper-cbv`, and `-fstrictness` controls.
- Decisive source fact: current WorkWrap says that when a function has both strictness and CPR properties it emits one worker/wrapper doing both transformations.  Current DmdAnal establishes worker/wrapper arity and boxity trimming required to preserve join-point and type/laziness semantics.
- Minimum falsifier: source jointly applies neither strictness nor CPR/boxity.  This falsifier fails at the current source.
- Five-field relation: object `EXACT`; action `TERMINAL_CONTAINS`; endpoint `TERMINAL_CONTAINS`; semantic guarantee `TERMINAL_CONTAINS`; full cost `RELATED_ONLY`.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_UNION_ABSORPTION`.
- Reason: the candidate is current GHC's named worker/wrapper construction, not an independent same-object whole algorithm.
