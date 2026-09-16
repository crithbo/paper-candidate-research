# Discovery Research Question Candidate

- RQ candidate ID: `S4-104-RQ05`
- Seed / lane: `S4-104-11` / `DISCOVERY_S4`
- Exact public anchor: vLLM Benchmark CLI timed-trace replay documentation at `vllm-project/vllm` `main`, located 2026-08-24.
- Stable object/guarantee: native timed-trace replay input, time multiplier, request/output semantics and scheduler path.
- Primary RQ: 对一个版本化公开 timed trace，native time scaling 是否会改变同一 SLO/capacity decision，并且是否存在保持同一 trace semantics 的有限 correction or certificate action？
- Scope: one public trace format and native replay transformation; excludes arbitrary synthetic resampling or generic scheduling.
- Contribution hypothesis: `MEASUREMENT_CHARACTERIZATION`.
- Earliest falsifier: current source documents/scopes the multiplier as a semantics-preserving replay transform or prior work already covers the exact transform/decision pair.
- Strong null: `--timed-trace-sec-multiplier` is only an explicitly declared test-rate knob and cannot support a natural deployment inference.
- Primary route: current Benchmark CLI/source plus the named public Mooncake trace schema; fallback: tag/release source.
- Frozen outcome-aware rule: if trace semantics cannot be preserved, do not replace it with another trace or claim a natural workload result.
- Pre-RQ packet: timed-trace replay and its multiplier are public current options, but the same-object action/estimand and semantics-preserving correction were not frozen; result `UNRESOLVED_BACKLOG`.
- Disposition: `RQ_BACKLOG__SCOPE_OR_ANSWERABILITY_UNCLEAR`.
