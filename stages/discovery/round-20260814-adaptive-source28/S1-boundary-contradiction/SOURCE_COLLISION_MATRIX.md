# Source / collision matrix

| RQ | Exact contract | Current locus | Strongest contrary | Outcome |
|---|---|---|---|---|
| RQ-S01/BF16 placement | fixed BF16/FP32 semantics, ABI and ISA | current LLVM RISC-V support/documentation | no target-specific state/constraint distinguishes placement from normal conversion selection | `GENERIC_KERNEL` |
| RQ-S02/physical storage buffer | valid SPIR-V physical addressing, explicit layout and unchanged ABI | current Khronos SPIRV-Tools parser/validator/optimizer route | any remaining construction is an optimiser/validator wrapper or changes pointer ABI | `GENERIC_WRAPPER_OR_SOLVER` |

No paper limitation, issue, resource failure or missing main result is used as scientific negative evidence.

