# Primary-source / collision / action matrix

Sources were checked through 2026-08-11. No row makes a current-source **absence** claim. Therefore an exact commit/flag absence audit is not invoked to infer a gap; the positive current documentation and papers are used to establish the native action union.

| Family and first-party source | Exact object / natural stream | Native + generic fair union | Disposition |
|---|---|---|---|
| [ReSketch thesis chapter / preprint record](https://research.chalmers.se/publication/551583/file/551583_Fulltext.pdf) | Frequency estimation with arbitrary merge, partition, and resize sequences; data-pipeline streams. | ReSketch representation, provenance DAG, merge/partition/resize; generic mergeable summaries. | `DROP`: direct absorption of the intended complete reconfiguration action. |
| [Apache DataSketches merge criteria](https://datasketches.apache.org/docs/Architecture/SketchCriteria.html) | Production streaming sketches, including saved summaries with changed size parameters. | Same-family update, merge and size-parameter compatibility; generic mergeable sketches. | `DROP`: budget-change merge is documented native semantics, not residual. |
| [Apache Theta resize-factor documentation](https://datasketches.apache.org/docs/Theta/ThetaResizeFactor.html) | Approximate distinct stream/set summary. | Theta update/compact/set operations and X1/X2/X4/X8 growth configurations. | `DROP`: changing resize factor is ordinary configuration. |
| [Apache DataSketches Java upstream](https://github.com/apache/datasketches-java) | Current multi-family streaming-sketch library. | Current upstream core library and documented sketch families. | `DIRECT_SUBTRACT`: confirms the deployable current baseline; no missing-feature allegation. |
| [Cuckoo Heavy Keeper (PVLDB 2025)](https://www.vldb.org/pvldb/vol18/p3149-ngo.pdf) | Heavy-hitter/frequency stream; packet and analytics streams. | CHK plus KV, sketch, and hybrid heavy-hitter families. | `DROP`: no union-external drift/reconfiguration action was named. |
| [Gentle-Sketch (2026)](https://www.nature.com/articles/s41598-026-48414-5) | Top-k flow estimation in packet streams. | Static bucket layout plus flexible relocation and competing invertible sketches. | `EXCLUDED`: static/top-k layout line; not a complete merge/reconfiguration contribution. |
| [Mergeable Summaries (TODS)](https://doi.org/10.1145/2500128) | Approximate heavy hitters, quantiles, and geometric summaries over distributed streams. | Deterministic/randomized mergeable summary constructions. | `DIRECT_SUBTRACT`: generic mergeability baseline; cannot be omitted from a fair union. |
| [Apache DataSketches server](https://github.com/apache/datasketches-server) | Server-held sketches receiving updates, queries, serialization and merging. | Official `update`, `query`, `serialize`, `merge`, and `reset` interfaces. | `METHODOLOGICAL_ADJACENT`: operational baseline, not a paper candidate. |
| [REQ adaptive compactors](https://arxiv.org/abs/2511.17396) | Relative-error streaming quantiles. | ReqSketch/adaptive compactors and full mergeability. | `EXCLUDED_REPEAT`: prior S5 quantile family. |
| [FlinkSketch](https://github.com/ProjectASAP/FlinkSketch) | Flink sketch aggregation. | Sketch-library aggregators and `merge` method. | `EXCLUDED`: integration wrapper, prohibited. |
| [Streaming fair submodular maximization](https://doi.org/10.1016/j.tcs.2026.116037) | Streaming subset selection under fairness constraints. | Multi/one-pass approximation algorithms. | `EXCLUDED`: S4 constraint-object territory. |
| [Dynamic graph-stream matching](https://doi.org/10.1145/3820493) | Dynamic graph stream matching. | Sketch-based multi-pass approximate matching. | `EXCLUDED`: dynamic graph object, not a reconfigurable summary action. |

## Current-reality record for deep reviews

| Review | Official/current material checked | Default/non-default configuration review | Result |
|---|---|---|---|
| ReSketch | Author institution full-text record, checked 2026-08-11. | No implementation-absence assertion; configuration audit `NOT_TRIGGERED`. | Positive direct subtractor for merge/partition/resize/provenance action. |
| Apache Theta/DataSketches | Official current criteria, Theta resize documentation, and current upstream repository landing page, checked 2026-08-11. | X1, X2, X4, X8 and seed/hash compatibility documentation reviewed. | Positive documented action/config union; no absence claim. |
| CHK | PVLDB original paper and author artifact record, checked 2026-08-11. | No claim about missing code/flag; audit `NOT_TRIGGERED`. | Paper action union prevents turning adaptive relocation/budget selection into N2. |

The bounded source record does not claim worldwide novelty/absence.
