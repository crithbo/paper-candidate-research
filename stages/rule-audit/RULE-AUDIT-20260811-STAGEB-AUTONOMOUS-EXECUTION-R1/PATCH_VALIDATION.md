# Patch Validation

## Static validation result

- `validation_status`: `PASS`
- `existing_target_anchor_checks`: `11/11 PASS`
- `draft_patch_begin_markers`: `1`
- `draft_patch_end_markers`: `1`
- `new_template_preexisting`: `false`
- `shared_files_modified_by_audit`: `false`

## Unique anchors verified

The following anchors each occurred exactly once in their frozen target:

1. `ROLE_CANDIDATE_OWNER`: Stage B heading;
2. `ROLE_CANDIDATE_OWNER`: Stage B authorization paragraph;
3. `ROLE_CANDIDATE_OWNER`: execution-failure heading;
4. `ROLE_MAINLINE`: high-value Stage A/B concurrency sentence;
5. `ROLE_MAINLINE`: Stage A gate → pending user Stage B transition;
6. `ROLE_MAINLINE`: mainline acceptance checklist heading;
7. `ROLE_MAINLINE`: local CPU/RTX 4070 resource sentence;
8. `ROLE_STAGEB_INDEPENDENT_REVIEW`: current mandatory item 14;
9. `ROLE_STAGEB_INDEPENDENT_REVIEW`: reviewer replay boundary;
10. `STAGEB_REPORT`: refusal-without-approval line;
11. `USER_BLOCKER_PACKET`: preclaim observation line.

## Post-application required-token checks

Mainline must verify at least one authoritative occurrence of each:

- `STAGEB_EXECUTION_CONTRACT.yaml`
- `B0_CONTRACT_FREEZE`
- `B6_FREEZE_AND_HANDOFF`
- `AUTONOMOUS_RECOVERY_ENVELOPE`
- `ENGINEERING_CORRECTION_IN_CONTRACT`
- `INVALIDATED_NON_EVIDENCE`
- `PARTIAL_VALID_EVIDENCE__MISSING_STAGE_GATE`
- `generic_rule_approval_is_not_topic_stageb_approval`
- `internal_replay_owner_must_not_author_component`

## Semantic negative controls

The applied rule must still refuse or escalate:

- no topic-specific `stageb_user_approval_id`;
- system/global environment changes;
- private/licensed/unpublished resources without authority;
- resource-envelope expansion;
- object, guarantee or main-claim change;
- removal of a current strong baseline;
- an invalidated run used as evidence;
- reviewer repair of the candidate;
- a second top-level Stage B topic without two approvals, two lanes and resource independence.

## Validation limitation

This static check proves patch anchors and intended rule coverage, not scientific Stage B success. No experiment, candidate run, download or Stage B initialization was performed.

