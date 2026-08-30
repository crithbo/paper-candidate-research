# Mainline Implementation Directive

## Identity and authority

- `audit_id`: `RULE-AUDIT-20260811-STAGEB-AUTONOMOUS-EXECUTION-R1`
- `proposal_id`: `STAGEB-AUTONOMOUS-EXECUTION-PROTOCOL-R1`
- `policy_status`: `USER_APPROVED`
- `shared_writer`: `MAINLINE_ONLY`
- `audit_lane_shared_files_modified`: `false`
- `stageb_topic_execution_authorized_by_this_directive`: `false`

## Frozen target old hashes

| File | SHA256 before patch |
|---|---|
| `rules/ROLE_CANDIDATE_OWNER.md` | `96601A060F56B44B95BCBCC4F234E3B107238D4C4655A535679DE88A8D3B3FDC` |
| `rules/ROLE_MAINLINE.md` | `537DE9F75F1392D42149D6C2377069FACA43C3BDAA2A0B41AC0A2AA7ABCA92F2` |
| `rules/ROLE_STAGEB_INDEPENDENT_REVIEW.md` | `2C0D7AE22E524C5EF967532F74D115B3DA5C14F5D32E5BA8D1D432F20B39F55B` |
| `templates/STAGEB_REPORT.md` | `DAC5B99E337783123D81CE65D9ABD6061FFED520D069EF8A4A3BD9F51F7B6A24` |
| `templates/USER_BLOCKER_PACKET.md` | `BA16FD03C6A7B28E0B0A8E861A3F17E465CD09E0A5717F0C850E0223483E7BFD` |
| `templates/STAGEB_EXECUTION_CONTRACT.yaml` | `ABSENT` |

Control inputs at proposal freeze:

- `AGENTS.md`: `B7122A5ACC5CF02A602988548E7464BF03362059293B083796BA1687D2CFAC73`
- `plan.md`: `76033107F2F52F9DCC8BD08E36D544BA5729F74E1BB15D587FED0A0EF71D8774`
- `registry.yaml`: `618DF01BAF9B799D8DE2C514D51FC9EBEFEB0A7469A8698B12999F6534F7DFD0`
- `rules/ROLE_RULE_AUDIT.md`: `9D0064D8E448ECFD3761E7125E776074417F81EF7012C9C49967AB7FA7148C99`

## Application sequence

1. Verify this audit package using `HASH_MANIFEST.sha256`.
2. Verify the five existing target hashes and confirm the new template is absent.
3. Confirm no target file has an active concurrent writer and choose the next safe assignment boundary.
4. Apply the complete `DRAFT_PATCH.diff`; do not cherry-pick only the autonomy clauses while omitting approval, evidence, invalidation or independent-review guards.
5. Recompute all six target hashes and record old→new pairs in mainline implementation evidence.
6. Mechanically verify the required tokens listed in `PATCH_VALIDATION.md` and validate the new YAML template as parseable data.
7. Update authoritative rule-version/provenance records in `history.md` and `registry.yaml`; update `plan.md` only if the new rule revision changes current short-term planning.
8. Existing active assignments retain their frozen rules. The new rule applies to future Stage B assignments at their safe start boundary.
9. Do not create a Stage B directory or `stageb_user_approval_id` as part of rule application. A concrete topic still requires its own user review and approval.

## Drift handling

If any target old hash changed before application:

- compare the current file to the frozen version;
- if drift is mechanical/non-overlapping, rebase the exact semantic delta and record both old hashes plus the resulting new hash;
- if drift touches approval, retry, revision, blocker, claim ceiling, Stage B WIP or independent-review semantics, stop with `RULE_PATCH_REBASE_CONFLICT` and return the exact conflict;
- do not request the same generic policy approval again; request the user only if resolving the conflict would change the approved scope.

## Canary and acceptance

No historical candidate migration or Discovery backtest is required. The first later topic-specific Stage B assignment is the canary:

- B0/B1 must complete before any claim-bearing run;
- mandatory contract fields and cross-file IDs/hashes must be `100%` complete;
- no actual command may exceed the frozen recovery/resource envelope;
- no invalidated run may feed a claim;
- any B0/B1 failure stops before claim-bearing work and returns a precise mechanical blocker.

## Rollback

If application or canary validation fails:

1. stop before the next claim-bearing run;
2. restore the five existing target files to the old hashes above and remove the new template only after verifying it has no accepted assignment consumer;
3. preserve implementation/canary evidence and hashes;
4. do not migrate or rewrite candidate states;
5. retain all pre-existing scientific and user gates.

