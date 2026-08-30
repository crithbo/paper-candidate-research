# Research-question candidate

## `S1-91-RQ01`

For a fixed C11 thread/key/value trace and thread-exit endpoint, can a glibc-specific constructor reduce TSS cleanup CPU/RSS/latency while preserving exactly when destructors run, their side effects, and the bounded iteration semantics?

There is no genuine same-object alternative: moving cleanup to `tss_delete`, process `exit`, another thread, or a global manager changes the fixed lifecycle/observer. Ordinary closure only; selective depth was off.
