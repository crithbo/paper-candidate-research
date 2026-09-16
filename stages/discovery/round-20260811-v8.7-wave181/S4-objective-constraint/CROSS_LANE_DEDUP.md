# Cross-lane deduplication

This screen uses streaming sketches and approximate SQL aggregates, distinct from current/terminal S4 objects (formats, indexes, solver proofs, Git/RocksDB, GPU/compiler, PagePack) and Wave136/143/169/175 objects.

| id | fixed approximate object |
|---|---|
| R01 | KLL stream quantiles with rank-error contract |
| R02 | Theta distinct/set sketch with statistical bounds |
| R03 | CPC distinct sketch with accuracy-space contract |
| R04 | Frequent-items heavy-hitter sketch with declared error mode |
| R05 | DuckDB T-Digest approximate quantile aggregate |
| R06 | DuckDB filtered-space-saving approximate top-k aggregate |
