# Source / collision matrix

| family | official current evidence | reader/oracle | union / decision |
|---|---|---|---|
| Arrow IPC | [Arrow format](https://arrow.apache.org/docs/8.0/format/Columnar.html) | Arrow stream/file reader | Dictionary batches support deltas and interleaving; complete writer action catalogue not frozen. `NOT_ADMITTED_UNFROZEN`. |
| rustc incremental | [Rust compiler guide](https://rustc-dev-guide.rust-lang.org/queries/incremental-compilation.html) | compiler output equality | Query DAG persists results; `try-mark-green` proves reuse or re-executes and compares output. Direct absorption. |
| ThinLTO | [current LLVM ThinLTO docs](https://clang.llvm.org/docs/ThinLTO.html), [DTLTO source docs](https://llvm.org/doxygen/DTLTO_8h_source.html) | linked executable semantics | Per-task summaries/import lists/cache keys, cache-hit skip, and documented pruning policies are current union. Direct absorption. |
| SQLite R-tree | official SQLite R-tree source/documentation route | SQLite reader/integrity route | No current exact source/action union pin in this pass; no absence fact claimed. `NOT_ADMITTED_UNFROZEN`. |
| HDF5 chunk index | official HDF5 source/documentation route | HDF5 reader | No frozen version/config/index action union or natural trace. `NOT_ADMITTED_UNFROZEN`. |
| Iceberg manifests | Apache Iceberg official source/spec route | Iceberg snapshot/table reader | Compaction/expiration determine maintenance timing and are controller/policy rather than a new fixed constructor. `STRUCTURAL_DROP`. |
