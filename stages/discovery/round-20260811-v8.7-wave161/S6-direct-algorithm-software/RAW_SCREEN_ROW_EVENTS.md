# Raw-screen row events

| family | native checker/verifier | initial action witness | final disposition |
|---|---|---|---|
| DepQBF QRP/BQRP | QRPcheck | resolution derivation/deletion trace ordering | NOT_ADMITTED_UNFROZEN |
| OpenTheory article | OpenTheory abstract machine / verified HOL checker | stack-machine command ordering and shared theorem state | NOT_ADMITTED_UNFROZEN |
| Lean `.olean` | `leanchecker`/kernel | module-environment declaration sequence | STRUCTURAL_DROP |
| Rocq/Coq `.vo` | kernel type checker | proof-script/event dependency sequence | STRUCTURAL_DROP |
| ACL2 book `.cert` | `include-book` certificate validation | book event/certification dependency sequence | STRUCTURAL_DROP |
| Isabelle proof term/theory | Pure kernel proof checker | reconstructed proof-term/inference sequence | STRUCTURAL_DROP |

All six are distinct from excluded Alethe, PB checked-deletion, AIGER, and DRAT/LRAT lines. No item is rejected for implementation, results, resources, or AI readiness.
