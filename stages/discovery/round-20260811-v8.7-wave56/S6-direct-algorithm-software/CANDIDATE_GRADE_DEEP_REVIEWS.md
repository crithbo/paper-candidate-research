# Candidate-grade deep review — Wave56

## SCOTCH-ND

- Exact object: a fixed sparse graph and a legal nested-dissection ordering used by an unchanged downstream symbolic factorization contract.
- Official/current source: [SCOTCH upstream](https://gitlab.inria.fr/scotch/scotch), its ordering documentation, and current graph-ordering/partition construction paths.
- Candidate action tested: a cache-aware separator packing/order constructor that preserves the ordering legality and charges separator finding, ordering time, memory, symbolic fill and downstream factorization cost.

| Dimension | Review |
|---|---|
| Decision rule | Build separators and recursively order all graph vertices. |
| Information | Whole fixed graph, with no hardware/profile oracle beyond a fair baseline. |
| Complexity/resource | Separator/order CPU/RAM plus symbolic/factor cost must be charged. |
| Quality/guarantee | Same legal permutation and fixed balance/separator constraints. |
| Full cost | Graph preparation, construction, memory, fill, factorization and query/solve effects. |
| Generalization/no-gain | SuiteSparse natural matrices are finite carriers; no-gain if it is a traversal/cache order within existing nested-dissection construction. |

Current SCOTCH-style nested dissection already supplies a complete whole-graph ordering action. The tested “packing” changes the implementation or optimization target, but does not name a new representation, exact/FPT/approximation guarantee, or atomic action outside the direct ordering family. It would either be routine tuning or change the ordering objective/contract.

`DROP_CURRENT_DIRECT_ORDERING_FAMILY__NO_NONTRIVIAL_SAME_OBJECT_N2`.
