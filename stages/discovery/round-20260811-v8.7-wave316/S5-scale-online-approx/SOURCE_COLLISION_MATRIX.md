# Source and collision matrix

| Family | Current first-party union | Same-object/reader oracle | Natural versioned trace | Collision result |
| --- | --- | --- | --- | --- |
| Cassandra SSTable | UCS/STCS/LCS/TWCS plus native selected-SSTable rewrite/recovery | CQL rows, tombstone visibility, reopen/recovery | not frozen; synthetic stress excluded | selection-only residual → `DROP` |
| ClickHouse MergeTree | immutable part merge, vertical mode, publication/inactivation, rebuilt indexes/checksums | fixed DDL + SQL results/reopen | official UK example static, update trace unfrozen | existing whole action → `DROP` |
| Iceberg | compact data, rewrite manifests, snapshot commit/retry and maintenance configs | snapshot-visible rows/deletes and catalog read | static tables insufficient | existing whole action → `DROP` |
| Kafka/Hudi | compaction/log-cleaner scheduling | consumer/snapshot view | not deepened | controller → `DROP` |
| Cassandra MV | view rebuild/backfill vicinity | view + base-table semantics | not frozen | `NOT_ADMITTED_UNFROZEN` |

No implementation-absence claim is made. The three deep objects were not retained because their complete reader-equivalent maintenance action is already a current native action; a parameter/threshold/selection policy is not a valid N2 substitute.
