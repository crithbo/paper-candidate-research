# Source and collision matrix

| Locator / subtractor | Primary current evidence | Role |
|---|---|---|
| RISC-V Zicond | GCC [RISC-V options](https://gcc.gnu.org/onlinedocs/gcc/RISC-V-Options.html), GCC [Zicond support patch series](https://gcc.gnu.org/pipermail/gcc-patches/2023-February/611767.html) | Current target/support union; direct subtractor rather than absence proof |
| CUDA mbarrier | NVIDIA [asynchronous barriers](https://docs.nvidia.com/cuda/cuda-programming-guide/04-special-topics/async-barriers.html), [async copies](https://docs.nvidia.com/cuda/archive/13.1.1/cuda-programming-guide/04-special-topics/async-copies.html), PTX [mbarrier contents](https://docs.nvidia.com/cuda/parallel-thread-execution/contents.html) | Positive current phase/token/transaction semantics; historical identity containment |
| SPIR-V precision | Khronos [SPIR-V unified specification](https://registry.khronos.org/SPIR-V/specs/unified1/SPIRV.html) | Explicit relaxed-precision semantic change makes same-guarantee test fail |
| Wasm/MLIR locator | [WAMI 2025](https://arxiv.org/abs/2506.16048) | Recent-paper locator only; no residual taken from it |

All sources were read-only and bounded on 2026-08-14; no current-absence assertion was made.
