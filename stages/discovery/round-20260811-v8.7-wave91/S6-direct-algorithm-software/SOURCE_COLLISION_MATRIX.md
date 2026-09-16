# Source and collision matrix

| Family | Official/current source | Current action evidence | Strongest same-information union | Collision conclusion |
|---|---|---|---|---|
| libdivsufsort | [upstream source](https://github.com/y-256/libdivsufsort) | induced sorting and bucket construction | complete native induced-sort construction | local traversal changes absorbed |
| METIS | [upstream source](https://github.com/KarypisLab/METIS) | multilevel recursive-bisection/k-way and multi-constraint schemes | coarsen + initial partition + uncoarsen/refine | matching/refinement changes absorbed |
| HiGHS | [upstream source](https://github.com/ERGO-Code/HiGHS); [official documentation](https://ergo-code.github.io/HiGHS/) | simplex, IPM, presolve and option paths | all native solver/basis construction paths under identical semantics | current union broad; action witness unfrozen |
| CGAL AABB tree | [official AABB-tree manual](https://doc.cgal.org/latest/AABB_tree/); [upstream source](https://github.com/CGAL/cgal) | hierarchy build/traversal and kernel predicates | complete native tree construction/query path | split/order changes absorbed |

No conclusion rests on an implementation-absence assertion. For HiGHS, current documentation exposes multiple solver and option paths, so a supposed absent solver action is not inferred from old documentation, issues, or future work.
