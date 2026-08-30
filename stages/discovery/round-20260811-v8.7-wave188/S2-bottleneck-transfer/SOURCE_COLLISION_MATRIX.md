# Native incremental metadata-transition breadth — source and collision matrix

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE188-NATIVE-INCREMENTAL-METADATA-TRANSITION-BREADTH`  
**Cutoff:** 2026-08-11.

| Family | Primary sources | Decision |
|---|---|---|
| Lucene | [index](https://lucene.apache.org/core/7_5_0/core/org/apache/lucene/index/package-summary.html), [commit](https://lucene.apache.org/core/7_0_1/core/org/apache/lucene/index/IndexCommit.html), [upstream](https://github.com/apache/lucene) | current merge/commit union absorbs same transition; `DROP` |
| Mercurial | [7.2](https://www.mercurial-scm.org/relnotes/7.2), [config](https://mercurial-scm.org/help/topics/config), [revlog](https://book.mercurial-scm.org/read/concepts.html) | delta-info/append/storage union absorbs; otherwise compatibility changes; `DROP` |
| DuckDB | [checkpoint](https://duckdb.org/docs/current/sql/statements/checkpoint), [storage](https://duckdb.org/docs/current/internals/storage), [config](https://duckdb.org/docs/stable/configuration/overview) | current checkpoint/rowgroup/storage-version union absorbs; otherwise reader change; `DROP` |
| Zarr v3 | [upstream](https://github.com/zarr-developers/zarr-specs) | source/flag/natural mutation closure not jointly frozen; `NOT_ADMITTED_UNFROZEN` |
| Delta Lake | [upstream](https://github.com/delta-io/delta) | source/protocol/natural mutation closure not jointly frozen; `NOT_ADMITTED_UNFROZEN` |
| LMDB | [upstream](https://github.com/LMDB/lmdb) | source/flag/recovery/natural carrier closure not jointly frozen; `NOT_ADMITTED_UNFROZEN` |
| bbolt | [upstream](https://github.com/etcd-io/bbolt) | source/flag/recovery/natural carrier closure not jointly frozen; `NOT_ADMITTED_UNFROZEN` |

No standard option, issue, future-work statement or lack of download is used as an absence claim. Required full cost includes all mutation, transition, durability/recovery and stock-reader work. `PROPOSE_STAGE0: []`.
