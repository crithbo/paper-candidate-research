# Exact public anchor

## S70-01 — Rust nightly AsyncDrop

- Exact anchor: Rust `std::future::AsyncDrop`, rustdoc `std 1.97.1 (8bab26f4f, 2026-07-14)`, feature gate `async_drop` / tracking issue 126482. URL: <https://doc.rust-lang.org/std/future/trait.AsyncDrop.html>.
- Current source locus: nightly rustc `rustc_mir_transform/elaborate_drop.rs`, async-drop glue and `check_if_can_async_drop`. URL: <https://doc.rust-lang.org/stable/nightly-rustc/src/rustc_mir_transform/elaborate_drop.rs.html>.
- Current upstream implementation/genealogy: rust-lang/rust tracking issue 126482. URL: <https://github.com/rust-lang/rust/issues/126482>.
- Exact object: a fixed nightly Rust `AsyncDrop` type graph in an async scope, preserving implicit async destructor invocation, ownership/field-drop behavior, and deallocation only after `AsyncDrop::drop` finishes.
- Anchor question: does the fixed object admit a non-generic, semantics-preserving whole-type async-destructor constructor beyond rustc's current glue/liveness construction?
- Primary route: official rustdoc -> current rustc source -> current upstream tracking/codegen entry. No fallback was used.

The anchor is a locator, not evidence of absence, novelty, or quality.
