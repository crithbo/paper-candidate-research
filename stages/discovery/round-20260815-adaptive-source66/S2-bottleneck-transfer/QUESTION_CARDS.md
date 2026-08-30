# Question cards — Source66

## S66-01 — OpenCL command-buffer state

- Same-object contract: fixed command sequence, resources, kernel arguments, and device result.
- Current union: record/replay command buffers; mutable kernel inputs, outputs, work-item sizes and offsets; optional simultaneous use.
- Full-cost boundary: record/update/finalize/enqueue CPU/RSS, command-state bytes, and end-to-end device latency.
- Contrary explanation: `clUpdateMutableCommandsKHR`/mutable dispatch already is the action; ordering and mutation choice are controller/configuration.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_MUTABLE_DISPATCH_UNION_OR_CONTROLLER`.

## S66-02 — SYCL graph finalization/update state

- Same-object contract: fixed command graph, queue/device, dependencies and graph execution result.
- Current union: recording, node construction, finalization, updatable executable graphs, dynamic parameters, synchronous update, and preconstructed multiple executable graphs to avoid update synchronization.
- Full-cost boundary: graph record/finalize/update CPU/RSS/bytes, submit/host synchronization, device occupancy, and end-to-end latency.
- Contrary explanation: a graph pool or update rule is an existing-point selector/controller, not a union-external complete constructor.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_GRAPH_POOL_UPDATE_UNION_OR_CONTROLLER`.

## S66-03 — CUDA memory-pool transition

- Same-object contract: fixed workload, allocation lifetimes, stream-order semantics, and output.
- Current union: `cudaMallocAsync`/`cudaFreeAsync`, default and explicit pools, pool attributes, thresholds/trim, event/opportunistic/internal-dependency reuse, and pool statistics.
- Full-cost boundary: allocation/free/reuse/trim CPU, driver synchronization, reserved/used bytes, peak RSS/VRAM, dependency effects, and workload latency.
- Contrary explanation: pool selection, reuse flags, release threshold, trimming, or timing is existing policy/configuration; stronger reuse can insert dependencies and change scheduling.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_MEMORY_POOL_POLICY_UNION`.
