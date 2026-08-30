# Source and collision matrix — Wave56

Frozen cutoff: `2026-08-11`; sources are official projects and original direct-algorithm families.

| Family | Official/current source | Current complete action / oracle | Result |
|---|---|---|---|
| DOT layout | [Graphviz documentation](https://graphviz.org/documentation/) | Native DOT layout/render contract and engine union | Layout family; no named same-object residual. |
| SCOTCH ND | [SCOTCH](https://gitlab.inria.fr/scotch/scotch) | Whole-graph ordering/partition construction | Direct ordering family. |
| CHOLMOD ND | [CHOLMOD](https://github.com/DrTimothyAldenDavis/SuiteSparse/tree/dev/CHOLMOD) | Symbolic ordering/analysis | Existing union. |
| nauty | [nauty/Traces](https://pallini.di.uniroma1.it/) | Exact canonical labeling/certificate | Direct canonical-labeling family. |
| bliss | [bliss](https://users.aalto.fi/~tjunttil/bliss/) | Exact canonical labeling/certificate | Direct canonical-labeling family. |
| KaHIP | [KaHIP upstream](https://github.com/KaHIP/KaHIP) | Balanced multilevel graph partition construction | Direct partition family. |
| Cuthill–McKee | [Boost Graph Library](https://www.boost.org/doc/libs/release/libs/graph/doc/cuthill_mckee_ordering.html) | Legal bandwidth/profile ordering | Direct ordering family. |
| planar embedding | [NetworkX planarity](https://networkx.org/documentation/stable/reference/algorithms/planarity.html) | Planarity test plus rotation-system embedding | Complete native construction. |

No retained candidate depends on an implementation-absence claim. Current upstream check records existing complete actions, not stale issues or hypothetical missing flags.
