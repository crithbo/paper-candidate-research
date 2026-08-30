# Raw screen row events

| Row | Exact object | Disposition | Rationale |
|---|---|---|---|
| EARLY-01 | Rust `track_caller` indirect-call coercion | `EXCLUDED_BEFORE_RAW__CHANGED_ABI_OR_DOCUMENTED_HINT_ENDPOINT` | The official contract ties actual-location loss to hiding an implicit ABI argument from a function-pointer type. Preserving it requires changing that representation/endpoint; reusing the shim is no contribution. |

This is a structural same-object decision, not a statement about implementation readiness, diagnostic usefulness, or attainable performance.
