# All-history five-field identity preflight

- Frozen surface: `plan.md` SHA256 `9931165B9E819B0C1D5B2847157388B140818474CB2673239DE6339A1E70D89F`; `registry.yaml` SHA256 `CB6D95F6FF6627DF2F6609F392DD83900CFF905E5B6567AA532FC366077391A8`.
- Bounded terms: `thread::scope`, `thread scope`, `scoped thread`, `scoped_thread`, `jthread`, `quick_exit`, `at_quick_exit`, `process::exit`, `rust thread`.
- Result: no exact canonical identity found. The held rustc coroutine queue is a different compiler state-layout object and was not read or used.

| Field | Relation | Reason |
|---|---|---|
| Object | NONE | No Rust `thread::scope` lifecycle object match. |
| Action / estimand | NONE | No scoped completion-frontier construction match. |
| Endpoint | NONE | No fixed automatic-join/TLS endpoint match. |
| Guarantee | NONE | No matching borrowed-lifetime contract. |
| Full cost | NONE | No matching scope completion boundary. |

Mechanical disposition: `NO_MATCH__NO_NOVELTY_OR_ABSENCE_INFERENCE`.
