# Exact anchor — S68-A01

- Identity: Linux futex2 `futex_waitv()` user API and current kernel `kernel/futex/waitwake.c`.
- URLs: https://www.kernel.org/doc/html/v6.6/userspace-api/futex2.html ; https://github.com/torvalds/linux/blob/master/kernel/futex/waitwake.c
- Date: accessed 2026-08-15.
- Object: one fixed `futex_waitv` vector (1–128 addresses, expected values and flags), timeout/signal outcome and returned wake index.
- Same-object guarantee: same vector values/order, return index/error/wake semantics and ordering; no replacement synchronization API or altered observable endpoint.
- Anchor question: is a non-generic registration/visibility action left after the vector contract and native multiwait implementation are fixed?
