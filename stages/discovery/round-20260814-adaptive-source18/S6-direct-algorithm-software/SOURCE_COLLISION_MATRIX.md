# Source and collision matrix — Source18

| Family | Fair current union | Strongest subtractor | Status |
|---|---|---|---|
| GPUDirect Storage placement | cuFile/cuObject, pinned-buffer/topology/driver paths, direct DMA constraints. | NVIDIA GDS design and API semantics. | Generic placement/controller after subtraction. |
| Transformer Engine FP8 scaling | Current, delayed, block scaling, MXFP8/NVFP4 formats and recipe state. | NVIDIA Transformer Engine documentation and existing FP8 methods. | Union absorbs action; alternatives alter numerical contract. |
| oneDNN Graph Compiler | Graph partition, fusion, layouts, buffer reuse and tuned kernels. | The anchor artifact itself. | Paper-owned complete constructor. |
| jemalloc extents | Extent hooks, split/merge, arena and decay controls. | Official allocator implementation/model. | Generic allocator placement/controller. |
| CUTLASS pipeline | Source17 pipeline union. | Source17 identity record. | Excluded repeated. |
| Verilator recourse | Active Stage0 object. | Registry active identity. | Excluded active. |

No unresolved direct collision supports a proposal, so no `SEARCH_BOUNDED_OPEN`
claim is used as a novelty conclusion.
