# Pre-evidence RQ Candidates

## RQ-S01 — RISC-V Ztso atomic lowering

Shared object: fixed C/C++ atomic program, language-visible atomic outcome, RISC-V ABI, and Ztso-enabled target.

1. Preserve atomic semantics while selecting fence/atomic lowering sequences.
2. Joint memory-order lowering, register pressure, and scheduling construction with code/runtime cost.
3. Canonical no-gain condition for explicit fence versus Ztso lowering.

Selected before evidence: 2, conditional on a target-specific construction rather than ordinary memory-model lowering or scheduling.

## RQ-S02 — OpenCL mutable command-buffer commitment

Shared object: fixed OpenCL command-buffer workload, completion/order observables, and device-visible results.

1. Preserve command-buffer execution semantics while choosing mutable-command commitment boundaries.
2. Construct command/buffer publication grouping with full CPU/device cost.
3. Identify canonical no-gain conditions for update versus re-record paths.

Selected before evidence: 2, conditional on a non-controller mechanism and a public runtime union. Online command selection/retry/configuration is excluded.
