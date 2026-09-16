# Raw screen row events

| row | signature | gate event | outcome | reason |
|---|---|---|---|---|
| R01 | `POSTGRESQL_NOTIFY__TRANSACTION_COMMIT_DELIVERY_VISIBILITY__FIXED_LISTENER_ORDER_ENDPOINT__POSTGRESQL_ASYNC_FULL_COST` | RQ and question card complete | `EXCLUDED_BEFORE_RAW__COMMIT_DELIVERY_BOUNDARY_IS_OBSERVABLE_OR_GENERIC_NOTIFICATION_DISPATCH` | Commit/abort, listener-transaction deferral, and ordering/dedup are fixed endpoint guarantees; remaining batching is generic dispatch. |

No row entered evidence-qualified raw.
