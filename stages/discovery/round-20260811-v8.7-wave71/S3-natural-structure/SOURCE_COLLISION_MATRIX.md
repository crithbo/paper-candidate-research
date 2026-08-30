# Source / collision matrix

All material is official/upstream documentation or an original paper; cutoff 2026-08-11.

| family | primary source | action conclusion |
|---|---|---|
| GFA-REPEAT-PATH-CONTRACTION | [GFA 1 specification](https://gfa-spec.github.io/GFA-spec/GFA1.html), [assembler components](https://gfa-spec.github.io/assembler-components/). | Upstream path contraction directly absorbs action. |
| HDF5-REGIME-CHUNK-CONSTRUCTOR | [current HDF5 chunking](https://portal.hdfgroup.org/documentation/hdf5/latest/hdf5_chunking.html), [chunk issues](https://portal.hdfgroup.org/documentation/hdf5/latest/hdf5_chunk_issues.html). | Existing chunk/cache/filter action union; remaining choice is tuning. |
| OTEL-TRACE-SKELETON | [current OpenTelemetry trace API](https://opentelemetry.io/docs/specs/otel/trace/api/), [upstream source](https://github.com/open-telemetry/opentelemetry-specification/blob/main/specification/trace/api.md), [Tracezip original paper](https://arxiv.org/abs/2502.06318). | Direct same-object shared-span-skeleton collision. |
| KAFKA-KEY-REGIME-COMPACTION | [Kafka design](https://kafka.apache.org/41/design/design/). | Online controller exclusion. |
| TEMPORAL-COMMUNITY-PHASE-BLOCK | [SNAP data](https://snap.stanford.edu/data/). | Wave59 exclusion. |
| BGP-ROUTE-REGIME-PREFIX | [RouteViews](https://www.routeviews.org/). | Wave54 exclusion. |
| PARSER-VALIDATOR-REGIME-CACHE | registry frozen S2 scope. | Cross-lane exclusion. |
| LLVM-PROFILE-PHASE-REGION | registry frozen S6 scope. | Cross-lane exclusion. |
