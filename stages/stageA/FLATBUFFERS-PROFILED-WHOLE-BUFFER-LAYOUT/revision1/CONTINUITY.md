# Revision 1 assignment continuity

- lane_id: `CANDIDATE_EXECUTION_LANE_3`
- assignment_id: `STAGEA-L3-20260811-FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT-REVISION1-V8.7`
- topic_id: `FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT`
- unique_write_directory: `<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT\revision1`
- old candidate root: read-only
- independent gate root: read-only
- queue pre-read: `NONE`; no other queued topic was read.
- cross-assignment contamination: `NONE`; no fact, process, temporary file, environment variable, tool, or corpus from another topic is admitted.
- Stage B authorization: `false`; `stageb_user_approval_id=null`.

## Frozen controls and allowed shared-control drift

The scientific contract remains bound to the assignment-dispatch hashes below. They matched at the initial read checkpoint. Mainline subsequently performed shared-control status updates. Those live hashes are mechanical provenance only and do not change this assignment or any scientific decision.

| File | Frozen SHA-256 | Initial read | Later observed live SHA-256 | Disposition |
|---|---|---|---|---|
| `AGENTS.md` | `66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063` | exact | unchanged at last check | frozen |
| `plan.md` | `03AC71E874CE2678D0835300CC06A9772EE6D92391A64BC0E3B70C3E113AC188` | exact | `5C26F4CCFDE39901B2CA13B54AA33AD98D9524516552D7FEAE6E28719EDE7198` | allowed post-dispatch mainline drift; not evidence |
| `registry.yaml` | `BC5825CEA955F373E469E0B8F90AD5FAFF0B394757933B9C2E44D84C32C0F123` | exact | mainline reported `796C946338AF99451EAED756F218CDCC347597F7978AD35D3C913F323EE8EC44`; later reads observed `231D80D9A772AF37D9A0130D0BA1465E55AE36EB9DA3C2C99F016C7CF5BE2078` and `C92DE8E04F07CDC28E34B380B192CC25714332CEE28264F0E33532CE30F51252` | allowed active-task/shared-control drift; relevant semantic record still binds this lane/topic/directory |
| `rules/ROLE_CANDIDATE_OWNER.md` | `30E23336CF339771821EAEC8B2C7011025BA815D613DB639E68121FDCDE54D1F` | exact | unchanged at last check | frozen |

Academic-research-suite router SHA-256: `A6C2F5A569EB005C24A841103CE32E602221F31AE42F10AF302EEC67B12D3F4F`.
Academic pipeline workflow SHA-256: `379E642FD2C65BDA54938D3EF8B2C678BA92DDCB715C949954E7563076159F79`.

## Upstream continuity

Initial owner fixed artifacts independently matched:

- `STAGEA_REPORT.md`: `B6E5D66EF4B165BD1D14C3D76D5144BAC7ABE1BC3C86D52B5F40C1F09EDE057E`
- `RESULTS.md`: `5C5A9B268DBC3D746C8FE6278072183EDFFBE639F497031E306C5456F5E012C6`
- `handoff.yaml`: `8864B979BEFC34B7EC0D82D55A7C885BE59DB958543F3E46865864E32E535F25`
- `HASH_MANIFEST.sha256`: `6AD1305983AA337B35267BDA31DD543129952F2B650573D125257775DE3F2C2A`; independent full verification `11,519/11,519 PASS`, covered bytes `955,621,867`.

Independent gate fixed artifacts independently matched:

- report: `35ECFF24D97783C4214BA42FE2EDB0B47CB1D4650FC6C081526CEF8471F9C208`
- recomputation: `58458E4B18060242C4923797C982FB23C80C0A1CD06D0DC11A75A012DE222ABE`
- baseline audit: `6DC7D58DEF2B69583E3C009C7C4B531A0B7D28790AC233CAF4F66F887C8E5624`
- user packet: `7811D20F1D2B47ACC2EBC86F368A27E0E229550EEBF4AF6A0E4B45D506093EB6`
- handoff: `3D2B4CD9D26476737E0A3C63987B7258F546DDE7F5182370F7391F6337EB4000`
- manifest: `2C9ECD72A92ECEF7DB4BA8E08EDB6EAE3137D565383D70A45248209E2C1A09A6`; independent full verification `5/5 PASS`.

## Revision boundary

Unique atomic gate: `TRACE_DERIVED_PROFILE_MATCHED_READER_AND_EXECUTABLE_FRONTIER_FIDELITY_GATE`.

At this checkpoint no corrected natural claim-bearing observation has been accepted. Scientific revision consumed: `false`. Trace collection over the frozen training split, source compilation, tiny witness replay, and arm executability checks that suppress objective outcomes are preclaim fidelity operations, not scientific result rows.
