# Bounded non-evidence seed pool

| ID | Engine | Perspective | Sketch | Pre-evidence disposition |
|---|---|---|---|---|
| S01 | BOUNDARY_OR_FAILURE | MPI runtime engineer | Partition-ready calls publish parts of one message while completion remains request-level. Could publication grouping be a same-semantics runtime constructor? | selected |
| S02 | COMPOSE_DECOMPOSE_SIMPLIFY | application developer | Independent producer threads may make partitions ready at different times, while matching/order is fixed. | merged into S01 |
| S03 | NEGATION_OR_INVERSION | systems researcher | If the only choice is transport scheduling of ready partitions, the candidate is a generic controller. | merged into S01 |

No network-security topic was considered.
