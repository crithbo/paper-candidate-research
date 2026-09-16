# Raw screen row events

| family | primary evidence | screen disposition |
|---|---|---|
| veriT fine-grained SMT preprocessing | Current proof-producing solver and published fine-grained preprocessing rules/checker ecosystem. | candidate-grade deep review |
| SCIP exact MIP + VIPR certificate | Exact mode produces a certificate checkable by VIPR/formally verified CakeML checker. | candidate-grade deep review |
| SoPlex rational LP presolve/exact solve | Native presolving and exact rational solution exist; independent proof/lifting checker route not frozen. | `NOT_ADMITTED_UNFROZEN` |
| CAQE certifying QBF | Certifying QBF solver with preprocessing as an explicit concern. | candidate-grade deep review |
| QRATPre+ QBF preprocessing | QRAT/QRAT+ preprocessing is a proof-system-level direct collision. | candidate-grade deep review |
| certified MaxSAT preprocessing | 2024 work already supplies end-to-end proof checking for broad preprocessing transformations. | `STRUCTURAL_DROP__DIRECT_SAME_OBJECT_PREPROCESSING_CERTIFICATION_COLLISION` |

