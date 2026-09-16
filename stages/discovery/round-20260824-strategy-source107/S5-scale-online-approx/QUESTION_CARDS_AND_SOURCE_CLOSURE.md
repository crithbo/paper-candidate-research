# Source107 S5 Source Closure

- CRFEPOCH Stage 0 outputs/chat and group repository: `NOT_READ`.
- Current sources: vLLM hybrid KV cache manager/config/metrics; SGLang session-aware radix cache; PyTorch `torch.compile` docs; current MoE routing/residency literature.

| RQ | Disposition | Closure basis |
|---|---|---|
| RQ01 | `EXCLUDED_BEFORE_RAW` | vLLM already manages per-group allocation/prefix caching and exposes cache configuration/retention surfaces; frozen action is generic cache lifecycle. |
| RQ02 | `EXCLUDED_BEFORE_RAW` | SGLang UnifiedRadixCache already registers session leaves, manages references and evicts them with session-aware policy. |
| RQ03 | `EXCLUDED_BEFORE_RAW` | torch.compile already caches multiple compiled results per code object and handles guard failure/dynamic shapes with recompile limits. |
| RQ04 | `EXCLUDED_BEFORE_RAW` | current MoE work covers online routing and dynamic hot-expert residency; no distinct single-GPU native action was frozen. |
| RQ05 | `LOCATOR_ONLY` | metrics exist but no fixed cold/warm event, complete cost denominator and held-out decision threshold were frozen. |

| Funnel unit | Count |
|---|---:|
| Offline seeds / RQs / closure | 8 / 5 / 5 |
| Raw / deep / clean brief | 0 / 0 / 0 |
| Excluded / locator only | 4 / 1 |

`COMPLETE_ZERO_PROPOSALS__FOUR_CURRENT_UNION_OR_GENERIC_EARLY_FATAL__ONE_LOCATOR_ONLY_UNFROZEN`.

No resource action occurred; the locator-only item is not STOP evidence.

## Auditable source-closure addendum (MAINLINE completeness repair)

This addendum repairs evidence provenance only. It neither changes an RQ nor
adds a seed, raw row or scientific revision. Queries were frozen as:

1. `site:docs.vllm.ai OR site:github.com/vllm-project/vllm prefix caching session KV cache current`
2. `site:github.com/sgl-project/sglang radix cache session state current`
3. `site:pytorch.org torch.compile dynamic shapes cache guards CUDA graph current`
4. `MoE runtime online expert residency routing current paper`

Search stopped after one exact current carrier locus and one decisive contrary
source per RQ, or after the carrier failed the pre-RQ action/endpoint contract.
No `NO_MATCH` result is interpreted as novelty or current absence.

### RQ01 — vLLM session/KV representation recourse

- Exact identity: `vllm-project/vllm`, `main` commit `b26039b09fc97aa00f095a99eda503b7dad594ec` (GitHub API observed 2026-08-24).
- Current source loci: `docs/design/hybrid_kv_cache_manager.md` describes per-group block allocation and prefix-hit intersection; `vllm/config/cache.py` declares `enable_prefix_caching`, `prefix_match_unit`, block sizing and cache configuration; `vllm/v1/core/kv_cache_manager.py` owns allocation and prefix-cache statistics.
- Frozen action/endpoint: update a session/KV representation under recourse; lower complete recourse cost while preserving fixed session semantics.
- Current/contrary correspondence: the current manager already allocates/cache-manages per KV group and the cache config exposes runtime cache controls. This covers the generic lifecycle action proposed by RQ01; no distinct atomic action was frozen.
- Full-cost initial boundary: block allocation, cache lookup/intersection, eviction/recompute, GPU KV capacity and request latency; metrics must include TTFT and inter-token latency, not cache hit rate alone.
- Minimum falsifier: a source-defined representation update not reducible to allocation/prefix caching, with a finite same-semantics witness.
- Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_CURRENT_UNION`, not a global novelty claim.

### RQ02 — SGLang multi-turn branch/session state

- Exact identity: `sgl-project/sglang`, current `main` documentation locus `docs/docs/advanced_features/session_radix_cache.mdx`, observed 2026-08-24.
- Current source locus: Session-Aware Radix Cache registers reusable leaves by `session_id`; it tracks references, prefers unreferenced KV on eviction, and supplies `/close_session` semantics. The documentation explicitly covers full-attention, sliding-window and Mamba components.
- Frozen action/endpoint: maintain non-generic branch/session state under edits with legal full-cost witness.
- Current/contrary correspondence: this current carrier already implements session reference registration, state retention and session-aware eviction. The RQ’s precommitted action is lifecycle policy, not a distinct branch-state mechanism.
- Full-cost initial boundary: reusable leaf registration/reference tracking, active-session protection, eviction/recompute, device/host cache usage and request latency.
- Minimum falsifier: an atomic update action outside session reference/leaf eviction with a defined branch semantics oracle.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_SESSION_RADIX_UNION`.

