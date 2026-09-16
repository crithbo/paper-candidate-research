# Unique approximation families

| id | natural carrier / exact-small oracle | strong union / full cost | status |
|---|---|---|---|
| R01 | numeric telemetry/event streams; exact sorted prefix oracle | KLL plus current merge/serialization forms; ingest, compaction, retained bytes, merge, serialization, query/error | current union closes |
| R02 | user/event identifiers with set queries; exact hash-set/set-operation oracle | Theta framework and compatible seed/bounds operations; hash/update, retained bytes, merge, serialize, query/bounds | current union closes |
| R03 | high-cardinality event identifiers; exact distinct count on small partitions | native CPC state/update/merge; hash/update, bytes, merge/serialization, estimate/error | current union closes |
| R04 | weighted event labels; exact frequency table oracle | frequent-items updates/query/error-mode union; update, retained state, merge, bounds/error, query | current union closes |
| R05 | public analytical tables/stream columns; exact quantile oracle | DuckDB T-Digest aggregate including all state transitions; scan, aggregate state, combine, memory, finalization | no atomic witness |
| R06 | public log/event tables; exact frequency top-k oracle | DuckDB Filtered Space-Saving aggregate state; scan, state, combine, memory, finalization | no atomic witness |

The natural carrier route is explicit but no corpus was downloaded or run.
