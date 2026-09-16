# Research Question Cards — Source37 S2

## QC-S37-01 — cuFile batch construction

- Exact public identity: fixed cuFile read/write transaction set, file offsets, GPU/CPU buffers, bytes, status semantics and ordering boundary; current GDS documentation accessed 2026-08-15.
- Contribution hypothesis: `SYSTEM_ARCHITECTURE / N2`, batch construction with a bounded completion/status-materialization guarantee.
- Current official locus: GDS cuFile API Reference specifies batch setup, submit, poll/status, cancel/destroy; batch I/O is FIFO ordered against stream work and entries may reorder within a batch.
- Cheapest falsifier: all legal grouping/completion actions are simply the documented batch API/parameters or no target-specific guarantee can be stated.
- Result: `EXCLUDED_BEFORE_RAW__CURRENT_BATCH_API_COMPOSITION`. The frozen action remains API grouping/polling/configuration; no non-generic target-specific constructor/guarantee was isolated.

## QC-S37-02 — Vulkan DGC construction

- Exact public identity: fixed Vulkan indirect command workload, shader/device state and command execution/synchronization semantics; current Vulkan DGC specification accessed 2026-08-15.
- Contribution hypothesis: `COMPILER_TOOL / N2`, device command layout/preprocess construction with a bounded validity/cost guarantee.
- Current official locus: DGC specifies indirect command layouts, input buffers, device-queried preprocess allocation, optional preprocess and its explicit/automatic synchronization, then command generation/execution.
- Cheapest falsifier: the proposed construction is merely filling documented buffers/layouts or selecting whether to preprocess.
- Result: `EXCLUDED_BEFORE_RAW__CURRENT_DGC_LAYOUT_PREPROCESS_UNION`. No target-specific algorithm/guarantee beyond current layout/preprocess composition was frozen.

## QC-S37-03 — CUDA cluster launch control

- Exact public identity: fixed irregular CUDA kernel, input/output and memory semantics on a cluster-launch-control-capable target; current NVIDIA guide accessed 2026-08-15.
- Contribution hypothesis: `SYSTEM_ARCHITECTURE / N2`, in-kernel cancellation/claim construction with bounded completion/full-cost guarantee.
- Current official locus: Cluster Launch Control documents asynchronous cancellation request, shared-memory synchronization, result decoding, work-stealing loop and existing in-flight block claim behavior.
- Cheapest falsifier: current feature already expresses the claimed work-claim action; remainder is a scheduler policy.
- Result: `EXCLUDED_BEFORE_RAW__CURRENT_CLUSTER_WORK_STEALING_UNION`. No target-specific new action/guarantee was frozen.

No card entered raw. Current union, strongest collision, small witness and Q2 calibration thus remain not-applicable downstream debt rather than RQ prerequisites.
