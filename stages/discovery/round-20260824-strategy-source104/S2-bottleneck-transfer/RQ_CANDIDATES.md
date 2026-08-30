# Frozen RQ candidates

## `S2-104-RQ01`

- Seed: `S2-104-01`; anchor: version-pinned current vLLM speculative-decoding source/documentation, exact revision to be frozen from first party.
- Primary RQ: For one public vLLM speculative-decoding carrier, can a runtime jointly choose verification granularity and KV reservation to improve request-level full cost (draft, target, verification, KV, queue and E2E) without changing output semantics compared with current native policies?
- Finite closure question: does current vLLM expose a distinct joint action, or does it already express the full construction through current scheduler/speculative/KV controls?
- Primary/fallback source routes: current first-party docs/source; official release documentation if source transport fails.

## `S2-104-RQ02`

- Seed: `S2-104-03`; anchor: version-pinned current TensorRT-LLM speculative-decoding source/documentation.
- Primary RQ: For one public TensorRT-LLM speculative carrier, is there a non-threshold, same-distribution action that selects a no-speculate region based on charged draft, verification, synchronization and memory costs, outperforming its current native control in a fixed full-cost boundary?
- Finite closure question: are the action and guarantee public and distinct from current native speculative controls?
- Primary/fallback source routes: official docs/source; official release notes.

## `S2-104-RQ03`

- Seed: `S2-104-04`; anchor: version-pinned current FlashInfer paged-KV/speculative source/documentation.
- Primary RQ: For one public FlashInfer-backed decode carrier, can a target-native joint paged-KV representation/batching action reduce request-level full cost without becoming a generic kernel selector or existing paged-KV policy?
- Finite closure question: does one public carrier own the representation, batching, legality and full-cost interface?
- Primary/fallback source routes: official documentation/source; pinned release source.

All candidates retain same-object, full-cost, current-union and non-revival gates. No optional alternate RQ is authorized.

## Source-closure results

- `S2-104-RQ01`: `EARLY_FATAL__CURRENT_NATIVE_DIRECT_COVERAGE`. Current vLLM exposes per-request adaptive verification, a batch-size schedule for speculative-token count, and the scheduler/KV lookahead reservation needed for draft tokens. The frozen proposed joint action is already native.
- `S2-104-RQ02`: `EXCLUDED_BEFORE_RAW__GENERIC_THRESHOLD_RESIDUAL`. TensorRT-LLM documents fixed speculative configurations and a versioned no-dynamic-disable limitation, but this RQ did not identify an action beyond an ordinary per-request on/off threshold or a finite non-generic full-cost construction.
- `S2-104-RQ03`: `EARLY_FATAL__CURRENT_NATIVE_PAGED_KV_LIFECYCLE_AND_BACKEND_SELECTION`. FlashInfer already owns paged-KV wrapper planning, cross-layer auxiliary-data reuse and backend selection; the frozen representation/batching sketch has no surviving target-native residual.
