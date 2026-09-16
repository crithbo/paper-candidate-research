# Source Origin Use — Source27 S5

## Frozen source capsules

| Capsule | Exact origin (not an admission claim) | Allowed carrier | Intended non-generic question space | Cooldown check |
|---|---|---|---|---|
| `S5_HERDTOOLS7_ARCH_MEMORY_MODEL_LITMUS` | Official Herdtools7 repository; latest non-prerelease release or `main` selected at 2026-08-14 | one architecture `.cat` model and public litmus set with stock checker/counterexample | architecture-model-specific action/guarantee or counterexample consequence | distinct from Source25/26 SPIR-V/Binaryen/Yosys surfaces |
| `S5_RISCV_SAIL_FORMAL_SPEC` | Official RISC-V Sail repository; latest official release or `main` selected at 2026-08-14 | official model configuration plus stock emulator/theorem-prover counterexample | RISC-V configuration-specific formal action/guarantee | distinct from Source25/26 generic-formal-wrapper surfaces |

The capsules are provenance-controlled starting points only. They supply neither novelty nor a residual. Herdtools7 and Sail mature tools, their own constructors, and generic solver/prover calls are restricted to carrier, comparator, or contrary-evidence roles.

## Pre-lookup selection constraint

At most three selected locators may be checked. Each must differ from every other selected locator on at least two of exact object, contribution type, atomic action/estimand, carrier, and falsifier. No re-entry into a Source25/26 same surface is proposed.
