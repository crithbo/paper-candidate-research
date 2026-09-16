# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260813-AI-TOPIC-DISCOVERY-WORKFLOW-R8`
- `proposal_id`: `DISCOVERY-CASCADE-R8-FRESH-PAIRED-BACKTEST`
- `decision_label`: `BACKTEST_REQUIRED__USER_POLICY_DECISION_REQUIRED`
- `user_policy_approval_required`: `true`
- `backtest_required`: `true`
- `production_patch_authorized`: `false`
- `discovery_reopen_authorized`: `false`
- `parallelism_change_authorized`: `false`
- `shared_files_modified`: `false`

## Problem statement

现有 Discovery 的低 raw-to-proposal 比率混合了健康 abstention 与重复/异质 screening units，不能直接解释为低 recall。更明确的注册证据是：旧审计窗口六个 Stage0 briefs 全部需要 Stage0 补回 cutoff 前可获得的 source/action 信息。R7 的质量行为保持 dormant；v8.8-R3 未校准；R3R1 因缺 control arm 而未进入 executor。因此不能把旧方案修词后直接切生产。

需要一个全新、assignment-gated、paired、blind、可回滚的 R8，以测试多源 seed、机制去重、多通道检索、facet rerank、NEXT_BEST_CHECK、保守停止与静态执行预检是否在相同预算下提高 clean-brief precision，同时不降低科学门。

## Current rule

- `rules/ROLE_DISCOVERY.md`: 已要求机会包、三遍发现法、current-upstream reality check、R7 dormant collision-first 与 fidelity closure plan；R7 当前 `OFF`。
- `rules/ROLE_MAINLINE.md`: 当前 `S1–S6` 六来源直接并行；Discovery 已按用户指令停止新分发；R7 不得改变六路并发。
- `rules/ROLE_DISCOVERY_BACKTEST.md`: 要求独立 `PACKER → EXECUTOR → AUDITOR`，但旧 R3R1 实际暴露 control/treatment schema 未在 dispatch 前完成 scoreability 检查。
- `templates/TOPIC_BRIEF.md`: 有 R7 可选字段，但没有 R8 的 NEXT_BEST_CHECK、跨 wave evidence delta 与静态 execution preflight compact block。

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| `rules/ROLE_DISCOVERY.md` | `DISCOVERY_R8_MODE` | 无 R8 权威 | 新增 `OFF/SHADOW/PRODUCTION`，默认 OFF；与 R7 分开，不继承旧 calibration。 |
| `rules/ROLE_DISCOVERY.md` | candidate cascade | 当前三遍法 + dormant R7 | 增加 four-source seed、mechanism signature、cheap structural prefilter、retrieval union、facet rerank、NEXT_BEST_CHECK、conservative stop、static execution preflight。 |
| `rules/ROLE_DISCOVERY.md` | dispositions | 现有 raw statuses | 保留现有状态并增加 audit-only `HUMAN_CORE_HIGH_VALUE`；不自动创建 registry state。 |
| `rules/ROLE_DISCOVERY.md` | cross-wave artifacts | handoff/manifest | 在 R8 active 时输出 packet-local `OPPORTUNITY_FAMILIES.yaml`、`EVIDENCE_DELTA.jsonl`、`DECISION_TRACE.md`。 |
| `templates/TOPIC_BRIEF.md` | compact R8 section | R7 optional block | 增加 mechanism signature、source-role passport、next-best checks、stopping proof、static execution preflight 与 claim ceiling。 |
| `rules/ROLE_DISCOVERY_BACKTEST.md` | scoreability/control arm | 一般角色独立要求 | PACKER dispatch 前验证 control/treatment 都有完整可评分 schema；缺任一 arm 即 `FAILED_NOT_DISPATCHABLE`。 |
| `rules/ROLE_DISCOVERY_BACKTEST.md` | R8 paired design | 无 | 同一 blind packet、cutoff、预算、access boundary；旧案例只作 regression，新 blind holdout 决定泛化。 |
| `rules/ROLE_MAINLINE.md` | evidence snapshot | registry/handoff | 主线仅在 assignment boundary 机械合并 packet-local evidence snapshot；registry 只存 pointer/hash。 |
| `rules/ROLE_MAINLINE.md` | feedback | repair telemetry only | 至少六个独立 Stage0 决定后才可按 repair vector 调整 source-mode，单次不超过 10 percentage points，保留 exploration floor。 |
| `rules/ROLE_MAINLINE.md` | parallelism treatment | 六来源直接并行 | **可选、独立政策项**：保留六身份、试点三 active seats。未经新用户批准不得改变现行六路并发。 |

