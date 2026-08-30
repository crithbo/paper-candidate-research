# R21 opportunity anchors and cards

| Signature | Invariant / two-plan skeleton | Current source loci, contrary and full-cost / finite falsifier |
|---|---|---|
| LLVM_STACKMAP__DEOPT_RECONSTRUCTION__FIXED_IR_RUNTIME_SEMANTICS | Preserve deopt continuation values; native plans encode/reconstruct state through current stackmap paths | LLVM stackmap/statepoint loci; contrary is existing deopt lowering. Tests/parser; compile CPU/RSS, map bytes, runtime reconstruction and code bytes; one failing value reconstruction kills. |
| CLANG_CPP_MODULE__BMI_OBJECT_COUNTERPART__FIXED_CXX20_ABI | Preserve linked object and module ABI; one/two phase BMI production | Clang module docs/current source; contrary is current one/two-phase compiler union. Module test/cxxfilt; compile CPU/RSS, BMI/object bytes; ABI mismatch kills. |
| CUDA_STREAM_MEM_OPS__VALUE_WAIT_WRITE__FIXED_STREAM_ORDER | Preserve stream-visible memory value/order; direct stream write/wait and dependency sequence | CUDA runtime stream-ordering API; contrary is current driver scheduler. Stock status/order oracle; launch CPU, sync latency, GPU time, memory; ordering failure kills. |
| HIP_STREAM_MEM_OPS__VALUE_WAIT_WRITE__FIXED_HIP_ORDER | Same fixed HIP stream visible order | HIP docs/source union only partly bounded; stock API status oracle and natural ROCm samples; same cost denominator. |
| XLA_ASYNC_HLO__START_DONE__FIXED_RESULT_LIFETIME | Preserve HLO result/lifetime while moving start/done | OpenXLA async-HLO current source; HLO verifier and test corpus; compile/device memory/latency full cost. |
| CUDA_DEVICE_GRAPH_LAUNCH__COMPLETION_VISIBILITY__FIXED_GRAPH_RESULT | Preserve graph result and completion visibility across native launch modes | CUDA graph/current API; stock graph result oracle; host/device launch, graph memory and latency full cost. |

The residual column is intentionally blank for unfrozen cards; it is not inferred from a missing source feature.
