# Target-family screen

| ID | Exact target-specific direction | Joint action shape | Status |
|---|---|---|---|
| R1 | AArch64 SVE/SME | mode/ZA lifetime + predicate/register assignment + spill/reload | `FINITE_FIDELITY_GAP_BRIEF` |
| R2 | ARM Thumb-2 | IT/control lowering + register/scavenger assignment | `NOT_ADMITTED_UNFROZEN`: likely ordinary RA/lowering |
| R3 | SystemZ | addressing mode + register pair + spill/reload selection | `NOT_ADMITTED_UNFROZEN`: target union/collision not closed |
| R4 | LoongArch | immediate/materialization + register allocation + branch relaxation | `NOT_ADMITTED_UNFROZEN`: generic composition risk |
| R5 | Hexagon | packet formation + register assignment + predication | `NOT_ADMITTED_UNFROZEN`: union/witness not closed |
| R6 | WebAssembly | local allocation + stackification + control shape | `STRUCTURAL_DROP`: reviewed compositional union family |
| R7 | AArch64 SVE (non-SME) | vector-length/predicate lowering + spilling | `NOT_ADMITTED_UNFROZEN`: folded into R1 scope if SME absent |

No line is rejected because a result, implementation or hardware is missing.
