# Exact public anchor

## A01 — glibc ISO C thread-specific storage destruction boundary

- exact object: GNU C Library current ISO C `tss_t` / `tss_dtor_t` lifecycle.
- primary current anchor: [glibc ISO C Thread-local Storage](https://sourceware.org/glibc/manual/latest/html_node/ISO-C-Thread_002dlocal-Storage.html).
- project/current version context: glibc 2.43 current documentation.
- frozen endpoint: a fixed thread/key/value trace, destructor side effects at `thrd_exit`, the non-effects of `tss_delete`/process `exit`, and bounded destructor iterations.
- natural carrier: C11 threaded programs using per-thread library state and a `tss_dtor_t` cleanup function.

This anchor is a locator; it does not claim a current implementation absence.
