# Source and Collision Audit

## Frozen input verification

| Input | Required SHA-256 | Verified |
|---|---|---|
| Brief | `DABDC067...153ADE` | yes |
| Collision matrix | `AD28C63D...E3ADD3` | yes |
| Discovery log | `57AE8B80...E1B861` | yes |
| Discovery handoff | `18BB98D1...1E75DE` | yes |

## First-party current-source findings

| Source | Finding | Consequence |
|---|---|---|
| [MLIR Vector dialect](https://mlir.llvm.org/docs/Dialects/Vector/) | nested current lowering, flattened 1-D and mixed `vector.cast` alternatives; concrete static/dynamic index, shuffle and memory tradeoffs | valid action family but all alternatives must be target/pipeline legal |
| [MLIR Vector dialect](https://mlir.llvm.org/docs/Dialects/Vector/) | MLIR does not intend explicit RA/spill modeling; target costs are abstract ranking costs | prohibits physical-spill exactness claim at MLIR |
| [MLIR Passes](https://mlir.llvm.org/docs/Passes/) | many vector-to-LLVM/SCF/target conversion options; some imply assumptions/UB or target change | full legal option grid is mandatory baseline |
| [LLVM VPlan analysis](https://llvm.org/doxygen/VPlanAnalysis_8cpp_source.html) | computes register usage and spill/reload cost from target register availability | direct subtractor for vector factor/unroll/register budget selector |

## Collision conclusion

No deployed same-object MLIR-stage method was found that has all of: complete frozen target representation/cast action catalog, bounded target-specific exact/FPT/certified frontier, same MLIR-to-LLVM contract, and full-cost guarantee. `SEARCH_BOUNDED_OPEN` remains; no absence inference is made.

The Discovery brief is narrowed, not confirmed wholesale: VPlan makes a generic register-pressure plan contribution insufficient. Only a representation-boundary algorithm with a VPlan-separated witness remains reviewable.

