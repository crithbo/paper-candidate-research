# DISCOVERY-M1-20260810-V8.7-WAVE38-MEASUREMENT-RESIDUAL — Discovery log

## Closure

- **Lane/assignment:** M1 Measurement Observatory / `DISCOVERY-M1-20260810-V8.7-WAVE38-MEASUREMENT-RESIDUAL`.
- **Frozen collision cutoff:** 2026-08-09.  This was a first-party-source design review; no new trace capture, build, profile, benchmark, download, or experiment occurred.
- **Method:** accepted production Discovery v2/v8.1, v8.6 fidelity-plan, and v8.7 current-upstream-reality discipline.  Blocked two-axis v8.2r2 was not used.
- **Result:** `COMPLETE_ZERO_PROPOSALS`.  No TOPIC_BRIEF is emitted.

## Five non-overlapping public system/compiler-stack screens

| # | Exact object and first-party source | Natural carrier + deterministic oracle | Native chain / current comparator | Decision |
|---:|---|---|---|---|
| 1 | [PostgreSQL `pg_stat_statements`](https://www.postgresql.org/docs/current/pgstatstatements.html) | It exposes normalized-statement execution statistics, but the official interface does not publish a natural production trace with query text/data/schema.  SQL result equivalence is a native oracle only after those missing inputs are frozen. | Planner statistics, index choice, plan settings, and extension-side collection are different layers; a trace-driven recommendation is not itself a native same-query action. | **DROP — carrier/action discontinuity.** An index adviser or planner-setting selector is a controller/wrapper, and a full-cost ledger cannot be fixed without schema, update cost, and query mix. |
| 2 | [OpenJDK Mission Control](https://github.com/openjdk/jmc) / JFR recording analysis | JFR files are parseable and analyses can be deterministic for a supplied recording.  No new public, naturally generated recording with a frozen application contract was identified here. | JMC already loads event collections and evaluates rules; output is diagnosis, not a same-object deployment action. | **DROP — instrumentation/diagnostic wrapper.** A ranking reversal across JFR rules would remain measurement, not N3 utilization. |
| 3 | [Perfetto Trace Processor](https://github.com/google/perfetto/tree/main/src/trace_processor) | A supplied trace and SQL query give a deterministic answer.  The official stack's trace artifacts are observability inputs, not a frozen operational workload plus native actuator. | Trace parsing/querying is the complete current analysis action. | **DROP — benchmark/characterization only.** A new query/planner merely changes analysis execution; it does not act on the traced system while preserving its function. |
| 4 | [Wasmtime](https://github.com/bytecodealliance/wasmtime) runtime and its [profiling guide](https://docs.wasmtime.dev/examples-profiling.html) | A fixed Wasm binary can be executed with a semantic exit/output oracle, but the reviewed official materials do not supply a public natural production profile corpus. | Compilation strategy, cache and resource limits are exposed runtime configuration; the strongest fair union includes those native choices. | **DROP — selector/configuration residual.** A profile-to-strategy rule does not introduce a union-external action, and charging warm-up/compilation/cache construction eliminates a measurement-only claim. |
| 5 | [LLVM optimization remarks](https://llvm.org/docs/Remarks.html) and current [PassBuilder pipeline](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Passes/PassBuilderPipelines.cpp) | Per-program remarks and test output are deterministic for a frozen source/toolchain; they are diagnostic/compiler artifacts rather than a public natural workload distribution. | Current pipeline already contains configurable pass composition and annotation/remark paths. | **DROP — no stable N3 carrier; direct N2 not frozen.** Mining missed remarks would only prioritize existing transformation work unless a complete, same-IR new transformation and complexity/guarantee delta are specified. |

## Near-threshold action-divergence audit

Rows 1 and 4 are closest to a measurement-to-action claim, so they receive the required subtraction rather than a blanket “policy overlap” rejection.

| Dimension | PostgreSQL statement-statistics proposal | Wasmtime profile-driven proposal |
|---|---|---|
| Decision rule | Choose index/statistics/plan-setting action from observed statement distribution. | Choose existing compilation/cache/limit configuration from profile features. |
| Information condition | Same query statistics, plus schema/data/update state required for a fair decision. | Same module/profile/host features available to the native runtime configuration. |
| Complexity/resource | Adviser search and write/amortization cost is extra; a trace-only model omits it. | Profiling, compilation, cache construction, invalidation, and warm-up belong in the denominator. |
| Quality/guarantee | A new index or stale statistics can change latency and write/storage obligations; no fixed same-function guarantee was frozen. | Semantics are preserved, but the proposed choice adds no new semantic/quality guarantee. |
| Full cost | Cannot close without a public schema, query sequence, and update ledger. | Closing full cost leaves selection among currently exposed strategies, not a new action. |
| Generalization / no-gain | The claimed regime predicts which existing action to choose; no action-divergence witness remains. | The same profile inputs select an already legal native configuration; no action-divergence witness remains. |

**Action-divergence witness conclusion:** neither line can name two inputs with identical strongest-union information where the proposed system performs a complete atomic action that the union cannot express.  This is a structural reason to reject a selector claim, not a claim that a future implementation or result would fail.

## Fidelity and finite Stage A route

None of the five screens reaches a finite Stage A route because the failure occurs *before* implementation readiness: either the natural carrier and full-cost ledger do not close (PostgreSQL/Wasmtime), or the alleged action is only trace analysis/diagnosis (JMC/Perfetto), or no complete transformation is frozen (LLVM).  The absence of a runnable artifact is not negative scientific evidence and did not determine the decision.

No active, blocked, paused, or terminal topic was reused.  In particular, this package excludes Wave34 M1's Google/Alibaba/Azure/CCL/MLPerf/DuckDB/fault-corpus lines, UST, Knative, CVC5, RocksDB, Parquet, LLVM-bitcode, and previously terminal objects.
