# S94-S1-RQ01 — Rust scoped-thread completion frontier

- Exact anchor: Rust standard library `std::thread::scope`, version 1.97.1 (`8bab26f4f`, 2026-07-14), <https://doc.rust-lang.org/stable/std/thread/fn.scope.html>.
- Stable object / contract: one Rust program using `thread::scope`; borrowed-data safety, automatic joins, panic behavior and documented TLS-destructor boundary are held fixed.
- Contribution hypothesis: `SYSTEM_ARCHITECTURE`, N2.

## Primary RQ

For a fixed Rust scoped-thread program, can a target-specific whole-scope completion construction reduce scope-end full cost while preserving the documented automatic-join and post-return TLS-destructor semantics, rather than merely scheduling existing joins?

- Alternative/null: joining earlier/later is generic task scheduling; waiting for TLS destructors changes the documented completion boundary.
- FINER-lite: Feasible CONDITIONAL; interesting CONDITIONAL; novelty threat HIGH; scope PASS; relevant CONDITIONAL.
- Primary route: official Rust std documentation; transport fallback only: linked official source page.
- Pre-RQ closure: ordinary; no selective nomination.
