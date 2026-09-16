# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260813-R11A-HASH-ONLY-PRIOR-IDENTITY-DENYLIST-R12`
- `proposal_id`: `R11A-HASH-ONLY-PRIOR-IDENTITY-DENYLIST-V1`
- `decision_label`: `USER_POLICY_DECISION_REQUIRED__ASSIGNMENT_LOCAL_CONTROL_ARTIFACT_RECOMMENDED`
- `user_policy_approval_required`: `YES__NARROW_NEW_PROTECTED_IDENTITY_READ_AUTHORITY`
- `backtest_required`: `false__mechanical_fixture_validation_required`

## Problem statement

R11A requires proof that new eligibility-index families do not reuse prior V8.8/R10 identities. The authorized historical surfaces contain no comparable stable-family hash values. PACKER correctly refused to derive them from protected identity/semantic material, leaving every family exclusion-unverifiable at checkpoint 008. Repeating search cannot close a missing control-plane artifact.

## Current rule

- File/heading: R11A `TWO_PHASE_MASTER_CONTRACT.yaml` / `identity_and_contamination_controls`; `PHASE1_INDEX_ASSIGNMENT.yaml` / `family_qualification_record` and `contamination_controls`.
- Current behavior: Packer may use old material only for identity-hash dedup/exclusion and may read an existing prior hash, while old identities/outcomes/cases remain protected.
- Why insufficient: no role is authorized to convert the legacy identity-bearing fields into the newly required stable hash format, and no comparable denylist exists.

## Proposed minimum delta

| File/control | Current semantics | Proposed semantics |
|---|---|---|
| New R11A control-private denylist directory | absent | mainline-owned deterministic no-model transform over exact frozen protected inputs |
| `NORMALIZATION_PROFILE.yaml` | absent | freeze `R11A-STABLE-FAMILY-IDENTITY-NORM-V1` and SHA-256 canonicalization |
| Private denylist/provenance/validation | absent | hashes only, source-manifest hashes, counts, validation; no scientific content |
| Packer candidate commitment | absent | Packer freezes its own candidate identity hashes before comparison |
| Packer-visible exclusion result | absent | only candidate-owned opaque IDs/hashes, booleans, aggregate counts and roots; no prior identities or method labels |
| R11A additive resume amendment | blocked at checkpoint 008 | reference validated artifact hashes and resume the same Phase-1 assignment |
| Shared rules/templates | unchanged | no patch |

Exact paths, schema, normalization, validation and rollback are frozen in `HASH_ONLY_DENYLIST_CONTROL_SPEC.md`.

## Safety invariants

- Q2 minimum preserved: yes; no candidate admission threshold changes.
- Q1 priority preserved: yes.
- Same-object preserved: yes; this artifact only checks identity reuse.
- Latest collision preserved: unchanged.
- Fair current strong baseline preserved: unchanged.
- Natural input/evidence preserved: unchanged.
- Full-cost preserved: unchanged.
- Reproducibility preserved: strengthened by a versioned normalization profile, exact source hashes and deterministic recomputation.
- Claim ceiling preserved: yes; the artifact carries no scientific claim.
- STOP non-revival preserved: yes.
- User StageB approval preserved: yes.
- Blind identity/outcome separation preserved: yes; Packer never receives protected values or the private prior digest set.

## State and compatibility migration

- Existing states affected: only R11A Phase-1 control blocker after successful validation.
- Existing assignments affected: same R11A Phase-1 assignment resumes from checkpoint 008; no new PACKER calibration/repack.
- Template compatibility: no shared template changes.
- Old filename compatibility: not applicable; old packages remain immutable.
- One-time migration required: exact 28-record legacy identity transformation plus zero-case R10 provenance, then additive registry/control registration by mainline.
- Rollback path: mark artifact `REVOKED_NOT_INPUT`, remove it from Packer allowlist, restore checkpoint-008 blocker and preserve all artifacts/checkpoints.

## Validation plan

- Historical/time-slice cases: no scientific replay; all exact frozen historical identity records are transformed mechanically.
- Negative controls: malformed identity, missing identifier, DOI aliases, arXiv versions, URL aliases, identical duplicate, different-preimage collision injection and protected-string leakage fixture.
- Expected behavior changes: R11A exclusion proof becomes mechanically decidable without revealing old cases; no change to eligibility, strata or downstream thresholds.
- Forbidden regressions: raw identity or semantic leakage; partial denylist accepted as complete; Packer adaptive search against a revealed prior hash set; source hash mismatch; output nondeterminism; any Phase 2/downstream dispatch before Phase-1 acceptance.
- Acceptance threshold: all control-spec checks pass exactly; otherwise no resume.

## Decision request

Fresh approval is required because existing R11A authority permits use of already-existing hashes but does not permit a new actor to read protected identities and derive hashes.

Recommended approval text:

> 批准 `R11A-HASH-ONLY-PRIOR-IDENTITY-DENYLIST-20260813-R12A`：仅允许主线控制面使用无模型、确定性的本地转换器读取 R12 提案列明的六个精确输入，按 `R11A-STABLE-FAMILY-IDENTITY-NORM-V1` 生成控制面私有哈希 denylist，并仅向 R11A PACKER 返回其已冻结候选哈希的相交结果、算法/版本、source-manifest hashes 与汇总计数。禁止泄漏目标名、标识原文、结果、答案、case semantics、class/stratum 或 method labels；禁止改阈值、样本、OFF/PRODUCTION、旧证据、checkpoint 或任何科学状态。机械验证全部通过后可从 checkpoint 008 恢复同一 Phase-1 assignment；任一缺失、歧义、碰撞、非确定性或泄漏均 fail closed。不得启动 Phase 2、Executor、Auditor、shadow、Discovery、Stage0/A/B、实验、下载、自动化或外部服务。

Until that exact narrow approval exists, mainline must preserve the checkpoint-008 blocker and must not contact PACKER.

