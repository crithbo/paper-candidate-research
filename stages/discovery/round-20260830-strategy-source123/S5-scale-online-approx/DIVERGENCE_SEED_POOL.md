# Source123 S5 divergence seed pool

## Metadata

- Assignment: `DISCOVERY-S5-20260830-SOURCE123`
- Topic: `SOURCE123-PORTFOLIO-S5`
- Generated before every Source123 S5 external call: `YES`
- Seeds: `10/12`
- Model route: temporary `gpt-5.6-sol/high`
- Network-security exclusion: `PASS`
- All rows are `SEED_NON_EVIDENCE`; no novelty, absence, Q2, or feasibility claim.

## Frozen seeds

| ID | Exact carrier candidate | S5 opportunity sketch | Bounded online action | Main collapse risk |
|---|---|---|---|---|
| S5-123-01 | vLLM V1 Scheduler + prefix caching + serving benchmark | Current active-set scheduling may allocate KV incrementally and preempt by recomputation after allocation failure; future decode growth and shared-prefix blocks can instead be reserved at admission. | Admit a request/prefill chunk only if a prefix-refcount-aware future-KV reservation remains feasible; release reservation as tokens complete. | Ordinary admission control or current scheduler already reserves future blocks. |
| S5-123-02 | vLLM chunked prefill | Prefill chunks consume compute now but also create future decode state; fixed chunk/token caps may shift cost to preemption. | Jointly select waiting requests and prefill chunk sizes under compute and future-KV budgets. | Sarathi/DistServe or current chunked-prefill scheduler directly absorbs it. |
| S5-123-03 | vLLM prefix caching | Shared immutable prefix blocks reduce marginal reservation, but later private decode growth differs per sequence. | Charge shared prefix blocks once and reserve only marginal private growth. | Ordinary cache replacement/prefix-aware queue ordering. |
| S5-123-04 | SGLang RadixAttention/LPM scheduling | Longest-prefix-match ordering may improve reuse but over-admit sequences with large future growth. | Prefix-benefit versus reserved-growth admission on a radix tree. | Preble/SGLang policy already models the exact tradeoff. |
| S5-123-05 | TensorRT-LLM inflight batching/KV cache manager | Capacity scheduling may expose a different preemption/eviction contract. | Cross-check same active-set reservation action. | Cross-runtime API comparison without a contribution. |
| S5-123-06 | Mooncake conversation trace | Timestamp, lengths, and prefix hashes can drive trace-faithful active-set memory replay. | Canonical trace panel for admission/full-cost, not cache ranking. | Trace omits declared `max_tokens` or runtime costs. |
| S5-123-07 | Mooncake tool-agent trace | Agent turns may create burstier prefix trees and output-growth uncertainty. | Robust reservation under exact request caps. | Application-only extension or no natural cap field. |
| S5-123-08 | vLLM recompute preemption | Recompute discards generated KV and reprefills later, creating measurable debt. | Minimize reserved-block opportunity cost plus expected recompute debt. | Generic priority formula or current recompute-aware policy. |
| S5-123-09 | public ShareGPT serving benchmark | Output lengths provide a canonical offline oracle for future growth. | Compare online policy using declared caps with clairvoyant output-length oracle. | Benchmark convention leaks future result into online input. |
| S5-123-10 | session resume/prefix reuse | Paused sessions compete with new requests for active-set memory. | Reserve resume-critical private suffix separately from reusable prefix. | Ordinary inactive-cache replacement, explicitly out of scope. |

## Frozen convergence

- Primary seed: `S5-123-01`.
- Primary RQ: In a single-GPU PagedAttention continuous-batching runtime, can a prefix-tree-aware online admission and prefill-chunk policy reserve each admitted request's future private KV growth—using only its declared generation cap, current prefix-block ownership, and current occupancy—so that KV-capacity recompute preemption is eliminated for admitted requests while improving full-cost throughput/latency over current preempt-on-allocation-failure, fixed-cap, and prefix-order baselines?
- Contribution hypothesis: `SYSTEM_ARCHITECTURE / METHOD_ALGORITHM`, route `N2`.
- Exact object: active running/waiting request admission and future-KV reservation; not inactive cache replacement, ordinary eviction, TorchDynamo, distributed routing, or model approximation.
- Immutable semantics: identical generated token semantics, scheduler priority contract when tied, and declared request caps; no truncation or quality change.
- Target-specific discriminator: immutable prefix blocks are shared/refcounted while each admitted sequence grows private KV blocks online; the action couples a prefix tree, PagedAttention block granularity, prefill compute budget, and hard future-growth feasibility.
- Minimum falsifier: current vLLM/SGLang already reserves exact future private growth with prefix-aware accounting; or reservation reduces to a static `max_num_seqs/max_num_batched_tokens` setting; or strongest scheduling papers directly implement the same object/action/guarantee.
- Precommitted null: simple worst-case reservation or tuned current caps match the proposed policy after throughput, TTFT/ITL, guard/queue overhead, stranded reservation, and recompute cost are all charged.
- Selective-depth nomination: `NONE`.

