# SOURCE_COLLISION_MATRIX

| Object | Current first-party union | Result |
|---|---|---|
| CUDA graphs | [Runtime graph API](https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__GRAPH.html) | Native update/launch union. |
| CUDA pools | [Memory pools](https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__MEMORY__POOLS.html) | Native async allocation union. |
| Cooperative launch | [CUDA guide](https://docs.nvidia.com/cuda/cuda-c-programming-guide/) | Native launch/config union. |
| TMA | [PTX ISA](https://docs.nvidia.com/cuda/parallel-thread-execution/) | Native descriptor/barrier union. |
| HIP | [HIP docs](https://rocm.docs.amd.com/projects/HIP/en/latest/) | Native graph/stream union. |
| Triton/LLVM | [Triton](https://triton-lang.org/main/), [AMDGPU](https://llvm.org/docs/AMDGPUUsage.html) | JIT/target/config union. |

No gfx1250→CDNA5 or AMD-TDM→NVIDIA-TMA claim is made.
