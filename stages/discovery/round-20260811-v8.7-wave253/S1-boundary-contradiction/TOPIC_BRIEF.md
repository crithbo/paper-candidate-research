# S1-W253-PPC-PPDP

N2: exact trace-level PPC Prefix-Pressure Pareto DP jointly chooses legal prefixed address form, materialized-address live range, RA/coalescing/spill and relocation-cost state. Same MachineIR/ABI/ISA baseline is complete current LLVM PowerPC composition. Natural LLVM PowerPC tests, compiler+objdump+relocation+unwind oracle, and full compile/link CPU/RSS, bytes/relocs/spills/uops/runtime costs are frozen. StageA killer: strict Pareto residual on 10–20 public tests; stop on illegality or zero residual. Tier B conditional; no implementation/result claim.
