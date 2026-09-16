# Exact public anchor

## A99-01

- Exact identity: POSIX.1-2024 `pthread_barrier_wait()` on a fixed initialized barrier and fixed participating thread set.
- Version/date: The Open Group Base Specifications Issue 8 / POSIX.1-2024, retrieved 2026-08-15.
- Primary sources: <https://pubs.opengroup.org/onlinepubs/9799919799/idx/functions.html> and <https://pubs.opengroup.org/onlinepubs/9799919799/xrat/V4_xsh_chap01.html>.
- Observable endpoint: a waiting set reaches the required number; exactly one unspecified participating thread receives the serial-thread result, other threads receive zero, and the barrier is reusable/reset under the specified contract.
- Anchor status: fixes the native semantic object only; it is not a novelty or absence claim.

