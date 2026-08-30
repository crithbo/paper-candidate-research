# Unique opportunity families

All ten raw rows map one-to-one to a `UNIQUE_OPPORTUNITY_FAMILY`; deduplication key is the exact native object plus function/guarantee, rather than a shared domain label.

| Family | Exact object | Strongest initial same-object union / direct subtractor | Carrier and full-cost boundary | Funnel state |
|---|---|---|---|---|
| DUCKDB-ROBUST-JOIN | One parsed DuckDB query with fixed relations/statistics/output. | Current join-order/build-side optimizer, `disabled_optimizers`, plus DuckDB’s published RPT and POLAR implementations. | JOB/TPC-H/DSB query inputs; plan CPU/memory, all execution I/O/CPU, materialization and result equality. | Deep |
| BINARYEN-RELOOPER | One fixed Wasm CFG to a spec-valid, semantically equivalent Wasm module. | Native Relooper and ReReloop passes, deterministic emitter, spec tests. | Wasm spec tests and Binaryen tests; transformation time, bytes, validation and execution equivalence. | Deep |
| RUST-TRAIT-GOALS | One fixed crate goal set to rustc’s accept/reject/diagnostic contract. | Current and next trait-solver paths, feature gates and compiler test suite. | rustc UI/compiler tests; solver CPU/memory, diagnostics and compilation outcome. | Deep |
| HOTSPOT-SUPERWORD | Fixed C2 graph to equal Java/deoptimization behavior. | Current SuperWord legality/dependence analysis and JVM flags. | jtreg/Java programs; compilation time/code bytes/runtime and deopt behavior. | Raw drop |
| SQLITE-PLAN | Fixed SQL/database/statistics to identical result rows. | Native planner, indexes/statistics and documented planner controls. | SQLite test DB/query suites; planning/execution time, I/O, result equality. | Raw drop |
| ZFS-METASLAB | Fixed pool state/request sequence to allocation correctness. | Current allocator classes, metaslab policy and tunables. | zpool test inputs; allocation latency, fragmentation, write amplification/rebuild. | Raw drop |
| NGINX-H2-DISPATCH | Fixed stream states to HTTP/2-compliant transmissions. | Existing scheduling/flow-control/priority semantics. | HTTP/2 conformance traces; latency, fairness, protocol state and CPU. | Raw drop |
| QEMU-TCG-RA | Fixed TCG block to host code with exact execution semantics. | TCG register allocator/spill action family. | QEMU tests; codegen CPU/code size/host execution correctness. | Raw drop |
| MAKE-JOBSERVER | Fixed build DAG and commands to normal make rebuild semantics. | Jobserver tokens, ready-job queue, `-j` and load-limit controls. | GNU make tests/public trees; scheduling overhead plus all child-command cost. | Raw drop |
| LMDB-SPLIT | Fixed LMDB key/value relation to identical reader behavior. | Native page split/rebalance and page-size/environment controls. | LMDB tests/public key-value workloads; write I/O, page bytes, reader legality. | Raw drop |
