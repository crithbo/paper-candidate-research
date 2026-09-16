# Research Question Cards — Source36 S2

## QC-S36-01 — OpenCL mutable command buffer

- Exact object: fixed OpenCL commands, inputs, device capability set, output and command-dependency semantics.
- Current source locus: Khronos `cl_khr_command_buffer` and `cl_khr_command_buffer_mutable_dispatch` current specification/refpages, accessed 2026-08-15.
- Contrary/current union: command recording/replay, multi-device command-buffer layering, mutable kernel arguments, work sizes, offsets and update entry points are explicit native actions.
- Candidate discriminator: a target-specific whole constructor and guarantee beyond recorded-command composition.
- Result: none frozen; the remaining idea is a command-update/controller policy.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_COMMAND_BUFFER_UNION`.

## QC-S36-02 — CUDA cluster DSM

- Exact object: fixed CUDA kernel semantics, grid outputs and device target; no source-level algorithm change or altered memory contract.
- Current source locus: current CUDA Programming Guide thread-block-cluster/DSM sections, accessed 2026-08-15.
- Contrary/current union: compile-time `__cluster_dims__`, runtime `cudaLaunchKernelEx`, cluster dimension attributes, dynamic shared-memory attributes and `cluster.sync()` already express the proposed launch/memory choices.
- Candidate discriminator: a target-specific semantics-preserving constructor with an explicit guarantee beyond those controls.
- Result: none frozen; selecting cluster size/shared-memory allotment is a launch configuration choice.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_LAUNCH_CONFIGURATION_UNION`.

## QC-S36-03 — CUDA programmatic dependent launch

- Exact object: fixed primary/secondary kernels, input/output values and memory-ordering guarantee.
- Current source locus: CUDA Programming Guide programmatic dependent launch and graph programmatic dependency documentation, accessed 2026-08-15.
- Contrary/current union: current APIs supply programmatic stream serialization and graph dependency type data for early dependent launch.
- Candidate discriminator: a same-object action/guarantee beyond the graph/launch dependency union.
- Result: none frozen; the possible difference is dependency policy/scheduling.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_DEPENDENCY_UNION`.

No card met all RAW_REQUIRED fields; particularly, none supplied a non-configuration, target-specific action/guarantee. Full-cost if externally reopened would include compile/setup CPU, command/launch overhead, device memory, temporary bytes, cross-block access/synchronization and end-to-end latency. No measurement was run.
