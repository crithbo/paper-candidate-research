# Raw screen row events

| Order | Item | Event | Rationale | Counts as raw? |
|---|---|---|---|---|
| 1 | S70-01 / QC-S70-01 | `EXCLUDED_BEFORE_RAW__GENERIC_KERNEL_OR_CHANGED_GUARANTEE` | Current rustc already owns async-drop glue; changing ordering/liveness/deallocation violates fixed semantics, while preserving them leaves generic glue-elision/scheduling. | no |

No evidence-qualified raw item, C0/D1, deep review, or clean brief was created. Seeds/RQ/backlog remain outside the raw denominator.
