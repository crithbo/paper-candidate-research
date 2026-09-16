# Raw screen row events

| Row | Exact object | Disposition | Reason |
|---|---|---|---|
| EARLY-01 | fixed Rust `repr(C)` exported enum/struct and C reader | `EXCLUDED_BEFORE_RAW__CHANGED_FFI_LAYOUT_OR_PRESCRIBED_REPR_ACTION` | Rust niche/layout freedom is not an ABI-preserving alternative inside the fixed C layout contract. Changing representation changes the same-object endpoint; retaining it is the prescribed layout algorithm. |

No implementation, resource, or empirical outcome was used as negative evidence.
