# Source and collision matrix — Wave54

Frozen cutoff: `2026-08-11`. Sources below are official project documentation/current upstream locations and original algorithm families.

| Family | Official/current source | Native action / semantic contract | Collision result |
|---|---|---|---|
| LLVM dominator tree | [LLVM DominatorTree](https://llvm.org/doxygen/classllvm_1_1DominatorTree.html) | Complete exact dominance construction/query action | Direct algorithm family; no new atomic residual. |
| LLVM loop forest | [LLVM LoopTerminology](https://llvm.org/docs/LoopTerminology.html) | Fixed CFG loop/nesting semantics | Current analysis union. |
| CHOLMOD supernodes | [CHOLMOD User Guide](https://github.com/DrTimothyAldenDavis/SuiteSparse/blob/dev/CHOLMOD/Doc/CHOLMOD_UserGuide.pdf) | Symbolic analysis/supernodal data-structure construction | Existing direct construction family. |
| COLAMD ordering | [COLAMD package](https://github.com/DrTimothyAldenDavis/SuiteSparse/tree/dev/COLAMD) | Sparse column-ordering contract | Existing ordering family; no N2 specified. |
| Souffle index | [Souffle documentation](https://souffle-lang.github.io/docs/) | Relation/index lookup and generated-program contract | Native index/configuration union. |
| DuckDB radix sort | [DuckDB execution source](https://github.com/duckdb/duckdb/tree/main/src/common/sort) | Same sorted relation semantics | Native sort/run/merge union; no full constructor residual. |
| OR-Tools CP-SAT | [CP-SAT documentation](https://developers.google.com/optimization/cp/cp_solver) | Exact model feasibility/objective contract | Current presolve/solver union; generic transformation would be opaque solver/wrapper. |
| Boolector rewrite DAG | [Boolector documentation](https://boolector.github.io/docs/) | Equivalent bit-vector formula/DAG semantics | Native simplification/rewrite union. |

No retained candidate depends on an implementation-absence claim, so no unverified absence or stale issue is used. The current-source/documentation check is positive: each family has a complete native direct action that either absorbs the named action or leaves only a routine implementation schedule.
