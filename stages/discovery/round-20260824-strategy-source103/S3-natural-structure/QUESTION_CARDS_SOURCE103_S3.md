# Source103 S3 Research Question Cards

These cards are screening artifacts, not Stage 0 briefs. They record the post-anchor disposition for every selected locator and preserve bounded-open versus structural reasons separately.

## `S3-103-QC01` — prefix-topology metadata/layout

- RQ candidate: `S3-103-RQ01`
- Exact public identity: vLLM current `v1/core/block_pool.py`; comparison source: SGLang RadixAttention documentation; public carrier candidate: TraceLab v0.0.1.
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY` for the native representation; a natural replay carrier is not yet closed.
- Same-object contract: vLLM native prefix-cache block sharing and copy-on-write semantics.
- Claim endpoint: target-native metadata/layout action.
- Current-source locus: [vLLM BlockPool](https://github.com/vllm-project/vllm/blob/main/vllm/v1/core/block_pool.py) exposes hash-to-block cache entries, full-block caching, reference-counted allocation, eviction, and private-block hash movement.
- Strongest skeptic: [SGLang RadixAttention](https://sgl-project-sglang-93.mintlify.app/concepts/radix-attention) already supplies a radix-tree representation with prefix matching, insertion/splitting, and reference-count protection.
- Minimum falsifier: current vLLM or a fair native configuration already expresses the frozen action, or no public carrier contains token-level prefix data.
- Bounded closure debt: `OPEN_BOUNDED` — TraceLab publishes timing/prefix accounting but its published sanitized row specification only exposes token counts/cache-prefix split and redacts sensitive input fields; no named public, replayable token-level natural carrier has been established.
- Front-end disposition: `LOCATOR_ONLY`
- Reason in plain Chinese: 当前实现与相邻系统足以否定泛化“树/引用计数”动作，但尚未冻结一个不被吸收的 vLLM 特有原子动作；自然 token-level carrier 也未闭合。因此进入 backlog，而非科学 STOP。
- Eligible for C0: `NO`

## `S3-103-QC02` — lifetime/ownership/reclamation

- RQ candidate: `S3-103-RQ02`
- Exact public identity: vLLM current BlockPool and SGLang RadixCache ownership paths.
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY`
- Same-object contract: native KV block allocation, sharing, reference counts, cache eviction, and copy-on-write-safe hash movement.
- Claim endpoint: target-native ownership/reclamation representation.
- Current-source locus: [vLLM BlockPool](https://github.com/vllm-project/vllm/blob/main/vllm/v1/core/block_pool.py), including `move_block_hashes`, `get_new_blocks`, hash removal, eviction, and block reference count updates.
- Known direct-fatal check at this locus: `FOUND` for the generic pre-evidence action class.
- Minimum falsifier: source-level presence of exact lifecycle operations; satisfied.
- Bounded closure debt: `NOT_APPLICABLE` — no non-generic residual was frozen before the direct-current check.
- Front-end disposition: `EXCLUDED_BEFORE_RAW`
- Reason in plain Chinese: 候选只是“用自然寿命改进 ownership/reclamation 表示”的泛化表述；当前 vLLM/SGLang 已实现该生命周期动作族，未留下同对象的原子残余。
- Eligible for C0: `NO`

## `S3-103-QC03` — shape-sequence compilation/memory-plan artifact

- RQ candidate: `S3-103-RQ03`
- Exact public identity: vLLM V1 compilation and CUDA-graph execution path.
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY`
- Same-object contract: same vLLM serving graph, dynamic batch semantics, CUDA-graph/Inductor configuration, and fallback behavior.
- Claim endpoint: compiler/memory-plan artifact.
- Current-source locus: [vLLM compilation configuration](https://github.com/vllm-project/vllm/blob/main/vllm/config/compilation.py), [vLLM torch.compile design](https://github.com/vllm-project/vllm/blob/main/docs/design/torch_compile.md), and [vLLM CUDA-graph design](https://github.com/vllm-project/vllm/blob/main/docs/design/cuda_graphs.md).
- Strongest skeptic: [LAPS](https://arxiv.org/abs/2601.11589) gives a length-aware prefill/CUDA-graph route; [Foundry](https://arxiv.org/abs/2604.06664) addresses context materialization for CUDA-graph cold start.
- Known direct-fatal check at this locus: `FOUND` for the unfrozen action class of recurring-shape capture/cache selection.
- Minimum falsifier: current compilation/capture configuration already supplies dynamic-shape, range/static-size, or capture-size routes; satisfied.
- Bounded closure debt: `NOT_APPLICABLE` — no target-specific compiler transformation or guarantee remains after subtraction.
- Front-end disposition: `EXCLUDED_BEFORE_RAW`
- Reason in plain Chinese: seed 没有定义超出当前 vLLM 动态 shape、compile range 与 CUDA-graph capture 的原子动作；再以自然长度分布包装会退化为参数/selector。
- Eligible for C0: `NO`

## `S3-103-QC04` — prefix-cache benchmark validity

- RQ candidate: `S3-103-RQ04`
- Exact public identity: TraceLab public coding-agent trace/analysis release and UniCache heterogeneous-prefix-cache evaluation.
- Carrier kind: `NATURAL`
- Same-object contract: coding-agent serving prefix-cache accounting and a decision-changing workload evaluation endpoint.
- Claim endpoint: benchmark validity or measurement conclusion.
- Current-source locus: [TraceLab paper](https://arxiv.org/abs/2606.30560), [TraceLab public repository](https://github.com/uw-syfi/TraceLab), and [TraceLab cache-hit experiment](https://tracelab.cs.washington.edu/exp/prefix_cache/cache_hit_ratio/).
- Strongest skeptic: [UniCache](https://jxing.me/pdf/unicache-sigmetrics26.pdf) already measures task-dependent inter-turn reuse distributions, structural reuse, cache hit ratio, and queued TTFT; it states when trace construction must pair content with timestamps.
- Known direct-fatal check at this locus: `FOUND` for the unfrozen broad endpoint “a workload/benchmark misses natural reuse structure.”
- Minimum falsifier: existing public benchmark/trace already exposes the targeted structure and conclusion; satisfied.
- Bounded closure debt: `NOT_APPLICABLE` — no new estimand, coverage rule, or conclusion-changing held-out test was frozen.
- Front-end disposition: `EXCLUDED_BEFORE_RAW`
- Reason in plain Chinese: TraceLab 已公开真实 coding-agent trace、cache hit/idle gap 分析与 replay tooling；UniCache 已研究异构前缀复用和时间建模。当前 seed 只会重复已有测量对象。
- Eligible for C0: `NO`
