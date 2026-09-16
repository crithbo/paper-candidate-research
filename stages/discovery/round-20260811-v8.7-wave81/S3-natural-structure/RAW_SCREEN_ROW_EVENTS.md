# Wave81 raw screen-row events

Frozen assignment: `DISCOVERY-S3-20260811-V8.7-WAVE81-NATURAL-BURST-PHASE-HETEROGENEITY`  
Frozen cutoff: 2026-08-11. Rule revision: `v8.7+R5-P0`; `DISCOVERY_QUALITY_MODE=OFF`.

| Event | Family | Public natural carrier / observed structure | Candidate action | Disposition |
|---|---|---|---|---|
| RAW-01 | Brotli phase meta-blocks | Public web text/JS/CSS streams have changing literal/context distributions; RFC 7932 exposes independent meta-block codes. | Jointly choose meta-block boundaries, block types and context maps under a fixed decoded byte stream. | `DEEP_DIVE_REQUIRED` |
| RAW-02 | Java CDS phase archives | Application class-loading is concentrated in startup phases; JDK documentation supports captured class lists and dynamic archives. | Construct phase-aware archive contents/order for the same classpath and class-loading semantics. | `DEEP_DIVE_REQUIRED` |
| RAW-03 | V8 IC state epochs | Production Chromium/V8 programs induce monomorphic-to-polymorphic feedback evolution. | Globally construct feedback-epoch specialization/deoptimization boundaries. | `DEEP_DIVE_REQUIRED` |
| RAW-04 | HTTP archive burst grouping | HAR/network archives have request bursts and page phases. | Cross-record compression/layout construction. | `EXCLUDED`: pure archive/format-emitter direction, not a same-object N2/N3 constructor here. |
| RAW-05 | Kafka partition burst compaction | Public Kafka traces exhibit partition/key bursts. | Stateful compaction/flush scheduling. | `EXCLUDED`: online controller/scheduler, outside Wave81. |
| RAW-06 | JVM GC phase regions | Allocation and collection cycles have regime changes. | Region-selection/scheduling policy. | `EXCLUDED`: overlaps S2 allocation/lifetime bottleneck transfer and is an online controller. |
| RAW-07 | Arrow/database skewed joins | Natural query streams contain key-frequency phases. | Build-side partition/rehash choice. | `EXCLUDED`: overlaps S2 and is a generic partitioning wrapper without a frozen residual. |
| RAW-08 | GPU kernel phase scheduling | Kernels show shape/occupancy regimes. | Schedule/launch policy. | `EXCLUDED`: S6 compiler/guarantee scope and tuning/selector risk. |
| RAW-09 | Browser network replay phases | Chrome NetLog requests form page-navigation phases. | Replay batching/prefetch policy. | `EXCLUDED`: online controller; no nontrivial same-object constructor fixed. |
| RAW-10 | OpenTelemetry trace bursts | Service traces have repeated spans and burst epochs. | Trace clustering/storage transform. | `EXCLUDED`: overlaps Wave71 trace line and risks generic clustering wrapper. |

Only RAW-01--03 reached candidate-grade review. No raw observation is treated as a natural-positive result.
