# Pre-evidence RQ versions

## S01 — `RISCV_ZFA_FLI__FIXED_FLOAT_RESULT__CONSTANT_MATERIALIZATION_FORM_COST`

1. For a fixed RISC-V floating result, ISA and ABI, can FLI versus non-FLI materialization admit a target-specific algorithm with a code-size/front-end guarantee beyond ordinary instruction selection?
2. Does the form boundary retain a same-object joint constructor after stock LLVM lowering and target-feature selection are included?

## S02 — `CUDA_DEVICE_GRAPH_LAUNCH__FIXED_GRAPH_SEMANTICS__UPLOAD_UPDATE_LAUNCH_COMMITMENT`

1. For a fixed CUDA graph computation and dependency semantics, is there a non-controller construction that changes upload/update/launch commitment while preserving device-graph requirements?
2. Can this be stated as a same-object algorithmic guarantee rather than a device-side scheduling policy?

These were written before source retrieval and assert neither absence nor novelty.
