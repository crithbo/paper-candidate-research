# Source109 S4 Divergence Seed Pool

所有行均在 lookup 前按 `PREDECESSOR_IDENTITY_DENYLIST.yaml` 检查。

| Seed | Offline sketch | denylist_check | Result before lookup |
|---|---|---|---|
| S4-109-01 | TensorRT-LLM versioned benchmark claim: plugin configuration changes cold-to-steady SLO ranking | DISTINCT | retain |
| S4-109-02 | TGI exact benchmark claim replication with warm/cold boundary | DISTINCT | retain |
| S4-109-03 | TensorRT-LLM inflight batching metric repackaging | RELATED_ONLY? action/endpoint not fixed | do not select |
| S4-109-04 | ORT GenAI benchmark first-vs-steady | RELATED_ONLY to Source108 generic first/steady; no discriminator | do not select |
| S4-109-05 | TGI benchmark result release/config drift negative replication | DISTINCT | retain |
| S4-109-06 | TensorRT-LLM KV/prefix policy | EXACT_OR_CONTAINS vLLM/SGLang lifecycle family | exclude |
| S4-109-07 | TensorRT-LLM plugin semantic validation benchmark | DISTINCT | retain |
| S4-109-08 | llama.cpp CUDA FA/all-quants warning | EXACT_OR_CONTAINS | exclude |
| S4-109-09 | generic goodput/energy | EXACT_OR_CONTAINS | exclude |
| S4-109-10 | TGI router/cache behavior | RELATED_ONLY; no frozen endpoint | do not select |
| S4-109-11 | ONNX Runtime I/O binding host transfer | RELATED_ONLY to S2, outside S4 assignment action | backlog |
| S4-109-12 | TensorRT-LLM published benchmark artifact/result mismatch | DISTINCT | retain |

Selected RQ candidates before lookup: S4-109-01→RQ01, S4-109-02→RQ02, S4-109-05→RQ03, S4-109-07→RQ04, S4-109-12→RQ05. No excluded row is replaced in this assignment.
