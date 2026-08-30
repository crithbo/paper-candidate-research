# Exact public anchor

## A100-01

- Exact identity: POSIX.1-2024 `pthread_rwlock_rdlock()` and `pthread_rwlock_tryrdlock()` on one initialized read-write lock and a fixed reader/writer arrival trace.
- Version/date: The Open Group Base Specifications Issue 8 / POSIX.1-2024, retrieved 2026-08-15.
- Primary source: <https://pubs.opengroup.org/onlinepubs/9799919799/functions/pthread_rwlock_rdlock.html>.
- Observable endpoint: read acquisition or block/failure conditioned on active/blocked writers, with the specified recursive read-lock and error behavior.
- Anchor status: fixes the native synchronization contract; it is neither a novelty claim nor an implementation-absence claim.

