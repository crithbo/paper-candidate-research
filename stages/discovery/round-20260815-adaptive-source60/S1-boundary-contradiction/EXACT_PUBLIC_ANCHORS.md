# Exact public anchor

## A01 — RISC-V Zicond Version 1.0.0

- Exact public anchor/version: RISC-V Zicond Extension for Integer Conditional Operations, Version 1.0.0, observed 2026-08-15.
- URL: https://docs.riscv.org/reference/isa/unpriv/zicond.html
- Fixed object: a Zfinx/Zdinx RISC-V scalar floating-point select with unchanged LLVM IR/C semantics, ISA and target features.
- Fixed endpoint: exact selected value and normal compiler output legality; no altered arithmetic, ABI, or target feature set.
- Precommitted current route: LLVM RISC-V current support documentation and the current upstream commit that adds Zicond lowering for this select family.
