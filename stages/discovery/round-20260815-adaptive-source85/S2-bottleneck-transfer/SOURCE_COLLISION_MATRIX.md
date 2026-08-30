# Current union and collision matrix

| Comparator | Same-object action | Evidence | Assessment |
|---|---|---|---|
| Relax default compilation pipeline | Legal graph transforms including fusion and buffer planning | Official Relax VM architecture | Strong union component |
| `StaticPlanBlockMemory` | Static allocation reuse | Official transform reference | Strong union component |
| Workspace/allocation lowering | Workspace construction and residual dynamic allocation lowering | Official transform reference | Strong union component |
| VM code generation/runtime | Bytecode, constant-pool, kernel packaging and VM execution | Official Relax VM architecture | Strong union component |
| Direct same-object joint-constructor paper | Fusion-boundary plus static-lifetime constructor | Not safely searchable until exact action/source is pinned | `SEARCH_BOUNDED_OPEN`, not absence evidence |

The matrix rejects ordinary pass ordering, memory flags, generic packing, black-box ILP, cache policy and wrapper proposals. The open collision line is a bounded debt, not a novelty conclusion.
