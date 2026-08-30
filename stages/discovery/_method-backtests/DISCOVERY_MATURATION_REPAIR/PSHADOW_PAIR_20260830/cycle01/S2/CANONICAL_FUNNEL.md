# DMR-V1-PSHADOW-CYCLE-01-S2 canonical funnel

Model route: `gpt-5.6-terra / medium`. Network/source budget used: two official-source search roles and two official-source opens; no downloads, builds, experiments, or candidate execution.

## Seed and RQ

- Seed: per-layer KV cache residency may exploit hybrid/sliding layer classes better than a whole-cache offload choice.
- Primary RQ: In Transformers v5.6.2, do layer class, sliding-window, and offload semantics leave a same-object per-layer residency/prefetch decision beyond whole-cache mode selection?
- Exact anchor: Transformers v5.6.2 KV-cache documentation and same-tag `src/transformers/cache_utils.py`.

## Canonical source closure

The v5.6.2 documentation states that offloading keeps only the current layer cache on GPU, asynchronously prefetches the next layer, and sends the current layer cache back to CPU. It also exposes `offload_only_non_sliding`, whose semantics decide whether sliding/chunked layers are offloaded. The same-tag source implements `prefetch(layer_idx + 1, only_non_sliding)` and `offload(layer_idx, only_non_sliding)` around per-layer cache update.

Sources:

- https://huggingface.co/docs/transformers/v5.6.2/kv_cache
- https://github.com/huggingface/transformers/blob/v5.6.2/src/transformers/cache_utils.py

## Question-card disposition

- Exact object: Transformers v5.6.2 DynamicCache/StaticCache offloading.
- Proposed action: layer-class-aware GPU/CPU KV offload and asynchronous prefetch.
- Current-source result: the official documentation and same-tag source already express this action and the sliding/non-sliding selector.
- Collision classification: `DIRECT_FATAL` for the frozen action gap; no same-object residual was frozen before the bounded source route closed.
- Disposition: `EXCLUDED_BEFORE_RAW`.
- Scientific inference: this is an exact current-source absorption for the frozen S2 action, not a broad cache/offloading category conclusion.

