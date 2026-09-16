# Current-upstream reality check — S83-RQ-01

| Facet | Evidence | Result |
|---|---|---|
| Cross-TU action | Clang Users Manual: codegen-data is read to outline more effectively across translation units | current native action |
| Linker composition | Same documentation: generated outlined functions can be optimized by conventional ICF, with `-Wl,--icf=safe` example | current native composition |
| Whole-constructor mechanism | Current MachineOutliner controls include global outlining; 2025 LLVM project material describes Global Function Merger leveraging ICF | direct same-mechanism collision |
| Candidate endpoint | code-size reduction while retaining compiled program semantics | shared endpoint |

This is not an absence claim. The documented and source-visible current union already covers the proposed outline-plus-ICF construction; changing only its scoring, thresholds, or schedule would be tuning/controller work.
