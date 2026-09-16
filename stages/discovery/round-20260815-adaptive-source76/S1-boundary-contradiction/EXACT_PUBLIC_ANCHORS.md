# Exact public anchor

Anchor: Rust Reference, current `#[track_caller]` code-generation contract, observed 2026-08-15.

- <https://doc.rust-lang.org/stable/reference/attributes/codegen.html?highlight=track_call>
- <https://doc.rust-lang.org/error_codes/E0737.html>

The reference says Rust implements the attribute by appending an implicit ABI parameter. Coercion to a function pointer creates a shim because the parameter is not in the function-pointer type; that shim intentionally loses the actual caller information across virtual calls in order to preserve soundness. This is an anchor and contrary contract, not an absence claim.
