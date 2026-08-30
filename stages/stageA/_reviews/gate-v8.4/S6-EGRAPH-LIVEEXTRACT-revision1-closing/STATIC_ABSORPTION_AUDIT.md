# Static absorption and fairness audit

## Object integrity

The frozen object is not the full raw cyclic Diospyros artifact. It is the preregistered root-7 acyclic projection derived from that artifact. The source has 91 nodes; the projection audit removes two malformed records and 63 cycle-participating representatives, then retains 24 nodes in 16 root-reachable e-classes. The reviewer independently confirmed that every retained node is source-backed, all child e-class mappings are faithful, the retained union graph is acyclic, and no retained class is unreachable.

This heavy projection constrains external validity, but it is not post-result object drift: the exact source, projection rule, root, mapping and STOP rule were frozen in the revision contract. The resulting claim must therefore name the derived acyclic projection, never the raw cyclic e-graph or Diospyros generally.

## Oracle and controls

Static inspection found a shared implementation path:

- all exact extractions are enumerated from the same classes and root;
- each fixed extraction uses the same Dijkstra state `(emitted roots, resident values)` and the same compute/delete/recompute semantics;
- runtime-first globally minimizes one-shot selected-DAG target cost before exact scheduling;
- memory-first globally minimizes exact recomputation-free peak, then target cost, before exact scheduling;
- joint applies the same scheduler to all nine extractions at every B;
- exact ties are retained, and both controls happen to have one frozen tie.

The sealed `schedule_queries=306` equals `9 extractions × 34 budgets`, consistent with exhaustive coverage. The reviewer did not reexecute the solver, so this is a static code-path and sealed-output audit rather than an independent optimality rerun.

## Exact absorption partition

| Budget | Joint | Sequential control | Equality surface |
|---|---|---|---|
| 4–20 B | infeasible | both infeasible | no valid point |
| 24–44 B | cost 2100, peak 24, extraction root `7.2`, actions `C:3,C:6,C:7` | memory-first | identical extraction, action trace, cost and peak |
| 48–136 B | cost 1200, peak 48, extraction root `7.3`, actions `C:26,C:27,C:7` | runtime-first | identical extraction, action trace, cost and peak |

All 29 feasible joint points are absorbed; strict witness count is zero. Both frontier traces have zero deletion and zero recomputation. The proposed coupling mechanism therefore has no realized mechanism metric on this frozen natural object.

## Full-cost interpretation

Every target-operation execution and recomputation is charged. Artifact/projection bytes, projection time, extraction enumeration, schedule search, wall time, RSS and result bytes are recorded. Search overhead is not included in the target-operation objective, but this cannot rescue the candidate: the joint oracle already ties a sequential control before charging its broader search. Adding joint planning overhead can only preserve or worsen the negative comparison.

Measured backend latency, spills, cache traffic and energy are unavailable. That forbids machine-performance claims and limits the STOP kernel to the frozen proxy mapping. It does not turn the completed negative gate into a resource blocker.
