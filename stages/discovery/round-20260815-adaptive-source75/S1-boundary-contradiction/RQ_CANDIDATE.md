# Research-question candidate

Primary RQ: for a fixed C/C++ `asm goto` program, fixed inline-assembly constraints, LLVM IR `callbr` CFG, target, ABI, and observable fallthrough/indirect-label semantics, is there a target-specific whole-function construction that jointly chooses output-register residency, edge materialization, and label layout with a stated code-size/front-end guarantee beyond LLVM's current composition?

Rejected alternate wording: “optimize asm goto code generation.” It leaves the target-specific action, guarantee, and fairness contract undefined.

Counterfactual consequence if the RQ were true: a compiler could emit a different legal machine-level realization for the same `callbr` CFG while preserving the fixed paths and inline-assembly constraints, rather than merely changing an optimization flag.
