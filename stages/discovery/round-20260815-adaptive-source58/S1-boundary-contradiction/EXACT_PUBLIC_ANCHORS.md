# Exact public anchor

## A01 — WebAssembly Component Model Canonical ABI `post-return`

- Public anchor/version-date: `WebAssembly/component-model`, `design/mvp/CanonicalABI.md`, default branch observed 2026-08-15.
- URL: https://github.com/WebAssembly/component-model/blob/main/design/mvp/CanonicalABI.md
- Fixed object: a synchronous component-model lower/lift call chain with canonical result ownership and the ABI-specified `post-return` cleanup contract.
- Fixed endpoint: same component-visible return/result ownership, resource cleanup semantics, binary ABI, and legal call order.
- Primary route: Canonical ABI source then current `bytecodealliance/wasmtime` component lowering/runtime source. Fallback is current Wasmtime API documentation for `CanonicalOptions`.

This anchor merely identifies a producer–consumer ownership seam; it does not establish that current code lacks a construction.