### RQ03 — torch.compile dynamic-shape family merge

- Exact identity: PyTorch `torch.compile` documentation version `2.13`; current official locus `https://docs.pytorch.org/docs/stable/generated/torch.compile` observed 2026-08-24.
- Current source/documentation locus: compiled results are cached on the code object; guard failures create additional compiled results up to `torch._dynamo.config.recompile_limit` (default 8); `dynamic=True` attempts dynamic kernels to avoid recompilation, while `dynamic=None` detects dynamism and recompiles more dynamically.
- Frozen action/endpoint: merge online shape families while preserving compiled-graph contract and reducing full compilation/recompile cost.
- Current/contrary correspondence: code-object cache, guards, dynamic-shape tracing and guard-driven recompilation already express the RQ’s proposed mechanism class. No narrower merge action or separate correctness guarantee was frozen.
- Full-cost initial boundary: graph capture, guard evaluation/failure, compile latency, artifact-cache storage/load, eager fallback and subsequent execution latency.
- Minimum falsifier: a target-native shape-family action not expressible as current guard/dynamic tracing/recompile behavior, with finite graph equivalence check.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_COMPILE_CACHE_UNION`.

### RQ04 — MoE expert-state retention

- Exact identity: public MoE runtime/residency family; no single same-object single-GPU carrier/commit was frozen before closure.
- Contrary loci: HetRoute, arXiv `2608.00577`, combines offline expert server/GPU-CPU residency placement with online cost-aware Top-k routing; HCRMap, arXiv `2607.11586`, dynamically promotes, retains, demotes or evicts hot experts under resource pressure.
- Frozen action/endpoint: retain expert state online under sequence shift, fixed output contract and non-generic action.
- Current/contrary correspondence: direct mechanisms already cover adaptive hot-expert residency and online routing. The RQ provided neither a distinct target-native carrier nor a different endpoint/guarantee.
- Full-cost initial boundary: expert load/migration, GPU/CPU residency, routing/communication overhead, routing quality and end-to-end token latency.
- Minimum falsifier: a single public carrier with an atomic state action outside routing/residency promotion/demotion and a same-output or fixed-quality witness.
- Disposition: `EXCLUDED_BEFORE_RAW__DIRECT_MECHANISM_UNION`; this is an action-contract failure, not an absence claim.

### RQ05 — cold/warm session-memory measurement

- Exact identity: no versioned public carrier plus fixed cold/warm event was frozen; vLLM current metrics documentation is only a locator.
- Current locus: `vllm/docs/design/metrics.md` exposes KV usage, prefix-cache queries/hits, prompt/generation token counters, TTFT and inter-token latency. It states legacy CPU swap metrics are no longer relevant in v1.
- Frozen estimand/endpoint: a cold/warm session-memory threshold that changes a deployment decision.
- Contrary evidence: the current metric surface does not define cold/warm session lifecycle, a full load/transfer/recompute denominator, or a held-out decision threshold. Existing metrics alone would produce a dashboard rather than a measurement mechanism.
- Full-cost initial boundary required but not frozen: model/load artifact state, session creation/close, host-device transfer, KV allocation/eviction/recompute, TTFT and inter-token latency.
- Minimum falsifier: one versioned carrier with an explicit cold/warm event, named decision function and held-out threshold.
- Disposition: `LOCATOR_ONLY__ESTIMAND_AND_CARRIER_UNFROZEN`; no scientific STOP or absence inference.
