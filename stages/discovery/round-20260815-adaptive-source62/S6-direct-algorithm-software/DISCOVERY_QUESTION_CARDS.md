# Canonical question-card index

Canonical detailed cards are frozen in `QUESTION_CARDS.md` for this assignment-local package.

| Card | Exact same-object claim shape | Current-union result | Canonical disposition |
|---|---|---|---|
| C01 | GCC C++20 coroutine actor/ramp/destroy frame-state and cleanup construction | Current GCC producer chain supplies analysis, ramp, actor and destroy synthesis; residual is ABI-changing or generic frame layout. | `STRUCTURAL_DROP__CURRENT_PRODUCER_CHAIN_AND_GENERIC_LAYOUT_KERNEL` |
| C02 | GHC STG lift-set and closure-environment construction | Documented selective late lambda lifting already converts free variables to parameters with relevant default/nondefault bounds; residual is generic lambda lifting. | `STRUCTURAL_DROP__CURRENT_SELECTIVE_LATE_LAMBDA_LIFTING_AND_GENERIC_KERNEL` |
