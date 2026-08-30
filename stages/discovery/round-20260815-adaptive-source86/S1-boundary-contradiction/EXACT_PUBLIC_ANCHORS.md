# Exact public anchor

## A01 — POSIX cancellation cleanup stack and Linux/glibc interface

- exact object: POSIX.1-2024 cancellation cleanup handlers, instantiated by the current Linux pthread cleanup interface.
- immutable endpoint: a fixed C thread's cancellation/`pthread_exit` trace, observable cleanup handler side effects, LIFO scope order, and terminal `PTHREAD_CANCELED`/exit result.
- frozen date: 2026-08-15.
- primary anchor: [POSIX.1-2024 Thread Cancellation Cleanup Handlers](https://pubs.opengroup.org/onlinepubs/9799919799/functions/V2_chap02.html).
- current implementation-facing anchor: [Linux man-pages `pthread_cleanup_push(3)`](https://www.man7.org/linux/man-pages/man3/pthread_cleanup_push.3.html), Linux man-pages 6.18.
- current upstream source locus for a later implementation-specific closure if needed: glibc `nptl/pthread_cancel.c` / cleanup runtime; no implementation-absence claim is made in this cycle.
- natural carrier: C programs that establish cleanup handlers around cancellation points to release locks or restore thread-local invariants.

The anchor was frozen before the primary RQ and is not evidence of a residual.
