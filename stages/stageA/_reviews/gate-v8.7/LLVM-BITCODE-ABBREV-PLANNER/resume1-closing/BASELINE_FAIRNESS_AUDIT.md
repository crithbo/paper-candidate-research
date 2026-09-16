# B2 Strongest-Baseline Fairness Audit

## Verdict

`FAIR_EXECUTABLE_SAME_OBJECT_BASELINE__ABSORPTION_CONFIRMED`

## Same object and information

B2 and WL receive the same expanded semantic record trace and operate on the same LLVM 22.1.8 native bitcode object. Neither receives reader timing, a future corpus label, or post-hoc knowledge unavailable to the other. Both emit complete ordinary `.bc` files and use the same native acceptance/equivalence checks.

## Same action and accounting domain

Both planners share the deterministic grammar generator, leaf eligibility, scope feasibility, abbreviation-ID assignment space, mandatory blob handling, definition caps, and exact bit evaluator. The evaluator accounts for definition payload, induced application-ID and CodeLen widths, record payloads, blob alignment, END_BLOCK and alignment. Thus the B2 comparison does not omit the ID-width/scope costs targeted by the candidate.

## Executability

B2 is implemented as deterministic greedy positive-net action selection with exact re-evaluation after each choice. It is computationally finite, materializes files, and passes the native writer/reader/checker path. It is not a per-metric synthetic union or an unattainable oracle.

## Candidate-specific residual

WL's exact assignment/subset/global-budget machinery produces no output outside B2's natural result: B2 and WL match byte-for-byte on `100/100`, including all `63` modules with a B0-relative benefit. Therefore candidate-specific coverage is `0%` and the strongest-union residual distribution is identically zero.

## Scope caveat

This audit validates fairness only inside the frozen bounded domain. It does not assert that B2 is strongest for every legal LLVM abbreviation grammar or every possible scope/ordering transformation.
