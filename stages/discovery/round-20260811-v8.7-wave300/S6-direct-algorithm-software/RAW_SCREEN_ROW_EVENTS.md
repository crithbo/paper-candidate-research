# Raw screen row events

| family | stock verifier / exact contract | guarantee-first seed | disposition |
|---|---|---|---|
| ANTLR serialized ATN | runtime ATN deserializer; fixed grammar/language | size/load bound for version-compatible ATN construction | `NOT_ADMITTED_UNFROZEN` |
| Java StackMapTable writer | JVM verifier; fixed class behavior | bounded verification metadata construction | `NOT_ADMITTED_UNFROZEN` |
| Bison LR parser table | generated parser and grammar acceptance | exact/FPT parser-table state/action layout bound | `NOT_ADMITTED_UNFROZEN` |
| OpenJDK CDS archive | HotSpot loader; fixed class graph semantics | archive relocation/table locality guarantee | raw only: broad runtime union |
| GNU gettext MO catalog | libintl lookup; fixed catalog/plurals | verified hash/offset table theorem | raw only: prior object-family proximity |
| Wasmtime serialized cache | Wasmtime validator/runtime; fixed module semantics | verified artifact/fixup construction | raw only: Wasm-family dedup risk |

Format freedom, selectors, cache controls, generic ILP/DP/matching/packing and wrappers are excluded.
