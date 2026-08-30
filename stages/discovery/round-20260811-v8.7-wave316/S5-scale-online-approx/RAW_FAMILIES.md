# Fresh opportunity-family screen

Cutoff: 2026-08-11.  These are fixed-object native-maintenance leads, distinct from this lane's Zarr, FITS, HDF5/netCDF, CRAM/BAM, compact-automata, PostgreSQL, RocksDB and LSM-controller lines.

| ID | Fixed object | First-party entry | Initial whole action | Funnel result |
| --- | --- | --- | --- | --- |
| R1 | Cassandra SSTable set and CQL-visible rows/tombstones | [Cassandra compaction docs](https://cassandra.apache.org/doc/latest/cassandra/managing/operating/compaction/index.html) | rewrite selected immutable SSTables to reader-equivalent replacement SSTables | candidate-grade deep |
| R2 | ClickHouse MergeTree table and SQL-visible ordered rows | [ClickHouse merges](https://clickhouse.com/docs/concepts/core-concepts/merges) | merge a legal set of immutable parts and publish a new part | candidate-grade deep |
| R3 | Iceberg table snapshot and SQL-visible rows | [Iceberg maintenance](https://iceberg.apache.org/docs/latest/maintenance/) | rewrite data files/manifests and atomically commit a replacement snapshot | candidate-grade deep |
| R4 | Kafka compacted topic and consumer-visible key/version log | [Kafka documentation](https://kafka.apache.org/documentation/) | log cleaning/segment replacement under compaction policy | `DROP__CONTROLLER_POLICY` |
| R5 | Apache Hudi MOR table and snapshot reader result | [Hudi compaction docs](https://hudi.apache.org/docs/compaction) | schedule/execute log-file compaction | `DROP__CONTROLLER_POLICY` |
| R6 | Apache Cassandra materialized-view build state | [Cassandra view docs](https://cassandra.apache.org/doc/latest/cassandra/developing/cql/mvs.html) | backfill/rebuild a view under base-table updates | `NOT_ADMITTED_UNFROZEN`: no fixed stock recovery/view-update trace or union closure in this pass |

R4–R5 are rejected because selecting a cleaning/compaction time or threshold is exactly the prohibited online controller family. R6 is not a scientific DROP: its object and recovery contract were not frozen.
