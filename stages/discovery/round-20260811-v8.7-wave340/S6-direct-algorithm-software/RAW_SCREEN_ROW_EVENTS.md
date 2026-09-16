# Raw screen row events

| ID | Cross-phase family | Official source | Intended stock oracle / carrier | Result |
|---|---|---|---|---|
| R1 | MySQL InnoDB bulk-load plus B-tree page construction | https://github.com/mysql/mysql-server | SQL results/check; sysbench/public DB route | `NOT_ADMITTED_UNFROZEN` |
| R2 | Tantivy segment build plus merge/index construction | https://github.com/quickwit-oss/tantivy | Search result equality; public text corpora | `NOT_ADMITTED_UNFROZEN` |
| R3 | Apache Calcite rule-program plus physical-plan construction | https://github.com/apache/calcite | SQL result oracle; TPC-style public queries | `NOT_ADMITTED_UNFROZEN` |
| R4 | Swift SIL optimization plus IRGen construction | https://github.com/swiftlang/swift | Program tests/ABI; Swift benchmark corpus | `NOT_ADMITTED_UNFROZEN` |
| R5 | OpenSSL certificate-chain build plus verification cache construction | https://github.com/openssl/openssl | Chain verification oracle; public certificate corpora | `NOT_ADMITTED_UNFROZEN` |
| R6 | MariaDB columnstore/rowgroup construction plus compression/index build | https://github.com/mariadb-corporation/mariadb-columnstore-engine | SQL oracle; public tables | `NOT_ADMITTED_UNFROZEN` |
| R7 | Wasmtime Cranelift compilation plus code-cache artifact construction | https://github.com/bytecodealliance/wasmtime | Wasm validation/runtime oracle; WasmBench route | `NOT_ADMITTED_UNFROZEN` |
| R8 | TimescaleDB chunk creation plus compressed-segment construction | https://github.com/timescale/timescaledb | SQL/query equality; public time-series route | `NOT_ADMITTED_UNFROZEN` |

All remain raw: no current-union-external native two-action witness was frozen. This is not an absence or negative scientific inference.
