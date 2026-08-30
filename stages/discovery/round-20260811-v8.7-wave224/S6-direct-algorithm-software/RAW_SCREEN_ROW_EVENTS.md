# Raw screen row events

| Row | First-party evidence | Frozen fact / action implication | Outcome |
|---|---|---|---|
| R1 | WebAssembly Core Specification | Module validation fixes types/control constraints; integers in the binary encoding use LEB128. | retain for depth |
| R2 | LLVM `WebAssemblyRegStackify` source | LLVM’s stackification pass is explicitly a code-size optimization for temporary values. | retain for depth |
| R3 | Binaryen upstream | `wasm-opt` loads, transforms, and re-emits Wasm; its Stack IR and multi-pass optimizer are native same-object comparators. | retain for depth |
| R4 | Binaryen pass overview | `CoalesceLocals` performs liveness-based local reuse and copy removal, described as a register-allocation pass; Binaryen also supports structured-expression transformations. | strong union component |
| R5 | WABT upstream + standard | WABT supplies stock binary-reading/tooling, while the standard fixes validator/runtime semantics. | oracle route |
| R6 | Source/collision closure | Exact current LLVM/Binaryen/WABT revisions, all exposed and default/nondefault options, and primary same-object joint-construction collision are not fully closed. | `NOT_ADMITTED_UNFROZEN` |

R6 is not an absence assertion. No missing action is inferred from a future-work statement or incomplete source enumeration.
