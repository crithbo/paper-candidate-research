# Exact public anchor

## A01 — pthread_atfork callback sequence

- Exact identity: `pthread_atfork(prepare,parent,child)` callbacks and a fixed multithreaded process/fork trace.
- Immutable endpoint: same callback side effects, lock ownership, parent and child state at fork return, and callback registration/order contract.
- Official standard locator: <https://pubs.opengroup.org/onlinepubs/9799919799/functions/pthread_atfork.html>.
- Official current glibc documentation locator: <https://sourceware.org/glibc/manual/> (version 2.43 published as latest); glibc’s `_Fork` documentation confirms `_Fork` intentionally does not invoke `pthread_atfork` handlers.
- Natural carrier: multithreaded POSIX applications and libraries using fork handlers to establish post-fork consistency.

The POSIX page returned HTTP 403 in this bounded browser route; this is recorded only as source-access telemetry. The anchor is not a current-absence claim.
