# Discovery log — DISCOVERY-M1-20260809-V8.4-WAVE4

## Assignment boundary

- Lane and origin: M1 measurement observatory, `O8`.
- Accepted method: calibrated production discovery method `v2/v8.1` only. TLS-blocked two-axis `v8.2r2` was not used or claimed.
- Source boundary and cutoff: original papers plus author/official project, benchmark, documentation, or upstream issue material available by 2026-08-09.
- Execution boundary: read-only source discovery. No trace replay, profiler run, benchmark, reducer, compiler, database, CPU/GPU, download, or experiment was executed.

## Result

`ZERO_PROPOSAL`. Two natural measurement signals were examined, but neither supports an unabsorbed N1/N2/N3 mechanism after same-object collision review. No `TOPIC_BRIEF` is emitted and no Stage 0/A/B artifact is created.

## O8 direction cards

### M1-W4-A — Trace evidence for AI-infrastructure ranking reversals

- **Exact object considered:** trace-backed, full-stack attribution of LLM-training configuration comparisons, where a summary metric can rank configurations differently from end-to-end step time.
- **Natural evidence:** the original [CCL-Bench 1.0 paper](https://arxiv.org/abs/2605.06544) packages workload traces, workload cards, and launch scripts; it reports that greater compute/communication overlap can coexist with longer step time, that bandwidth sensitivity differs by accelerator family, and that the best tuning on one framework can be up to 3× slower than the peer framework on identical hardware.
- **Potential utilization mechanism considered:** choose/evaluate a parallelization or communication configuration from trace-level causal cost evidence rather than from overlap or a single throughput summary.
- **Direct subtractor:** CCL-Bench itself. Its main object is trace-backed LLM-infrastructure measurement and it already turns the ranking/metric discrepancy into an evidence toolkit and case-study conclusion.
- **Strong baseline union:** CCL-Bench; [MLPerf Endpoints](https://mlcommons.org/benchmarks/endpoints/) (full speed-versus-capacity characterization under live load); [MLPerf Inference rules/documentation](https://docs.mlcommons.org/inference/submission/) (scenario, accuracy, latency, and result-validation constraints); [Chakra](https://arxiv.org/abs/2305.14516) (standardized execution traces).
- **Collision decision:** `DIRECT_FATAL` for any proposed trace dashboard, evidence card, ranking-reversal detector, or generic trace-coverage benchmark. Merely recommending that practitioners inspect the curve/trace is not N1/N2/N3.
- **Why no residual was retained:** a new proposal would need a distinct executable decision action with a formally specified information boundary and a full-cost improvement over CCL-Bench-supported selection. No such action or natural multi-artifact counterexample was established by this read-only wave.
- **Disposition:** `DROP_NOT_PROPOSED`.

### M1-W4-B — Remote Parquet request-count cliff

- **Exact object considered:** a DuckDB/httpfs remote-Parquet scan whose object-store range-request count rises sharply with row-group count and projected columns.
- **Natural evidence:** upstream [duckdb-httpfs issue #172](https://github.com/duckdb/duckdb-httpfs/issues/172) reports a production-like S3 Parquet workload (17.4M rows, 282 variables) with roughly 150k requests and >19 minutes in DuckDB versus roughly 60 requests and ~1m20s in Arrow. The report hypothesizes a row-group-by-column request pattern; it is a reporter-provided measurement, not an independently replayed result here.
- **Potential utilization mechanism considered:** cost-aware byte-range coalescing/readahead that chooses between request fan-out and additional transferred bytes from the scan’s projected columns and row-group layout.
- **Direct/strong collisions:** the official [DuckDB-Wasm paper](https://duckdb.org/pdf/VLDB2022-kohn-duckdb-wasm.pdf) documents range requests plus exponentially growing readahead buffers to reduce remote-request counts; DuckDB also documents Parquet row-group parallelism and predicate-pushdown tradeoffs. The issue alone does not establish that its instance lies outside those mechanisms, nor that a new choice rule would dominate them at full network/CPU/memory cost.
- **Strong baseline union:** DuckDB/httpfs current behavior and issue repro; DuckDB-Wasm range-request/readahead design; Arrow comparison supplied by the upstream reporter; an oracle-style exhaustive byte-range grouping is required before claiming an algorithmic residual.
- **Collision decision:** `DIRECT_SUBTRACT` against generic readahead/request-coalescing. After subtraction, no independently evidenced new constraint, stable crossover law, or N2 policy remains.
- **Why no residual was retained:** a single issue’s large observed ratio is not a portable natural corpus, and an unmeasured “cost model” would be a controller proposal without proof that it changes an admissible decision frontier.
- **Disposition:** `DROP_NOT_PROPOSED`.

## Conditional finite Stage A killers if a later lane supplies a residual

These are re-entry gates, not experiments executed or candidates proposed by this assignment.

| Same object | Required frozen natural artifacts | Fair comparison | Finite killer |
|---|---|---|---|
| Trace-derived configuration choice | At least two public trace/workload-card artifacts with pinned framework, hardware, parallelism plan, and launch scripts; at least one ranking reversal not already reported by CCL-Bench | CCL-Bench metrics/workflow; MLPerf Endpoints curve where serving applies; native framework selection | Kill if a CCL-Bench-supported metric/action selects the same configuration with no worse complete step-time/capacity cost, or if the rule reverses under repeat/pinned trace replay. |
| Remote Parquet request policy | At least two public remote Parquet workloads with file layout, projection/filter, endpoint, and request log; include the issue’s exact version/commit if reproducible | Current DuckDB/httpfs, DuckDB-Wasm-style readahead, Arrow, and a bounded offline range-grouping ceiling | Kill if fixed/exponential readahead or Arrow matches the same full-cost Pareto point, or if no stable request/byte/latency crossover survives both artifacts. |

## Evidence and claim discipline

- CCL-Bench’s reported measurements are attributed to its authors; this lane did not reproduce them.
- Issue #172 is treated as an upstream observation and candidate corpus lead, not as a validated universal law or an established DuckDB defect.
- No current-evidence/readiness shortfall is treated as scientific negative evidence. The drops follow direct collision or absence of a defined residual mechanism, not absence of hardware, implementation, or AI readiness.
