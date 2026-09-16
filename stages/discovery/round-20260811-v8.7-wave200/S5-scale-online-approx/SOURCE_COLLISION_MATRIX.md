# Wave200 Collision Matrix

| Object | Current union / exact oracle | Full cost + 72h killer | Disposition |
|---|---|---|---|
| PostgreSQL hash | Bucket split transfers tuples under current mapping; persistent crash recovery, exact equality reader and VACUUM cleanup. | buckets/tuple transfers, WAL, I/O, locks, index/query/update cost; fail if native split expresses action or oracle/recovery differs. | `CURRENT_UNION_ABSORBED` |
| SQLite R-tree | Exact spatial result oracle required. | update/query/index space/rebuild/RSS/temp; fail on reader difference or absent public versioned trace. | `NOT_ADMITTED_UNFROZEN` |
| DuckDB ART | Exact SQL result oracle required. | insert/delete/query/index space/rebuild/RSS/temp; fail on reader difference or absent closure. | `NOT_ADMITTED_UNFROZEN` |
| Cassandra SAI | Wave156 repeat. | N/A | `REPEAT_EXCLUDED` |
| Lucene | Wave156 repeat. | N/A | `REPEAT_EXCLUDED` |
| RocksDB | LSM/compaction controller exclusion. | N/A | `SCOPE_EXCLUDED` |
