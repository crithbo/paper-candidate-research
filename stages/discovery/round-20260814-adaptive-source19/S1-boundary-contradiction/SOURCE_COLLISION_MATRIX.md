# Source and collision matrix

All entries are official/current documentation or upstream source records, consulted read-only on 2026-08-14.

| Family | Primary snapshot | Established fact / disposition |
|---|---|---|
| CUDA memory domains | NVIDIA [Memory Synchronization Domains](https://docs.nvidia.com/cuda/cuda-programming-guide/04-special-topics/memory-sync-domains.html), [CUDA C++ memory model](https://docs.nvidia.com/cuda/cuda-programming-guide/05-appendices/cuda-cpp-memory-model.html) | Domain contract, defaults, mapping and cross-domain fence rule are explicit; remaining action is a launch selector. |
| OpenCL SVM scope | Khronos [OpenCL C](https://registry.khronos.org/OpenCL/specs/unified/html/OpenCL_C.html), [OpenCL API](https://registry.khronos.org/OpenCL/specs/unified/html/OpenCL_API.html) | Scope/capability and queue-sync rules are defined; no whole non-generic action established. |
| RISC-V Ztso | RISC-V [ISA reference](https://docs.riscv.org/reference/isa/v20240411/_attachments/riscv-unprivileged.pdf), GCC [RISC-V options](https://gcc.gnu.org/onlinedocs/gcc/RISC-V-Options.html) and GCC Ztso mappings record | Current ISA/mapping path is a direct subtractor. |
| AArch64 FPMR FP8 | Arm [AAPCS64 current source](https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst); GCC [r15-7161 FPMR commit](https://gcc.gnu.org/pipermail/gcc-cvs/2025-January/416373.html); LLVM [FPMR RFC](https://discourse.llvm.org/t/rfc-improving-fpmr-handling-for-fp8-intrinsics-in-llvm/86868) | Direct current target-specific collision: redundant FPMR writes are already avoided. |
| Wasm exception tags | [WebAssembly exception-handling specification](https://webassembly.github.io/exception-handling/core/) | Current validation/runtime contract, but no frozen non-generic action. |
| SPARC windows | GCC [SPARC options](https://gcc.gnu.org/onlinedocs/gcc/SPARC-Options.html) | Initial official locus only; union not closed, so no depth/absence inference. |

No current-absence assertion is used in any disposition.
