# Source64 primary RQ

## RQ01 — Rust closure capture inference

For a fixed Rust closure body, local types, edition, trait bounds and borrow/auto-trait semantics, can a target-specific whole capture-inference constructor jointly choose capture paths and capture modes while preserving the same accepted program, diagnostics and runtime traits, with a non-generic exact/FPT/Pareto guarantee beyond current `rustc` capture analysis?

**Counterfactual and minimum falsifier.** If a different capture changes closure type, borrow checking, auto traits, drop order, diagnostics or edition behavior, it changes the object. If all same-object choices are already the language-defined current precision rule, no residual survives. The official Rust reference and current rustc source route are the bounded primary materials.

No other seed is elevated: terminal/direct identities were excluded and reserves do not enter the scientific denominator.
