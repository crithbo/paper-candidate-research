# Canonical raw screening events

| Row | Family | Raw status | Decision | Reason |
|---|---|---|---|---|
| R45-01 | Vulkan sparse resource binding | `EVIDENCE_QUALIFIED_RAW` | `STRUCTURAL_DROP` | only page/bind/queue policy composition; no target-specific whole action or bounded guarantee |
| R45-02 | OpenMP rectangular target transfer | `EVIDENCE_QUALIFIED_RAW` | `STRUCTURAL_DROP` | all described actions are stock rectangle/copy/dependency calls or a scheduler |
| R45-03 | Kokkos cross-memory view materialization | `EVIDENCE_QUALIFIED_RAW` | `STRUCTURAL_DROP` | stock mirror/deep-copy contract leaves generic packing or API selection |

No result-aware replacement occurred. No source closure item remains: the three cards reached a contract-based structural decision rather than an unexecuted source gap.
