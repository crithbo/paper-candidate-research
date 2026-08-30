# Question Cards — Source35 S2

| Card | exact identity / same-object contract | current official locus and contrary | minimum falsifier | canonical base disposition |
|---|---|---|---|---|
| QC-S35-01 | Fixed CUDA multi-GPU program, allocation contents, virtual-address contract and outputs. | CUDA VMM guide describes `cuMemAddressReserve`, `cuMemCreate`, `cuMemMap`, `cuMemSetAccess`, unmap/release and fabric handles; this is the native action union. | Name a legal same-object mapping action and target-specific guarantee not expressible by that union. | Excluded before raw. |
| QC-S35-02 | Fixed TensorRT engine/network, input sequence, dynamic-shape and tensor-output contract. | TensorRT dynamic-shape documentation specifies `IOutputAllocator`, preallocation, growth/recycling and current-pool behavior. | Name a whole action and target-specific guarantee beyond those allocator strategies. | Excluded before raw. |
| QC-S35-03 | Fixed CUDA program, managed allocation contents, outputs and memory-consistency contract. | CUDA Unified Memory current guide; possible action is access/placement advice or runtime migration policy. | Name a non-policy action/guarantee preserving the contract. | Excluded before raw. |

Full-cost boundaries, if a distinct action is later evidenced, respectively include mapping/handle/access overhead plus copy/memory footprint; engine build/enqueue/output allocation CPU/RSS/bytes/latency; and migration/fault/copy/CPU/GPU-memory/end-to-end latency. No actual measurement was run.
