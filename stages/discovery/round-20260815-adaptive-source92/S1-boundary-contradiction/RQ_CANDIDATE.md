# S92-S1-RQ01 — POSIX fork-handler ordering under a fixed child-execution contract

- Assignment / lane: Source92 / S1.
- Divergence seed: `S92-S1-01`.
- Exact public anchor: The Open Group, POSIX.1-2024 `fork()` function page, accessed 2026-08-15: <https://pubs.opengroup.org/onlinepubs/9799919799/functions/fork.html>.
- Stable object and guarantee: a multithreaded POSIX program calling `fork()`, with the specified child process and post-fork restrictions unchanged.
- Contribution-type hypothesis: `SYSTEM_ARCHITECTURE`, N2.

## Primary RQ

For one fixed multithreaded POSIX program and its `fork()`/child observable semantics, can a target-specific complete construction choose a different `pthread_atfork` handler/recovery ordering that reduces handler/recovery full cost without widening the legal child-operation set or changing the required parent/child effects?

- FINER-lite: Feasible CONDITIONAL; Interesting CONDITIONAL; novelty threat HIGH; ethical/scope PASS; relevant CONDITIONAL.
- Alternative/null: the legal post-fork restriction fixes the only semantic boundary; any remaining handler ordering is generic synchronization or changes the lifecycle contract.
- Precommitted primary route: POSIX.1-2024 official `fork()` page.
- Transport-only fallback: official POSIX function index pointing to the same versioned function family.
- Pre-RQ closure nomination: `ORDINARY_CLOSURE`; strong-model route not requested.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE` before source review; final evidence disposition is recorded in the Question Card.
