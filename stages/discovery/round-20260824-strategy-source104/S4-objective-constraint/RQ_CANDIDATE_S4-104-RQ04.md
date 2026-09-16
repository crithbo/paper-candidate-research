# Discovery Research Question Candidate

- RQ candidate ID: `S4-104-RQ04`
- Seed / lane: `S4-104-06` / `DISCOVERY_S4`
- Exact public anchor: vLLM `benchmark_prefix_caching.py` and Benchmark CLI current documentation.
- Stable object/guarantee: native vLLM prefix-cache benchmark with unchanged cache/action and public workload mode.
- Primary RQ: 在同一 native prefix-cache benchmark object 中，cache reset/warm-up protocol 是否存在不改变 runtime action 但可改变 deployment ranking 的可证伪 measurement residual？
- Scope: benchmark validity only; excludes a new cache policy, lifecycle wrapper or cross-runtime comparison.
- Contribution hypothesis: `BENCHMARK_DATASET` or `MEASUREMENT_CHARACTERIZATION`.
- Earliest falsifier: current supported benchmark/sweep already controls cache carryover/reset under the same public workload and reports the relevant choice.
- Strong null: this is an exact Source103 forbidden generic prefix-cache lifecycle repeat.
- Primary route: official benchmark code/docs and official reset/sweep control; fallback: tagged source release.
- Frozen outcome-aware rule: a direct repeat is excluded, not renamed.
- Pre-RQ packet: current public benchmark source and the Source103 terminal identity both cover the frozen generic prefix-cache lifecycle direction; result `EARLY_FATAL`.
- Disposition: `EXCLUDED_AFTER_PRE_RQ_CLOSURE__TERMINAL_CONTAINS`.
