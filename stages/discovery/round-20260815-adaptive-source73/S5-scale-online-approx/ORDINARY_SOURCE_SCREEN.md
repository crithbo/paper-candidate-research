# Source73 ordinary source screen

Official source: https://spark.apache.org/docs/3.5.6/structured-streaming-programming-guide.html

| Role | Finding |
|---|---|
| ANCHOR/CURRENT | built-in HDFS and RocksDB providers are versioned stores; RocksDB changelog checkpointing uploads changes and periodic background snapshots support recovery/trimming. |
| CURRENT/CONTRARY | changelog checkpointing can be enabled/disabled and queries can switch safely between traditional and changelog checkpoints after restart. |
| HISTORY | bounded registry search found no exact five-field Spark state-store identity. NO_MATCH is not novelty evidence. |

The candidate's complete action space resolves as follows:

1. choose commit/snapshot/compaction timing: a forbidden policy/controller;
2. use the documented changelog/snapshot and two-way transition: already current native union;
3. implement another StateStoreProvider: a paper-owned full constructor; or
4. change provider/query/recovery semantics: changed object.

No union-external stock-native atomic action remains. Disposition: EXCLUDED_BEFORE_RAW__CURRENT_UNION_OR_CONTROLLER. This is neither a resource/implementation result nor an absence assertion.
