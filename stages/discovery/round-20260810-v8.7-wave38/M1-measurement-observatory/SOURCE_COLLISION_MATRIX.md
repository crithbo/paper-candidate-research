# Source collision and action-residual matrix — Wave38

**Frozen cutoff:** 2026-08-09.  All linked sources are official documentation or upstream source repositories.  This matrix reports a design screen, not empirical measurements.

| Object | First-party evidence | Carrier and oracle status | Strongest same-object action union | Collision/residual judgment |
|---|---|---|---|---|
| PostgreSQL statement statistics | [Official documentation](https://www.postgresql.org/docs/current/pgstatstatements.html) | Statistics available; natural public query/schema/update carrier not frozen; SQL equivalence needs them. | Native planner/index/statistics/configuration actions plus collection. | Action is external recommendation/selection and full cost is open — **DROP** |
| JFR/JMC | [OpenJDK JMC upstream](https://github.com/openjdk/jmc) | Recording parser/rules can be deterministic for an input; public natural application trace not frozen. | Rule evaluation and report generation. | Diagnostic wrapper, not native operational action — **DROP** |
| Perfetto Trace Processor | [Perfetto upstream](https://github.com/google/perfetto/tree/main/src/trace_processor) | Deterministic trace-query oracle only. | Trace ingestion and SQL/query processing. | Characterization/action discontinuity — **DROP** |
| Wasmtime | [Wasmtime upstream](https://github.com/bytecodealliance/wasmtime), [official profiling examples](https://docs.wasmtime.dev/examples-profiling.html) | Module result is a native oracle; no public natural profile carrier frozen. | Existing strategy, cache, and resource configurations, with their costs. | Profile selector is absorbed; no divergence witness — **DROP** |
| LLVM remarks | [LLVM Remarks documentation](https://llvm.org/docs/Remarks.html), [current PassBuilder source](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Passes/PassBuilderPipelines.cpp) | Deterministic compiler remark/test output; no stable natural distribution. | Existing pass pipeline and remark annotation paths. | Diagnosis/priority alone; no complete new N2 transform — **DROP** |

## Collision controls

- Wave34 M1 genealogies are excluded by assignment: Google/Alibaba/Azure production traces, CCL-Bench, MLPerf, DuckDB remote-Parquet, Defects4J, OSS-Fuzz, syzbot, FuzzBench, and LLVM test-suite.
- Current plan/registry exclusions remain intact: UST, Knative, CVC5, RocksDB, S5, Parquet, LLVM-bitcode, and all terminal topics.
- No implementation-absence gap is asserted, hence no current-source absence claim is used as an action-gap certificate.
