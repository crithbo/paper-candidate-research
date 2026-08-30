# Anchor-first public anchor

## A01 — RISC-V Zawrs, Version 1.01

- Exact public anchor/version: RISC-V ratified `Zawrs` extension, Version 1.01, observed 2026-08-15.
- URL: https://docs.riscv.org/reference/isa/unpriv/zawrs.html
- Frozen object envelope: an RV64 program with an LR/SC polling loop and the same C/C++ atomic, ISA, and visible synchronization semantics.
- Immutable boundary: inserting `WRS.NTO` or `WRS.STO` must neither change the required atomic ordering nor assert a stronger liveness/timeout guarantee than the ISA permits.
- One decision that could change: whether a target-specific, non-generic code-generation construction exists rather than a wait/retry policy.
- Precommitted primary source route: official RISC-V Zawrs specification plus current LLVM RISC-V usage/support documentation. Transport-only fallback: current GCC RISC-V options documentation.

This anchor is a locator, not a statement of absence, novelty, or Q2 potential.
