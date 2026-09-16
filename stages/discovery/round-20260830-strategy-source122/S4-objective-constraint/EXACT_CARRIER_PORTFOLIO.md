# Source122 S4 Exact Public Carrier Portfolio

Frozen before RQ convergence and targeted source results. Excluded families: MLPerf inferred-ranking and LeRobot AoI.

| ID | Exact carrier candidate | Endpoint candidate |
|---|---|---|
| C01 | vLLM `benchmark_serving.py` result JSON and goodput SLO CLI | TTFT/TPOT/E2EL goodput validity |
| C02 | SGLang `bench_serving.py` result JSON | cross-harness SLO metric conformance |
| C03 | NVIDIA GenAI-Perf OpenAI endpoint measurements | standardized serving latency/throughput baseline |
| C04 | llama.cpp SPEED-Bench result JSON | already-running single-GPU server latency/throughput |
| C05 | MLPerf Server LoadGen logs | canonical Poisson/SLO comparator |
| C06 | MLPerf Endpoints characterization | fixed-operating-point versus curve coverage |
| C07 | vLLM profiler/production metrics endpoint | benchmark-to-runtime metric consistency |
| C08 | SGLang request-rate/burstiness fixtures | arrival-process sensitivity of SLO ranking |

No evidence, novelty or absence claim is made. No result-aware carrier replacement is allowed.
