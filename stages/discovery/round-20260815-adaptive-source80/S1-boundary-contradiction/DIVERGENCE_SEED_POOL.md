# Divergence seed pool

The pool was generated offline before targeted evidence lookup. It is non-evidentiary and does not count as locator, raw, or opportunity-family evidence.

| Seed | Engine | Perspective | Sketch | Pre-evidence result |
|---|---|---|---|---|
| S01 | JANUSIAN_TENSION | runtime engineer | JNI critical-array access needs direct native bytes but constrains the VM’s GC progress. Could a same-endpoint placement constructor shorten critical regions? | Selected for convergence |
| S02 | CONSTRAINT_MANIPULATION | compiler engineer | Could nested primitive-array critical regions be ordered to preserve dataflow but reduce pin/GC-lock time? | Merged into S01 |
| S03 | PROBLEM_REFRAMING | application author | Could copying only the live subrange replace a critical pointer earlier? | Not selected: changes action/data-transfer semantics |
| S04 | NEGATION_OR_INVERSION | VM maintainer | Could the VM defer unpin until a later safe point without altering the native view? | Not selected: VM policy/controller, not a contribution |
| S05 | ABSTRACTION_LADDER | systems researcher | Could all Java-to-native bulk transfers be planned from one lifetime graph? | Not selected: generic scheduler shell |
| S06 | COMPOSE_DECOMPOSE_SIMPLIFY | performance reviewer | Could `Get<Type>ArrayElements`, regions, and critical access form a same-object Pareto construction? | Not selected: API-mode/quality boundary changes |

S01 preserves the distinct boundary question: native direct-access duration versus VM GC progress under the fixed JNI critical-region contract.
