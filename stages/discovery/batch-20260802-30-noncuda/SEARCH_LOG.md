# Search log — non-CUDA Discovery wave 30

Date: 2026-08-02. Scope: primary/official papers, project documentation, and official open-source carriers. Searches are collision-first; absence is recorded as `SEARCH_BOUNDED_OPEN`, never as proof of novelty.

| Query family | Key sources inspected | Collision use / result |
|---|---|---|
| dynamic compiler scheduling, ML compiler graph schedules, shape specialization | [USENIX dynamic compiler scheduling](https://www.usenix.org/conference/hotpar12/lightweight-approach-compiling-and-scheduling-highly-dynamic-parallel-programs); [PluS, USENIX ATC 2025](https://www.usenix.org/conference/atc25/technical-sessions); [MLIR Shape dialect](https://mlir.llvm.org/docs/Dialects/Shape/); [IREE](https://iree.dev/) | Confirms strong dynamic/specialization baselines. No direct source located for the exact same-budget guarded-region/net-cost contract; `MLIR-SHAPE-REGION` remains open pending Stage 0 audit. |
| compiler cache/reuse and artifact identity | [LLVM MLGO](https://llvm.org/docs/MLGO.html); [LLVM optimization remarks](https://llvm.org/docs/Remarks.html); [IRHash ATC 2025](https://www.usenix.org/system/files/atc25-landsberg.pdf); [ccache](https://ccache.dev/) | Used to drop cache/remark/triage formulations; they do not establish a new compiler optimization object. |
| deferred and incremental view maintenance, concurrent outer joins | [Deferred IVM, SIGMOD 1996](https://www.vldb.org/dblp/db/conf/sigmod/ColbyGLMT96.html); [IVM overview](https://www.vldb.org/dblp/db/journals/debu/GuptaM95.html); [Streaming View, PVLDB 2025](https://www.vldb.org/pvldb/vol18/p5153-zhou.pdf); [DuckDB joins](https://duckdb.org/docs/stable/guides/performance/join_operations.html) | Establishes `DIRECT_SUBTRACT` for conventional auxiliary state and prestate handling. No direct match located for bounded lineage-witness quotient with an explicit correction bound; `IVM-PRESTATE-COARSEN` remains open. |
| dynamic graph / stream algorithms | [Dynamic k-core, VLDB Journal](https://vldb.org/vldb_journal/index.php?id=1373&option=com_article_manager&view=article); [incremental k-core source paper](https://www.vldb.org/pvldb/vol9/p1217-sariyuce.pdf) | Dropped dynamic-k-core and temporal-motif variants that lacked an object/guarantee distinct from known maintenance or the active late-window motif candidate. |
| public artifacts | [IREE source](https://github.com/iree-org/iree); [MLIR source](https://github.com/llvm/llvm-project/tree/main/mlir); [TPC-H](https://www.tpc.org/tpc_documents_current_versions/current_specifications5.asp); [YCSB](https://github.com/brianfrankcooper/YCSB); [RocksDB compaction](https://github.com/facebook/rocksdb/wiki/Compaction) | Verifies natural/open starting carriers only. No downloads, execution, or experimental claims were made. |

## Search boundary and limitations

- Search terms covered: dynamic-shape multiversioning, guarded specialization, compiler schedule reuse, deferred IVM/prestate/concurrent outer joins, dynamic k-core, stream motif lateness, approximate join sketches, LSM credit, and runtime reoptimization.
- The scan did not exhaust ACM/IEEE full text or all preprints. Both proposals have collision gates explicitly assigned to Stage 0.
- Sources were used for existence and baseline semantics, not to infer unreported performance or novelty claims.
