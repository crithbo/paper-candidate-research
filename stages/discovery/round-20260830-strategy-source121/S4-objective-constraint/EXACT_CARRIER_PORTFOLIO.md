# Source121 S4 Exact Carrier Portfolio

Frozen before RQ convergence and source results. Excluded identity: `MLPERF-INFERRED-RANK-VALIDITY`.

| ID | Exact carrier candidate | Endpoint candidate |
|---|---|---|
| C01 | MLPerf Power analyzer/power logs and audit rules | energy-per-stream validity under time-window alignment |
| C02 | MLPerf Tiny energy runner logs | energy ranking validity under interface/board measurement boundary |
| C03 | MLPerf Mobile app/model initialization metrics | cold-start coverage and ranking |
| C04 | TensorFlow Lite benchmark_model initialization/warmup reports | cold-versus-steady backend ranking |
| C05 | ExecuTorch Inspector/ETRecord profiling artifacts | delegate initialization and runtime attribution |
| C06 | ONNX Runtime profiling JSON and EP partition events | SLO attribution across fallback boundaries |
| C07 | IREE Tracy/benchmark suite artifacts | compile/load/dispatch full-cost ranking |
| C08 | llvm-mca instruction-region and scheduling-model fixtures | bounded resource-scheduling guarantee |

No evidence, novelty or absence claim is made. No result-aware replacement is allowed.
