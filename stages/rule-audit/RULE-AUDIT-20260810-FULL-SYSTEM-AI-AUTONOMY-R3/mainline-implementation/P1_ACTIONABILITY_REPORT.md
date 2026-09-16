# R3 P1 Readable Shadow and Control-Plane Report

## Outcome

P1 shadow construction passed its readability/actionability checks and two dual-read cycles. It remains non-authoritative: `registry.yaml` is still the sole machine state source, and no topic was migrated by the shadow view.

## Common policy and normalized controls

- `rules/CORE_POLICY.md`: `30B24D069673DAD4EB555C5FC4DE4CCA6EB9D2108697BE7031FAEF75F9B42803`
- `rules/_shadow_v9/CONTROL_PLANE_SCHEMA.md`: `2A11DE0E18267A37B62046CC65BA5B34B17E9A4D3A1EB2B499BC5A80B0D07BF6`
- `templates/_shadow_v9/TOPIC_CONTRACT.yaml`: `FAFF8D6BEA22FD55BD9E512405709A8C053E506EFCD6384B0A6BD14344A16791`
- `templates/_shadow_v9/EVIDENCE_LEDGER.yaml`: `E15177515F120FFDC49C352EC0D7F659C1F1C43D4AEBA8E4593EB02042F4E451`
- `templates/_shadow_v9/AUTONOMY_AND_USER_BUDGET.yaml`: `C534080D483AA580E032907ED670776BEAFC335D5DE70AFA05EF48056CEEFD1C`
- `templates/_shadow_v9/HANDOFF.yaml`: `86C4F18A6B33B786EFAD42FBC56F15E8AD98822BBA65F98F5161340BB570C901`

## Role actionability

Every role passed 9/9 checks: mission; authority/write boundary; ordered workflow; decision procedure/table; evidence/claim ceiling; blocker/revision/failure handling; output/handoff; readable length; explicit anti-drift prohibitions/examples.

| Shadow role | SHA-256 | Result |
|---|---|---|
| Mainline | `21B613CCA3D74B6BA8B3E7FADF1FE7390676971A930C17F8450873CCA01B0A60` | 9/9 |
| Discovery | `FFB457FB44B8CF993B40C5D0C0121800DFD7C4CA0F0B7F2FF002DC6620FCB0A1` | 9/9 |
| Candidate Owner | `6A4E69A29DBDA513A3A4474724D62909938E341A8945508129736878EC914EE0` | 9/9 |
| Stage0 Review | `480B5DA5BF736DBE6452CE3B5EC30FFB665E71338FFA2E7052FBB6C7CB707C9C` | 9/9 |
| StageA Review | `45FAC1A43208286892C9F7D1DED43164F1D7E02FA7EFD2E80D719003F89C21F5` | 9/9 |
| StageB Independent Review | `751D4ABFD02FA0F4D5B6C9D7EC4B96DBD963A209C1E955F9445AA470E9F66DF2` | 9/9 |
| Discovery Backtest | `796E6A3BF19E0942DE657FF226B154ECFF780F3F354BCF758EA7A51F192F0E88` | 9/9 |
| Rule Audit | `6DCF71AD3B37D9DF73E02369E03F925056BF21163E0EC27FE5792C4E208F6D5E` | 9/9 |

The role files retain local mission, permissions, sequence, decisions, blocker/revision rules, outputs and examples. They are not thin indexes into CORE or templates.

## Dual-read cycles

`P1_DUAL_READ_CYCLES.yaml` SHA-256 `739D39D2D3C43F38E11B0D3C2A57AD07AF0739429F1D11EB5964746E746FB920` records:

1. AIGER Stage0→StageA: authoritative composite status maps deterministically to topic/science/execution/assignment/lane axes with no decision change.
2. R4 scheduling cutover: authoritative scheduling config maps to the shadow scheduling view without mutating any topic.

Counts reconcile at Stage0 PASS 14, StageA PASS 1, StageA STOP 6, StageB accepted 0 and formal candidate 0. The registry passed duplicate-rejecting YAML validation.

## Cutover and rollback

Authoritative cutover remains `false`. A later cutover requires an explicit mainline package and count/hash reconciliation; this report alone does not authorize it. Rollback ignores or removes the shadow-derived files and retains current `registry.yaml`; no candidate state rollback is required.

