# Source120 S4 Exact Public Carrier Portfolio

Frozen before RQ convergence and before targeted source results. These are carrier candidates, not novelty or quality claims.

| ID | Exact carrier candidate | Frozen object/endpoint candidate | Type hypothesis |
|---|---|---|---|
| C01 | MLPerf Inference LoadGen scenarios and accuracy/performance logs | scenario validity and backend ranking | BENCHMARK_DATASET |
| C02 | MLPerf Tiny benchmark suite and energy submissions | resource-constrained ranking validity | MEASUREMENT_CHARACTERIZATION |
| C03 | ONNX Runtime performance-test models and profiling trace | EP partition/fallback attribution validity | BENCHMARK_DATASET |
| C04 | ExecuTorch bundled benchmark/profiling artifacts | delegate cold/steady cost ranking | MEASUREMENT_CHARACTERIZATION |
| C05 | LLVM llvm-mca scheduling-model tests | bounded resource-scheduling guarantee | THEORY_FORMAL |
| C06 | LLVM MachineScheduler MIR tests | small-DAG schedule optimality/coverage | THEORY_FORMAL |
| C07 | Triton proton/benchmark fixtures | kernel schedule measurement validity | BENCHMARK_DATASET |
| C08 | PRIVATE_TOOLCHAIN benchmark suites and Tracy/profiling artifacts | dispatch ranking under compilation/runtime cost | MEASUREMENT_CHARACTERIZATION |

Precommitted exclusion: carriers without a versioned input family, observable endpoint, or finite current-source route remain carrier-only; no result-aware replacement.
