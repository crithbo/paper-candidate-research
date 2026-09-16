# Raw screen row events

| Row | RQ | Result | Reason |
|---|---|---|---|
| C0-01 | QC01 LLVM callbr / asm-goto | `NOT_ADMITTED_UNFROZEN` | Exact anchor and fixed semantics exist, but no target-specific complete N2 action or guarantee was frozen before raw; a generic RA/layout solver would violate the non-generic hard gate. |

This is not a negative result about feasibility, performance, or implementation readiness.
