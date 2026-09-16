# UNIQUE_OPPORTUNITY_FAMILIES

Six fresh objects were kept separate at the opportunity-family level: LLVM IR definedness, return-register leakage mitigation, Linux cross-thread barrier visibility, robust-futex exit recovery, ELF dynamic-loader namespace binding, and RISC-V reservation-set wait hints. They do not reuse Source08’s DWARF call-site debug object, Wasm GC validation object or Zacas atomic-CAS object.

| Family | Final result |
|---|---|
| LLVM freeze / poison control use | `DROP` after depth |
| Clang zero-call-used-regs | `DROP` after depth |
| Linux membarrier | `DROP` at raw |
| Linux robust futex | raw-only / not promoted after depth allocation |
| ELF dlmopen | `DROP` at raw |
| RISC-V Zawrs | `DROP` at raw |

