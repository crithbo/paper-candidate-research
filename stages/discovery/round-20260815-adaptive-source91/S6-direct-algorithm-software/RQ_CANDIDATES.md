# Source91 S6 — anchored RQ candidates

## S91-01: HotSpot C2 SuperWord

**Primary RQ.** For a fixed Java method, profile, ISA target, and Java execution semantics, is there a target-specific whole vector-pack constructor with a formal code-size/legality/throughput guarantee that is not expressible by the current SuperWord plus normal C2 composition?

**Anchor route.** OpenJDK current HotSpot source, `src/hotspot/share/opto/superword.*`, with the source-supported C2 flag surface and Java execution oracle.

**Early counterfactual.** If the residual reduces to ordinary loop vectorization, a generic dependence formulation, or a flag/pass choice, the RQ is not a S6 opportunity.

## S91-02: jemalloc allocation geometry

**Primary RQ.** For a fixed allocation/free trace and unmodified allocation API semantics, is there a jemalloc-specific jointly certified arena/bin/run construction that improves a complete latency–fragmentation cost ledger beyond the current policy union?

**Anchor route.** jemalloc upstream size-class and arena source plus documented `mallctl` configuration surface.

**Early counterfactual.** If all admissible changes are allocator configuration, decay/purge policy, or generic online bin packing, the RQ fails.

## S91-03: ImageMagick palette quantization

**Primary RQ.** For a fixed image, colorspace, alpha semantics, and palette-size endpoint, is there a target-specific jointly certified palette constructor beyond the current image-quantization union?

**Anchor route.** ImageMagick current quantization source and CLI/API documentation.

**Early counterfactual.** A generic clustering objective, encoder option, or changed color-management object fails the non-generic discriminator.

The other seeds were retained only at portfolio level: no same-object RQ was committed because their initial action/endpoint boundary was already generic or insufficiently discriminated.
