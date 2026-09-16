# Source / collision matrix

| Family | Official or primary current source | Current-union / collision outcome |
|---|---|---|
| AArch64 MOPS | [Arm toolchain feature support](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a); [LLVM AArch64 source](https://github.com/llvm/llvm-project/tree/main/llvm/lib/Target/AArch64) | Two actions divide on fault/restart contract; otherwise current lowering absorbs. |
| PowerPC MMA | [LLVM PowerPC source](https://github.com/llvm/llvm-project/tree/main/llvm/lib/Target/PowerPC) | Current source, flags and direct-paper closure not completed; `NOT_ADMITTED_UNFROZEN` / raw only. |
| PJRT donation | [PJRT C++ API overview](https://openxla.org/xla/pjrt/cpp_api_overview) | API itself exposes ownership change; direct absorption by changed guarantee. |
| PRIVATE_TOOLCHAIN HAL | [HAL reference](https://PRIVATE_TOOLCHAIN.dev/reference/mlir-dialects/HAL/); [CUDA HAL design](https://PRIVATE_TOOLCHAIN.dev/developers/design-docs/cuda-hal-driver/) | Deferred recording/application is existing runtime construction; no target-specific residual frozen. |
| CUDA conditional graph | [CUDA Programming Guide, graph section](https://docs.nvidia.com/cuda/cuda-programming-guide/04-special-topics/cuda-graphs.html) | Device conditional handles and static body topology are current contract; host re-submit changes interface/cost domain. |
| SYCL command graph | [Khronos SYCL source](https://github.com/KhronosGroup/SYCL-Docs) | Current implementation and complete flag/config union not bounded; `NOT_ADMITTED_UNFROZEN`. |

Bounded search date: 2026-08-14. No old issue, future-work claim, or security/exploit source is used to assert a current absence.
