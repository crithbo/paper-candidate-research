# Exact public anchor

## S63-A01

- Exact public identity: OpenMP API Specification 5.2, nowait clause, HTML section 15.6, specification git revision `95b2e3a44`.
- URL: https://www.openmp.org/spec-html/5.2/openmpse94.html
- Frozen date: 2026-08-15; official specification.
- Tentative object: one C/C++ OpenMP `target nowait` region and its generated target task, with the fixed OpenMP task-dependence and completion contract.
- Immutable guarantee boundary: same program-visible data, dependences, task completion and OpenMP semantics; no changed device, runtime, or API guarantee.
- Anchor question: once the region is allowed to defer, is a non-generic, target-runtime-specific complete action still available, rather than just a communication/task scheduler?
- Primary route: the above specification, then LLVM/OpenMP first-party runtime documentation/source. Fallback is transport-only and was not used.

This anchor is only a locator; it neither asserts current absence nor novelty.
