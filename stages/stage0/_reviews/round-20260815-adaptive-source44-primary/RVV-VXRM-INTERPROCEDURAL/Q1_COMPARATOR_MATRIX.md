# RVV-VXRM-INTERPROCEDURAL — Comparator and Q2 Matrix

| Comparator / collision class | Same-object coverage | What it already absorbs | Residual test | Result |
|---|---|---|---|---|
| LLVM `RISCVInsertWriteVXRM` at `10b4fa5b79eb9d27b4928ad82afa3847762bc72f` | Same RVV backend and CSR writes | Intra-MachineFunction forward/backward available/anticipated placement and redundant writes | Does it carry a fixed internal callee's RNE exit across a call? Source sets every call to `Unknown`. | Narrow action gap, not proof of novelty. |
| LLVM RVV lowering + RA + `RISCVInsertVSETVLI` | Same compiler target | Intrinsic lowering, register allocation and VL/VTYPE state handling | Revision must include all interactions and cannot count VSETVLI-only change. | Must compose. |
| LLVM explicit VXRM intrinsics | Same backend facility, different frozen program mode | Direct read/write operations | Frozen object excludes them; a revision must reject any hidden observation/inline asm. | Boundary, not residual. |
| psABI vector calling convention | Same ABI | `vxrm`/`vxsat` non-preservation and unspecified entry | Internal implementation summary must not strengthen the external ABI contract. | Legality gate. |
| Generic interprocedural dataflow / finite-state call-graph DP | Broad algorithmic subtractor | Summary propagation and ordinary cost minimization | Need native action-path bijection plus RVV-specific state/cost and non-generic guarantee. | Fatal if equivalent. |
| GCC/V-extension rounding operand and generic RVV codegen literature | Nearby compiler mechanism | Per-instruction rounding operand support, local lowering, generic scheduling/vectorisation | None showed the frozen LLVM stock call-edge transfer action and guarantee in bounded search. | `SEARCH_BOUNDED_OPEN`; no absence claim. |

## Fair strongest composition

The Stage A comparator must use the same LLVM pin and same IR/call graph/ABI/VLEN/numeric inputs. It must include ordinary `-O` defaults and all documented non-default choices that alter inlining, IPA/IPRA, machine scheduling, VSETVLI and VXRM writing; every configuration is charged for compile CPU/RSS, code bytes, CSR writes, frame/spill changes and runtime/uop proxy. A candidate loses if the same point arises from this union without the proposed frontier algorithm.

## Q2 judgement

`TIER_B_Q2_VIABLE` is conditional on the single revision gate because the work can become a target-specific compiler N2 contribution only if it proves a non-generic call-edge residual. Four states alone, a better pass heuristic, ordinary dataflow, or parameter tuning is below Q2.
