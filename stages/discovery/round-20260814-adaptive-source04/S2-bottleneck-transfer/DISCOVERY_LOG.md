# S2 adaptive-source04 — nonlocal two-plan witness preflight

Canonical v8.7 only; V9 OFF. This pilot required two complete, target-specific and same-object legal plans before depth. GlobalISel, MLIR vector, generic solvers, flags/pass ordering, and Source01–03 identities were excluded.

| row | family | two-plan witness | disposition |
|---|---|---|---|
| F01 | Clang LTO CFI type-test/layout ↔ linker check code | For one fixed C++ virtual-call program and CFI acceptance/trap contract, Plan A uses a contiguous vtable region with a byte-array type test; Plan B uses a different legal vtable/bit overlap placement with the same type-test result for every fixed target. | DROP: current CFI design/ByteArrayBuilder/link-time type metadata already owns the complete constructor. |
| F02 | LLVM MemProf context cloning ↔ allocator hot/cold handoff | Same profiled ThinLTO program and executable semantics: Plan A retains a shared allocation wrapper with ambiguous metadata; Plan B clones its call context and passes the same hot/cold interface to the allocator. Both are complete legal compilation plans. | DROP: current MemProf context-disambiguation explicitly builds the graph, identifies clones, applies them and rewrites allocation calls. |
| F03 | Clang SafeStack classification ↔ runtime unsafe-stack frame | Candidate plans safe/unsafe partition versus all-safe frame do not preserve the same overflow-isolation guarantee; the latter is not a legal witness. | PRE_RAW_REJECT__SAME_GUARANTEE_FAILS. |
| F04 | HWASan stack-tag assignment ↔ AArch64 tag codegen | Per-alloca independent tags versus current base-plus-retag alters tag-collision/detection behavior; it does not freeze the same sanitizer guarantee. | PRE_RAW_REJECT__SAME_GUARANTEE_FAILS. |
| F05 | Clang EH cleanup CFG ↔ personality/unwinder representation | Itanium landingpad and Windows funclet/SJLJ forms change ABI/personality and unwinder contract; no same-object two-plan witness. | PRE_RAW_REJECT__ABI_SEMANTICS_DIFFER. |
| F06 | GCC split-stack prologue ↔ morestack runtime | Split and fixed-stack routes differ in segment-growth/overflow behavior and linker/runtime contract; no same-object two-plan witness. | PRE_RAW_REJECT__RUNTIME_SEMANTICS_DIFFER. |

Counts: raw=6; fresh unique=6; two-plan witnesses admitted=2; deep reviews=2; clean briefs=0.

The two witness-qualified rows are direct current-union absorptions. The other four fail before depth because their proposed alternative changes a security, ABI, or runtime guarantee—not because an implementation, result, resource, or AI capability is missing.
