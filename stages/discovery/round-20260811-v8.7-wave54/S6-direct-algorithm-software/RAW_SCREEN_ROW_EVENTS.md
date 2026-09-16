# Wave54 raw screen events

| raw_id | unique opportunity family | scope | disposition |
|---|---|---|---|
| R01 | LLVM dominator-tree construction | compiler data structure | `DEEP` |
| R02 | LLVM loop-nest forest construction | compiler analysis data structure | `DROP` |
| R03 | CHOLMOD supernode amalgamation | sparse-solver construction | `DROP` |
| R04 | SuiteSparse COLAMD column ordering | sparse-solver ordering | `DROP` |
| R05 | Souffle relation index selection/build | Datalog database data structure | `DROP` |
| R06 | DuckDB radix-sort run construction | database operator construction | `DROP` |
| R07 | OR-Tools CP-SAT presolve transformation | exact solver transformation | `DROP` |
| R08 | Boolector bit-vector rewriting DAG construction | solver IR/data structure | `DROP` |

`repeat=0`: all rows were checked against the registered active/terminal/blocked/hold list and Wave44–50 outputs. The S2/S4 current assignments expose no registered exact object; query-planner/objective/controller families were excluded conservatively.
