# Source113 S5 Serving Trace Closure

## RQ01 — versioned serving-trace characterization

- Exact public carrier: BurstGPT Release v2.0, public Azure serving trace; schema has `Timestamp` (seconds from first-day midnight), `Session ID`, `Elapsed time` (submit-to-final-response, explicitly not TTFT), model and token fields.
- Candidate object/action/endpoint: use a trace with explicit session/arrival semantics to characterize a scheduling/cache decision endpoint.
- Contrary/current: LLMServingSim JSONL has explicit `arrival_time_ns`, `input_tok_ids`, `session_id` and dependencies, but it is a simulator workload schema rather than an observed serving trace; ShareGPT lacks per-request timestamps and needs synthesized arrivals.
- Full-cost boundary: request arrival, parent dependency wait, prompt/prefix token identity, prefill/decode token count, cache lookup/eviction/recompute, queue delay, TTFT/ITL and total elapsed time. BurstGPT alone lacks prefix token IDs and TTFT.
- Finite stop: no one frozen public carrier jointly supplies observed arrival, session/prefix linkage, cache event and decision endpoint.
- Disposition: `PRE_RQ_NONADMISSION__CARRIER_FIELD_BUNDLE_UNCLOSED`.

## RQ01 current-union/same-object check

- Cache-aware agent scheduling is already directly represented by session-aware serving work and trace-driven simulators; without a different trace-carrier field bundle or estimand, any admission/scheduling proposal would be generic session/KV policy.
- This is not a global absence or scientific STOP. No trace was downloaded or replayed.

## Funnel

`offline_seed=4; valid_RQ=1; pre_RQ_nonadmission=1; raw=0; deep=0; clean_brief=0`.

`COMPLETE_ZERO_PROPOSALS__TRACE_SCHEMA_FIELD_BUNDLE_NOT_FROZEN`.
