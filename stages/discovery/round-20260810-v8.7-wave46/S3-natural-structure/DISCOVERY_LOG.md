# Discovery log — WAVE46 NATIVE-CONSTRUCTOR DP

- Assignment: `DISCOVERY-S3-20260810-V8.7-WAVE46-NATIVE-CONSTRUCTOR-DP`
- Frozen cutoff: `2026-08-10`; method: accepted `v2/v8.1 + v8.6 + v8.7`.
- Scope: 6 fresh graph/index/storage/compiler constructor lineages; Wave29–45, all active/terminal objects, HNSW, WebGraph, UST, Knative, Parquet, CVC5, Git and RocksDB objects were excluded.
- Execution: primary-source/original-paper inspection only; no download, implementation, experiment, benchmark or downstream-stage creation.

## Result

One conditional `PROPOSE_STAGE0` is retained. It is a static same-object posting-tree constructor, not a tuning or controller proposal. The other five lines are native-choice closures or alter the immutable reader/output object.

| # | Constructor lineage | Natural carrier | Current strong union / collision | Outcome |
|---|---|---|---|---|
| 1 | PostgreSQL GIN posting-tree leaf cuts | Fixed GIN index build from a natural document/tag/array table plus frozen query-log term-frequency distribution | [PostgreSQL 18 GIN documentation](https://www.postgresql.org/docs/current/gin.html): posting list/tree, fast update/pending list and bulk insertion. | `PROPOSE_STAGE0`: bounded trace-aware legal page-cut DP, contingent on current-source non-equivalence. |
| 2 | PostgreSQL BRIN range summaries | Ordered natural append table with query range distribution | [current BRIN documentation](https://www.postgresql.org/docs/current/brin.html) | Summarization/range size is native index parameter and autosummarization behavior; no union-external constructor. `DROP`. |
| 3 | Cassandra SSTable block/index construction | Natural partition-key and clustering-key tables | [current Cassandra storage engine](https://cassandra.apache.org/doc/stable/cassandra/architecture/storage-engine.html), [compression](https://cassandra.apache.org/doc/latest/cassandra/managing/operating/compression.html) | Proposed block/codec cuts either select native SSTable compression/index settings or define a different SSTable reader format. `DROP`. |
| 4 | LLD section/symbol layout | Natural compiler/linker object sets and profiles | [current LLD linker-script policy](https://lld.llvm.org/ELF/linker_script.html), [current options](https://llvm.googlesource.com/llvm-project/+/refs/tags/llvmorg-20.1.4/lld/docs/ld.lld.1) | Linker scripts and `--symbol-ordering-file` already express the fixed layout action; an external DP supplies an order file, hence wrapper/selector. `DROP`. |
| 5 | Cranelift/regalloc2 register allocation | Public compiler MIR/test corpus with live-range/interference structure | [current Wasmtime upstream](https://github.com/bytecodealliance/wasmtime) and [current Wasmtime architecture](https://docs.wasmtime.dev/contributing-architecture.html) | A bounded-window allocator changes allocation/spill decisions already native to the allocator; no distinct same-output constructor/guarantee was isolated. `DROP`. |
| 6 | Zstandard block parsing | Natural source/archive/text corpora with repetition structure | [Zstandard project](https://github.com/facebook/zstd) and its documented strategy family | Parser/match-window/strategy are codec choices; globally different blocks alter the compressed format/performance contract or are tuning. `DROP`. |

## Evidence honesty

The GIN proposal claims neither a current implementation absence nor a speedup. Current GIN docs establish the native object and strong baseline; the action gap is the falsifiable hypothesis that its build path does not already replay the proposed **same-information, trace-aware bounded cut DP** under the same legal page format and all costs. The Stage A plan begins by pinning current source and defeating this hypothesis if equivalent behavior exists.
