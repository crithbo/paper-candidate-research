# R5 Audit Input Snapshot

## Identity

- `audit_id`: `RULE-AUDIT-20260810-SCREENING-YIELD-INITIAL-TOPIC-QUALITY-R5`
- `snapshot_time`: `2026-08-10T22:08:29+08:00`
- `project_root`: `<LEGACY_LOCAL_PROJECT_ROOT>`
- `shared_files_modified`: `false`
- `registry_updated_at_at_read`: `2026-08-10T22:25:00+08:00`
- `registry_rules_revision`: `v8.7-authoritative-plus-r3-p0-clarity-compatibility__p1-shadow-not-authoritative`

This snapshot freezes the control-plane files and the directly relevant Wave29–47 / Stage0 materials used by the audit. Later mainline writes do not change the evidence boundary of this report.

## Current control-plane hashes

| File | SHA-256 |
|---|---|
| `AGENTS.md` | `2B0DA6CAD951C6E1E4F371B7BCF8E2BDF6A5E41CF53D9895614E118219A6AC8D` |
| `plan.md` | `94870BD776C7B5251692DB9EC0B4CB5BCCD359BDCAF8DDB93B546E8BEAB3B122` |
| `registry.yaml` | `F4B87C52275760D4BB30963BDD92A9F249B4C378998E8E95B53EA6AC2DAC82CD` |
| `rules/ROLE_RULE_AUDIT.md` | `9D0064D8E448ECFD3761E7125E776074417F81EF7012C9C49967AB7FA7148C99` |
| `rules/ROLE_DISCOVERY.md` | `F669980E485855F499D0046FBB1B1502F84ADABADDD1229104A2B470CDACB667` |
| `rules/ROLE_STAGE0_REVIEW.md` | `AD00B257F80FB1AF3B842E652E395A0B964291E43B0BA2FD7526CA098D2546B9` |
| `rules/ROLE_MAINLINE.md` | `079DAD36654A7D03DFCAEB96DD79DBE279037C7A4DC8175D9ED3A7F7987D076E` |
| `rules/ROLE_DISCOVERY_BACKTEST.md` | `B2295EC8C975C1327830C2C8A69B3204C74DB584446D7978F95FEBD362CB5235` |
| `templates/RULE_AUDIT_REPORT.md` | `90EE1DEB1898E609C331EE78D1E9D5EB277757A90AC50E3E6373DD6B33B9F9BC` |
| `templates/RULE_CHANGE_PROPOSAL.md` | `D9173DA82C04F1DBD93CF61229C9CD22D8FF4D9F12271EF7D1EF99BDA4E5430E` |

## R4 completion evidence

| Artifact | SHA-256 / result |
|---|---|
| `USER_APPROVAL_IMPLEMENTATION_DIRECTIVE.md` | `9ACEC6454E7F3DF88BC5E1FDA5C557F587D01D191853A8424569BCF314635ABB` |
| `mainline-implementation/SCHEDULING_TELEMETRY.yaml` | `1055E662D8AA8C3F20AC878DD13610DB2FF94F600D6012A6C6B8B1984353E841` |
| `mainline-implementation/SHADOW_PILOT_REPORT.md` | `7835CBE817661439ACB0F1205C2D72B6D7ECF2DDAB27029D23981376F9D380F2` |
| `mainline-implementation/handoff.yaml` | `82B9C00C8C9BFD8FB313EBCFD05F5F09E9B35891B2C453039B73F2B56007547E` |
| R4 result | `PASS_FOR_AUTHORITATIVE_SCHEDULING_CUTOVER`; cycle1 routed AIGER, cycle2 correctly did not manufacture work; duplicate/shared-write/rule-drift all zero |

## Wave29–47 denominator reconstruction

The user's `at least 238 screening units` is conservative. The canonical logs and handoffs permit reconstruction of **244 row-events**. They are not 244 independent research opportunities.

| Wave | Recorded row-events | Event type | Stage0 proposals |
|---:|---:|---|---:|
| 29 | 22 | fresh contribution/direct-algorithm genealogy rows | 0 |
| 30 | 22 | fresh orthogonal-lens genealogy rows | 0 |
| 31 | 22 | fresh objective/scale genealogy rows | 0 |
| 32 | 10 | fresh direct-algorithm rows | 0 |
| 33 | 12 | fresh genealogy rows; top-3 deep audits are a subset, not extra rows | 0 |
| 34 | 16 | 3 S2 + 3 S3 deep leads + 10 M1 carrier rows | 2 |
| 35 | 6 | explicit re-audit of prior near-misses | 0 |
| 36 | 6 | explicit re-audit of prior near-misses | 0 |
| 37 | 16 | fresh action-divergence / residual rows | 0 |
| 38 | 5 | M1 stacks | 0 |
| 39 | 5 | natural-structure rows | 1 |
| 40 | 5 | direct-algorithm rows | 0 |
| 41 | 2 | explicit potential rescreen | 1 |
| 42 | 1 | explicit SPLIDT rescreen | 0 |
| 43 | 2 | explicit Kafka/Flink rescreen | 0 |
| 44 | 31 | fresh boundary/natural/direct-algorithm rows | 0 |
| 45 | 28 | bottleneck/objective/M1 rows | 0 |
| 46 | 20 | heuristic/DP/online-constructor rows | 1 |
| 47 | 13 | global-constructor/direct-exact rows | 1 |
| **Total** | **244** | mixed raw, deep-audit and rescreen events | **6** |

