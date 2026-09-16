# Exact public anchor — S65-A01

- Identity: Linux Kernel current Restartable Sequences documentation.
- URL: https://docs.kernel.org/userspace-api/rseq.html
- Date: accessed 2026-08-15; official Linux Kernel documentation.
- Exact object: one Linux rseq ABI V2 thread, its registered `struct rseq`, and one preemptible/signal-deliverable rseq critical section with fixed start, post-commit and abort boundary.
- Immutable semantics: the same per-CPU update result; the same rseq abort/restart behavior and ABI compatibility; no replacement with a lock/atomic API or changed concurrency guarantee.
- Anchor question: does the ABI leave a target-specific complete construction, rather than an ordinary compiler region-selection or scheduler decision?

Anchor only; no novelty or current-absence assertion.
