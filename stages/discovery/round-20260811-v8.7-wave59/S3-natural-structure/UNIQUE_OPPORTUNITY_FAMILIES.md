# Unique families

| family | stable natural structure | proposed atomic action | same-object oracle | result |
|---|---|---|---|---|
| SNAP-COMMUNITY-ADJACENCY-BLOCK | community/cluster locality and degree skew | jointly construct a relabeled adjacency-block representation | graph query/algorithm outputs after inverse label map | NOT_ADMITTED_UNFROZEN |
| SUITESPARSE-MASKED-SPGEMM-WORKSPACE | sparse row-length skew and mask locality | construct per-region symbolic workspace allocation | exact semiring matrix result | DROP |
| TENSORFLOW-RAGGED-SPARSE-BRIDGE | highly variable row lengths | convert/choose ragged versus sparse representation | operation output | DROP: function changes |
| GRAPHBLAS-HYPERSPARSE-EXPORT | extreme column sparsity | choose hyper/CSC export representation | GraphBLAS object export/import semantics | DROP |
| ARROW-HASHJOIN-SKEW-PARTITION | heavy-hitter join keys | partition build/probe state | relational join result | EXCLUDED: S2 |
| OGB-NEIGHBOR-BATCH-REUSE | power-law degree and repeated neighborhoods | preserve/reuse mini-batch neighborhoods | model-training trace | EXCLUDED: online controller/S5 |
| OSM-SPATIAL-ENTITY-ORDER | spatial locality | reorder serialized entities | reader equality | EXCLUDED: pure emitter |
| SPARSE-PREFIX-FILTER-COMPACTION | sparse property/prefix memberships | construct a compact membership filter | membership answers | EXCLUDED: S6 index/filter |
