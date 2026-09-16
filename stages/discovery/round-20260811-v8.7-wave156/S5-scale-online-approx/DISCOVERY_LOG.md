# Wave156 Discovery Log

`DISCOVERY-S5-20260811-V8.7-WAVE156-DYNAMIC-EXACT-INDEX-RECOURSE-BREADTH`; cutoff 2026-08-11; v8.7/R5-P0, quality mode OFF. The required minimal inputs and academic-research-suite were reread. Only first-party sources were inspected; no experiment, benchmark, download, automation, downstream stage, or shared-control write occurred.

## Witness-first result

Six new exact-index families were screened: Lucene segment index, MySQL/InnoDB secondary B-tree, Cassandra SAI, DuckDB ART, PostgreSQL B-tree, and Apache Druid bitmap/inverted indexes. Current registry/plan search found no named active collision. The first four received source-grounded union review; PostgreSQL/Druid remained raw because this bounded search did not freeze a versioned public natural trace plus complete action witness. No absence is inferred from that.

| Family | Frozen same-object whole-action union | Decision |
|---|---|---|
| Lucene 10 | `IndexWriter` flush/commit/delete/force-merge; pluggable `MergePolicy` returns one or many primitive merges; schedulers execute serially/concurrently; deletion policies retain commit points. | The supposed rebuild/recourse rule is an existing MergePolicy/DeletionPolicy selector: controller/wrapper, no atomic divergence. |
| MySQL InnoDB | exact SQL index semantics plus current instant/in-place/copy DDL, concurrent-DML handling, online index create/drop and FORCE/null rebuild. | Native algorithms/locks and rebuild actions already express the candidate; no N2 witness. |
| Cassandra SAI | exact CQL semantics, Memtable indexing/flush, SSTable compaction/rewrite, tombstone/delete handling, incremental rebuild markers and compaction strategies. | A compaction cadence/selection changes configuration/policy, not reader semantics-preserving new action. |
| DuckDB ART | exact ART index build/update/delete/vacuum candidate. | `NOT_ADMITTED_UNFROZEN`: no complete current-action source and natural trace were frozen in this assignment. |
| PostgreSQL B-tree | exact B-tree insert/delete/vacuum/reindex candidate. | `NOT_ADMITTED_UNFROZEN`: do not infer an action gap without current source/trace closure. |
| Apache Druid | exact bitmap/inverted index segment ingestion/compaction candidate. | `NOT_ADMITTED_UNFROZEN`: no complete action witness/trace closure. |

No `PROPOSE_STAGE0`: the three reviewed native unions absorb the proposed actions; the other three are not dropped but are insufficiently frozen. A future <=72h fidelity route must use a versioned public natural update/query trace and exact reader oracle, then charge ingest/update/delete, segment/SSTable/page rewrite, vacuum/merge, temporary space, WAL/log, CPU/I/O, query latency and catch-up. It fails closed on reader mismatch, illegal operation, or no full-cost Pareto/parameterized guarantee gain.

Sources: [Lucene MergePolicy](https://lucene.apache.org/core/10_4_0/core/org/apache/lucene/index/MergePolicy.html), [Lucene deletion policy](https://lucene.apache.org/core/10_3_0/core/org/apache/lucene/index/IndexDeletionPolicy.html), [MySQL online DDL](https://dev.mysql.com/doc/refman/8.0/en/innodb-online-ddl-operations.html), [MySQL performance/concurrency](https://dev.mysql.com/doc/refman/8.0/en/innodb-online-ddl-performance.html), [Cassandra SAI concepts](https://cassandra.apache.org/doc/latest/cassandra/developing/cql/indexing/sai/sai-concepts.html), [SAI configuration](https://cassandra.apache.org/doc/latest/cassandra/developing/cql/indexing/sai/operations/configuring.html).

Decision: `COMPLETE_ZERO_PROPOSALS`; no scientific STOP claim.
