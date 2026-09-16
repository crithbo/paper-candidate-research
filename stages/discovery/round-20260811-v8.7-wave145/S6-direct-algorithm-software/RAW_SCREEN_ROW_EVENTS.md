# Raw screen row events

| family | native incremental object | witness-first result |
|---|---|---|
| Apache Arrow IPC dictionary stream | dictionary/record-batch sequence read by Arrow stream reader | `NOT_ADMITTED_UNFROZEN`: format permits deltas/interleaving, but writer union and natural trace are not frozen. |
| rustc incremental queries | cached query DAG and compiled artifacts | `STRUCTURAL_DROP`: current try-mark-green algorithm is the complete direct invalidation/reuse mechanism. |
| LLVM ThinLTO | summary/index/backend native-object maintenance | `STRUCTURAL_DROP`: current cache keys/hits, per-module summaries and cache pruning already cover named action. |
| SQLite R-tree | update/rebalance of R-tree nodes | `NOT_ADMITTED_UNFROZEN`: full current R-tree source union/natural trace not frozen; no absence claim made. |
| HDF5 chunk-index maintenance | chunk index update/resize readable by HDF5 | `NOT_ADMITTED_UNFROZEN`: native index/version/config union and carrier remain unclosed. |
| Apache Iceberg manifest maintenance | snapshot/manifest update read by Iceberg table reader | `STRUCTURAL_DROP`: manifest compaction/expiration is maintenance policy/controller, not a fixed whole-output constructor. |
