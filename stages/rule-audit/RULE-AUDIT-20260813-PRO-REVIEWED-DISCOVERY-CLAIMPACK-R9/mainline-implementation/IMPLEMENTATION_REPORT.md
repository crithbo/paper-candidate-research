# Mainline Implementation Report — Discovery Claim Pack V9 R0

- implementation_id: `MAINLINE-IMPLEMENTATION-20260813-DISCOVERY-CLAIMPACK-R9`
- approval_id: `RULE-AUDIT-20260813-PRO-REVIEWED-DISCOVERY-CLAIMPACK-R9`
- implemented_at: `2026-08-13T03:05:05+08:00`
- shared_file_writer: `MAINLINE`
- implementation_status: `COMPLETE_INSTALLED_DORMANT_OFF`

## Outcome

The user-approved Pro-reviewed Discovery Claim Pack was installed at a safe assignment boundary. The canonical control is `DISCOVERY_CLAIM_PACK_MODE=OFF`; the frozen v8.7 production method and all already-frozen assignments remain unchanged.

This installation did not start Discovery, a method backtest, shadow evaluation, E2 engineering smoke, Stage 0, Stage A, Stage B, a download, an experiment, automation, a formal paper project, or external submission work. It did not change any candidate scientific state.

## Authority and package verification

The mainline fully read and mechanically verified the required audit package before applying any shared-file change:

| Audit artifact | SHA-256 |
|---|---|
| `USER_APPROVAL_DIRECTIVE.md` | `FC0A181DAE8D26BFE02475EF2DBD8753EA63E3629E7352071D09FE96DA8390EC` |
| `AUDIT_INPUT_SNAPSHOT.md` | `5190AE01641E5ACEE47D93006390A3BF8D8C124D5A1A0DFBBA2E31973ED24284` |
| `RULE_AUDIT_REPORT.md` | `5175870C8DF96B7138DDC7B63617DE41EF1D21CD019304E2514A8B937B1123A2` |
| `RULE_CHANGE_PROPOSAL.md` | `EE083FB4349E8238B851059FBFA5988D171EF4885F76DD368D54CB0E5CAA2586` |
| `MAINLINE_IMPLEMENTATION_SPEC.md` | `03DEA743516614CC014CE6AEB7D436AC129B1EFCFD637FF2F41B8E592012B62A` |
| `DRAFT_PATCH.diff` | `66DEDCAF36F10D731D0B7BD3B01433157D5A78B5F84E17CB04FD95F7E9F04D1D` |
| `handoff.yaml` | `6A69328A8D448E265F7552D4232793DB6BD225D691107D3ACAC76861E59E5F34` |
| `HASH_MANIFEST.sha256` | `36C706D40B5743147843BC1CE6F6E8ADD1EFC45FE4E6701278EE589365F7B13D` |

The strict audit manifest verified `10/10` non-self entries. All preimage hashes in `AUDIT_INPUT_SNAPSHOT.md` matched the live files. Both proposed new files were absent before installation. `git apply --check --recount --unidiff-zero --unsafe-paths` passed before installation; after mainline applied the exact hunks with `apply_patch`, the corresponding reverse check passed.

## Shared rule and template changes

| File | Old SHA-256 | New SHA-256 |
|---|---|---|
| `AGENTS.md` | `B7122A5ACC5CF02A602988548E7464BF03362059293B083796BA1687D2CFAC73` | `84FB3A35189C22EFFD426D49B71E2848CA29ED76D971A1B387DCD99A2DA1BF35` |
| `rules/DISCOVERY_CLAIM_PACK.md` | `ABSENT` | `6DDCF4CE3CC76900FB6AAEF5876ED0D3E824489F3894F4C092C481176F256DA9` |
| `rules/ROLE_DISCOVERY.md` | `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3` | `3A9E44B0DA74C4EEE71F18B482E69ADCB4FB5A41C0E8CAEF24FF786F8D9BF145` |
| `rules/ROLE_MAINLINE.md` | `E2539121ED56CED3EA7745F74F54EFBDFDE9FF58ED276723C97072603135A170` | `96BFE824CDB15F638CF6320CC344D35578323E84CE576F1E703ED886EBBB85A5` |
| `rules/ROLE_DISCOVERY_BACKTEST.md` | `B2295EC8C975C1327830C2C8A69B3204C74DB584446D7978F95FEBD362CB5235` | `82EF55746418D5F507681878BCB7046445A65F4B892CCB5BACAAEE5BC7A758C0` |
| `rules/ROLE_STAGE0_REVIEW.md` | `14A88E2650C627569B97B1131897F561C0A6A2926CFC0DBA0DDF019CFD0A0A73` | `47BE69395B0569DFF28A661DB96B09BDEB6888DE92557D0A788B8F037B0646C1` |
| `templates/TOPIC_BRIEF.md` | `41D7B1977C6C467E31762B097C3F53C4314900E5C69AD8351EBB709F3963A130` | `950CF22BB565849897370DFDAE582477EC9E2E777F8F989F69D9B7053C4A0927` |
| `templates/STAGE0_REPORT.md` | `9A2AF034DCA78BCCBFBB2EBB28E8B2A408EDEEC4E68D3B369774BBABBE50A313` | `20B2556BD7605E4FDD025D40D0428D13F5C371FCAE1F42BBA9DDD0CEE9256B15` |
| `templates/HANDOFF.yaml` | `F3BE8F8E38CC6C97BD838ADCF746B835FBD5D8B84E2E2451B1588834ADFF23AE` | `A180FE98DDFB6C2F3452D066481133C3D9E86C914920E4344C4B1D7A1D76F509` |
| `templates/DISCOVERY_METHOD_BACKTEST.md` | `C537A8CA96B48FBC1FC362F445000E719DA7E3A28E9E97588DBDE5A266C2B1E6` | `22C1377DAC8F536C9508DE9CF789B3C8A4851E6CD58352A1BBC33B277A4EE439` |
| `templates/DISCOVERY_EVIDENCE_LEDGER.yaml` | `ABSENT` | `E6FB0DD43147E677E38DFFF4EAE2B8FB63ED79D74EAC3C08A9142A391F63E9E9` |

