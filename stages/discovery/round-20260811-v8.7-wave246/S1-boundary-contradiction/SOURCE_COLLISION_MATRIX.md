# SOURCE_COLLISION_MATRIX

| role | primary source | finding |
|---|---|---|
| direct algorithm collision | [CC’23 paper](https://pp.ipd.kit.edu/uploads/publikationen/fried23cc.pdf) | Same LLVM RISC-V compressed-ISA RA: compressibility priority, register choice, spill decision and copies are jointly optimized. |
| current LLVM pass | [RISCVMakeCompressible source](https://llvm.org/doxygen/RISCVMakeCompressible_8cpp_source.html) | Current pass analyzes compressible uses, selects registers and updates operands for code-size reduction. |
| current MC compression | [RISCVRVC namespace](https://www.llvm.org/docs/doxygen/namespacellvm_1_1RISCVRVC.html) | Current LLVM exposes RVC MC compression. |
| relaxation subtractor | [binutils RVC relaxation discussion](https://sourceware.org/pipermail/binutils/2022-March/120252.html) | RVC compression/relaxation is also handled at link scope; it is not a new construction path. |

No future-work or source absence supports the decision. The CC’23 paper is a direct same-object collision, not merely adjacent literature.
