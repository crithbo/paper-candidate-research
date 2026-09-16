# Source / collision matrix

| Family | Official/current first-party source | Native strongest-union requirement | Collision status |
|---|---|---|---|
| Graphviz `dot` | [Graphviz upstream](https://github.com/graphviz/graphviz) | Ranking, crossing/order and coordinate production paths | Same-object invariant unavailable; structural drop. |
| METIS | [METIS upstream](https://github.com/KarypisLab/METIS) | Coarsening, initial partition, refinement and documented options | Partition approximation/FPT collision audit open. |
| OpenFST | [OpenFST upstream](https://github.com/kkm000/openfst) | Determinization/minimization/encoding algorithms | Native exact methods already direct baseline; structural drop. |
| PostgreSQL hash index | [PostgreSQL upstream](https://github.com/postgres/postgres) | Build, split, WAL, maintenance and access-method configuration paths | Extensible-hashing collision audit open. |
| Brotli | [Brotli upstream](https://github.com/google/brotli) | Encoder meta-block, context-map, quality/window/mode paths | Direct constrained-compression collision audit open. |
| igraph | [igraph upstream](https://github.com/igraph/igraph) | Community coarsening/move/quality paths | Fixed reader-equivalent semantics unavailable; structural drop. |

The listed repositories are first-party source anchors, not evidence that every
path was audited. For every `UNFROZEN` row, this distinction is decisive.
