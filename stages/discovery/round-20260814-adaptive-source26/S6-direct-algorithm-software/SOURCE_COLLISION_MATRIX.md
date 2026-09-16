# Source26 Current-Union and Collision Matrix

| ID | Exact family | Current official union / opposite evidence | Same-object result | Collision status | Disposition |
|---|---|---|---|---|---|
| QC01 | LLVM AArch64 pair/address construction | Post-RA source includes matching scans, pairing, update/offset/UMOV folds and register renaming; unwind order constrained. | Fixed MIR semantics plausible, but an atomic global action/guarantee was not closed. | Primary algorithmic collision is `SEARCH_BOUNDED_OPEN`; no absence claim. | LOCATOR_ONLY |
| QC02 | LLVM AArch64 SME streaming/ZA construction | Function attrs, SMEABIPass and obligatory compatibility transitions; registry Wave280 has same family absorption. | Repeat opportunity family. | Direct project collision. | EXCLUDED_BEFORE_RAW |
| QC03 | LLVM AArch64 SVE tail/predicate construction | LoopVectorize and AArch64 TTI enumerate tail/epilogue modes, reductions, recurrences, reverse and threshold options. | Same loop semantics, but proposed difference is a policy restatement. | Current union plus generic-kernel subtraction fatal. | STRUCTURAL_DROP |
| QC04 | MLIR/SPIR-V cooperative matrix fragment construction | Type/op and spec legality expose scope, layout, stride and uniformity as explicit semantic constraints. | Fixed target/producer/action union missing. | `SEARCH_BOUNDED_OPEN`; direct collision not claimed absent. | LOCATOR_ONLY |

The matrix uses only official current source/docs/specification routes and an internal registry dedup reference. “Not closed” is not global absence.
