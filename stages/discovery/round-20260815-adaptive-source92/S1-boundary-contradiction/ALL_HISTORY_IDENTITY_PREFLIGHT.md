# All-history five-field identity preflight

- Lookup surface: `plan.md` SHA256 `09BCDB24E82702D840E24FFCC2653BD008197A608471EE3A92AB3B09747BEF9F` and `registry.yaml` SHA256 `778CCB74EFDA8DF2CBA5A63150A1BE5CC45AC001D76184AB2457CA8B220DD006`.
- Bounded terms: `pthread_atfork`, `atfork`, `fork handler`, `prepare handler`, `parent handler`, `child handler`.
- Result: no matching canonical identity/certificate in the frozen lookup surface.

| Field | Relation to historical identity | Reason |
|---|---|---|
| Exact object | NONE | No registered `fork()` handler-order object was found. |
| Atomic action / estimand | NONE | No registered handler-order construction was found. |
| Claim endpoint | NONE | No fixed child-execution endpoint match was found. |
| Semantic guarantee | NONE | No matching POSIX fork-child contract was found. |
| Full-cost boundary | NONE | No matching handler/recovery cost boundary was found. |

- Frozen direct current collision: NO at preflight; subsequent primary evidence established a structural semantic constraint, not a historical identity collision.
- Mechanical disposition: `NO_MATCH`; this is explicitly **not** evidence of novelty or current absence.
