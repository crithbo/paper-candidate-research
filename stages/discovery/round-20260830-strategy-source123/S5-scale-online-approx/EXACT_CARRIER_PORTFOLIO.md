# Source123 S5 exact carrier portfolio

Frozen before the first source call. URLs/queries are locators, not evidence. No result-aware carrier replacement.

## Exact carriers 1–10

| Order | Role | Frozen primary route | Precommitted question |
|---:|---|---|---|
| 1 | ANCHOR/CURRENT | `https://github.com/vllm-project/vllm/blob/main/vllm/v1/core/sched/scheduler.py` | Does V1 reserve future KV or preempt only after incremental allocation failure? |
| 2 | CURRENT | `https://github.com/vllm-project/vllm/blob/main/vllm/config/scheduler.py` | What token/sequence/preemption policies and caps are public? |
| 3 | CURRENT | `https://docs.vllm.ai/en/latest/configuration/optimization/` | What official tuning guidance exists for preemption, chunked prefill, and KV capacity? |
| 4 | CURRENT | `https://docs.vllm.ai/en/latest/features/automatic_prefix_caching/` | What exact prefix-block semantics and limits apply? |
| 5 | CURRENT | `https://github.com/vllm-project/vllm/blob/main/vllm/sampling_params.py` | Is a declared generation-token upper bound available at admission? |
| 6 | CANONICAL CARRIER | `https://github.com/vllm-project/vllm/blob/main/vllm/benchmarks/serve.py` | What prompt/output-length fields are available without future leakage? |
| 7 | CONTRARY | `https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/managers/schedule_policy.py` | Does current prefix-aware scheduling already couple future KV reservation? |
| 8 | CONTRARY | `https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/managers/scheduler.py` | What active-set memory/preemption actions exist? |
| 9 | ESCAPE | `https://github.com/NVIDIA/TensorRT-LLM` | Does capacity scheduling expose the same guarantee/action? |
| 10 | NATURAL TRACE | `https://github.com/kvcache-ai/Mooncake/tree/main/FAST25-release/traces` | Do traces expose arrival, input/output length, and prefix identity for faithful replay? |

## Frozen calls 11–24

- 11–14: official source/docs follow-ups for vLLM scheduler, KV manager/prefix cache, benchmark schema, and SGLang policy.
- 15–18 fixed primary-paper searches:
  - `site:arxiv.org LLM serving KV cache preemption recompute admission continuous batching`
  - `site:arxiv.org prefix aware scheduling LLM serving single GPU KV cache`
  - `site:usenix.org LLM serving preemptive scheduling chunked prefill KV cache`
  - `site:dl.acm.org LLM inference scheduling output length prediction KV cache admission`
- 19–22: open at most four exact primary papers from those searches addressing the frozen object/action.
- 23–24: official transport-only fallback for already frozen carriers/papers.

## Budget

- Search/open maximum: `24`.
- Network storage/build/experiment: no workspace download, `0 build`, `0 experiment`.
- Result-aware family/carrier backfill: `FORBIDDEN`.
- Stop early on direct fatal, generic collapse, or sufficient source-role closure.

