# Source109 S5 Closure

Pre-lookup denylist: seeds/RQs 04–06=`EXACT_OR_CONTAINS`, invalid selected and not replaced. RQ01=`DISTINCT`; RQ02–04=`RELATED_ONLY` with distinct-carrier requirement.

| RQ | exact current locus | action/endpoint/full cost | contrary + stop | disposition |
|---|---|---|---|---|
| RQ01 | HF continuous batching architecture, observed 2026-08-24 | paged KV allocation/admission/offload; fixed request semantics; blocks, prefix bookkeeping, cache eviction/recompute, CPU transfer, TTFT | current carrier already exposes allocator, safety-margin admission, prefix sharing, lazy eviction and offload; no distinct action frozen | EXCLUDED_BEFORE_RAW |
| RQ02 | TensorRT-LLM KV cache system/docs, observed 2026-08-24 | manager/reuse/retention; endpoint lower recourse cost; blocks, retention, eviction/offload, latency | current KV manager supports reuse, offload and prioritized eviction; generic lifecycle | EXCLUDED_BEFORE_RAW |
| RQ03 | ONNX Runtime GenAI generate API/config, observed 2026-08-24 | GenAI KV manager/session; endpoint state action; allocated KV length, generation, memory/session costs | current API already owns token-loop and KV management; no distinct action/oracle frozen | LOCATOR_ONLY |
| RQ04 | HF continuous batching docs, observed 2026-08-24 | cold/warm event/decision endpoint required | no fixed event/threshold precommitted; metric/config dashboard insufficient | LOCATOR_ONLY |

Search stopped at one official carrier plus one current contrary source per RQ. No absence or STOP inference. Valid selected=4; raw/deep/brief=0; predecessor exact repeats=3 excluded before lookup.
