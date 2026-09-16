# Source / collision matrix — Wave274

| facet | first-party evidence | finding |
|---|---|---|
| LLVM target / relocation | [MSP430 TargetMachine source](https://llvm.org/docs/doxygen/MSP430TargetMachine_8cpp_source.html) | default effective relocation is static; target registers ISel and AsmPrinter, not a special code-model/relax pass |
| LLVM frame / ABI costs | [FrameLowering](https://llvm.org/docs/doxygen/classllvm_1_1MSP430FrameLowering.html) | current union owns prologue/epilogue, call-frame and callee-save actions |
| LLVM MC | [MCInstLower](https://llvm.org/doxygen/classllvm_1_1MSP430MCInstLower.html) | MachineInstr-to-MC path exists; no targeted late constructor found |
| external comparator | [TI GCC guide](https://www.ti.com/lit/ug/slau646f/slau646f.pdf), [TI compiler guide](https://www.ti.com/lit/ug/slau132t/slau132t.pdf) | GNU relaxation and EABI/ELF/DWARF are current contract dimensions, not absence proof |
| direct collision | primary search found no verified MSP430-specific whole-trace N2 paper | bounded search is not a novelty proof; no witness exists to admit a brief |
