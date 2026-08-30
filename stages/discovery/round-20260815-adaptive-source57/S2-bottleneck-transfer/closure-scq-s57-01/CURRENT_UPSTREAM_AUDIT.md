# Current upstream audit — Wasmtime v45.0.0 GC recursive types

| Surface | Pinned source evidence | Effect on frozen closure |
|---|---|---|
| GC validation/type-section entry | `crates/environ/src/compile/module_environ.rs:284-334` | Validates the type section, then processes and interns each recursion group. |
| Module-level representation | `crates/environ/src/module_types.rs:10-160` | `ModuleTypes` stores interned types and recursion-group ranges/indexes. |
| Runtime canonical registry | `crates/wasmtime/src/runtime/type_registry.rs:35-84, 113-174, 459-600` | All module types are interned; a whole rec group is hash-consed and becomes shared runtime type indices. |
| Runtime usage rewrite | `type_registry.rs:163-170` | Module and environment entities are canonicalized to `VMSharedTypeIndex` for runtime use. |
| Strongest contrary | Same registry/type-table code | The exact recursive-group canonicalization action is already stock; table/order/hash variants are generic interning policy. |

The v45.0.0 tree response was complete (`truncated=false`) and only selected paths inside the assignment's frozen scopes. No repository-wide absence claim is made.
