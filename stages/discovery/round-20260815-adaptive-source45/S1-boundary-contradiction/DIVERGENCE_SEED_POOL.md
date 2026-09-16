# Source45 — offline seed pool

Seeds were generated before evidence lookup. They are not claims of novelty or paper potential.

| ID | Engine / perspective | Tension and cautious conclusion-first test | Pre-evidence disposition |
|---|---|---|---|
| S01 | `JANUSIAN_TENSION` / x86 backend engineer | MXCSR makes dynamic floating-point rounding observable, while AVX-512 may encode some rounding per instruction. If viable, a same-result call-graph construction would have to respect the floating environment rather than select a fast-math flag. | selected RQ01 |
| S02 | `CONSTRAINT_MANIPULATION` / PowerPC backend engineer | MMA accumulator groups are expensive architectural state while call lowering partitions functions. A candidate must preserve fixed MMA results/ABI through a whole-function constructor, not simply choose registers. | selected RQ02 |
| S03 | `BISOCIATION_STRUCTURAL_TRANSFER` / Arm backend engineer | SVE fault-first loading produces first-fault state whose observation may be separated from later calls. A legal construction would retain data/fault semantics, not alter fault handling. | selected RQ03 |
| S04 | `NEGATION_OR_INVERSION` / compiler engineer | A deoptimization continuation treats caller/callee state as compositional; reversing the cut asks whether ABI preservation creates a non-generic code-generation residual. | control locator |
| S05 | `ABSTRACTION_LADDER` / runtime engineer | A component engine’s stack-switch boundary can be viewed as ABI state instead of scheduling policy, but only with a fixed engine and public carrier. | control locator |
| S06 | `COMPOSE_DECOMPOSE_SIMPLIFY` / ISA engineer | RISC-V Zicond can replace a branch with a conditional form, but the question survives only if it entails more than feature/form selection. | control locator |

Coverage uses six engines and six perspectives. No evidence-based reselection occurred.
