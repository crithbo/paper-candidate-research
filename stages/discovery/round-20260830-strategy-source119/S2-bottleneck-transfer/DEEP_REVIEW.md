# Source119 S2 bounded deep reviews

## DR1 — Hybrid KV group allocation

Exact current boundary: vLLM documents support for exactly `full attention + X`, one LRU across groups, and shared buffers. A potential action would jointly allocate/evict more than two attention types.

Why it does not enter raw: the current document says the two-type case covers most models; no public natural model with a stable three-type contract was frozen. Without that carrier, the action is an abstract generalization. Predictive multi-tier work already claims architecture-aware sizing across attention variants, weakening an N2 residual. Minimum falsifier therefore fails at the natural/canonical carrier gate.

## DR2 — Tier-thrash-aware LMCache eviction

Exact current boundary: LMCache documents a deterministic 1.05x-overflow sequential LRU thrash workload across L0/L1/L2 and exposes eviction ratio/watermark controls.

Why it does not enter raw: the measurement conclusion is already part of the official canonical benchmark. Turning it into an eviction method is strongly collided by AsymCache's expected-compute-cost eviction/adaptive chunking, HotPrefix/Continuum reuse-value families, and predictive multi-tier reuse/prefetch. What remains is a generic cache-policy selector, not a target-specific algorithm with a clear residual and fair current union.

