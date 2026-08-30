# Source and collision matrix — Source09

| Family | Official/current basis | Strongest current union | Collision / decision |
|---|---|---|---|
| RISC-V Zcmp callee-save/push-pop | RISC-V ISA v20240411 defines cm.push/cm.pop register-list and stack_adj; LLVM RISC-V user guide declares Zcmp supported; current RISCVFrameLowering, RISCVMachineFunctionInfo and RISCVPushPopOptimizer source | Clang target/ABI flags + standard Zcmp frame lowering and callee-save handling + current greedy/PBQP allocation alternatives + PushPop optimizer + pseudo expansion + stock assembler/linker/unwind | PushPop optimizer sees register list picked during frame lowering and runs late. Bounded search has no direct target-specific joint RA/list FPT/Pareto result; SEARCH_BOUNDED_OPEN. |
| AArch64 MOPS | LLVM AArch64SelectionDAGInfo UseMOPS default true and EmitTargetCodeForMemcpy/Memmove/Memset | current MOPS lowering + ordinary RA/frame union | only native selector visible |
| RISC-V Zacas | LLVM RISC-V user guide, RISCVZacasABIFix and late AtomicExpand pass | current atomic-lowering/ABI-fix union | direct union facet |
| gp relaxation | LLVM RISC-V user guide | mrelax plus LLD relax-gp and fixed executable constraints | config/linker selection |
| CFI/basic-block sections | Clang CFI design and LLVM BasicBlockSections | prior Source08 union | generic remainder repeat |
| CHERI bounds | registry/history | historical family | excluded repeat |

## Source locators

- https://docs.riscv.org/reference/isa/v20240411/_attachments/riscv-unprivileged.pdf
- https://llvm.org/docs/RISCVUsage.html
- https://llvm.org/doxygen/classllvm_1_1RISCVFrameLowering.html
- https://llvm.org/doxygen/RISCVPushPopOptimizer_8cpp_source.html
- https://llvm.org/doxygen/RISCVTargetMachine_8cpp_source.html
- https://llvm.org/doxygen/AArch64SelectionDAGInfo_8cpp.html

Current source is treated as a strong comparator. No absence claim is inferred from an issue, future-work note, or unsupported flag.
