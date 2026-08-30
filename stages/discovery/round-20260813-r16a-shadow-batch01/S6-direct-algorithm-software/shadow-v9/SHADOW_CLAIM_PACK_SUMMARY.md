# R16A S6 V9 shadow summary

| Family | Canonical disposition | Shadow disposition | Shadow-only refinement |
|---|---|---|---|
| rr trace constructor | `NOT_ADMITTED_UNFROZEN` | `DEEP_DIVE_REQUIRED` | Separates event-stream and checkpoint boundaries, but source/action closure is still required. |
| rustc CGU constructor | `NOT_ADMITTED_UNFROZEN` | `DEEP_DIVE_REQUIRED` | Records partition/linkage coupling as a claim-pack interface rather than evidence of a residual. |
| Souffle relation index | `STRUCTURAL_DROP` | `C1_PARTIALLY_COVERED_NARROWED__SHADOW` | Records the official automatic combinatorial index selection as a direct coverage predicate. |
| OpenJDK C2 constructor | `NOT_ADMITTED_UNFROZEN` | `DEEP_DIVE_REQUIRED` | Makes transform/schedule coupling explicit, without asserting an absent current action. |

These V9 labels are isolated observations only. They do not revise canonical
v8.7 status or create a candidate.
