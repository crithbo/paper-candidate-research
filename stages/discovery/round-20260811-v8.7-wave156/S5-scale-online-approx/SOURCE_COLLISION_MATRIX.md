# Wave156 Source / Collision Matrix

| Object | Native union/current source | Exact oracle and full-cost ledger | Witness result / finite killer |
|---|---|---|---|
| Lucene | MergePolicy's `findMerges`/forced/delete merges and scheduler; deletion policy callbacks. | identical search results/commit visibility; flush/merge bytes, temporary disk, CPU/I/O, reader blocking, deletion retention. | A 72h trace replay fails if a proposed move is expressible as native policy or no full-cost Pareto/guarantee remains. Union absorbed. |
| InnoDB | online DDL table explicitly covers add/drop/rename indexes, inplace/copy/rebuild and locks/concurrent DML. | identical SQL results/transaction visibility; scan/copy, change capture/apply, writes, locks, buffer pool, temp space. | Fail on semantic/lock mismatch or no gain over legal native algorithm. Union absorbed. |
| Cassandra SAI | Memtable write, SSTable flush/compaction, tombstones, incremental rebuild markers, STCS/TWCS configuration. | identical CQL rows/index results; buffers, SSTable rewrite, postings/trie/kd-tree, compaction I/O, disk amplification/latency. | Fail if compaction choice is only strategy configuration or oracle diverges. Union absorbed. |
| DuckDB ART | Raw screen only. | Exact SQL/ART reader oracle and full rebuild/update/vacuum ledger required. | `NOT_ADMITTED_UNFROZEN`, not scientific DROP. |
| PostgreSQL B-tree | Raw screen only. | Exact SQL visibility plus page/WAL/vacuum/reindex costs required. | `NOT_ADMITTED_UNFROZEN`, not scientific DROP. |
| Druid inverted/bitmap | Raw screen only. | Exact segment query result plus ingestion/compaction/temporary storage costs required. | `NOT_ADMITTED_UNFROZEN`, not scientific DROP. |
