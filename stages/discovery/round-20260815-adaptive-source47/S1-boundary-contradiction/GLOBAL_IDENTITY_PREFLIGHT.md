# Global five-field identity preflight

| RQ / seed | Five-field signature | Relation | Disposition |
|---|---|---|---|
| RQ01 AArch64 CASP | fixed pair-atomic program; CASP/form action; C/C++ atomic endpoint; same target/ABI; code+atomic/full cost | `NO_MATCH__NOT_NOVELTY_EVIDENCE` | source-check eligible |
| RQ02 PowerPC HTM | fixed HTM+C++ exception program; abort/transition action; ABI-visible endpoint; same PowerPC target; code+runtime/full cost | `NO_MATCH__NOT_NOVELTY_EVIDENCE` | source-check eligible |
| S03 Ztso | fixed C++ atomic lowering | `TERMINAL_CONTAINS` | excluded seed |
| S04 Wasm exception tag | engine ABI materialization | `BOUNDED_HISTORICAL_IDENTITY__NO_DELTA` | excluded seed |
| S05 AArch64 MOPS | fixed memmove MOPS construction | `SOURCE46_EXACT_IDENTITY__NO_DELTA` | excluded seed |
| S06 CUDA graph update | graph visibility construction | `RELATED_OR_HISTORICAL_GRAPH_CONTROL` | excluded seed |

Mandatory controls Source45 MLPerf active-prebrief and Source44 RVV-VXRM active-revision1 were not selected or reopened.
