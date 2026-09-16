# Source / collision matrix — Wave261

| facet | first-party/current evidence | implication |
|---|---|---|
| LLVM source pin | `llvm-project` main `cfcdf93b66b20e92e98181de71fff33452d5b51d` queried 2026-08-11 | frozen LLVM comparator revision |
| LLVM pass/config | [TargetMachine source](https://llvm.org/docs/doxygen/LoongArchTargetMachine_8cpp_source.html) | MergeBaseOffset default true; its disable flag, RA hooks, branch relaxation and pseudo expansion must be included |
| LLVM relocation action | [MergeBaseOffset source](https://llvm.org/doxygen/LoongArchMergeBaseOffset_8cpp.html) | PCADD_LO family is recognized by the target pass |
| ISA/ABI | [LoongArch ELF ABI](https://loongson.github.io/LoongArch-Documentation/LoongArch-ELF-ABI-EN.pdf) | PC-relative relocation and `R_LARCH_RELAX` legality are fixed object semantics |
| GCC competitor | [official GCC options](https://gcc.sourceware.org/onlinedocs/gcc-14.1.0/gcc/LoongArch-Options.html) | explicit relocation/macro/relax auto policy is already a same-object action family |
| binutils competitor | binutils-gdb master `a80fede20bc1330eca5e419392c6595bb3a6ac1d`; [official relaxation series](https://sourceware.org/pipermail/binutils/2023-May/127539.html) | relaxable PC-relative sequences and scheduling limitation already documented |
| direct paper collision | original compiler/algorithm searches found only generic RA literature, not a verified LoongArch same-object joint algorithm | bounded search is not proof of novelty; with the action witness unfrozen it cannot support a brief |

The GCC git server's HTTP 429 is recorded as a provenance limitation only; it is not a scientific conclusion.
