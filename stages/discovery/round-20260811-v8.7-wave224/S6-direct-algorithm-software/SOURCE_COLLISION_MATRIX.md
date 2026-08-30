# Source and collision matrix

| Role | First-party source | Support | Boundary |
|---|---|---|---|
| Semantics | [WebAssembly Core Specification](https://webassembly.github.io/spec/core/) | Core module, validation, execution, and binary-format rules. | Does not establish producer union. |
| Index width | [WebAssembly binary values](https://webassembly.github.io/spec/core/binary/values.html) | Unsigned integers use unsigned LEB128. | Width freedom alone is not N2. |
| LLVM comparator | [LLVM WebAssemblyRegStackify source](https://llvm.org/docs/doxygen/WebAssemblyRegStackify_8cpp_source.html) | Native stackification is primarily a code-size optimization. | Need commit-pinned flags/path union. |
| Binaryen comparator | [Binaryen upstream](https://github.com/WebAssembly/binaryen) | Stack IR, wasm-to-wasm `wasm-opt`, multi-pass optimization, and liveness-based `CoalesceLocals`. | Full pipeline/options and direct-collision audit remain open. |
| Reader/tooling | [WABT upstream](https://github.com/WebAssembly/wabt) | Public native binary-toolkit route. | Not a proof of runtime equivalence alone. |

## Collision conclusion

No collision-free conclusion is claimed. LLVM stackification and Binaryen’s same-object local coalescing/Stack IR are direct structural comparators. A proposal requires a commit-pinned compositional-union audit and a non-generic joint guarantee that is not absorbed by these mechanisms.
