# Raw screen row events

| event | first-party evidence | disposition |
|---|---|---|
| Indexed object | LLVM specifies indexed profiles as `llvm-profdata` output and function data as an on-disk hash table. | fixed same object |
| Compatibility boundary | LLVM documents backward compatibility for indexed profiles; header offsets/version fields and profile variants constrain a legal writer. | fidelity boundary |
| Native layout divergence | Distinct legal bucket/record layout may be possible only if all offsets, keys, records and extension sections are regenerated and stock readers/PGO consumers agree. | representation witness only |
| N2 admission | Current source commit, all writer options and direct primary collision matrix were not fully closed in this review. | `NOT_ADMITTED_UNFROZEN` |

No generic hash choice, record ordering, external delta, compression, wrapper or controller is counted as a profile-specific N2.
