# Assignment continuity

- lane_id: `CANDIDATE_EXECUTION_LANE_3`
- assignment_id: `STAGEA-L3-20260811-FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT-INITIAL-V8.7`
- topic_id: `FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT`
- assignment_started_at: `2026-08-11T07:31:00.8627399+08:00`
- unique_write_directory: `<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT\initial`
- cross_assignment_contamination: `NONE`; no previous candidate's scientific facts, temporary files, process state, environment variables, tools, or corpora were admitted.
- queue_pre_read: `NONE`; only this topic's frozen upstream package and role-required templates were read.
- Stage B authorization: `false`; `stageb_user_approval_id=null`.

## Frozen controls

| File | Assignment SHA-256 | At-read SHA-256 | Disposition |
|---|---|---|---|
| `AGENTS.md` | `66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063` | same | exact |
| `plan.md` | `52BD8C4A8143C82AAB56FE79C6F181E36CE5EF1728D34CF36FD6FBCC729CB0BE` | same | exact |
| `registry.yaml` | `ED90F5350DFA905D345638CD10CDCB57B35080103C909C3E91EC0577C383A4F7` | `E70616AE3A067AA5E307D355B487D9914559F5A4843FC9A6072B2E29DBB01132` | concurrent mainline drift; current semantic record still exactly binds this lane, assignment, topic and write directory; not scientific evidence |
| `rules/ROLE_CANDIDATE_OWNER.md` | `30E23336CF339771821EAEC8B2C7011025BA815D613DB639E68121FDCDE54D1F` | same | exact |

## Upstream continuity

- Discovery manifest: `782EA1B348738B5A4C1C0713AC2C273D0F9A4F792D0C70A9696F05D4194BAD21`, `5/5 PASS`.
- Stage0 PRIMARY manifest: `0812CDFE89C2B5ADDFB3E538A8079F106F35E424331D02A004C5D25AFE91FFDE`, `4/4 PASS`.
- Stage0 confirmation manifest: `EFB773E2660F2D795FFEF8CD76F4520A8A8611AE808D31B6F3C4ADB2588844C5`, `2/2 PASS`.
- Stage0 revision1 manifest: `42E862898EC82E9AF8E9503468D9DBFCC28B7332268C219979B6F68ABFEB63D3`, `4/4 PASS`.
- Frozen closing handoff: `EF1CB0403019D6EE7F44AF4529896CBBDFDFBB55D54AA738A123DBF184BFD016`, exact.
- Frozen closing manifest: `A6D6C04EF9A0CF7FCC34E225AAB3057486C6933830DDD82EBEF4C5E5A1F36BA3`, `2/2 PASS`.
- Closing decision admitted as Stage0 input only: `CONFIRM_STAGE0_PASS / TIER_B_Q2_VIABLE`, evidence ceiling `PINNED_SOURCE_PLUS_STATIC_ACTION_STATE_AND_BYTE_CERTIFICATE__NO_NATIVE_EXECUTION_OR_NATURAL_RESULT`.

## Execution boundary

No claim-bearing observation has started. Native sources, native writer/reader/verifier, action catalog, full-cost collection paths, and the tiny witness/oracle must pass `PRE_CLAIM_CONTRACT_FIDELITY_GATE` first. Static upstream arithmetic remains non-claim-bearing until native replay.
