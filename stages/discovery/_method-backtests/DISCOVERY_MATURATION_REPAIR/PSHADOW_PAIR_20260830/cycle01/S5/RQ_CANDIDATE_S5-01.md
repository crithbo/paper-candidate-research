# S5-01 RQ candidate

Primary RQ: For one fixed LMCache/vLLM CPU-tier KV-cache configuration, can a reuse-distance-aware admission/eviction policy change the configured CPU-residency decision while preserving KV semantics and accounting for PCIe transfer plus TTFT cost?

Exact anchor: LMCache `dev` CPU-offload quickstart/source. Immutable boundary: same vLLM KV semantics; no change of model, request correctness, or denominator. Primary route: official documentation and current repository source. Fallback: none. Status: `RQ_READY_FOR_ORDINARY_CLOSURE`.
