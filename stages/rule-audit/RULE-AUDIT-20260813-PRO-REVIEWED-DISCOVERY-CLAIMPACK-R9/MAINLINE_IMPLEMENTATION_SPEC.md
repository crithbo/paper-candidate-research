# Mainline implementation specification

## Authority and boundary

- User policy approval is recorded in `USER_APPROVAL_DIRECTIVE.md`; do not request the same generic approval again.
- Only `MAINLINE-CONTROL` may apply shared-file changes.
- Apply at a safe assignment boundary. Existing assignments keep frozen rules/hashes.
- Do not start Discovery, Stage 0/A/B, a backtest, a shadow run, E2, download, experiment or automation merely by applying this package.

## Preflight

1. Recompute all old hashes in `AUDIT_INPUT_SNAPSHOT.md`.
2. If any proposed shared file changed, do not force-apply. Three-way inspect the exact hunk, preserve unrelated user/mainline edits, and record the new preimage hash.
3. Confirm there is no active shared-file writer.
4. Confirm `rules/DISCOVERY_CLAIM_PACK.md` and `templates/DISCOVERY_EVIDENCE_LEDGER.yaml` do not already exist under different semantics.

## Exact shared-file delta

Apply `DRAFT_PATCH.diff` from the workspace root with a patch engine that accepts deliberately narrow context. The package was checked with:

```text
git apply --check --recount --unidiff-zero --unsafe-paths stages/rule-audit/RULE-AUDIT-20260813-PRO-REVIEWED-DISCOVERY-CLAIMPACK-R9/DRAFT_PATCH.diff
```

Then apply with the same flags without `--check`, or reproduce the same hunks using `apply_patch` as required by the mainline execution environment.

Affected shared files:

- update `AGENTS.md`;
- add `rules/DISCOVERY_CLAIM_PACK.md`;
- update `rules/ROLE_DISCOVERY.md`;
- update `rules/ROLE_MAINLINE.md`;
- update `rules/ROLE_DISCOVERY_BACKTEST.md`;
- update `rules/ROLE_STAGE0_REVIEW.md`;
- update `templates/TOPIC_BRIEF.md`;
- update `templates/STAGE0_REPORT.md`;
- update `templates/HANDOFF.yaml`;
- update `templates/DISCOVERY_METHOD_BACKTEST.md`;
- add `templates/DISCOVERY_EVIDENCE_LEDGER.yaml`.

## Registry control-plane update

Do not rewrite candidate states. Add one control record whose exact YAML placement follows the current registry schema:

```yaml
discovery_claim_pack_v9_r0:
  proposal_id: DISCOVERY-CLAIM-PACK-V9-R0
  approval_id: RULE-AUDIT-20260813-PRO-REVIEWED-DISCOVERY-CLAIMPACK-R9
  approval_status: USER_APPROVED_FOR_INSTALLATION
  protocol: rules/DISCOVERY_CLAIM_PACK.md
  mode: OFF
  canonical_production_allowed: false
  reason: INDEPENDENT_PAIRED_BLIND_BACKTEST_AND_TWO_PROSPECTIVE_SHADOW_WAVES_REQUIRED
  legacy_production_method_unchanged: true
  r7_stacking_allowed: false
  e2_default: NOT_RUN_NOT_REQUIRED_FOR_STAGE0
  scheduling_change_included: false
  discovery_lane_ceiling: 6
  terminal_stop_revival_allowed: false
  backtest_started: false
  shadow_waves_completed: 0
  cutover_requires_separate_mainline_acceptance: true
```

Update the top-level `rules_revision` with a suffix such as `__discovery-claim-pack-v9-r0-installed-off`, without describing it as production-calibrated.

## Plan/history update

- `plan.md`: record that the Pro-reviewed claim-pack rules are installed in `OFF`, production Discovery remains closed/current method unchanged, and no evaluation run was started. List the next optional action as an independently frozen backtest, not an automatic dispatch.
- `history.md`: append one compact policy record with approval ID, implementation package path, old/new shared-file hashes, mode OFF, safety boundaries and rollback.

## Mechanical acceptance

After applying:

1. verify the patch or equivalent exact hunks;
2. search for `DISCOVERY_CLAIM_PACK_MODE`, `E2_ENGINEERING_SMOKE`, `C0_DIRECT_COVERED`, `DISCOVERY_EVIDENCE_LEDGER` and the contribution types across affected rules/templates;
3. confirm `E2` is optional/non-claim-bearing and never a Stage 0 admission requirement;
4. confirm terminal STOP non-revival and new-ID language remains;
5. confirm the six-lane ceiling remains and no seventh lane/3-seat cutover is introduced;
6. confirm legacy frozen assignments need not supply new fields;
7. recompute SHA-256 for every changed shared file;
8. write a mainline implementation report, `handoff.yaml` and strict manifest under this audit directory's `mainline-implementation/` subdirectory.

## Rollback

- Default operational rollback: registry mode remains or returns `OFF`; no candidate state rollback is needed.
- File rollback: restore only the exact old versions listed in `AUDIT_INPUT_SNAPSHOT.md` after checking that no later approved edits overlap. Never use a broad reset.
- Scientific rollback trigger: hard-gate leakage, false structural-DROP regression, contamination, E2 evidence leakage, terminal-revival behavior, or failure of preregistered paired endpoints.

