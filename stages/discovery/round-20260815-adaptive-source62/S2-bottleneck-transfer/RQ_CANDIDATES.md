# RQ candidates — Source62 S2

| ID | Primary same-object RQ | Hypothesis | Cheapest falsifier | Status |
|---|---|---|---|---|
| RQ-S62-01 | For a fixed Node SEA and platform, can a target-specific preparation-blob snapshot/code-cache/asset constructor improve build plus cold-start full cost beyond current SEA construction? | `COMPILER_TOOL`, possible N2 | It only selects `useSnapshot`, `useCodeCache`, asset mapping or existing exec flags. | ORDINARY_CLOSURE |
| RQ-S62-02 | For a fixed V8 context/heap semantics, can a target-specific snapshot constructor improve serialize plus deserialization cost under the stock embedder API? | `SYSTEM_ARCHITECTURE`, possible N2 | It depends on unspecified embedder/external-state behavior rather than a frozen native action. | ORDINARY_CLOSURE |
| RQ-S62-03 | For fixed Julia user-image/runtime behavior, can a target-specific system-image plus multi-version metadata constructor improve image-build/startup full cost beyond stock selection? | `COMPILER_TOOL`, possible N2 | It only selects CPU targets/clone heuristics/options. | ORDINARY_CLOSURE |

No alternative RQs were needed. These are not raw admissions or scientific claims.
