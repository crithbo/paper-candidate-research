# Same-object RQ candidates — Source37 S2

## S37-01 — cuFile batch construction

- RQ-A: For a fixed versioned transaction set and cuFile status semantics, can a batch constructor jointly choose submission grouping and completion-materialization structure with a bounded same-object guarantee?
- RQ-B: For the same object, can batch construction reduce whole I/O-path cost while preserving byte/status results and FIFO requirements?
- Selected: RQ-A. It has a clearer dependent non-product consequence: construction changes the defined completion/status materialization contract, rather than merely a batch-size selection.

## S37-02 — Vulkan device-generated-command construction

- RQ-A: For a fixed indirect-command workload, can a device-command layout/preprocess constructor provide a target-specific bounded guarantee under Vulkan DGC semantics?
- RQ-B: Can a same-object preprocess/execution construction reduce materialization cost without changing command output or synchronization semantics?
- Selected: RQ-A. Its dependent consequence is the specified preprocessing/execution validity relation.

## S37-03 — CUDA cluster launch control

- RQ-A: For a fixed irregular kernel and output/memory contract, can a work-claim constructor improve a bounded full-cost objective while preserving cluster cancellation semantics?
- RQ-B: Can a semantics-preserving work-stealing structure improve the tail without becoming an online scheduler wrapper?
- Selected: RQ-A. Its dependent consequence is valid cancellation/claim completion under the kernel’s fixed semantics.

All versions were formed before source inspection. Current union/collision/witness/Q2 are deliberately absent from this RQ layer.
