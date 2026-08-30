# Research-question candidate

## `S1-87-RQ01`

- seed: S01 in `DIVERGENCE_SEED_POOL.md`.
- exact anchor: glibc current normal-termination/`atexit` documentation, fixed C process and exit status.
- contribution hypothesis: target-specific `N2`, conditional only.

Primary RQ: for a fixed C process, ordered `atexit` registration trace, normal `exit`/return-from-`main` endpoint, and observer-visible handler effects, can an exit-path constructor reduce cleanup CPU/RSS/latency while retaining reverse registration order and the documented separation from `_Exit`?

No same-object alternative was needed. Replacing normal termination with `_Exit`, reordering callbacks, or moving callbacks to a supervisor changes the endpoint. Ordinary closure route: current glibc documentation plus POSIX compatibility text; no selective packet.
