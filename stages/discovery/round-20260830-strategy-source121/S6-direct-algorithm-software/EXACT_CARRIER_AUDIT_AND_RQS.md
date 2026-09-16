# Source121 S6 Carrier Audit and Frozen RQs

## Carrier audit

- Closed exact carriers: C02 `test_loop_ordering.py`, C04 `test_autotuner.py`, C05 `test_core.py`, C07 `wmma.py`, C08 `barrier-elimination.mlir`.
- Unresolved without replacement: C01 `test_scheduler.py`, C03 `test_fusion.py`, C06 `ldmatrix.ll` (transport internal error).
- C05 is a broad language-semantics suite; no target-specific decision endpoint was frozen, so no RQ is generated.

## RQ01 — Inductor FP8 loop-ordering regression fixture
- Exact carrier: current `test/inductor/test_loop_ordering.py`, with official issue #174417 identifying `test_fp8_cast_and_t` failure under a Triton trunk update.
- Primary RQ: Does this exact FP8 cast/transpose fixture expose a target-specific loop-ordering invariant whose regression can be predicted by a finite backend-cost/legality model rather than version-specific test expectation?
- Type: `REPLICATION_NEGATIVE / COMPILER_TOOL`.
- Falsifier: current test/source already encodes the invariant, or the event is only a fixed-version upstream regression.

## RQ02 — Triton autotuner cache-key completeness
- Exact carrier: current `python/test/unit/runtime/test_autotuner.py`.
- Primary RQ: Is the current Triton autotuner cache key complete for all source-visible semantic/performance inputs exercised by the merged fixture, or can a target-specific dependency model prevent stale best-config reuse without disabling caching?
- Type: `COMPILER_TOOL / METHOD_ALGORITHM`.
- Falsifier: current cache key already covers target, function, environment, tuning key, configs and IR override, or missing inputs are generic invalidation metadata.

## RQ03 — LLVM NVPTX WMMA generated-test coverage
- Exact carrier: current `llvm/test/CodeGen/NVPTX/wmma.py`.
- Primary RQ: Does the generated WMMA regression fixture cover the target-feature/type/layout combinations needed to make a fixed NVPTX lowering-support decision, or can a finite coverage construction change that decision without adding unsupported semantics?
- Type: `BENCHMARK_DATASET / REPLICATION_NEGATIVE`.
- Falsifier: generator already enumerates the current support matrix, or remaining gaps are simple test expansion.

## RQ04 — MLIR GPU barrier-elimination legality
- Exact carrier: current `mlir/test/Dialect/GPU/barrier-elimination.mlir`.
- Primary RQ: Can the exact barrier-elimination fixture define a target-specific dependence certificate that removes additional barriers while preserving GPU workgroup memory semantics beyond the current pass?
- Type: `COMPILER_TOOL / THEORY_FORMAL`.
- Falsifier: current pass already uses equivalent dependence reasoning, or the residual requires unbounded alias/control analysis or changes memory semantics.

All four RQs were frozen before the final eight current/contrary calls; no alternatives or backfill are allowed.
