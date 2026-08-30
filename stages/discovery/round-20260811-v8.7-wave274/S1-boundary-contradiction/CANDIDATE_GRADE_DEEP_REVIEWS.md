# Candidate-grade deep review — Wave274

## Current source union

[MSP430TargetMachine.cpp](https://llvm.org/docs/doxygen/MSP430TargetMachine_8cpp_source.html) fixes unspecified relocation to `Reloc::Static` and registers only the MSP430 target, DAG selector and asm printer. [MSP430 frame lowering](https://llvm.org/docs/doxygen/classllvm_1_1MSP430FrameLowering.html) implements call-frame pseudo removal, prologue/epilogue and callee-save spill/restore; [MC lowering](https://llvm.org/doxygen/classllvm_1_1MSP430MCInstLower.html) lowers MachineInstr to MCInst. Together with standard LLVM RA/PEI this is the current same-object compiler union.

TI's official [MSP430 GCC guide](https://www.ti.com/lit/ug/slau646f/slau646f.pdf) records `--relax/--no-relax`; its compiler guide states EABI/ELF/DWARF. This is a strong external comparator, but it cannot manufacture a missing LLVM state action.

## Witness and N2 test

The proposed premise requires two legal same-information paths differing in *code-model/form/RA* state. The source pin instead fixes static relocation absent an explicit model and exposes no target late relaxation/form-selection state after RA. The remaining possible divergence is ordinary allocation, spill, frame adjustment, or linker relaxation—each is respectively generic RA/PEI, target frame lowering, or outside LLVM's frozen action path. There is therefore no LoongArch/APX-like forced witness, and no target-specific state/transition system from which an exact/FPT/Pareto guarantee can be named. A DP would be generic RA/ILP or cost-table tuning.

**Decision:** `DROP__OBJECT_PREMISE_COLLAPSES_TO_GENERIC_RA_FRAME_OR_EXTERNAL_LINKER`. This is a structural same-object/current-union decision, not an inference from missing implementation, results, resources or AI readiness.

**Finite 72-hour killer:** any future rescreen must source-pin a current target-specific post-RA form/relax action, show two legal fixed-MachineIR/EABI/relocation paths forced apart from the complete stock union, then certify a target-specific Pareto/approximation state space over public MSP430 tests and full CPU/RSS/bytes/spill/frame/cycle denominator. Fail on generic solver/tuning, changed ABI/relocation, no strict witness, or direct collision. It was not run.
