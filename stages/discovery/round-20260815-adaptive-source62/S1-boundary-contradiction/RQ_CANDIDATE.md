# RQ candidate RQ01

- Exact anchor: MPI-4.1 partitioned point-to-point communication, 2023-11-02.
- Primary RQ before evidence: For a fixed MPICH partitioned request and fixed `Pready` trace, is there a non-generic request-state construction that changes publication grouping while preserving all MPI partition/completion semantics with a formal/full-cost guarantee?
- Same-object guarantee: same request, partition contents, matching, partial-completion and completion visibility.
- Contribution hypothesis: N2/system runtime, conditional only.
- Ordinary closure result: `EARLY_FATAL` — the currently stated decision is only when to schedule/transfer already-ready partitions; no transport-specific state, information restriction, or distinct guarantee is frozen.
