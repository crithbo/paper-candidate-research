# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260813-R11A-PHASE1-IDENTITY-CAPACITY-R13`
- `proposal_id`: `R11A-BOUNDED-OPAQUE-IDENTITY-CAPACITY-V1`
- `authorization_id_proposed`: `R11A-BOUNDED-OPAQUE-IDENTITY-CAPACITY-20260813-R13A`
- `decision_label`: `USER_POLICY_DECISION_REQUIRED__ASSIGNMENT_LOCAL_CAPACITY_AMENDMENT_RECOMMENDED`
- `user_policy_approval_required`: `YES__FINITE_NEW_COMMITMENT_AND_PRIVATE_INTERSECTION_AUTHORITY`
- `backtest_required`: `false__per_batch_mechanical_validation_required`

## Problem statement

R12A correctly closed prior-identity exclusion for four immutable candidate commitments. Checkpoint 011 has two eligible and two pending families, but Phase-1 requires at least 60. Blocker 012 proves the current roster's maximum reachable value is four. New public-source work cannot create admissible identities unless a finite expanded commitment and mainline-private intersection path is expressly authorized.

## Current rule

- File/heading: R11A `PHASE1_INDEX_ASSIGNMENT.yaml` / `eligibility_pool`, `family_qualification_record`, `contamination_controls`; R12A resume amendment.
- Current behavior: only the four pre-R12A identities have a valid exclusion result; no future-batch authority exists.
- Why insufficient: the control contract is safe but arithmetically incapable of reaching the unchanged acceptance minimum.

## Proposed minimum delta

| Assignment-local control | Current semantics | Proposed semantics |
|---|---|---|
| Candidate commitment capacity | four immutable identities only | total unique ceiling 128 including the four; raw-lead ceiling 160 |
| Batch schedule | none | append-only `32/32/32/28` new unique batches; no fifth/replacement batch |
| Precommit/intersection order | one R12A batch | public identity preflight → immutable commitment → mainline-private intersection → full source qualification |
| Packer-visible result | four-candidate R12A result | own IDs/hashes, booleans, algorithm/profile, roots/manifests and counts only |
| Mainline gate | one resume gate | mandatory mechanical gate after every batch; no per-batch user reapproval inside caps |
| Source qualification | unchanged | unchanged and performed only after nonmatch; nonmatch never implies eligibility |
| Resource envelope | existing R11A envelope | no increase; additional offline control subcaps only |
| Shared rules/templates | unchanged | no patch |

Exact paths, schemas, caps, validation and rollback are specified in `R13_CAPACITY_CONTROL_SPEC.md`.

## Safety invariants

- Q2 minimum preserved: yes.
- Q1 priority preserved: yes.
- Same-object preserved: yes; same-object source bridge remains mandatory.
- Latest collision preserved: unchanged.
- Fair current strong baseline preserved: unchanged.
- Natural input/evidence preserved: unchanged.
- Full-cost preserved: unchanged.
- Reproducibility preserved: strengthened by append-only batch commitments, manifests and deterministic intersection.
- Claim ceiling preserved: nonmatch remains identity-control evidence only.
- STOP non-revival preserved: yes.
- User StageB approval preserved: yes.
- R11A 60–80/72 target, six strata, contribution diversity/cap, source qualification, blind isolation and statistical thresholds preserved: yes.

## State and compatibility migration

- Existing states affected: only `BLOCKED_USER_ACTION_REQUIRED__CONTROL_PLANE_IDENTITY_CAPACITY` may resume after approval and the first batch gate.
- Existing assignments affected: same Phase-1 assignment and directory; no new Packer assignment or repack.
- Template compatibility: no shared-template change.
- Old filename compatibility: all existing R11A/R12A files remain immutable; R13 uses additive names.
- One-time migration required: mainline freezes the R13 capacity amendment and batch gate schema.
- Rollback path: revoke only R13 inputs, restore checkpoint 011/blocker 012, retain original four commitments, R12A PASS and all evidence.

## Validation plan

- Historical/time-slice cases: none; this is not a method evaluation.
- Negative controls: within/cross-batch duplicate, unhashable/ambiguous identity, prior match, changed commitment after seal, collision injection, extra/missing visible candidate, forbidden field/protected-string leak, noncanonical digest and cap/budget breach.
- Expected behavior changes: Phase-1 can commit enough independently deduplicated candidate identities for 60 to be arithmetically reachable; no family becomes eligible from the amendment alone.
- Forbidden regressions: private denylist or historical identity disclosure; private-match-guided commitment; identity/old-evidence modification; relaxed source or coverage qualification; more than four batches; resource top-up; downstream dispatch.
- Acceptance threshold: every batch gate passes exactly; final Phase-1 acceptance still requires all original 60–80 and coverage gates.

## Decision request

Fresh approval is required because R12A covered only four frozen candidate identities and did not authorize additional commitment/intersection batches.

Recommended exact approval wording:

> 批准 `R11A-BOUNDED-OPAQUE-IDENTITY-CAPACITY-20260813-R13A`：在同一 R11A Phase-1 assignment 与原写目录内，允许 PACKER 仅用公开候选身份按既有 `R11A-STABLE-FAMILY-IDENTITY-NORM-V1` 追加最多四个不可覆盖的 opaque commitment 批次，新增 unique commitments 依次最多 `32/32/32/28`，连同既有 4 个后累计 unique commitment 上限为 128；累计 raw identity lead 上限为 160，重复、不可哈希、歧义、prior-match 和来源不合格均消耗相应上限，不得第五批、替代批或无限补充。每批必须先冻结 commitment 及 manifest，再由 `MAINLINE_CONTROL_PLANE__DETERMINISTIC_NO_MODEL_HASH_INTERSECTION` 使用既有 R12A 私有 denylist 做离线相交；PACKER 只能收到其自身 opaque ID/hash 的 match boolean、SHA-256 与 normalization profile/version、既有 private root、无标签 source-manifest hashes 和汇总计数，不得收到历史身份明文、历史逐条 hash、目标名、结果、答案、case semantics、class/stratum、contribution type、method label 或私有映射。只有 nonmatch 候选才可继续既有 Phase-1 完整来源资格审查，nonmatch 不构成 eligibility 或科学证据。每批后必须通过主线机械门，验证预承诺顺序、哈希/manifest、跨批去重、碰撞、泄漏、容量算术、来源资格账本和剩余预算；本授权覆盖四批，无需逐批再次请求用户批准，但任何超额、第五/替代批、资源增补、normalization/denylist 变化、私有访问扩张、阈值变化或下游投递都需新的用户批准。保持 Phase-1 的 60–80、目标 72、六 strata 每类至少 8、至少五种 contribution type、单类不超过 30%、来源资格、盲隔离、统计阈值、旧证据与 identity 不变；不新增网络或下载权限，公开来源读取只沿用原 R11A Phase-1 资源与路线。任一缺失、歧义、重复未闭合、碰撞、非确定性、泄漏、预算/边界违例或最终容量不足均 fail closed，回到 checkpoint 011 与 blocker 012，不作科学负推断。不得启动 Phase 2、Executor、Auditor、shadow、Discovery、Stage0/A/B、E2、实验、自动化、外部服务或 production cutover。

Until this exact narrow approval exists, preserve blocker 012 and do not contact the Packer or create any R13 control/commitment artifact.

