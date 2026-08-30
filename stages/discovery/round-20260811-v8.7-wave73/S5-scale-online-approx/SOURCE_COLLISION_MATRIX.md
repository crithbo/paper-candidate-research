# Primary source and action/collision matrix

Every source was checked through 2026-08-11. No row claims that a current implementation lacks an action; the v8.7 absence-claim audit is therefore `NOT_TRIGGERED`, rather than being replaced with a claim from a paper limitation or old issue.

| Unique family / first-party source | Frozen object and information/guarantee | Strongest fair union / full-cost | Review |
|---|---|---|---|
| [Semiring IVM](https://arxiv.org/abs/2606.07795) | Insert-only semiring CQ maintenance; amortized update + constant-delay enumeration for stated query classes. | Native semiring structure + compatible IVM; updates, state, enumeration all costed. | `DROP`: rebuild schedule is a controller. |
| [IMP provenance sketches](https://www.openproceedings.org/2026/conf/edbt/paper-18.pdf) | Sketch-annotated relational deltas; safe overapproximation of query provenance. | Incremental annotation/delta semantics + full maintenance; state and delta processing costed. | `DROP`: direct object-level maintenance action. |
| [Dynamic k-center with recourse](https://proceedings.mlr.press/v267/bhattacharya25a.html) | Fully dynamic metric points; approximate centers, bounded recourse, amortized update. | Native dynamic sparsifier/k-center + compatible dynamic clustering methods; center changes and updates costed. | `DROP`: direct dynamic-data-structure instantiation. |
| [Competitively consistent clustering](https://proceedings.mlr.press/v267/buchbinder25a.html) | Dynamic k-center/facility/k-median with approximation and recourse against an offline comparator. | Online fractional/rounding construction and allowed offline ceiling. | `DIRECT_SUBTRACT`: competitive/recourse union. |
| [Adaptive dynamic bitvectors](https://doi.org/10.1007/s00224-025-10229-8) | Dynamic bitvector operations under a query/update mix; amortized time bound. | Native adaptive representation plus compact dynamic bitvector predecessors. | `DROP`: complete representation already named. |
| [Concurrent order maintenance](https://doi.org/10.1016/j.jpdc.2026.105238) | Parallel list insert/delete/order operations. | Locking/lock-free comparison implementation; synchronization and operation cost. | `EXCLUDED`: concurrency implementation, not a new online-rebuild residual. |
| [CompactLTJ](https://link.springer.com/article/10.1007/s00778-025-00945-5) | Graph-database join processing with compact index structures. | Compact representation and adaptive dynamic bitvectors. | `EXCLUDED`: ordinary index-layout scope. |
| [Fully dynamic lp embedding](https://proceedings.mlr.press/v267/banihashem25a.html) | Dynamic metric embedding through updates. | Native dynamic embedding algorithm + generic embedding baselines. | `EXCLUDED`: representation/embedding object outside assigned rebuild focus. |
| [Enzyme IVM](https://arxiv.org/abs/2603.27775) | Materialized-view refresh in data-engineering pipelines. | Cost-based refresh strategy and Spark primitives; refresh planning cost. | `EXCLUDED`: explicitly strategy-selection/controller object. |
| [Dynamic correlation clustering](https://proceedings.mlr.press/v258/braverman25a.html) | Dynamic labeled graph clustering under adaptive changes. | Fully dynamic algorithm and update-time guarantee. | `EXCLUDED`: separate dynamic-graph theory object; no same-object rebuild residual. |

## Current-reality check record for deep reviews

| Deep line | Current official/original material checked | Config/absence conclusion |
|---|---|---|
| Semiring IVM | Author original preprint, dated 2026, checked 2026-08-11. | No implementation-absence claim; flags/source audit not required. |
| IMP | EDBT 2026 official proceedings paper, checked 2026-08-11. | Positive semantics/state specification; no source-absence claim. |
| Dynamic k-center | PMLR official 2025 proceedings and PDF, checked 2026-08-11. | Positive algorithm/guarantee collision; no upstream-source absence claim. |
| Dynamic bitvectors | Original journal record, checked 2026-08-11. | Positive representation collision; no configuration-absence claim. |

This is a bounded collision record, not a global novelty assertion.
