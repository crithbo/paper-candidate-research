# RAW_SCREEN_ROW_EVENT

| ID | GPU family / official source | Minimal same-object witness + current union | Result |
|---|---|---|---|
| R01 | CUDA graph update ([CUDA Runtime API](https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__GRAPH.html)) | Graph exec update must preserve update legality/launch semantics; native graph/update union. | `NOT_ADMITTED_UNFROZEN` |
| R02 | CUDA stream-ordered allocation ([CUDA Runtime API](https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__MEMORY__POOLS.html)) | Allocation/free visibility is ordered by stream dependencies; native pool/async alloc union. | `NOT_ADMITTED_UNFROZEN` |
| R03 | CUDA cooperative launch ([CUDA C guide](https://docs.nvidia.com/cuda/cuda-c-programming-guide/)) | Whole-grid residency/launch legality is fixed; launch/config union. | `NOT_ADMITTED_UNFROZEN` |
| R04 | CUDA Tensor Memory Accelerator ([CUDA PTX ISA](https://docs.nvidia.com/cuda/parallel-thread-execution/)) | Descriptor/TMA transfer completion is constrained by documented barrier semantics; native descriptor/barrier union. | `NOT_ADMITTED_UNFROZEN` |
| R05 | ROCm HIP graphs/streams ([HIP docs](https://rocm.docs.amd.com/projects/HIP/en/latest/)) | HIP graph/stream event dependencies define legal launch/update ordering; native HIP union. | `NOT_ADMITTED_UNFROZEN` |
| R06 | Triton JIT/LLVM codegen ([Triton docs](https://triton-lang.org/main/), [LLVM AMDGPU docs](https://llvm.org/docs/AMDGPUUsage.html)) | Same kernel specialization/code-object/occupancy legality; JIT/target/config union. | `NOT_ADMITTED_UNFROZEN` |
