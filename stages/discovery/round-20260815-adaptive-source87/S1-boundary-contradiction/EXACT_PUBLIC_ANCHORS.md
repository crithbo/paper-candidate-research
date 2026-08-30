# Exact public anchor

## A01 — GNU C Library normal termination and `atexit`

- exact public object: glibc current normal-termination / `atexit` semantics for a fixed C process.
- frozen version/date: glibc current stable 2.43 (2026-01-23 release status), documentation accessed 2026-08-15.
- primary anchor: [glibc Cleanups on Exit](https://sourceware.org/glibc/manual/latest/html_node/Cleanups-on-Exit.html).
- contrary anchor: [glibc Termination Internals](https://sourceware.org/glibc/manual/latest/html_node/Termination-Internals.html).
- normative compatibility anchor: [POSIX `atexit`](https://pubs.opengroup.org/onlinepubs/9699919799/functions/atexit.html).
- natural carrier: C libraries register cleanup at normal process termination for application-visible resource release.

The anchor fixes normal `exit`/return-from-`main` behavior, handler effects, registration order, and distinction from `_Exit`; it does not assert a current implementation absence.
