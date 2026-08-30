# Source123 S5 source-call ledger

- Assignment: `DISCOVERY-S5-20260830-SOURCE123`
- Calls: `24/24`; search 4; open/find 20
- Build/experiment/download/backfill: `0`

| Call | Role | Target | Result | Use |
|---:|---|---|---|---|
| 1 | ANCHOR/CURRENT | vLLM V1 `scheduler.py` | OPENED | Active-set scheduler carrier. |
| 2 | CURRENT | vLLM `config/scheduler.py` | OPENED | Public scheduler caps/policies. |
| 3 | CURRENT | vLLM optimization/tuning docs | OPENED | Preemption and chunked-prefill guidance. |
| 4 | CURRENT | vLLM automatic prefix caching docs | OPENED | Prefix-cache official locus. |
| 5 | CURRENT | vLLM `sampling_params.py` | OPENED | Declared generation cap locus. |
| 6 | CANONICAL | vLLM `benchmarks/serve.py` | OPENED | Serving benchmark carrier. |
| 7 | CONTRARY | SGLang `schedule_policy.py` | OPENED | Prefix/output ordering union. |
| 8 | CONTRARY | SGLang `scheduler.py` | OPENED | Current SGLang scheduler carrier. |
| 9 | ESCAPE | TensorRT-LLM repository | OPENED | Alternate runtime union. |
| 10 | NATURAL | Mooncake FAST25 traces directory | OPENED | Trace family identity. |
| 11 | CURRENT DEEP | find `preempt` in vLLM scheduler | OPENED | `allocate_slots` failure → victim selection → `_preempt_request`. |
| 12 | CURRENT DEEP | find `max_num_batched_tokens` in config | OPENED | Caps, chunking, FCFS/priority, custom scheduler surface. |
| 13 | CURRENT DEEP | find `preemption` in official docs | OPENED | RECOMPUTE behavior and tuning recommendations. |
| 14 | CURRENT DEEP | find `cache blocks` in prefix docs | NO_MATCH_TRANSPORT | Counted; no inference. |
| 15 | CONTRARY SEARCH | arXiv preemption/admission query | SEARCHED | TOPAS and related primary works. |
| 16 | CONTRARY SEARCH | arXiv prefix-aware single-GPU query | SEARCHED | Preble and related works. |
| 17 | CONTRARY SEARCH | USENIX preemption/chunked-prefill query | SEARCHED | Sarathi/FastServe/Mooncake. |
| 18 | CONTRARY SEARCH | ACM output-length/admission query | SEARCHED | No exact fatal surfaced in result set. |
| 19 | CONTRARY DEEP | TOPAS arXiv:2608.25523 | OPENED | Prefix residency + ready-request admission under shared memory. |
| 20 | CONTRARY DEEP | Sarathi-Serve OSDI 2024 | OPENED | Chunked prefill/stall-free batching. |
| 21 | CONTRARY DEEP | Preble arXiv:2407.00023 | OPENED | Distributed prefix-aware E2 + local scheduling. |
| 22 | CONTRARY DEEP | FastServe NSDI 2026 | OPENED | Token-level preemptive scheduling/offload. |
| 23 | CURRENT DEEP | find `max_tokens` in vLLM sampling params | OPENED | Finite request-visible cap available; `None` remains possible. |
| 24 | CURRENT DEEP | find `lpm` in SGLang policy | OPENED | LPM, DFS-weight, FCFS, LOF, random, routing-key policies. |

## Decisive primary loci

- `https://github.com/vllm-project/vllm/blob/main/vllm/v1/core/sched/scheduler.py`
- `https://github.com/vllm-project/vllm/blob/main/vllm/config/scheduler.py`
- `https://docs.vllm.ai/en/latest/configuration/optimization/`
- `https://github.com/vllm-project/vllm/blob/main/vllm/sampling_params.py`
- `https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/managers/schedule_policy.py`
- `https://arxiv.org/abs/2608.25523`
- `https://www.usenix.org/conference/osdi24/presentation/agrawal`
- `https://arxiv.org/pdf/2407.00023`
- `https://www.usenix.org/conference/nsdi26/presentation/wu-bingyang`

Current repository identities are `main` retrieved 2026-08-30; Stage 0 must pin commits.

