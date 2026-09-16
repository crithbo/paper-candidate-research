# Exact public anchor

## A102-01

- Exact identity: POSIX.1-2024 robust `pthread_mutex_t`, owner-death acquisition through `pthread_mutex_lock`, `pthread_mutex_consistent`, and unlock on a fixed protected application state.
- Version/date: The Open Group Base Specifications Issue 8 / POSIX.1-2024, retrieved 2026-08-15.
- Primary source: <https://pubs.opengroup.org/onlinepubs/9799919799/functions/pthread_mutex_lock.html>.
- Observable endpoint: a new owner receives `EOWNERDEAD` while holding the mutex, either restores its protected state and calls `pthread_mutex_consistent`, or unlocks without it to mark the state nonrecoverable.
- Anchor status: freezes the standard recovery contract, not an implementation-absence or novelty claim.

