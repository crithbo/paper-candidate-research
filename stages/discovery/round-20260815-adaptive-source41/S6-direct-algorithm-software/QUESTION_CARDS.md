# Source41 question cards

## QC-01: AVR ABI frame construction

- **Identity:** fixed AVR MachineFunction, ABI, stack/callee-save semantics and
  stock generated-code behavior.
- **Current-source locus:** LLVM declares `createAVRFrameAnalyzerPass`; AVR
  frame lowering implements prologue/epilogue and callee-save spill/restore.
- **Carrier/oracle/full cost:** public AVR LLVM test route; stock
  assembler/disassembler; compile CPU/RSS/temp, bytes and stack frame size.
- **Disposition:** `STRUCTURAL_DROP__CURRENT_UNION_ABSORPTION`.

## QC-02: AVR shift expansion

- **Identity:** fixed AVR shift semantics and generated behavior.
- **Current-source locus:** LLVM declares an AVR shift expansion pass.
- **Carrier/oracle/full cost:** public AVR test route; stock assembler and
  semantic equivalence; compile CPU/RSS/temp and code bytes.
- **Disposition:** `STRUCTURAL_DROP__CURRENT_UNION_ABSORPTION_OR_SELECTOR`.

