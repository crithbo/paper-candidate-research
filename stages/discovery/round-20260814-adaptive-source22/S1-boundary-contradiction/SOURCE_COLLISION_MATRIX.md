# Source and collision matrix

| Family | Primary/current source | Bound and result |
|---|---|---|
| RISC-V Zalasr | GCC [RISC-V options](https://gcc.gnu.org/onlinedocs/gcc/RISC-V-Options.html) | Positive current target feature; no current-absence inference and no C0 closure |
| OpenCL device enqueue | Khronos [OpenCL C specification](https://registry.khronos.org/OpenCL/specs/unified/html/OpenCL_C.html) | Device enqueue has explicit prerequisite features; no non-generic same-object action established |
| CUDA mbarrier | NVIDIA [asynchronous barriers](https://docs.nvidia.com/cuda/cuda-programming-guide/04-special-topics/async-barriers.html) | Source21 containment exclusion |
| Wasm stack switching | [WAMI 2025](https://arxiv.org/abs/2506.16048) | Source03 containment exclusion; paper is locator only |

Read-only, bounded official/primary evidence. The additional bounded query did not return in its allotted retrieval window; this records a search boundary only and is not a resource or scientific negative conclusion.
