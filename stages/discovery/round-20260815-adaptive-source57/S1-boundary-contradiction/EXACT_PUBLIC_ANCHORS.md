# Exact public anchor

## A01 — WebAssembly Threads wait/notify, Draft 2023-10-10

- Exact public anchor/version: WebAssembly Specification, Release 2.0 + Threads, Draft 2023-10-10; public PDF observed 2026-08-15.
- URL: https://webassembly.github.io/threads/core/_download/WebAssembly.pdf
- Stable object envelope: one shared WebAssembly linear-memory instance whose programs use `memory.atomic.wait*` and `memory.atomic.notify`, retaining the specified atomic, timeout, and wake behavior.
- Candidate immutable endpoint: same visible return/status, same memory ordering, and required queue/wake semantics; no alternative host scheduling or weaker fairness claim is permitted.
- Primary source route: the public Threads specification then current `bytecodealliance/wasmtime` source. Transport-only fallback: current Wasmtime published documentation.

The anchor is a locator only; it does not establish a current-runtime gap or a publishable residual.
