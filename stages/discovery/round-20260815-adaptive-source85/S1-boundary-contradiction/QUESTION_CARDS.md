# Question card

## QC01 — PostgreSQL NOTIFY transaction-commit delivery/visibility

| field | frozen content |
|---|---|
| canonical signature | `POSTGRESQL_NOTIFY__TRANSACTION_COMMIT_DELIVERY_VISIBILITY__FIXED_LISTENER_ORDER_ENDPOINT__POSTGRESQL_ASYNC_FULL_COST` |
| exact object | Current PostgreSQL `NOTIFY`/`LISTEN` semantics and stock async notification path. |
| same-object endpoint | For a fixed sender/listener transaction trace: listener-observed channel, payload, duplicate folding, ordering, abort invisibility, and permitted delivery point. |
| native action | Emit `NOTIFY`; commit or abort sender transaction; listener commits/aborts its own transaction; server folds same channel/payload inside one transaction and delivers stock notifications. |
| current strongest union | Current documentation plus `async.c`: sender notifications are delivered only if its transaction commits; a listener in a transaction receives only after that transaction ends; same-payload/channel notices in one transaction fold; distinct notices preserve sender order and cross-transaction notices follow commit order. Capacity configuration changes queue capacity, not this endpoint contract. |
| minimum survival trace | T1 emits N then aborts; T2 emits N then commits while L is in a transaction; L ends its transaction. Any candidate publication before T2 commit, from T1, or while L remains in its transaction fails the fixed endpoint. |
| natural carrier/oracle | Stock server with application notification traffic; server/client transaction boundary plus current documentation/source constitute the native semantic oracle. |
| full-cost initial denominator | sender/server CPU, async queue occupancy, listener latency after legal delivery point, transaction CPU/RSS, and any additional storage/coordination. |
| finite falsifier | Within 72h Stage0 could construct the two-transaction trace above and inspect documented/stock behavior; any candidate that must publish at a prohibited boundary is falsified before performance measurement. |
| current-upstream reality | Official current docs and current `async.c` source locus were checked. No absence claim is made; capacity flags/configuration do not establish a semantic action gap. |
| disposition | `EXCLUDED_BEFORE_RAW__COMMIT_DELIVERY_BOUNDARY_IS_OBSERVABLE_OR_GENERIC_NOTIFICATION_DISPATCH` |

The card is excluded for a structural reason, not for missing implementation, result, hardware, or AI readiness.
