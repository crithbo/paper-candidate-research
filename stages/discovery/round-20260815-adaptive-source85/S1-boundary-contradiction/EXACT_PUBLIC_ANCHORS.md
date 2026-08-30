# Exact public anchor

## A01 — PostgreSQL asynchronous notification commit boundary

- exact public object: PostgreSQL 18 current `NOTIFY` / `LISTEN` asynchronous-notification semantics and the current upstream implementation locus `src/backend/commands/async.c`.
- frozen date: 2026-08-15.
- primary anchor: [PostgreSQL current NOTIFY documentation](https://www.postgresql.org/docs/current/sql-notify.html).
- contrary/consumer anchor: [PostgreSQL current LISTEN documentation](https://www.postgresql.org/docs/current/sql-listen.html).
- source locus: [current upstream `async.c`](https://github.com/postgres/postgres/blob/master/src/backend/commands/async.c).
- natural carrier: database applications use `NOTIFY` to signal listeners after committed changes; the stock server and client transaction boundary are the carrier and oracle.

The exact public anchor, version family, same-object endpoint, and bounded official route are frozen before the RQ.
