# Rule Audit Report

## Identity

- `audit_id`: `RULE-AUDIT-20260810-SCREENING-THROUGHPUT-PARALLELISM-R4`
- `trigger`: 用户认为当前筛选速度与效率不足，并询问是否应增加并行数。
- `requested_by`: 用户直接请求
- `date`: 2026-08-10（Asia/Shanghai）
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260810-SCREENING-THROUGHPUT-PARALLELISM-R4/`
- `shared_files_modified: false`

## Executive conclusion

当前最慢的不是 raw paper/genealogy screening，而是三个串联问题：

1. `Discovery brief precision` 偏低，raw coverage 很快，但大量工作不能形成精确 Stage 0 brief；
2. `Stage 0 → Stage A` 的决定性通过率低，累计已有决定性 Stage A 结论的 7 题中仅 1 PASS、6 STOP；
3. 单一主线同时承担规则迁移、机械验收、共享状态写入和下一 lane 投递，容易让已完成 handoff 在控制面排队。

因此不建议永久增加每阶段 lane 上限，也不建议在 v8.8 回测完成前扩大 raw Discovery 并发。建议先做一个可撤销的 `+1 burst seat`：当规则维护/方法回测占用一席、同时存在已经通过上游 gate 的可执行 scientific assignment 时，临时允许总活跃席位从现行默认四席增至五席；只反归档既有长期 lane，不新建逐题会话。当前最适合占用该席的是已完成 `CONFIRM_STAGE0_PASS`、等待主线验收的 `AIGER-DELTA-SCHEDULE` Stage A，而不是第三、第四条浅筛 Discovery。

永久扩容应等待队列证据。当前 candidate lane、Stage A gate 和两条 Stage 0 lane 均无积压，扩充它们不会提高产出。

## Question and scope

- User/process question: 当前筛选为何慢；瓶颈属于 Discovery、Stage 0、Stage A 还是主线调度；是否需要增加并行数，以及增加到哪一层。
- Rules inspected: `AGENTS.md`、`plan.md`、`registry.yaml`、`rules/ROLE_RULE_AUDIT.md`、`rules/ROLE_MAINLINE.md`、`rules/ROLE_DISCOVERY.md`、`rules/ROLE_DISCOVERY_BACKTEST.md`、`rules/ROLE_STAGE0_REVIEW.md`、`rules/ROLE_CANDIDATE_OWNER.md`、`rules/ROLE_STAGEA_REVIEW.md`。
- Audit evidence inspected: R1/R2/R3 rule-audit reports and proposals；registry Wave29–47、session pool、candidate states、active task records；Codex live task status for mainline、AIGER confirmation、Stage 0、candidate、gate and v8.8 PACKER。
- Method: `academic-research-suite` 的 stage-gated、integrity-first、reproducible handoff 与 interaction-budget 原则。
- Out of scope: 不重审候选科学结论；不运行 Discovery/Stage 0/A/B、实验或下载；不改变共享规则、registry、plan、模板或任务状态；不复活 STOP。
- Snapshot caveat: 主线正在执行用户已批准的 R3 P0/P1/P2，因此共享文件处于受控更新中。本报告冻结 2026-08-10T21:40:56+08:00 所见的 authoritative v8.7+P0 与 P1 shadow 状态；shadow 文件不是本报告的生产规则。

## Current authoritative behavior

1. `rules/ROLE_MAINLINE.md`“并发与在制品”仍以默认四席位调度：普通供给期为主线、两个 Discovery、一个 Stage 0 或 candidate；决定性证据期为主线、一个 Discovery、一个 candidate、一个 gate/review/第二 candidate。
2. 同节仍列 Discovery 18–24 raw、6–10 briefs、Stage 0 6–8、Stage A 3–5、Stage B 1–2 的 WIP 目标，虽声明不是配额，但没有规定依据真实 ready queue 自适应扩缩。
3. `registry.yaml` 允许每阶段默认 2、最大 4 条长期 lane，并要求优先反归档旧 lane，不创建逐题任务。
4. Stage 0 PRIMARY 与 confirmation 必须独立；v8.8 backtest 必须 `PACKER → EXECUTOR → AUDITOR` 串行交接。这些独立性门不能为了速度合并。
5. candidate 与 Stage A gate 均为长期复用 lane；只有存在真实 WIP 才反归档 lane2–4。
6. 主线是共享状态唯一写者。该单写者边界正确，但当前规则没有“科学 handoff 快速验收优先于非关键规则重构”的显式调度优先级。

## Evidence of a problem or of correct behavior

| Observation | Source/artifact | Repeated? | Classification |
|---|---|---:|---|
| Wave29–47 在约 3 小时 43 分钟内登记至少 238 个异质 screening units（genealogies、deep audits、rescreen topics、measurement stacks）并形成 6 个 Stage 0 proposals。原始扫描吞吐并不低；单位并非完全同质，不能把 238 当精确统计分母。 | `registry.yaml` Wave29–47 | 是 | Raw throughput healthy; precision bottleneck |
| 六个 proposals 为 KNATIVE、UST、WebGraph、HNSW、GIN、AIGER；前五个分别在 Stage 0/Stage A 形成 STOP 或 HOLD，仅 AIGER 最新独立 confirmation 给出 Stage 0 PASS。 | registry、plan、live AIGER confirmation | 是 | Brief precision / Stage A yield issue |
| 累计 Stage 0 独立 PASS 为 13；已有决定性 Stage A 结论的 7 题为 1 PASS、6 STOP，独立 PASS 比例约 14.3%。 | `plan.md`、`registry.yaml` | 是 | Downstream yield bottleneck |
| 当前 candidate lane1 与 Stage A gate1 空闲，lane2 冷归档；Stage 0 PRIMARY 与 confirmation 均已完成当前工作，没有候选排队。 | live task pool、registry session pool | 当前快照 | No downstream capacity bottleneck |
| AIGER confirmation 已完成 `CONFIRM_STAGE0_PASS / TIER_B_Q2_VIABLE`，但快照时 registry 仍显示 confirmation active；主线同一长 turn 正在执行 P0/P1/P2。 | AIGER confirmation final、mainline current turn、registry | 当前实例；结构风险可重复 | Mainline head-of-line control-plane delay |
| v8.8 PACKER 已与主线规则迁移并行运行，证明维护任务和独立方法回测可以并行，而不破坏单一共享写者。 | live PACKER、mainline turn | 当前实例 | Correct parallelization |
| 热池固定 S2/S6 会造成来源偏置；plan 已提出“两条热 Discovery 槽在 S1–S6 轮转、M1 周期/触发”，但尚未成为生产调度规则。 | `plan.md`“会话池/下一步” | 是 | Scheduling clarity gap |
| R1/R2 已证明继续扩大 broad raw coverage 的边际收益很低；v8.8 回测正在验证 collision minimum set、atomic action certificate、model/native boundary 与 top-k deep review。 | R1/R2/R3，active PACKER | 是 | More raw concurrency premature |
| Stage 0 双审没有 ready queue，candidate/gate 也没有 wait queue。 | live pool、registry | 当前与此前多轮 | `NO_CHANGE` for permanent lane count |

## Bottleneck diagnosis

| Pipeline point | Current condition | Is more parallelism useful now? | Correct action |
|---|---|---|---|
| Raw Discovery | High scan throughput, low proposal precision | Not before v8.8 pass | Finish backtest; then use rotating two-lane + bounded third burst/shadow |
| Discovery → Stage 0 handoff | Current collision/action certificate often repaired downstream | Parallelism amplifies rework | Apply v8.8 only after audit PASS; measure clean-brief rate |
| Stage 0 PRIMARY | Idle, no brief queue | No | Keep one hot lane |
| Stage 0 confirmation | Current assignment completed, no queue | No permanent expansion | Keep independent lane; pipeline N+1 only when ≥2 briefs exist |
| Mainline acceptance/dispatch | Single writer also doing major maintenance | Yes, through priority and one burst seat | Fast-accept finished scientific handoff before continuing noncritical refactor block |
| Stage A owner | Idle while one newly confirmed PASS awaits mainline acceptance | Yes, immediately after authoritative acceptance | Use existing lane1; no lane2 yet |
| Stage A gate | Idle | No | Activate only after owner handoff |
| Backtest | PACKER active; roles must be serial | No role parallelization | Preserve PACKER→EXECUTOR→AUDITOR independence |

## Parallelism recommendation

### Immediate

Adopt a temporary `MAINTENANCE_COEXISTENCE_BURST` of one additional active seat. It applies only when all are true:

1. a rule migration or method backtest is active;
2. at least one scientific assignment has completed its upstream independent gate and is ready to dispatch;
3. the required existing long-lived lane is idle;
4. unique write directories and frozen rule revisions are present.

The burst seat ends when the ready queue is empty or the maintenance/backtest closes. It does not increase any per-stage maximum above four and does not create a new task. Under the present snapshot, AIGER Stage A is the eligible workload once mainline mechanically accepts the confirmation handoff.

### After v8.8 backtest passes

Use two rotating hot Discovery lanes across S1–S6, plus M1 on cadence/trigger. A third Discovery burst may run only when Stage 0 ready queue is 0–1, Stage A ready queue is empty, and the third source is orthogonal/least-recently-used. It must use existing archived sessions and the same brief cap; it is removed as soon as Stage 0 or Stage A WIP appears.

### Do not expand now

- Do not add candidate lane2/gate2 until there are at least two independently confirmed, resource-ready Stage A assignments.
- Do not add a third Stage 0 pair until two consecutive accepted batches show both existing Stage 0 lanes continuously occupied and a nonempty wait queue.
- Do not parallelize PACKER/EXECUTOR/AUDITOR for the same packet.
- Do not keep all six Discovery sources simultaneously active merely to increase raw count.

## Risk analysis

- False-negative risk: moderate if fixed S2/S6 heat persists; rotation reduces coverage bias. More raw lanes without v8.8 may preserve the same false-negative/false-positive patterns.
- False-positive/weak-paper risk: high if parallelism is used as a proposal quota; proposal count must remain unconstrained.
- Scientific-integrity risk: low for a +1 scheduling burst because scientific gates and independent reviews remain unchanged; high if Stage 0 confirmation or backtest roles are merged.
- Resource/time risk: moderate. One additional active task consumes model budget, but reuses an existing lane and is removed when no ready science exists.
- State-migration risk: low. No candidate state migration and no new formal status are needed.
- Terminal-revival risk: zero by design; scheduling changes do not touch terminal topics.

## Recommendation

- Decision: `PATCH_RECOMMENDED`
- Minimum effective change: replace fixed-seat-only language with an adaptive queue policy, add `MAINTENANCE_COEXISTENCE_BURST=1`, give completed scientific handoffs priority over noncritical refactor continuation, and add queue/service/dispatch metrics. Do not change quality gates or permanent per-stage maxima.
- Why a smaller operational fix is insufficient/sufficient: manually dispatching AIGER would fix the current instance but not the recurring single-writer head-of-line risk. Permanently adding multiple lanes is larger than the evidence supports. A one-seat, condition-triggered pilot is the smallest general fix.
- Non-relaxable gates preserved: Q2、same-object、latest collision、fair current strong baseline、natural input/evidence、full-cost、reproducibility、claim ceiling、independent review、STOP non-revival and per-topic Stage B approval remain unchanged.

## Validation and rollback

- Historical cases/backtest required: no scientific behavior backtest. The active v8.8 backtest remains separately required for Discovery semantics.
- Shadow-run plan: two scheduling cycles under existing authoritative rules; record recommendations and actual dispatches without changing admission decisions. The first cycle may include AIGER Stage A plus the active PACKER/P1 work if mainline confirms authorization.
- Success criteria:
  1. any ready scientific assignment is accepted or explicitly rejected/blocked within the next mainline control cycle rather than waiting behind a new noncritical refactor block;
  2. no lane receives two assignments and no assignment is duplicated;
  3. rule revision/hash remains pinned per assignment;
  4. at least one scientific assignment remains active whenever a ready, authorized queue exists, even while maintenance/backtest is active;
  5. no increase in manifest, provenance, same-object or independent-review failures;
  6. Discovery expansion is not activated before v8.8 PASS except noncanonical shadow logging;
  7. user/model cost per accepted Stage 0 brief and per decisive Stage A observation is reported, not only raw papers per hour.
- Failure criteria: duplicated work, shared-file race, rule-revision drift, higher rework rate, hard-gate bypass, or an added seat remaining active with no ready assignment.
- Rollback condition: remove the burst seat and return to the current default four-seat policy; no candidate state rollback is required.

## Mainline handoff

- User approval already present: `NO_FOR_THIS_NEW_R4_SCHEDULING_PATCH`; the user requested audit, not automatic activation.
- Files proposed for change after approval: `rules/ROLE_MAINLINE.md`“并发与在制品/主线验收/通信”；future normalized control-plane scheduling fields in `registry.yaml` or its P1 shadow schema. No scientific role rule requires semantic change.
- Registry migrations proposed: none for candidate states; add only scheduling telemetry/config after approval.
- Existing active/blocked/hold/terminal topics affected: no scientific decision changes. AIGER may become the first pilot workload only after mainline accepts its existing confirmation and confirms Stage A authorization. BLOCKED/HOLD/STOP remain unchanged.
- Shared files modified: `false`
