# Source120 S5 Exact Public Carrier Portfolio

Frozen before Source120 source lookup. These are carrier candidates, not evidence, RQs, or novelty claims.

| ID | Exact public carrier candidate | Required carrier fields before RQ | Intended decision surface |
|---|---|---|---|
| C01 | `microsoft/BurstGPT` public workload trace | arrival timestamp, model/request identity, prompt/output length | online KV reservation/admission |
| C02 | `microsoft/vidur` repository workload/trace inputs | arrival, prompt/output distributions, replica/scheduler inputs | online memory-aware admission |
| C03 | `Mooncake` public trace/workload artifact | session/prefix identity, arrival, KV transfer/cache events | CPU/SSD KV admission/eviction |
| C04 | `lmsys/lmsys-chat-1m` dataset | conversation/session identity, timestamp, prefix reconstructability | session/prefix cache policy |
| C05 | `allenai/WildChat-1M` dataset | conversation ID, timestamp, tokenizable turns | online session-memory policy |
| C06 | `ShareGPT` public conversation corpus | session identity, turn order, timestamp or explicit absence | prefix/session cache policy |
| C07 | `microsoft/LLMCompass` artifact workloads | fixed model/operator graph, memory/latency estimand | online approximation/model-guided planning |
| C08 | `microsoft/GenZ-LLM-Analyzer` artifact | model/system config and memory/latency estimate | online resource planning |
| C09 | `LLMServingSim` public simulator traces | arrivals, lengths, hardware/config, scheduling endpoint | memory-aware serving policy |
| C10 | vLLM current benchmark prefix-sharing/request generator | deterministic request stream, prefix group, lengths | cache admission/eviction benchmark |

Carrier admission requires exact public identity plus enough existing fields to define a fixed online decision and full-cost denominator. Missing fields cause honest carrier abstention; no result-aware replacement is allowed.
