# Discovery Research Question Candidate

- RQ candidate ID: `S4-104-RQ01`
- Seed / lane: `S4-104-02` / `DISCOVERY_S4`
- Exact public anchor: vLLM `bench startup` documentation and `docs/benchmarking/sweeps.md` on `main`, located 2026-08-24.
- Stable object/guarantee: one versioned vLLM startup benchmark; native cold/warm readiness semantics and same serving configuration.
- Primary RQ: 在同一 vLLM startup object 中，是否存在官方 cold/warm iteration 之外、能改变固定 deployment decision 的可证伪 readiness estimand，而不是另一个启动时间分解？
- Scope: public single-GPU/CPU-first path, same model/config and native readiness; excludes generic JIT profiling and non-vLLM runtimes.
- Contribution hypothesis: `MEASUREMENT_CHARACTERIZATION`.
- Earliest falsifier: current official benchmark/sweep already defines equivalent cold/warm readiness and configuration choice.
- Strong null: startup sweep already varies engine settings and records cold/warm times.
- Primary route: current official CLI doc + sweep documentation/source; fallback: versioned release docs.
- Frozen outcome-aware rule: coverage means no rename to generic startup profiling.
- Pre-RQ packet: current official startup sweep explicitly spans cold/warm iterations and engine-setting combinations; result `EARLY_FATAL` for the frozen readiness-estimator action.
- Disposition: `EXCLUDED_AFTER_PRE_RQ_CLOSURE__CURRENT_NATIVE_BENCHMARK_COVERAGE`.
