# Source and collision matrix — M1 Wave 4

| ID | Primary source / date role | Evidence extracted | Same-object relevance | Limit / honest boundary |
|---|---|---|---|---|
| A1 | [CCL-Bench 1.0](https://arxiv.org/abs/2605.06544), original paper, 2026 | Trace + YAML workload-card + launch-script evidence package; reports overlap/time disconnect, bandwidth sensitivity, and same-hardware framework ranking reversal. | Direct current paper on trace-backed LLM infrastructure evaluation and explanatory measurements. | Authors’ findings; not rerun here. The paper is a direct subtractor, not a proof of every trace claim. |
| A2 | [MLPerf Endpoints](https://mlcommons.org/benchmarks/endpoints/), official benchmark | Sweeps live endpoint load to characterize full speed-versus-capacity curves; uses reviewed submissions. | Current deployment/evaluation baseline for replacing fixed operating points with a curve. | Serving endpoint scope, not automatically training/parallelism selection. |
| A3 | [MLPerf Inference submission guide](https://docs.mlcommons.org/inference/submission/), official documentation | Defines scenario/load generation, latency tracking, accuracy validation, and result computation. | Strong fairness baseline for claims about fixed-scenario measurement. | It does not by itself derive a new selection algorithm. |
| A4 | [Chakra](https://arxiv.org/abs/2305.14516), original paper | Standardized execution-trace schema and tooling for co-design/simulation. | Methodological-adjacent trace representation baseline. | Does not alone absorb a distinct decision mechanism. |
| B1 | [duckdb-httpfs issue #172](https://github.com/duckdb/duckdb-httpfs/issues/172), upstream issue, 2025 | Public S3 Parquet report with row/column counts, request-count/time observation, and Arrow comparison. | Natural workload lead for remote scan cost cliff. | Reporter measurement; unexecuted and not independently certified here. |
| B2 | [DuckDB-Wasm paper](https://duckdb.org/pdf/VLDB2022-kohn-duckdb-wasm.pdf), official project paper | Remote partial-file reads and exponentially growing readahead buffers reduce request counts; row groups can be skipped with predicates. | Direct subtractor for generic range-request coalescing/readahead. | Browser/Wasm deployment differs; it does not prove current httpfs is optimal. |
| B3 | [DuckDB documentation](https://duckdb.org/duckdb-docs.pdf), official documentation | Larger Parquet row groups improve compression; smaller row groups enable parallel reads and predicate-based skipping. | Layout/cost tradeoff baseline. | Documentation does not supply the proposed full-cost frontier. |

## Collision summary

| Candidate shape | Direct subtractor | Strong baseline union | Residual after subtraction | Result |
|---|---|---|---|---|
| Trace-based explanation of cost cliff / ranking reversal | A1 | A1 + A2 + A3 + A4 | None: generic trace evidence, curve reporting, and stated reversal claims are already principal contributions. | `DIRECT_FATAL → DROP` |
| Row-group-aware request coalescer/readahead | B2 | Current DuckDB/httpfs + B2 + reporter’s Arrow comparator + bounded offline ceiling | None evidenced: generic readahead is occupied; a new crossover policy was not shown to exist beyond the single upstream report. | `DIRECT_SUBTRACT → DROP` |

## Search boundary

Search was bounded to original papers, official benchmark/project documentation, and upstream issues through 2026-08-09. `SEARCH_BOUNDED_OPEN` is not asserted for either shape because the listed direct/strong collisions are sufficient to reject the generic claims.
