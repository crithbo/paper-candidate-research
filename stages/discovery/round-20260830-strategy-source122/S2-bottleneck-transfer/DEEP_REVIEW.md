# Source122 S2 deep review

## Current vLLM carrier

The tiering manager immediately reserves CPU-primary space for a secondary hit, batches promotions at schedule end, and treats a full primary tier as unavailable. Current metrics expose promotion allocation failures, active promotion jobs, bytes/time and primary-tier read/write occupancy. The object and estimand are therefore observable.

## Direct-coverage audit

- PrefixShield meters newly materialized blocks, carries admission responsibility and gates reuse promotion while debt remains.
- Bidaw schedules by KV-loading layer and size to reduce blocking.
- Strata's cache-aware scheduler explicitly mitigates delay hits, hides cache-loading latency and overlaps complementary work.
- SYMPHONY coordinates request priority and memory placement; current vLLM already supports LRU/ARC and promotion telemetry.

The proposed “promotion-pressure-aware admission” has the same object class, information, target action and latency/full-cost endpoint as this union. Restricting it to vLLM metric names would be an implementation rename, not a Q2 N2 residual.

