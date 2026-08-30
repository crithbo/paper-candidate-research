# Cross-lane deduplication

The six objects below are distinct from the excluded Wave136 characterization lines and current/terminal S4 objects (PagePack, DYNCACHE-PGM, Parquet/ORC, RocksDB, Git, CVC5, PB, HNSW, WebGraph, GIN, AIGER, Knative). No object from Wave113/119 is reconsidered.

| id | exact object boundary |
|---|---|
| R01 | crash-fault-tolerant replicated key-value objects with one-shot transactions |
| R02 | byte-granularity persistent-memory GPU hash index |
| R03 | DPU-based JBOF disaggregated key-value service |
| R04 | datacenter crash-failure detector and its coordination clients |
| R05 | data-dependent read path on a fixed read-only on-disk structure |
| R06 | stateful P4 program temporal-verification problem |

No new object is retained, so no cross-lane ownership collision remains.
