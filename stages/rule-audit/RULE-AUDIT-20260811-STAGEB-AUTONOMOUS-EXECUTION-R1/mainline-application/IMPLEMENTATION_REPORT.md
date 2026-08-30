# Stage B Autonomous Execution R1 — Mainline Application Report

- Audit: `RULE-AUDIT-20260811-STAGEB-AUTONOMOUS-EXECUTION-R1`
- Proposal: `STAGEB-AUTONOMOUS-EXECUTION-PROTOCOL-R1`
- Applied by: `MAINLINE_ONLY`
- Applied at: `2026-08-11T19:52:29+08:00`
- Result: `COMPLETE_MAINLINE_APPLIED__FUTURE_STAGEB_ONLY`
- Topic-specific Stage B approval created: `no`
- Stage B initialized or executed: `no`
- Experiment, download, automation, system install, global environment change, formal project, external submission: `none`

## Authority and scope

The audit package manifest was mechanically verified 8/8. User policy approval is frozen in `USER_APPROVAL_DIRECTIVE.md` with SHA-256 `2304E6C6977DE1C773963D5FFE0F15B2DA4A8F3711AC34448CF980CFDFAC086B`. The generic policy approval applies only to the future Stage B execution protocol. It does not generate any topic-specific `stageb_user_approval_id`.

The draft patch had encoding/context compatibility defects. Mainline therefore replayed the approved semantics manually at the same safe assignment boundary. No approved semantic scope was added or omitted.

## Applied files and rollback points

| File | Old SHA-256 | New SHA-256 |
|---|---|---|
| `rules/ROLE_MAINLINE.md` | `537DE9F75F1392D42149D6C2377069FACA43C3BDAA2A0B41AC0A2AA7ABCA92F2` | `E2539121ED56CED3EA7745F74F54EFBDFDE9FF58ED276723C97072603135A170` |
| `rules/ROLE_CANDIDATE_OWNER.md` | `96601A060F56B44B95BCBCC4F234E3B107238D4C4655A535679DE88A8D3B3FDC` | `AAF37485E3F0C9EE575B34F4717F08C7E4E082062B92FA70DD43C56856C99BD6` |
| `rules/ROLE_STAGEB_INDEPENDENT_REVIEW.md` | `2C0D7AE22E524C5EF967532F74D115B3DA5C14F5D32E5BA8D1D432F20B39F55B` | `DE930349F1FA34F611DF685C556FB2E7B1A2E844AA82C5FE1641C4A6D0DE8B66` |
| `templates/STAGEB_REPORT.md` | `DAC5B99E337783123D81CE65D9ABD6061FFED520D069EF8A4A3BD9F51F7B6A24` | `D5013D4DE380623DF40116513F7ABC8FAF589265ABE1CFFBF6D48044AA47CEA7` |
| `templates/USER_BLOCKER_PACKET.md` | `BA16FD03C6A7B28E0B0A8E861A3F17E465CD09E0A5717F0C850E0223483E7BFD` | `3EF974665FAB7136354DDE79D06ADDCD447B08C2BA2065A1BF3392F2DA96EF1F` |
| `templates/STAGEB_EXECUTION_CONTRACT.yaml` | `ABSENT` | `2B6BFF351B604D991DAE815EF5913101915AD555AE6995437DF319C395D0759F` |

The old hashes are the exact semantic rollback points. Rollback is not authorized by this report; it would require a new mainline policy decision.

## Actionability validation

- Required authoritative tokens: `9/9 PASS`.
- `STAGEB_EXECUTION_CONTRACT.yaml`: 98 lines, 15 required top-level keys, even indentation, no tabs, no duplicate mapping key in the structural path check: `PASS`.
- Registry top-level keys unique: `PASS`.
- Forbidden obsolete `E:\project\writing\reserch` references across shared control/rules/templates: `0`.
- Mainline role states Stage B WIP=1 by default, bounded burst=2 only with two topic approvals, two ready lanes and resource independence.
- Candidate Owner role contains human-readable mission, permission boundary, frozen contract, B0–B6 workflow, recovery order, engineering/scientific revision distinction, blocker behavior and single-writer/subagent procedure.
- Independent reviewer role checks contract provenance, B0–B6, invalidated runs, recovery envelope and clean replay without candidate repair.
- Stage B report and blocker templates preserve partial valid evidence without converting resource failure into scientific STOP or PASS.

## Control state after application

- Stage 0 independent PASS: `20`.
- Stage A independent PASS: `1/3`.
- Stage A independent STOP: `9`, pending the Parquet independent gate.
- Active assignments: `4` — Parquet gate, CVC5 R3C1, S5 R3D, V8 R3F1 preflight.
- Discovery: `closed`.
- Topic-specific Stage B approval: `none`.
- Stage B execution: `not authorized`.
- Current active assignments retain their assignment-start frozen rule hashes; the new protocol applies only to future topic-approved Stage B assignments.

## Shared-control hashes

- `AGENTS.md`: `B7122A5ACC5CF02A602988548E7464BF03362059293B083796BA1687D2CFAC73`
- `plan.md`: `52EE4BB5EBA2D11432B36663115808C3C972346669349A438AEEEEAB543F0D42`
- `registry.yaml`: `35691A5A0359106B05337FFB60393720D219625267A3351A493A63C7204570D2`
- `history.md`: `08F6AC63126CC79D521D7A5E11A7B7C067F8515C5B826CCB86FD63E174921B54`

These hashes are the control snapshot immediately before this immutable application evidence package was added. The package itself does not modify shared control.
