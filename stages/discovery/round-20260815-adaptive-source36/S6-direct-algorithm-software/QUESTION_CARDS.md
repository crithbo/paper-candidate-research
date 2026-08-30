# Source36 question cards

## QC-01: RISC-V Zilsd load/store pairing

- **Identity:** fixed RISC-V non-vector MachineFunction, memory dependence
  semantics, ABI, enabled Zilsd and generated-code behavior.
- **Current-source reality:** `RISCVZilsdOptimizer.cpp` says the pass combines
  32-bit load/store pairs into 64-bit operations, first rescheduling/forming
  pairs before allocation and then repairing invalid pairs after allocation.
- **Oracle / carrier:** stock LLVM assembler/disassembler and public LLVM
  RISC-V test route.
- **Full cost:** compile CPU/RSS/temp, code size, register pressure and later
  run cost under separately authorized hardware.
- **Canonical disposition:** `STRUCTURAL_DROP__CURRENT_UNION_ABSORPTION`.
  The proposed complete action is already described by the current target pass;
  no independent target-specific guarantee was frozen.

## QC-02: RISC-V Zacas ABI fix

- **Identity:** fixed atomic compare-exchange IR, target ABI and program
  semantics.
- **Current-source reality:** LLVM exposes `createRISCVZacasABIFixPass`; current
  RISC-V documentation further records ABI-compatibility restrictions on
  compiler generation of certain Zacas operations.
- **Oracle / carrier:** stock LLVM IR verification, assembler/disassembler and
  public atomic test route.
- **Full cost:** compile CPU/RSS/temp, code bytes and later execution cost.
- **Canonical disposition:** `STRUCTURAL_DROP__CURRENT_UNION_ABSORPTION`.
  The candidate is a current ABI legalization pass, not an independently frozen
  whole constructor.

