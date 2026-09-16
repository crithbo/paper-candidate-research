# Candidate-grade deep reviews

## D1 — Rust FFI unwind ABI

- Exact object/function: an FFI function declaration/definition with fixed argument/result ABI and a fixed caller-visible panic/foreign-exception contract.
- Current reality snapshot: the [Rust Reference ABI rules](https://doc.rust-lang.org/reference/items/functions.html#extern-function-qualifier) distinguishes unwinding (`Rust`, `C-unwind`, suffix `-unwind`) from non-unwinding ABIs.  Its current behavior table makes `C` versus `C-unwind` observably different at an unwind boundary; the [panic rules](https://doc.rust-lang.org/stable/reference/panic.html) identify wrong-ABI foreign unwind as undefined behavior.  This is specification-level current evidence, not an implementation-absence assertion.
- Native two-action witness: the same source signature may be written with `extern "C"` or `extern "C-unwind"`; both declarations are legal, but an escaping panic/foreign exception has abort/UB behavior in the former and permitted propagation in the latter.
- Strongest union and direct subtractor: rustc's declared ABI/panic model plus the reference's boundary table already select and define this outcome; no compiler pass gap is claimed.
- Six dimensions: the plans differ in decision rule, information, resource behavior and most importantly the observable safety/cleanup guarantee. They therefore do **not** compare the same fixed guarantee. Any repair is ABI/attribute selection or a wrapper.
- Disposition: `DROP__SAME_OBJECT_GUARANTEE_DIFFERS__DECLARATION_SELECTOR`.
- StageA killer had it survived: compile a minimal Rust/C++ FFI boundary with one escaping panic and verify the fixed declared ABI, cleanup trace, exit behavior and full compile/runtime cost. This is not scheduled because the structural gate already fails.

## D2 — Windows x64 SEH unwind-info construction

- Exact object/function: one x64 PE function with fixed instructions, calling convention, exception/debug recovery contract and function-table coverage.
- Current reality snapshot: [Microsoft's current x64 exception-handling specification](https://learn.microsoft.com/en-us/cpp/build/exception-handling-x64?view=msvc-170) requires function table/unwind data for nonleaf functions and specifies that the dispatcher reconstructs the caller by undoing recorded prologue operations. It documents canonical `.pdata/.xdata` production and the chained-unwind form. Default and nondefault source/config routes remain source-bounded rather than an absence claim.
- Native two-action witness: for a fixed save/stack-allocation sequence, a producer can use direct `UNWIND_INFO` codes or a permitted chained representation; both yield the same restored context when legal.
- Strongest union/direct subtractor: stock compiler/assembler lowering already owns prologue choice and metadata emission. The remaining construction is generic encoding/layout selection, not a target-specific algorithm with a distinct guarantee.
- Full-cost and finite falsifier: a prospective 72h route would use public compiler tests and `dumpbin`/PE parsing to verify unwind recovery, while accounting for compile CPU/RSS, bytes, prologue uops and unwind-table bytes. If an encoding is either rejected or no smaller/better under the same context-recovery oracle, it kills the claim.
- Disposition: `DROP__GENERIC_METADATA_ENCODING_OR_CURRENT_LOWERING_COMPOSITION`.

No deep item satisfies the non-generic same-object N1/N2/N3 admission shape. Missing runtime results played no part in either disposition.
