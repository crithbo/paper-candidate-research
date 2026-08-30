# Discovery Research Question Candidate

- RQ ID: `S4-107-RQ01`; seed: `S4-107-01`.
- Anchor: vLLM current optimization/startup documentation.
- Primary RQ: compile-cache reuse and fixed KV allocation是否仍留下不同于当前 `VLLM_CACHE_ROOT`、`VLLM_FORCE_AOT_LOAD`、`--kv-cache-memory` 的同对象 readiness/steady-state decision action？
- Earliest falsifier: current documentation already expresses cache validity, explicit allocation and their startup/throughput tradeoff.
- Pre-RQ result: `EARLY_FATAL` for frozen generic cache/readiness action.

## Closure audit

- Exact object/action/claim endpoint: vLLM V1 on one unchanged model/config/hardware; reuse compile artifacts and optionally pass the logged KV allocation to alter repeated-boot readiness versus steady decode/concurrency.
- Current source locus and version/date: `https://docs.vllm.ai/en/latest/configuration/optimization/`, “Optimization and Tuning”, accessed 2026-08-24 (`latest`, current documentation).
- Direct coverage mapping: `VLLM_CACHE_ROOT` persists compile artifacts; `VLLM_FORCE_AOT_LOAD=1` makes cache misses fail; `--kv-cache-memory` reproduces allocation and skips profiling/CUDA-graph estimation; `--enforce-eager` explicitly trades fastest startup for steady decode performance.
- Contrary evidence: same page states a conservative fixed KV value caps batch concurrency and an optimistic value fails allocation; therefore the proposed cold/steady tradeoff is not an uncharged residual.
- Full-cost boundary: model/config/GPU cache validity, compilation, CUDA-graph estimation, memory profiling, KV allocation and batch concurrency; no system installation, external artifact transfer or claim experiment included.
- Query/stop boundary: one official current tuning page plus its named runtime controls; stop when all proposed actions and their stated tradeoffs are natively expressed. Result: `EARLY_FATAL` for this exact action, not a global absence claim.
