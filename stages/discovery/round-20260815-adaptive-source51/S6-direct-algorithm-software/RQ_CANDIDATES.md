# Same-object RQ candidates

## RQ01 — GCC IPA constant-propagation clone construction

For a fixed C/C++ program, target/ABI, optimization profile and externally visible behavior, can a target-specific constructor jointly choose legal interprocedural constant-specialization clones and call-site rewrites with a non-generic exact/FPT/approximation/Pareto guarantee over execution cost, binary growth and compilation cost?

The stock oracle is the compiled program's observable behavior plus GCC's normal diagnostics/linkability.  A natural finite route would use versioned GCC testsuite C/C++ programs with fixed optimization/profile inputs.  The full-cost denominator would include IPA analysis and clone construction CPU/RSS/temporary memory, compile/link CPU, output text/data bytes, and execution/dispatch cost for the fixed workload.

The RQ is not a claim that the current compiler lacks cloning.  It is admissible for bounded checking because a two-action witness is syntactically lawful: at one externally visible function reached by two constant call contexts, the legal plans may retain one general body or emit two constant-specialized clones and rewrite both callers.  Whether that difference supplies a non-generic paper contribution is decided at C0, not presumed here.
