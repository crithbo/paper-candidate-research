# Exact public anchor

Anchor: current Rust Reference type-layout contract, observed 2026-08-15.

- <https://doc.rust-lang.org/stable/reference/type-layout.html>
- <https://doc.rust-lang.org/nomicon/other-reprs.html?highlight=repr>
- <https://doc.rust-lang.org/stable/nightly-rustc/src/rustc_abi/layout.rs.html>

The Reference distinguishes `Rust`, `C`, primitive, and transparent representations. `repr(C)` specifies a target C-compatible layout algorithm, while Rust representation makes only soundness-required layout guarantees. The rustc source view locates the layout/niche machinery. These are anchor/current facts, not proof of a missing optimization.
