# Source120 S2 exact-carrier portfolio

Frozen before the first source call. These are locator candidates, not evidence or novelty claims.

| Order | Exact carrier candidate | Required fields | Fixed decision class |
|---:|---|---|---|
| 1 | Vidur simulator current release workloads/config | arrivals, prompt/output lengths, scheduler config, memory model | admission/batch scheduling |
| 2 | BurstGPT public trace | timestamps, token lengths, model/request class | queue admission under KV capacity |
| 3 | Mooncake public traces | session/prefix/cache events and timestamps | cache placement/admission |
| 4 | vLLM benchmark serving JSON output | request timing/token/SLO and scheduler settings | queue-memory policy ranking |
| 5 | SGLang benchmark trace/output | request timing and radix-cache statistics | cache-aware admission |
| 6 | Azure LLM inference trace | arrival and token-length fields | reservation/admission |
| 7 | LMSYS-Chat-1M conversation data | session turns and prompt length derivation | session retention |
| 8 | ShareGPT trace derivatives used by current simulators | arrival/token/session fields | scheduling comparison |
| 9 | InferBench/LLM serving canonical workload | fixed request panel and SLO | benchmark validity/ranking |
| 10 | MLPerf Inference server scenario logs | arrival/query/sample timing and latency constraints | SLO admission/queueing |

Precommitted closure order is 1 through 10. No result-aware replacement or backfill.
