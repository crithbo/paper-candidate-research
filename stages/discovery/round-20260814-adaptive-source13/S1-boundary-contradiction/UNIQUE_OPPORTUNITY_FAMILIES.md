# Unique opportunity families

| Canonical signature | Exact object and fixed guarantee | Relation / residual-survival screen |
|---|---|---|
| AARCH64_MOPS__MEMCPY_LOWERING__SYNCHRONOUS_FAULT_RESTART__FIXED_AAPCS64_PROGRAM | One AArch64 `memcpy` call under fixed source-visible copy and fault behavior | New source-level family; likely guarantee split between library copy and fault/restart behavior. |
| POWERPC_MMA__ACCUMULATOR_CALL_BOUNDARY__STATE_SPILL_RESTORE__FIXED_ELFV2_FUNCTION | One ELFv2 PowerPC function/call graph with fixed MMA accumulator semantics | Distinct from active PPC prefixed-form work; source pin required before any residual claim. |
| PJRT_BUFFER__DONATION_READY_EVENT__ASYNC_EXECUTION__FIXED_BUFFER_SEMANTICS | One PjRT buffer/execute object with fixed host mutation/readiness semantics | New accelerator-runtime family; donation changes ownership obligation and is tested in D2. |
| PRIVATE_TOOLCHAIN_HAL__DEFERRED_COMMAND_BUFFER__STREAM_APPLICATION__FIXED_HAL_RECORDING | One PRIVATE_TOOLCHAIN HAL command buffer with fixed recorded command effects | New runtime family; likely current canonicalization/lowering rather than N2. |
| CUDA_GRAPH_CONDITIONAL__DEVICE_CONDITION_BODY__FIXED_GRAPH_TOPOLOGY | One CUDA graph with fixed conditional-body topology and memory ordering | New sub-object but adjacent to historical graph-capture work; host resubmission is not same interface. |
| SYCL_COMMAND_GRAPH__FINALIZATION_PARAMETER_BINDING__FIXED_BUFFER_LIFETIME | One finalized SYCL command graph and buffer ownership contract | New string; current source/config union not bounded, so not admitted. |