The installed rule adds the opportunity-family to research-claim-package protocol, seven contribution contracts, a typed opportunity graph, eight-predicate direct-coverage decisions, query/claim evidence ledgers, decision-ready stopping, and the E1/E2 separation requested by the approved package.

## Mainline control-plane update

| Shared control file | Old SHA-256 | New SHA-256 |
|---|---|---|
| `registry.yaml` | `35691A5A0359106B05337FFB60393720D219625267A3351A493A63C7204570D2` | `4CD4396BD1FEF84DAAACC5546BC791C62531E89D230FCD07770026623F2BD619` |
| `plan.md` | `52EE4BB5EBA2D11432B36663115808C3C972346669349A438AEEEEAB543F0D42` | `6C65F487C5D532C75B5AD30D9630E61106E8A155EE95A5F253F6A753F80FE5D8` |
| `history.md` | `08F6AC63126CC79D521D7A5E11A7B7C067F8515C5B826CCB86FD63E174921B54` | `3AACD2063A47B61F0B2D06C5B42EBB785E57749ED050245E10AB995988AFC920` |

`registry.yaml` now records the approval, audit hashes, protocol/template hashes, all old-to-new target hashes, `mode: OFF`, and the fail-closed evaluation and scheduling boundaries. `plan.md` and `history.md` record the same installed-but-dormant state without modifying existing scientific counts or assignment freezes.

## Mechanical and semantic validation

- audit manifest: `10/10 PASS`;
- patch preimage hashes: `ALL MATCH`;
- exact reverse patch check: `PASS`;
- registry top-level key uniqueness: `PASS` (`54` keys, no duplicates);
- YAML-lite checks for `registry.yaml`, `templates/HANDOFF.yaml`, and `templates/DISCOVERY_EVIDENCE_LEDGER.yaml`: `PASS` (zero tabs, zero odd indentation);
- obsolete `<LOCAL_PROJECT_ROOT>` scan across shared control/rules/templates: `0 hits`;
- canonical claim-pack control: `OFF`;
- canonical production allowed: `false`;
- existing v8.7 method and frozen assignments unchanged: `true`;
- E2: optional, bounded, non-claim-bearing, and not a Stage 0 admission gate;
- Discovery lane ceiling: `6`; a seventh lane is not authorized; `3-vs-6` requires a separate test;
- terminal STOP revival: forbidden;
- production cutover: not authorized;
- backtest, shadow, Discovery, Stage 0/A/B, downloads, experiments, and automation started by this installation: `false`.

The Q2/Q1 quality floor, same-object requirement, current-collision review, fair strong baselines, natural evidence, full-cost accounting, reproducibility, evidence/claim ceiling, Stage B user review, and formal-project user gate remain in force.

## Research-integrity method note

The `academic-research-suite` was used as the governing research-integrity workflow for this implementation. It reinforced separation of evidence, inference, recommendation, and policy state. The audit artifacts were treated as rule-change provenance only and were not imported into any candidate's scientific evidence ledger.

## Rollback points

The rollback point for the exact rule/template delta is the verified inverse of `DRAFT_PATCH.diff`, with the old hashes listed above. The two newly added files must only be removed as part of an explicitly authorized rollback. The control-plane rollback point is the recorded preimplementation hashes for `registry.yaml`, `plan.md`, and `history.md`; restoration must be performed by mainline with scoped `apply_patch`, preserving unrelated later changes and never using force or broad reset.

No rollback is presently indicated. Any future backtest, shadow wave, 3-vs-6 experiment, or production cutover requires its own frozen assignment and applicable authorization.
