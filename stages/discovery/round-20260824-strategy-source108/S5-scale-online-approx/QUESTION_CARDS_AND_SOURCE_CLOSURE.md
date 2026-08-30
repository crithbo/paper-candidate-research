# Source108 S5 Auditable Closure

All fields below were frozen from seed/RQ before lookup. A4, CRFEPOCH and group-repository inputs were not read; no resource action occurred.

| RQ | Exact public version/locus | Frozen object/action/endpoint | Contrary/current evidence and full-cost boundary | Stop / disposition |
|---|---|---|---|---|
| RQ01 | vLLM latest metrics docs `https://docs.vllm.ai/en/latest/design/metrics/` (observed 2026-08-24) | vLLM session/KV carrier; cold/warm decision function | docs expose KV usage, prefix queries/hits, TTFT and inter-token latency, but no defined cold/warm session event; full cost would require load/session/KV allocation/eviction/recompute/TTFT | no event/threshold → `LOCATOR_ONLY` |
| RQ02 | SGLang `main` session radix cache docs `docs/docs/advanced_features/session_radix_cache.mdx` (observed 2026-08-24) | session leaf reference/eviction claim; negative replication endpoint | current docs define registration, soft protection, close, device/host eviction order and reference semantics; action is current carrier behavior, not a distinct negative claim | direct current union → `EXCLUDED_BEFORE_RAW` |
| RQ03 | PyTorch 2.13 compile caching tutorial `torch_compile_caching_tutorial.html` | save/load artifact cold/warm break-even | cache artifacts validate same PyTorch/Triton/GPU and populate FXGraph/Triton/Inductor/PGO/autotune caches; full cost includes capture/compile/save/load/artifact storage/execute | artifact conditions specify carrier; no new estimator/action → `EXCLUDED_BEFORE_RAW` |
| RQ04 | vLLM latest metrics docs | prefix-hit metric versus TTFT validity | docs distinguish server counters from request histograms and expose prefix hit counters plus TTFT; metric semantics do not define causal cold/warm endpoint. Full cost must include prompt mix, cache capacity, recompute and request latency | dashboard/metric semantics only → `LOCATOR_ONLY` |
| RQ05 | no canonical versioned single-GPU workload carrier frozen | workload-composition ranking reversal | no named workload, cost denominator or held-out decision function; contrary literature already offers workload-aware KV benchmarks but does not instantiate this RQ’s carrier | finite carrier not frozen → `LOCATOR_ONLY` |

Search boundary: official vLLM/SGLang/PyTorch docs plus one workload-aware KV benchmark query; stopped when current action/metric semantics closed RQ or no exact carrier existed. No `NO_MATCH` is interpreted as absence or novelty.

Funnel: seeds `6`; RQs `5`; raw/deep/brief `0/0/0`; current-union exclusion `2`; locator-only `3`.

`COMPLETE_ZERO_PROPOSALS__TWO_CURRENT_UNION__THREE_UNFROZEN_MEASUREMENT_LOCATORS`.

## MAINLINE protocol disposition

`COMPLETE__ZERO_ADMISSIBLE_OUTPUT__PROTOCOL_NONCOMPLIANT_EXACT_REPEAT`.

After mainline comparison against predecessor identity holds, all five frozen RQs
are exact-or-contains repeats and are removed from this assignment's valid
selected/raw/deep/brief denominators:

- RQ01 and RQ04 repeat Source107 S5's vLLM metrics cold/warm/prefix-hit carrier;
- RQ02 repeats Source107 S5's SGLang session-radix carrier;
- RQ03 repeats Source107 S2/S6's PyTorch compile-cache artifact carrier;
- RQ05 repeats Source107 S5's unresolved workload/decision endpoint.

This is a protocol disposition only. It does not create a STOP, an absence
claim, a scientific negative conclusion, a new topic, or a replacement RQ.
No resources were acquired or produced.