## Safety invariants

- Q2 minimum/Q1 priority: unchanged.
- Same-object/latest collision/current strong baseline: strengthened.
- Natural input/evidence/full-cost/reproducibility/claim ceiling: unchanged or made more explicit.
- Missing implementation/result/resource: never structural solely for that reason.
- AI executability: queue-only; human-core high-value topics remain visible.
- Action-space overlap: never automatic absorption.
- `SEARCH_BOUNDED_OPEN`: preserved; no global novelty claim.
- STOP non-revival: preserved.
- Independent Stage0/StageA and user StageB/formal-project approval: preserved.
- Current Discovery stop: preserved until a separate explicit reopen.

## Validation plan

1. Create a fresh R8 method directory; do not overwrite or extend v8.8/R3R1.
2. Freeze control v8.7 and treatment R8 schemas, budget, cutoff, output fields, scoreability mapping and acceptance metrics before PACKER handoff.
3. Historical regression: Knative, UST, WebGraph, HNSW, GIN, AIGER, QUIC, AArch64, at least 3 positives, 4 true structural negatives and 3 unfrozen/resource controls.
4. Blind holdout: at least 8 unseen families: 3 positive, 3 true structural negative, 2 unfrozen/resource.
5. Strict independent long-lived `PACKER → EXECUTOR → AUDITOR`; executor sees neither identity/outcome nor key.
6. PASS 后运行两波 noncanonical shadow；任何安全失败立即停止，禁止自动 R8R1。

### Acceptance thresholds

- blind positive recall noninferior to control;
- all known cutoff-available material collisions recovered;
- false structural drop on unfrozen/resource controls = 0;
- terminal revival/hard-gate bypass/shared-write/contamination = 0;
- all structural decisions have named subtractor, locator and facet match;
- duplicate-family deep reviews reduced by at least 50%;
- target cost per clean brief reduced by 30% under identical accounting, or result remains `NOT_CALIBRATED` if sample/power is insufficient;
- Stage0 discovers no new cutoff-available minimum-set omission in two shadow waves;
- no proposal/PASS quota.

## State and compatibility

- Existing candidates/states: no retroactive re-judgment.
- Existing STOP/PASS/HOLD/BLOCKED: unchanged.
- Existing assignments: frozen rules remain unchanged.
- R7/v8.8/R3R1: preserved as historical evidence; not rebranded as R8.
- One-time migration: none before production approval.
- Rollback: keep `DISCOVERY_R8_MODE=OFF`; do not adopt evidence snapshot or scheduling treatment; no candidate-state rollback required.

## Decision request

本次用户指令只批准生成报告，尚未批准以下任一行为：

1. R8 paired backtest；
2. source acquisition/download；
3. 两波 shadow；
4. 共享规则或模板 patch；
5. 把六路并行改为三 active seats；
6. 恢复 Discovery；
7. 创建候选、Stage0/A/B、实验或自动化。

如用户决定推进，建议先单独批准“R8 paired backtest contract”，将并行数变更作为可分离的第二政策决定。即使 R8 PASS，也必须返回 exact shared-file diff、old→new hashes、shadow 结果与 rollback point 供用户再次批准 production cutover。