At least 17 rows (W35, W36, W41–43) are explicit repeats or rescreens. Therefore at most 227 rows are fresh-labelled first-pass events, and even those are not proven independent because later waves may remain within related mechanism families. The raw ratios are:

- `6 / 244 = 2.46%` per mixed row-event;
- `6 / 227 = 2.64%` per at-most fresh-labelled event.

Neither is a valid recall estimate because there is no blinded label for how many truly Q2-viable opportunities were present.

## Six-proposal outcome funnel at the snapshot

| Proposal | Discovery wave | Material downstream correction | Registered outcome |
|---|---:|---|---|
| `KNATIVE-DRAIN-CREDIT` | 34 | actual Route→Activator→Queue-Proxy commit order contradicts atomic cross-revision migration; Azure trace lacks Knative transition semantics | Stage0 `STOP` |
| `UST-SEGMENTED-FORMAT-COVER` | 34 | closest hybrid/segmented SpMM and generic contiguous-DP genealogy materially subtract the stated N2 | Stage0 `STOP` after revision |
| `WEBGRAPH-REFERENCE-FOREST` | 39 | first-party Rust `BvCompZ`, CLI `--bvgraphz`, and Zuckerli absorb the broad forest claim | Stage0 `PASS` only after revision/dispute/decisive review; StageA `STOP` on full-cost no-regression gate |
| `HNSW-LAYER-BMATCH` | 41 | FastHNSW/FastKCNA PVLDB 2025 absorbs broad global/layerwise construction; generic b-matching absorbs method kernel | Stage0 `STOP` after revision |
| `GIN-POSTING-CUT-DP` | 46 | current GIN already uses compressed posting segments; recurrence/witness did not capture strict-successor/native hierarchy semantics | `INCONCLUSIVE_POLICY_HOLD` after the sole revision |
| `AIGER-DELTA-SCHEDULE` | 47 | Stage0 added Yosys `-no-sort` and ABC `-u`; neither absorbed the atomic residual | clean independent Stage0 `PASS`; StageA active at the snapshot |

Derived funnel:

- proposal → independent Stage0 PASS: `2/6 = 33.3%`;
- proposal → direct Stage0 PASS without scientific revision: `1/6 = 16.7%`;
- realized StageA PASS from these six: `0/6` at the snapshot; AIGER is unresolved, not counted negative;
- project-wide registry: 14 independent Stage0 PASS, 1 StageA PASS, 6 StageA STOP; among the seven decisive StageA outcomes, observed PASS is `1/7 = 14.3%`, while other Stage0-pass topics may be blocked, paused, active or otherwise undecided.

## Frozen proposal and Stage0 source-audit hashes

| Topic | Discovery brief SHA-256 | Stage0 source-audit SHA-256 |
|---|---|---|
| `KNATIVE-DRAIN-CREDIT` | `B837EEBE2AFB876512A0E469C7F9B6DB1BEADDBB900BEC8A6964ECA38BAA17FD` | `8972D3855B4FF3821809AC76B7065F54915F62EAF94875C94CDBB8052B3C8DFA` |
| `UST-SEGMENTED-FORMAT-COVER` | `32D09E23FE190E3D4B3EDFC022D4D05DB65090666956E3435444E37B30AC07E0` | `7998975B53DBF4C8DB64FB521FB88BAE2735DA5EE509F5BAF6DC2292FA5C0460` |
| `WEBGRAPH-REFERENCE-FOREST` | `EE0B055F12EDBDE9C3C0C23D74E07BFB8C14468BAEC5C8FF63D70C2FA5D8C2E7` | `5FC55693E123E28569C44F33BA5114857F72ADE6874F87205E0E1D638F7C4DDD` |
| `HNSW-LAYER-BMATCH` | `CA7AF7C3834DA6DE771589E50B5DF54A94C0F53A1666A233D91EEA0D60599EF1` | `9A16D58A7C3A602DCBE85AD4B9A9E72E58C32381942AFE77162400866107FC18` |
| `GIN-POSTING-CUT-DP` | `9715270E28906B28E976A74C990D127A10AA787133697960E9C5BFD94C2D83E6` | `4A2EF1E5854A369C1FBA59CBDAF5DAF8C8DFCA0786258D2734D2615E6AE3A5E2` |
| `AIGER-DELTA-SCHEDULE` | `179A41BFF132986FC37FC6E4FB71764B9F39A36CE7ACB7A4032B7370D344EC2A` | `64D3915E57E2A51D789B8E20243B3D357CEF86E4C958E70F486129094BA85F75` |

## Method note

`academic-research-suite` informed the bounded literature strategy used in the recommendation: explicit scope/RQ, source-role hierarchy, primary-source verification, backward/forward chaining, synthesis rather than paper-by-paper summaries, contradiction/negative-source search, devil's-advocate checks and reproducible read-scope logging. It does not support increasing paper count without a source-role and synthesis plan.

