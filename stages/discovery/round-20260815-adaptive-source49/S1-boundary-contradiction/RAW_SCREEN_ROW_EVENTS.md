# Raw events

No new raw was admitted. Consequently Source44 ownership-bridge dispositions do not apply: that bridge is required for **new raws only**, not for rejected RQs.

| Signature | Disposition | Typed reason |
|---|---|---|
| `AARCH64_FPCR__FIXED_STRICT_FP_CALLGRAPH__STATE_TRANSITION` | `EXCLUDED_BEFORE_RAW__GENERIC_DYNAMIC_FP_ENVIRONMENT` | no target-specific guarantee beyond constrained-FP state placement |
| `POWERPC_FPSCR__FIXED_STRICT_FP_CALLGRAPH__STATE_TRANSITION` | `EXCLUDED_BEFORE_RAW__GENERIC_DYNAMIC_FP_ENVIRONMENT` | same generic kernel after current contract subtraction |
| `LOONGARCH_FCSR__FIXED_STRICT_FP_CALLGRAPH__STATE_TRANSITION` | `EXCLUDED_BEFORE_RAW__GENERIC_DYNAMIC_FP_ENVIRONMENT` | target register operation exists; no target-specific algorithm named |
