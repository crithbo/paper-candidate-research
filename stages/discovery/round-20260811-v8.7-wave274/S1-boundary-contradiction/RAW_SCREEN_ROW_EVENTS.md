# RAW_SCREEN_ROW_EVENTS — Wave274

| event | source-pinned observation | effect |
|---|---|---|
| E01 | LLVM MSP430 target-machine source defines effective relocation as `Reloc::Static` when unspecified. | no LLVM code-model/relax choice is exposed by this object. |
| E02 | The target initializes MSP430 DAG-to-DAG ISel and MSP430 AsmPrinter; the target machine inherits ordinary codegen pass configuration. | fair union contains stock ISel, generic RA/coalescing/spill/PEI, frame lowering and MC emission. |
| E03 | Current MSP430 frame lowering implements prologue/epilogue, call-frame pseudo elimination and callee-save spills/restores. | frame costs are already target-owned actions. |
| E04 | MSP430 MC lowering converts MachineInstr to MCInst. | there is no independently frozen late form/relax optimizer in LLVM. |
| E05 | TI's official GNU guide exposes linker relaxation, while TI EABI uses ELF/DWARF. | external toolchain behaviour is a subtractor, not evidence that LLVM lacks a same-object action. |
