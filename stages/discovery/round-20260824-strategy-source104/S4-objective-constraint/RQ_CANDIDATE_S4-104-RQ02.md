# Discovery Research Question Candidate

- RQ candidate ID: `S4-104-RQ02`
- Seed / lane: `S4-104-03` / `DISCOVERY_S4`
- Exact public anchor: vLLM `Benchmark CLI` current documentation, located 2026-08-24.
- Stable object/guarantee: one native online-serving benchmark with finite request-rate/ramp/backpressure configuration and unchanged output protocol.
- Primary RQ: 在同一 native ramp/trace carrier 中，是否存在一个不由当前 request-rate、burstiness、max-concurrency、ramp 参数已经表达的 SLO-cliff measurement action？
- Scope: public single-GPU serving protocol; excludes generic goodput and arbitrary p99 plot changes.
- Contribution hypothesis: `MEASUREMENT_CHARACTERIZATION`.
- Earliest falsifier: native CLI already provides the proposed arrival/backpressure/SLA condition and reports the same decision boundary.
- Strong null: current load-pattern and SLA-validation surfaces already cover the configuration decision.
- Primary route: official Benchmark CLI + current benchmark source; fallback: tagged docs.
- Frozen outcome-aware rule: no residual means no conversion into generic load-testing guidance.
- Pre-RQ packet: current official CLI already expresses request-rate, burstiness, max-concurrency, ramp and SLA-validation uses; result `EARLY_FATAL` for the frozen load/SLO measurement action.
- Disposition: `EXCLUDED_AFTER_PRE_RQ_CLOSURE__CURRENT_NATIVE_BENCHMARK_COVERAGE`.
