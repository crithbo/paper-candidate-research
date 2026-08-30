# Source and collision matrix

| Anchor | Primary source | Current source / union fact | Result |
|---|---|---|---|
| WAMI 2025 | [WAMI](https://arxiv.org/abs/2506.16048) | Wasm stack switching is a stated case study; it is contained by Source03’s Wasm async/ABI screen | Identity exclusion, not a new claim |
| Wasm validation | [Wasm 3.0 implementation limitations](https://webassembly.github.io/spec/core/appendix/implementation.html) | Deferred validation is permitted but the body must validate before execution | No distinct target-specific action |
| RISC-V microkernel compiler | [2025 microkernel backend paper](https://arxiv.org/abs/2502.04063), GCC [RISC-V options](https://gcc.gnu.org/onlinedocs/gcc/RISC-V-Options.html) | Current target choices/lowering are the fair union | Generic backend/target choice only |
| OpenMP target memory | LLVM [OpenMP runtimes](https://openmp.llvm.org/design/Runtimes.html) | `dyn_groupprivate` and native dynamic-memory extension are explicit current routes | Direct runtime/directive absorption |
| CUDA domains | NVIDIA [memory synchronization domains](https://docs.nvidia.com/cuda/cuda-programming-guide/04-special-topics/memory-sync-domains.html) | Previously screened Source19 identity | Excluded |
| AArch64 FPMR | Arm [AAPCS64](https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst), GCC [FPMR commit](https://gcc.gnu.org/pipermail/gcc-cvs/2025-January/416373.html) | Previously screened Source19 direct collision | Excluded |

All retrieval was read-only and bounded on 2026-08-14. No absence inference is used.
