# Source120 S2 carrier-first audit

| Carrier | Exact fields closed | RQ disposition |
|---|---|---|
| Mooncake FAST25 conversation/tool-agent JSONL | arrival ms, input/output lengths, ordered 512-token prefix hash IDs | Deep reviewed; same scheduling endpoint directly covered by Mooncake and later prefix-state schedulers |
| BurstGPT v2 | timestamp, session ID, elapsed time, request/response tokens, model/log type | No exact prefix-block identity or service-phase timing; locator only |
| Vidur current repository | trace arrivals/lengths, scheduler configuration and latency metrics | Stable carrier lacks current prefix-cache semantics; canary dependence and A100 profiles prevent fixed single-4070 object |
| vLLM bench serve | client latency/token metrics and request datasets | No native prefix-block identity or KV-residency trace in the frozen output contract |
| SGLang benchmark output | serving metrics and current radix-cache implementation | No frozen versioned trace panel with all carrier fields in this bounded route |
| Azure trace | arrivals and token lengths | Prefix/session identity incomplete for the frozen decision |
| LMSYS-Chat-1M | conversation content/turns | No deployment arrival or cache-residency timestamps |
| ShareGPT derivatives | request lengths in simulator-specific derivatives | Identity and arrival semantics depend on derivation, not one canonical carrier |
| InferBench/other serving panels | fixed request panels | Exact current prefix identity not closed |
| MLPerf server scenario logs | query timing and latency constraints | No prefix/session reuse identity |

No result-aware carrier replacement or backfill occurred.

