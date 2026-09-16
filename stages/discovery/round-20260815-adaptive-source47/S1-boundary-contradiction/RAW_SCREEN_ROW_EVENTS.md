# Raw screen row events

| Signature | Disposition | Reason |
|---|---|---|
| `AARCH64_CASP__FIXED_PAIR_ATOMIC__SAME_MEMORY_ORDER__FORM_CONSTRUCTION` | `EXCLUDED_BEFORE_RAW__GENERIC_ATOMIC_LOWERING` | Current LSE lowering already selects native single-instruction atomics; proposed residual names no CASP-specific guarantee. |
| `POWERPC_HTM__FIXED_CPP_EXCEPTION_ENDPOINT__ABORT_TRANSITION_CONSTRUCTION` | `EXCLUDED_BEFORE_RAW__GENERIC_ABORT_RECOVERY` | Candidate names no target-specific invariant beyond generic abort/cleanup/recovery. |

No evidence-qualified raw, deep review, or Stage 0 brief.
