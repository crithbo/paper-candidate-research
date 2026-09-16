# R16B S6 canonical v8.7 log

This canonical record was completed before any V9 shadow record. It is a
bounded official-source screen, not an experiment or performance result.

| Family | Canonical disposition | Reason / ceiling |
|---|---|---|
| Tesseract DAWG | `NOT_ADMITTED_UNFROZEN` | The official tools establish reader-equivalent wordlist/DAWG semantics, but a current complete `wordlist2dawg` action/config union and primary collision matrix remain finite closure work. |
| HarfBuzz subset | `STRUCTURAL_DROP` | The official subset API already makes GSUB glyph-layout closure an explicit native default action (with a no-closure flag). The proposed generic closure constructor has no distinct same-object N2 kernel. |
| SUNDIALS Jacobian | `NOT_ADMITTED_UNFROZEN` | Official upstream establishes the solver family, but source-level sparse-pattern/preconditioner union and a target-specific non-generic guarantee are not frozen. |
| Gecode extensional | `STRUCTURAL_DROP` | Official documentation already exposes DFA/TupleSet extensional propagators, domain consistency, compact-table and layered-graph variants. The candidate's generic representation/propagation kernel is directly absorbed. |

Canonical proposals: **0**. No shadow information was consulted.
