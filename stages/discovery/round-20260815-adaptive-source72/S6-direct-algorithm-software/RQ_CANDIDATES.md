# S72-01 RQ

For a fixed LLVM IR function and alias semantics, can an LLVM-specific joint constructor for MemoryDef/Use/Phi placement, clobber traversal, alias queries and caching give a target-specific exact/FPT/approximation/certified-Pareto guarantee beyond current MemorySSA? Falsifier: MemorySSA already exposes this union and the residual is standard SSA/dominance/alias-query construction.
