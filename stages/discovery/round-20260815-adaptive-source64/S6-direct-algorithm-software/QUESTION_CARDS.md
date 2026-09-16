# Source64 evidence-qualified question card

## QC01 — Rust closure capture inference

- **Exact identity:** fixed Rust closure body, local types, edition, trait bounds, borrow checker result, diagnostics and runtime behavior. The stock oracle is current rustc type checking plus execution/trait behavior.
- **Candidate shape:** jointly select capture paths and capture modes to reduce closure storage/borrow cost while preserving all fixed semantics.
- **Current docs/source reality:** the current Rust Reference defines capture paths and the ordered capture modes `ImmBorrow < UniqueImmBorrow < MutBorrow < ByValue`; it specifies shared-prefix escalation, capture precision, call traits, `Send`/`Sync`/`Clone`/`Copy`, and capture-dependent drop order. It separately specifies Edition 2018 whole-variable capture. Current `rustc_hir_typeck::upvar` documentation identifies the live producer locus as upvar borrow-kind inference and documents escalation from immutable to unique immutable/mutable borrow.
- **Action-survival assessment:** two syntactically possible capture plans are not an admissible same-object witness when they differ in borrow checking, inferred closure type, auto traits, drop timing, migration warning or edition behavior. The Reference explicitly makes these output semantics of capture, rather than an optimization objective.
- **Contrary / direct fatal:** a global capture selector would either emit the language-prescribed result or change the accepted program/diagnostic/trait/drop endpoint. Treating the latter as equal because executable output happens to match would weaken the frozen exact object.
- **Natural carrier / full cost:** Rust compiler UI/run-pass closure tests and public edition-versioned crates; compile CPU/RSS/temp, diagnostics, closure bytes/layout, trait behavior, runtime and drop-order cost.
- **72h killer:** on one documented disjoint-capture example, a changed capture mode/path must change a borrow/trait/drop observable or reproduce the source-defined inference result.
- **Disposition:** `STRUCTURAL_DROP__CAPTURE_IS_FIXED_TYPE_BORROW_TRAIT_DROP_AND_EDITION_SEMANTICS`.

No evidence-qualified raw survives. This is not a judgment about implementation availability, experimental result, resources, or AI readiness.
