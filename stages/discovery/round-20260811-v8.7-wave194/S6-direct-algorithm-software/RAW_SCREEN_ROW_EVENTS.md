# Raw screen row events

| family | fixed logical object and stock oracle | disposition |
|---|---|---|
| DWARF DIE/abbrev assignment | same debug entities/ranges/source locations; `llvm-dwarfdump --verify` plus debugger-facing DWARF semantics | candidate-grade deep review |
| MLIR bytecode tables/use-lists | same MLIR operation/type/attribute graph; stock MLIR deserialization/verifier | candidate-grade deep review |
| ECMA-335 metadata heaps/tables/coded indices | same CLI metadata/API and runtime reflection semantics; stock metadata reader | candidate-grade deep review |
| DEX identifier/index/debug-data assignment | same Android bytecode/metadata and verifier/runtime semantics; AOSP reader/verifier route | candidate-grade deep review |
| Rust rmeta | compiler-private metadata object lacks frozen stable public stock reader contract | `NOT_ADMITTED_UNFROZEN` |
| Swift module binary | current producer/reader and format contract not frozen as a public stable same-object checker route | `NOT_ADMITTED_UNFROZEN` |

