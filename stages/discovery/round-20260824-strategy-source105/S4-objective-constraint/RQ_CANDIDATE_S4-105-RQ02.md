# Discovery Research Question Candidate

- RQ ID: `S4-105-RQ02`; seed: `S4-105-03`.
- Exact anchor: MLPerf Inference Rules (`mlcommons/inference_policies`), current public rules retrieved 2026-08-24.
- Stable object: one named MLPerf LLM benchmark/scenario, official LoadGen semantics, quality and latency contract.
- Primary RQ: 在一个冻结 MLPerf LLM scenario 中，是否存在官方 scenario/metric 未表达、却能通过公开 reference carrier 改变 accelerator mapping/deployment ranking 的 benchmark-validity action？
- Candidate type: `BENCHMARK_DATASET` / `MEASUREMENT_CHARACTERIZATION`.
- Earliest falsifier: official rules/reference implementation already close the same query/scenario/quality/latency action.
- Primary route: rules + reference implementation + named benchmark artifact.
- Frozen no-reformulation: 不把规则解释或结果 dashboard 当论文。
- Pre-RQ packet: official rules close scenario, query, quality, latency, SUT and reproducibility semantics; result `EARLY_FATAL` for the frozen generic benchmark-validity action.
