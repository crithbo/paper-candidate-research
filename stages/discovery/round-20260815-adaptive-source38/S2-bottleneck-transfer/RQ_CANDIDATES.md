# RQ candidates — Source38 S2

1. **Level Zero VM:** For a fixed reserved-memory program, can a target-specific map/access/residency constructor provide a bounded full-cost guarantee beyond the stock VM action set?
2. **CUDA async copy:** For a fixed kernel and output semantics, can a pipeline-stage constructor provide a bounded latency/space guarantee beyond `memcpy_async`/pipeline primitives?
3. **NVSHMEM team/QP:** For a fixed GPU communication program and ordering result, can a target-specific team/QP construction provide a non-policy guarantee beyond stock teams/QPs/ordering APIs?

Each RQ was selected before source inspection; current union, collision, witness and Q2 are not RQ prerequisites.
