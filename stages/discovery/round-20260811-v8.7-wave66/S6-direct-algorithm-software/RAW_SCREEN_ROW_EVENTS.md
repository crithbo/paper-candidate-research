# Wave66 raw events

| raw | recent-artifact family | limitation clue | result |
|---|---|---|---|
| R01 | DuckDB external sort | memory/run-domain limitation | `DEEP → DROP` |
| R02 | Velox hash aggregation | skew/domain limitation | `DEEP → DROP` |
| R03 | Cranelift codegen | target/IR coverage limitation | `DEEP → DROP` |
| R04 | DataFusion optimizer | unsupported-plan/input-domain limitation | `DROP` |
| R05 | TiKV compaction | workload-domain limitation | `DROP` |
| R06 | OR-Tools CP-SAT | model-class limitation | `DROP` |

All are new paper-led families; limitation text is not treated as current absence evidence.
