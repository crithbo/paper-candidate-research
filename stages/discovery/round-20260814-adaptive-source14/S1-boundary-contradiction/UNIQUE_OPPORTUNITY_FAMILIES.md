# Unique opportunity families

| Signature | Frozen object / guarantee | Survival assessment |
|---|---|---|
| CLANG_OBJC_ARC__RETURN_HANDOFF__AUTORELEASE_RETAIN__FIXED_OBJC_ABI | One ARC call/return and fixed ownership/autorelease-pool observable behavior | ABI convention controls ownership transfer; investigate only same-guarantee residual. |
| XLA_ASYNC_CUSTOM_CALL__START_DONE_BUFFER__FIXED_HLO_RESULT_SEMANTICS | One XLA async custom-call start/done pair and fixed buffer/result semantics | New relative to PJRT donation; source/config union not yet bounded. |
| PRIVATE_TOOLCHAIN_VM_REF__INVOKE_BOUNDARY__RETAIN_RELEASE__FIXED_VM_ABI | One PRIVATE_TOOLCHAIN VM invoke boundary and reference lifetime | New runtime family; likely runtime ownership management, not an N2. |
| CUDA_DSM_CLUSTER__REMOTE_SHARED_MEMORY__FIXED_CLUSTER_SEMANTICS | One clustered CUDA histogram with fixed output and DSM lifetime/synchronization semantics | New from Source13 graph objects; tests placement versus fixed cluster guarantee. |
| CUDA_PIPELINE__ASYNC_COPY_COMMIT_WAIT__FIXED_DEVICE_MEMORY_SEMANTICS | One CUDA async pipeline and fixed produced values | Needs a non-generic action beyond staging/scheduling. |
| CUDNN_GRAPH__ENGINE_PLAN__FIXED_TENSOR_GRAPH_SEMANTICS | One finalized cuDNN graph with fixed tensor graph/result | Engine-plan selection is a current API choice; raw control only. |
