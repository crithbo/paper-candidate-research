# Witness-first raw screen rows

| Family | Fixed object / native oracle | Preliminary legal divergence | Outcome |
|---|---|---|---|
| Graphviz `dot` layered layout | Fixed directed graph and emitted layout interpreted by stock Graphviz consumers | Two rank/order choices can yield distinct legal layouts, but output coordinates are the object rather than an invariant reader result. | `STRUCTURAL_DROP`: same-object guarantee cannot be fixed without changing the layout objective. |
| METIS multilevel k-way partition | Fixed graph, k, balance constraint; partition checker/cut ledger | Distinct coarsening/seeding choices produce legal partitions. | `NOT_ADMITTED_UNFROZEN`: current multilevel union and direct approximation literature not closed. |
| OpenFST determinization/minimization pipeline | Fixed weighted acceptor/transducer and stock equivalence/shortest-distance semantics | Equivalent state-numberings and removal order exist. | `STRUCTURAL_DROP`: routine representation/order freedom is not a new whole constructor; direct exact algorithms are the native baseline. |
| PostgreSQL hash-index build/split | Fixed table, hash opclass and query semantics; stock queries/amcheck | A bucket split order may differ while lookup answers agree. | `NOT_ADMITTED_UNFROZEN`: current build/insert/split/WAL union and collision with extensible hashing are unclosed. |
| Brotli meta-block/context-map construction | Fixed uncompressed byte stream and stock decoder semantics | Legal meta-block/context-map decisions encode the same bytes. | `NOT_ADMITTED_UNFROZEN`: current encoder heuristics and strong compression literature/action union were not exhaustively pinned. |
| igraph multilevel community construction | Fixed graph and selected quality functional; score verifier | Different coarsening/move sequences are legal. | `STRUCTURAL_DROP`: objective selection/quality claim is not a fixed reader-equivalent object, and generic heuristic comparison remains. |

All six families are fresh relative to the registry’s noted Wave249/252/254
objects. No raw row was promoted merely because it exposes configuration or
heuristic freedom.
