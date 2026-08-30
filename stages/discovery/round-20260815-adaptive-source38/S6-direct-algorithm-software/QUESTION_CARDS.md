# Source38 question cards

## QC-01: M68k MOVEM multi-register construction

- **Identity:** fixed M68k MachineFunction, ABI, callee-save/spill semantics
  and stock generated-code behavior.
- **Current-source locus:** LLVM M68k target directory lists
  `M68kCollapseMOVEMPass`, described as operating on a multi-register move.
- **Oracle / carrier:** stock LLVM assembler/disassembler and finite M68k test
  route.
- **Full cost:** compiler CPU/RSS/temp, code bytes, register-pressure and later
  execution costs.
- **Evidence result:** current specialized pass is direct absorption of the
  proposed representation construction.
- **Disposition:** `STRUCTURAL_DROP__CURRENT_UNION_ABSORPTION`.

## QC-02: M68k stack-adjustment construction

- **Identity:** fixed M68k frame/ABI/function behavior.
- **Current-source locus:** M68k frame lowering source declares stack adjustment
  using LEA, SUB or ADD.
- **Oracle / carrier / full cost:** stock assembler/disassembler, finite LLVM
  M68k route; compile CPU/RSS/temp, bytes and frame size.
- **Evidence result:** the candidate remains ordinary target frame selection;
  no independent target-specific full constructor/guarantee was frozen.
- **Disposition:** `STRUCTURAL_DROP__CURRENT_UNION_ABSORPTION_OR_SELECTOR`.

