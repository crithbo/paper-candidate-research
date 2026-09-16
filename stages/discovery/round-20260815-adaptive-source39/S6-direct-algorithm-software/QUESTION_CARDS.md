# Source39 question cards

## QC-01: SPARC delay-slot fill / restore combination

- **Identity:** fixed SPARC MachineFunction, branch/restore semantics, ABI and
  stock generated-code behavior.
- **Current-source locus:** LLVM exposes `createSparcDelaySlotFillerPass`; its
  source records filled-slot accounting, a default-enabled filler and restore
  combinations.
- **Carrier/oracle/full cost:** stock LLVM assembler/disassembler; public
  SPARC test route; compile CPU/RSS/temp, code bytes and later execution cost.
- **Disposition:** `STRUCTURAL_DROP__CURRENT_UNION_ABSORPTION`.

## QC-02: Lanai delay-slot hazard-aware fill

- **Identity:** fixed Lanai MachineFunction/control-flow semantics.
- **Current-source locus:** LLVM Lanai filler scans instructions, rejects
  hazards/side effects and inserts an instruction or NOP.
- **Carrier/oracle/full cost:** stock LLVM assembler/disassembler; finite
  Lanai tests; compile CPU/RSS/temp and code bytes.
- **Disposition:** `STRUCTURAL_DROP__CURRENT_UNION_ABSORPTION`.

