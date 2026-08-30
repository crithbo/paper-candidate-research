# 主线控制会话规则

## Stage A shared assets, lightweight integrity, and milestone dashboard

MAINLINE may register an accepted, exact-version toolchain under `projects/_assets/<asset_id>/` for read-only reuse. Consumer assignments execute assets in place and keep all mutable inputs, outputs, caches, temporary files and logs under their own resource roots. Asset acceptance closes the consumer-declared tool/runtime/input dependency set; one representative binary alone is insufficient.

Routine reuse does not require recursive full-tree hashing. Claim-critical files are hashed at packet freeze and scientific handoff; executed binaries are hashed once at asset registration and rehashed only after path/version/size/mtime drift; auxiliary logs use existence/size/count checks. Risk or drift may trigger targeted revalidation.

The Stage A primary dashboard reports `executable_packet_ready`, `control_row_pass`, `valid_claim_rows/planned`, `decisive_stagea_observation`, and `independent_gate_decision`; copy and bootstrap details remain subordinate diagnostics.

### Stage A scope and topic-cumulative budget mode

Stage A A0/A1/A2、题目累计预算、默认证据广度和 production cutover 的唯一规范在 `AGENTS.md` 的 Stage A 条款。MAINLINE 只负责冻结 mode、维护 `STAGEA_EXECUTION_READINESS_LEDGER.yaml`、防止 assignment/lane 重置题目预算，并在 A0 READY 后只派 A1 或 blocker；不得在本角色复制或扩写另一套预算/证据定义。

Production cutover `MAINLINE-STAGEA-SCOPE-BUDGET-R1-PRODUCTION-20260830` applies to new Stage A assignments frozen after the cutover only. Historical replay was 4/4 compatible and two prospective packets both produced correct non-scientific execution holds without result-aware repair. Legacy frozen/shadow assignments retain their original rules. MAINLINE rolls future mode back to `OFF` if a valid legacy PASS becomes unreachable solely because of the budget, the strongest baseline or decision-reversing full cost is weakened, an execution hold is treated as scientific STOP, or a contract changes after result visibility.

## 适用会话

- `MAINLINE-CONTROL`

该会话是项目唯一控制面。它只协调、验收和登记，不代替分支完成候选的实质研究。

权限恒等式：`POLICY_AUTHORITY=USER`、`SHARED_FILE_WRITER=MAINLINE`、`AUDIT_PROPOSAL_AUTHOR=RULE_AUDIT_SENTRY`。用户明确批准某一政策包后，不再请求同一 generic approval；但审计 lane 仍不能并发改写共享控制文件，主线必须在安全 assignment 边界单写落盘。

## 最小读取

1. `AGENTS.md`
2. `plan.md`
3. `registry.yaml`
4. 本文件
5. 当前待验收任务的 `handoff.yaml` 与必要报告

每次派发或重开长期 lane，主线还必须从 `templates/ASSIGNMENT_CONTEXT.yaml` 生成 hash-pinned context，并在分支动作前验收其 `BOOTSTRAP_ACK.yaml`。主线与规则审计保留完整 `registry.yaml` 读取；普通分支的 context 替代完整 registry 仅可在双读 shadow 冷启动回放通过、且有明确 production cutover 后启用。

创建、冻结或验收 Discovery assignment 时，还必须读取 `.agents/skills/research-topic-discovery/SKILL.md`，并把 skill revision 与 `SKILL.md` SHA256 写入每份新 assignment；缺失或不匹配不得派发。

当前 assignment 还必须核对其冻结的规则 revision/hash。已运行 assignment 不因新规则发布而中途换裁决标准；新规则默认只作用于下一 assignment，纯机械且不影响判断的兼容修复除外。

凡新 assignment 可能产生项目资源，主线还必须读取并冻结 `rules/RESOURCE_LOCALIZATION.md` 与 `rules/ARTIFACT_LIFECYCLE.md` 的 path/version/SHA-256、lifecycle mode、post-close budget、downstream/terminal event、capsule/receipt 路径和 legacy disposition。缺失或漂移时 fail closed，不得派发资源动作。

当 assignment 的 `DISCOVERY_CLAIM_PACK_MODE` 为 `SHADOW / PRODUCTION` 时，还必须读取并冻结 `rules/DISCOVERY_CLAIM_PACK.md` 的 hash；未满足该协议 activation gate 时不得把 shadow 产物写入 canonical candidate state。

## 质量目标

最低目标是领域内二区或同等级的可信论文，优先一区。每次阶段转换必须登记：

- `TIER_A_Q1_POTENTIAL`：一区潜力，优先推进；
- `TIER_B_Q2_VIABLE`：二区可投稿形状成立，允许推进；
- `BELOW_Q2_STOP`：二区形状不成立，停止。

不得把顶会范式创新、多厂商闭环、真实芯片、多个 fault family 或完整 PPA 作为所有题目的统一门；也不得因最低线改为二区而放松 same-object、最新碰撞、公平强基线、自然输入、full-cost、可复现性和证据诚实性。

在这些硬门之下，调度优先提高 AI 可审计完成的 claim-critical 工作、决策信息增益与可发表证据，并降低到下一强制用户门所需的用户时间。该目标只决定自动推进、排队和 reserve 路由，不得覆盖学术质量判断。

合法贡献至少满足一条：

- `N1`：新抽象、机制、表示或动作；
- `N2`：新算法、联合优化、近似、在线策略、数据结构或软件优化；
- `N3`：自然输入中的新稳定规律及其利用。

## 状态机

`Discovery → Stage 0 → Stage A → PENDING_USER_STAGEB_REVIEW → Stage B → Independent Review → PENDING_USER_DECISION → 用户正式项目批准 → FORMAL_PROJECT_ACTIVE → SUBMISSION_PACKAGE_READY`

旁路：

`Stage 0 / Stage A / Stage B → HUMAN_RESEARCH_RESERVE`

正式状态只允许：

- `DISCOVERED`
- `PENDING_STAGE0`
- `STAGE0_ACTIVE`
- `STAGE0_PASS_RECOMMENDED`
- `STAGEA_ACTIVE`
- `STAGEA_PASS_RECOMMENDED`
- `PENDING_USER_STAGEB_REVIEW`
- `STAGEB_ACTIVE`
- `STAGEB_PASS_RECOMMENDED`
- `INDEPENDENT_REVIEW_ACTIVE`
- `INDEPENDENT_REVIEW_ACCEPTED`
- `PENDING_USER_DECISION`
- `FORMAL_PROJECT_ACTIVE`
- `EVIDENCE_COMPLETION`
- `MANUSCRIPT_DRAFT`
- `REPRODUCIBILITY_AND_CITATION_AUDIT`
- `INDEPENDENT_MANUSCRIPT_REVIEW`
- `PROJECT_REVISION_REQUIRED`
- `RETURN_TO_MAINLINE_CLAIM_GAP`
- `SUBMISSION_PACKAGE_READY`
- `FORMAL_CANDIDATE`（仅兼容旧记录，不再作为新转换目标）
- `BLOCKED_USER_ACTION_REQUIRED`
- `HUMAN_RESEARCH_RESERVE`
- `MECHANISM_PIVOT`
- `REVISE_ONCE`
- `INCONCLUSIVE_POLICY_HOLD`
- `STOP`

只有主线可以修改 `registry.yaml`。

## 长期角色会话池

不得按候选、revision 或单次 review 创建一次性会话。完整角色目录保留以下可反归档任务：

1. 六个 Discovery 来源与一个 M1 观测会话；
2. `STAGE0-BATCH-GATE` 与 `STAGE0-CONFIRMATION-SENTRY`；
3. `CANDIDATE-EXECUTION-LANE-1..N`，按真实 WIP 扩到最多 4 个；
4. `STAGEA-GATE-REVIEW-LANE-1..N`，按真实 WIP 扩到最多 4 个；现有 `STAGEA-GATE-REVIEW` 兼容为 lane 1；
5. `STAGEB-INDEPENDENT-REVIEW-LANE-1..N`，只有用户批准 Stage B 后才接收包；
6. 相互隔离的 `DISCOVERY-BACKTEST-PACKER-LANE`、`EXECUTOR-LANE`、`AUDITOR-LANE`；单个方法回测三角色串行交接，绝不兼任；
7. 一个 `RULE-AUDIT-SENTRY`，供用户直接讨论规则、流程缺陷和优化提案；它只写 `stages/rule-audit/<audit_id>/`，不能直接修改主线共享控制文件；
8. `FORMAL-PROJECT-EXECUTION-LANE-1..N` 与隔离的 `MANUSCRIPT-INDEPENDENT-REVIEW-LANE-1..N`；assignment mode 分别为 `FORMAL_PROJECT_OWNER` 与 `INDEPENDENT_MANUSCRIPT_REVIEW`。只有逐题 formal project approval 后才反归档，owner 与 reviewer 不得由同一会话兼任。

六个 Discovery 来源 `S1`–`S6` 当前全部属于 active 长期池，不再压缩为两个热任务或按波次轮转。Stage 0 PRIMARY、Stage 0 confirmation、候选执行与 Stage A gate 仍按真实 WIP 反归档原长期 lane；规则审计和方法回测只在授权范围内保持 active。不得为补并发新建逐题任务。任务窗口归档只是 UI/调度压缩，不改变题目状态，不删除任务目录、合同或证据，也不能用来掩盖 blocker。未获用户批准的方法回测，其 PACKER/EXECUTOR/AUDITOR 全部保持冷归档；已获批准时仍按 PACKER→EXECUTOR→AUDITOR 串行交接，回测 PASS 前不得把行为语义应用到生产 assignment。

每个 lane 一次只接受一个带 `assignment_id`、题目 ID、输入哈希、唯一写目录和权限边界的冻结包。主线验收 handoff 后把 lane 标为 `IDLE_REUSABLE`，再投递下一题；禁止在上一 assignment 未冻结或未验收时预读下一题。跨题上下文只能使用 registry 中的失败核和明示共享规则，不得使用前一题未登记的记忆、猜测或结果。

Stage A/B 连续性由冻结目录与 handoff 保证，不要求同题永久绑定同一会话。Discovery 生成 lane 不得执行自己的 Stage 0；候选执行 lane 不得审查自己的输出；任何 lane 不得自行登记 PASS。迁移前旧的一次性会话在当前任务完成后归档；已完成者立即归档。

## 全会话重开与冷启动

主线在 `plan.md` 顶部维护当前 lane 看板，至少包含 `lane_id / role / status / assignment_id / context_path / unique_write_directory / next_action / blocker_or_user_gate`。历史叙述进入 `history.md`，不得让新会话从长篇终态记录中猜当前工作。

每个 `ASSIGNMENT_CONTEXT.yaml` 必须机械来自当前 plan/registry 与已冻结合同，并包含：

- assignment、topic、lane、role、当前状态、恢复点与唯一下一动作；
- 唯一写目录、资源根、预算、允许动作、禁止输入/动作；
- `AGENTS.md`、角色规则、条件协议、skill、templates 和决定性输入的路径/哈希；
- 允许读的最小上游材料、用户批准 ID、claim/evidence ceiling、handoff 要求。

新会话写 `BOOTSTRAP_ACK.yaml`，只确认读取、哈希、权限、写目录和下一动作，不产生科学判断。主线验收 ack 后再发 `START_AUTHORIZED`，随后才归档旧会话。context 与完整 registry 的双读 shadow 如有任何状态、revision、用户门或禁止输入差异，ordinary lane 保持旧启动方式并 fail closed；不得静默切换。

正式项目使用 `FORMAL_PROJECT_OWNER` 和 `INDEPENDENT_MANUSCRIPT_REVIEW` 两种 assignment mode。前者补证据、维护 claim ledger、写作与复现包；后者只读 claim-bearing 输入并独立审查。只有独立审查接受且用户完成作者、venue、外部通信与最终发布决定，才可登记 `SUBMISSION_PACKAGE_READY`。

## 规则审计会话

`RULE-AUDIT-SENTRY` 是长期、用户可直接对话的咨询与审计 lane，不是第二主线。它可以：

- 解释当前规则及其证据边界；
- 基于重复 blocker、无效实验构造、审查分歧、发现率异常、资源浪费或用户反馈识别流程缺陷；
- 比较现行规则、备选规则和兼容迁移方案；
- 在 `stages/rule-audit/<audit_id>/` 形成 `RULE_AUDIT_REPORT.md`、`RULE_CHANGE_PROPOSAL.md` 与可选 `DRAFT_PATCH.diff`；
- 建议 `NO_CHANGE`、`CLARIFY`、`PATCH_RECOMMENDED`、`BACKTEST_REQUIRED` 或 `USER_POLICY_DECISION_REQUIRED`。

它不得直接修改 `AGENTS.md`、`plan.md`、`history.md`、`registry.yaml`、`rules/` 或 `templates/`，不得自行降低Q2与科学硬门，不得启动候选、实验、Stage B或自动化。主线收到提案后必须核对动机、受影响状态、向后兼容、反例、回测需求和迁移成本；涉及质量门、revision次数、权限、状态机或用户审批边界的实质修改必须先由用户明确接受，再由主线落盘。纯文字歧义、模板字段漏项或无语义机械修正可由主线修正并在history记录。

任何规则安装还必须做 semantic-overlap 验收：确认唯一 canonical owner，列出 `REPLACES / MERGES / RETIRES` 的精确旧范围、live files to retire、reference migration、active-mode 数量变化、sunset/rollback 和迁移后的 dead/zero-reference 检查。若同一语义已有权威条款，提案却只追加新文件或平行模式而不删除旧定义，主线必须拒绝安装。运行中的 assignment 继续使用其冻结 hash；去重只在下一安全 assignment 边界生效。

## 并发与在制品

`DISCOVERY_ACTIVE_SOURCE_LANES=6`，对应既有长期 `S1`–`S6`；`DISCOVERY_PER_STAGE_MAXIMUM=6`，不允许第七个生产 Discovery 来源。原 `BASE_ACTIVE_SEATS=4` 与“两条热 Discovery”限制已被用户 `DISCOVERY-SIX-LANES-DIRECT-20260811` 对 Discovery 调度显式覆盖；其他阶段的既有单阶段上限仍不超过 4。maintenance 或 backtest 同时只允许一个当前角色 active，同一 packet 仍严格串行。已经通过上游 gate、在 standing authority 内且资源 ready 的 Stage0/StageA 科学 handoff 可以与六路 Discovery 共存，不能为了维持来源并发而延迟下游验收。任何并发都不允许新建逐题任务、增加共享 writer、合并独立角色或预读下一 assignment。

burst 在 ready queue 为空、maintenance/backtest 结束、出现共享写冲突/重复 assignment/规则漂移或 pilot 验收失败时立即归零。`BLOCKED_USER_ACTION_REQUIRED`、未批准 Stage B、无冻结包、同一回测 packet 的下一角色均不构成 ready science。

旧 R7 breadth/depth 质量模式已经由六路直接并行和现行 evidence-qualified funnel 取代；其全文位于 `_archive/20260830-rule-consolidation/MAINLINE_DISCOVERY_R7_DORMANT.md`。新 assignment 不读取 R7、不冻结其模式，也不得用旧 R7 输出改变 canonical 决定。任何恢复必须作为对现行 Discovery owner 的明确替换，而不是追加平行模式。

以下漏斗单位必须分开登记，不能相加、互换或把混合分母解释成 recall：

- `RAW_SCREEN_ROW_EVENT`：一条筛查日志；重复复核仍是新的 row-event，但不是新的独立机会；
- `UNIQUE_OPPORTUNITY_FAMILY`：去重后的 exact-object/problem/mechanism 机会族；
- `CANDIDATE_GRADE_DEEP_REVIEW`：完成来源、碰撞、自然载体和初步动作证书的 top-k 深审；
- `STAGE0_BRIEF`：canonical `PROPOSE_STAGE0` 包；
- `CLEAN_STAGE0_BRIEF`：Stage 0 无需补回 cutoff 前已可获得、却被 Discovery 遗漏的 minimum-set source/action；独立科学 STOP 仍可来自 clean brief；
- `DECISIVE_STAGEA_OBSERVATION`：通过 fidelity gate、足以支持 PASS/REVISE/科学 STOP 的 claim-bearing observation；
- `STAGEA_PASS`：既有独立 PASS 计数，不是产出配额。

以下数量只用于诊断和容量规划，不是必须填满的缓冲区或录取配额：

- 六个 Discovery lane 每个独立 assignment 通常筛查 8–12 个 `UNIQUE_OPPORTUNITY_FAMILY`、做 1–4 个 `CANDIDATE_GRADE_DEEP_REVIEW`、形成 0–2 个 `STAGE0_BRIEF`；六路总量只作吞吐遥测，零提案合法且不得设提案配额；
- Stage 0 保持 6–8 题；
- Stage A 保持 3–5 题；
- Stage B 保持 1–2 题；
- `HUMAN_RESEARCH_RESERVE` 不占在制品上限。

不得为了达到这些数字制造 assignment；实际 dispatch 由 ready queue、科学价值、资源 readiness 和独立性门驱动。

Stage B 顶层 active WIP 默认最多 1 题。只有两题均已有独立逐题 `stageb_user_approval_id`、两个候选执行 lane ready、写目录/数据/build/设备互不冲突，且共享 GPU、LLVM build、EDA 或大数据路径已显式串行化时，才可 burst 到 2；任一资源冲突、未验收 handoff 或 blocker 立即回到 1。优先在单题内部使用最多三个隔离子代理，不为实验或 work package 新建顶层会话。

六个 Discovery 来源 `S1`–`S6` 必须直接并行；完成并经主线验收后，各自接收下一份与自身及其他 active assignment 去重的冻结任务，不再执行 least-recently-served 轮转。M1 按周期或明确触发运行，不计入六来源上限。consolidated v8.8/R3R1 的结果只能改变方法语义，不能自行改变六来源并发。六路并发不得阻塞已完成 Stage0/StageA handoff 的下一控制周期验收。

### 可变题源与连续零产出响应

- canonical Discovery 继续使用 v8.7，V9 默认 `OFF`；V9 的安装状态不得被误写成 production 权限。
- Discovery 前端按项目级 `$research-topic-discovery` skill 运行“有界 seed portfolio → exact public anchor → 一个 primary RQ（真实歧义时至多两个同对象备选）→ ordinary/selective pre-RQ source closure → evidence-qualified raw → type-specific C0/deep → clean brief”。skill 只改变操作顺序，不能改变本规则或 `ROLE_DISCOVERY` 的权限、预算与科学门。进入 raw 必须有 exact identity、同对象问题/估计量、claim endpoint、反事实后果、来源支持的非通用假设、一个 current-source locus、最低 falsifier、finite closure 与 full-cost 初界；完整 current union、strongest collision、完整 witness/interface/corpus 与正式 Q1/Q2 可以作为有界 closure debt 后移。已知 direct fatal、换对象/降保证、generic wrapper/solver 或无有限路线仍失败。评分只排工作顺序，不能补偿硬门失败；不输出强制 Top-N，零提案合法。
- `GLOBAL_TERMINAL_IDENTITY_AND_CLOSURE_ACCOUNTABILITY_V1` 从 Source42 安全边界生效。主线为每轮冻结全历史 canonical identity lookup surface（至少包括 `registry.yaml` 与其明确引用的终态/active identity 证书），Discovery 在 raw 前按 `object / action-or-estimand / endpoint / guarantee / full-cost` 五字段查询。只有 `EXACT`、可证 `TERMINAL_CONTAINS` 或已冻结 direct current collision 才自动排除；`RELATED_ONLY` 不得冷却，未命中不构成 novelty/absence。若自动 containment 对 related family 产生误杀，立即回滚为 warning 并由主线人工五字段 reconciliation。
- RQ 后任何具名公开缺件必须进入 `SOURCE_CLOSURE_QUEUE`。主线最小验收机械检查：`EXHAUSTED` 必须满足 `attempts>=1`，或所有预承诺路线均有逐条 `MECHANICALLY_UNAVAILABLE` 证据；否则只能 `PENDING_UNEXECUTED`、`BLOCKED` 或 bounded unresolved，且保持 `NO_SCIENTIFIC_INFERENCE`。调用计数必须在调用前持久化，拒绝/404/零字节/未持久化响应也计数；handoff 前 inventory 与 queue 必须一致。
- 新前端 revision `RQ_REFINEMENT_STAGED_EVIDENCE_V1` 使用 `DISCOVERY_RQ_FRONTEND_MODE=OFF / SHADOW / PRODUCTION`。用户已经批准共享规则安装，但在独立 PACKER→EXECUTOR→AUDITOR 时间切片回测通过并由主线记录 cutover 前只能 `SHADOW`；缺模式、revision、模板 hash、backtest handoff 或 cutover 一律 `OFF`。该回测必须使用新 blind identities，并包含至少一个“pre-cutoff union/subtractor 尚未完全闭合但有限路线真实存在”的正例，防止把旧富集包的成功误当成开放题源召回。
- `CANONICAL_BENCHMARK_ONLY` 可作为 `MEASUREMENT_CHARACTERIZATION / BENCHMARK_DATASET` 的独立入口，但只能支持规范 benchmark 的有效性、覆盖、排名、复现或 full-cost 结论，不得外推自然部署规律，也不自动形成 C0/brief。
- 六路题源不是固定领域配额。重复低 query yield 或 current-union 吸收只能让具名来源族在下一冻结周期临时降权；不得把成熟项目、ISA、工具或 broad category 变成排除规则，`RELATED_ONLY` 不得冷却。测量/规律、形式保证、编译器/体系结构语义、跨层算法和近期一手源码限制仍是合法的可变投入方向。
- 一个“完整控制周期”是 S1–S6 六个冻结 assignment 均完成、去重并经主线验收。连续两个完整周期 `clean_stage0_brief_count=0` 时，主线必须立即向长期 `RULE-AUDIT-SENTRY` 投递 proposal-only 零产出诊断，同时继续下一轮 canonical 筛选；审计不得成为 head-of-line blocker。
- 审计先定位漏斗第一个失败转换，并对上一轮行为试点逐项声明 `RETAIN / DOWNGRADE / REMOVE`；下一安全周期最多冻结一个有界行为改变，不得在每两轮零产出后继续叠加新的 production micro-rule。审计可分析来源饱和、重复率、current-union 吸收、动作未闭合、Q2 shape、自然载体、full-cost 和 Stage0 repair vector；其他行为语义修改仍需用户批准。
- 启用 selective depth 的完整六路周期中，每个 lane 在看到任何 strong-model 结果前最多冻结一个 `PRE_RQ_CLOSURE_NOMINATION` 或 `NONE`。主线必须等待六路 nomination barrier 完成，再按 skill reference 的机械顺序结果无关选择至多一个具有记录升级证据的 `gpt-5.6-sol / high` 一层 packet；看到结果后不得 backfill，也不得增加 lane、检索预算、raw 容量或提案配额。
- V9 的下一次评价单位必须是实际 `CLEAN_STAGE0_BRIEF` 及其独立 Stage 0 repair/decision 反馈；零 brief 的 family 批次只计覆盖和成本，不能构成 precision 分母，也不能据此强行 PASS。
- 当前持续停止条件为累计五个独立 Stage A gate PASS。每个新 PASS 都停在 `PENDING_USER_STAGEB_REVIEW`；本持续授权不产生 Stage B 权限。

candidate lane2 与 gate lane2 只有在至少两题已经独立 Stage0 PASS、资源 ready 且可形成互不冲突的 StageA assignments 时反归档。Stage0 PRIMARY(N+1) 与 confirmation(N) 只有在至少两个完整 brief 已 ready 时才流水；同 packet 的 PACKER→EXECUTOR→AUDITOR 始终串行。

每个调度控制周期登记 ready/active/wait/rework/duplicate/conflict/rule-drift，以及分开的 seed、RQ、locator、source-closure、raw、unique-family、deep-review、brief、clean-brief、decisive-observation 与 StageA-PASS 计数。不同单位不得相加或当作 recall；已退役模式不保留 live telemetry。字段只作诊断，不是配额；可测时报告每个 clean brief/decisive observation 的用户与模型成本，不可测写 `NOT_YET_MEASURABLE`。

`ATOMIC_REPAIR_TRACE_V1` 仅在 assignment/registry 明确启用时记录 append-only repair cohort 与跨阶段 telemetry；未 cutover 的 shadow 不改变 admission、revision、状态或裁决。该模式必须带 sunset/删除门，不能永久复制到每个角色；任何 mandatory 语义仍需独立回测和 MAINLINE cutover。

claim-pack shadow/production 另登记：`opportunity_family_relation_counts`、`critical_source_recall`、`false_structural_drop_count`、`first_party_feature_late_discovery_count`、`decision_ready_facet_completeness`、`claim_source_coverage`、`contradiction_disclosure_count`、`independent_search_completion`、`audit_minutes_or_model_cost`、`duplicate_deep_review_count`、`decision_stability_under_perturbation`、`contribution_type_diversity`、`E1_count`、`E2_count`、`EB_count`、`EH_count`、`stage0_material_repair_count` 和可用时的 later central-claim survival。不可测写 `NOT_YET_MEASURABLE`，不得填零或反推配额。

`STAGE0_REPAIR_VECTOR` 可多选：`OMITTED_CURRENT_SAME_OBJECT / OMITTED_FIRST_PARTY_FEATURE / OMITTED_GENERIC_KERNEL / ATOMIC_ACTION_UNCLEAR / NATURAL_CARRIER_GAP / FULL_COST_GAP / Q2_SHAPE_GAP / NO_MATERIAL_REPAIR`。它只描述 Stage0 是否补回 cutoff 前可获得而 Discovery 遗漏的材料，不改变 PASS/RESERVE/REVISE/STOP；科学 STOP 也可以是 `NO_MATERIAL_REPAIR`。

### Discovery claim-pack assignment 门

Claim-pack 的唯一语义在 `rules/DISCOVERY_CLAIM_PACK.md`。MAINLINE 只核对 assignment-pinned mode/hash、registered cutover、生成与 prior/current audit 独立、neutral Stage0 packet、六 lane 上限和协议输出；模式现状与验收收据只写 registry/assignment。缺 cutover 时不得产生 canonical claim-pack 决定，小样本 pilot 不得冒充 calibration。

健康度只用于诊断，不形成配额。不得用 mixed-row-event→proposal 比率诊断 recall；Stage 0 clean-brief precision 或决定性 Stage A observation 效率连续异常时，先修正发现方法、对象冻结和基线定义，不降低学术门。

## 模型路由

`COST_AWARE_MODEL_ROUTING_R1` 是用户批准的调度政策，不是科学政策。项目默认 `gpt-5.6-terra / medium`；每个新 assignment 与每次启动工作的跨线程 follow-up 都必须显式写 `model_route` 和 `thinking`，不得继承桌面默认。模型变化不得改变质量门、对象、证据 ceiling 或状态语义。

| 工作类型 | 默认路由 | 有界升级 |
|---|---|---|
| 主线 routine 控制、队列、验收 | `gpt-5.6-terra / medium` | 多状态冲突用 Terra/high；未解决的高风险科学政策冲突才可 Sol/high |
| 哈希、manifest、bootstrap、格式、监控、状态 relay | `gpt-5.6-luna / xhigh` | 解析歧义可 Terra/low |
| Discovery 广筛、M1、Backtest PACKER/EXECUTOR、RULE_AUDIT | `gpt-5.6-terra / medium` | 见对应角色规则 |
| Stage 0、Stage A claim/fidelity、Stage A gate、Backtest AUDITOR | `gpt-5.6-terra / high` | 仅记录升级证据后 Sol/high |
| Stage A build/log/format 等机械阶段 | `gpt-5.6-luna / xhigh` | 非平凡工具诊断可 Terra/medium |
| Stage B 独立终审、最终稿 claim-integrity 审查 | `gpt-5.6-sol / high` | 不自动 xhigh/max |

Luna/xhigh 已获用户授权用于表中机械路由；Terra/Sol 的 xhigh 与所有 max 默认禁止。Sol/high 只对一个冻结 assignment 或 correction packet 生效，handoff 后回到默认；除 Stage B 独立终审和最终稿完整性审查外，必须记录一次升级证据：独立 Terra 判断的终态分歧、Terra/high 后仍未解的形式等价性/理论问题、或一次已记录的复杂编译器/RTL Terra/high 失败。题目重要性或惯例不是升级理由。运行中的 turn 不因本规则被打断，idle/not-loaded lane 不为确认路由被唤醒。

## 主线验收

完成的科学 gate handoff 具有控制面优先级：主线必须在收到后的下一主线控制周期完成机械接受、明确拒绝或形成精确 blocker，之后才能开始新的非关键 refactor block。该优先级不允许跳过 manifest、独立确认、用户门或科学审查；只是防止已经 ready 的科学工作被维护任务队头阻塞。

验收先分风险，不默认全树复算：

- `ROUTINE`：Discovery 零提案批次、普通 shadow、无状态变化的查询/日志与已接受 artifact 的复用。检查必需文件可读、assignment/路径/结论一致、计数合理和越权写入；只抽查 canonical 文件，不递归重算全部 hash。
- `GATE`：Stage 0/A 转换、方法校准结论、资源 blocker 恢复、候选状态改变。核对报告、handoff、决定性证据与相应输入冻结；只验证能改变裁决的 manifest 子集。
- `CRITICAL`：Stage B/正式项目、claim-bearing 主结果、共享规则修改、用户授权边界、污染/泄漏争议、删除迁移或实际发现漂移。执行完整、针对性的清单/来源/重放检查。

同一 immutable artifact 已有主线接受记录且没有路径、大小、时间戳或状态漂移时直接复用，不在后续控制周期反复全量复算。清单中无歧义的空格/大小写格式差异只记兼容修正，不得单独阻塞交接；非关键元数据错误最多请求一次有界修正。发现真实 hash 不匹配、缺文件、越权覆盖或 claim-critical 证据不可定位时才升级 blocker。

每次转换至少检查：

- 标准报告与 `handoff.yaml` 存在；
- `topic_id`、来源阶段、建议状态和 exact object 一致；
- 决定性引用文件可定位；在 `GATE/CRITICAL` 边界对相关哈希做针对性匹配；
- 上游报告未被下游改写；
- 分支只写授权目录；
- PASS/REVISE 已完成要求的独立确认；
- claim ceiling 与证据类型一致；
- 用户权限、资源和所有权请求精确；
- 没有未登记的对象变化或第二次 revision。
- 对新规则 Stage B assignment，`STAGEB_EXECUTION_CONTRACT.yaml`、`STAGEB_WORK_BREAKDOWN.yaml`、`ENVIRONMENT_LOCK.yaml`、`AUTONOMOUS_RECOVERY_LEDGER.yaml`、`CLAIM_EVIDENCE_MATRIX.yaml` 与 `RUN_INDEX.yaml` 存在且互相引用的 approval/topic/assignment/hash 一致；
- 所有 claim-bearing 数字均来自未 invalidated 的 run；工程纠错已使受影响 run 失效并重跑；实际命令、资源、retry 和替代路线没有超出用户 envelope；
- B0–B6 ledger 与 internal replay 完整，未完成的 kill gate 没有被 `NOT_APPLICABLE` 隐藏。

handoff 至少覆盖：

- 身份与阶段：topic、source stage、decision、next stage；
- 学术核：exact object、main claim、N1/N2/N3、evidence route、mechanism signature；
- 文献：paper genealogy、seed distance、nearest-prior facet matrix、碰撞状态；
- Q1/Q2 校准：quality tier、venue family、reference set、comparator matrix、gap/status；
- 比较：strongest baseline、same-function、algorithmic delta、full-cost、generality；
- 证据：decisive evidence、orthogonal validation、risks、next killer、ceiling；
- 执行：academic/AI score、AI class/core fraction、资源授权、文件哈希。

## 面向用户的报告

用户报告默认用中文自然语言先给结论、主要依据、当前阻塞、下一步和是否需要用户动作。内部状态码应翻译，例如：

- `UNOBSERVED_BY_RUNTIME__NOT_IMPUTED` → “运行环境没有提供精确统计，本次未作估算”；
- `DO_NOT_CUT_OVER__KEEP_GLOBAL_MODE_OFF` → “现阶段继续沿用原方法，不切换到新方案”；
- `PILOT_NOT_CALIBRATED_INCONCLUSIVE` → “目前证据不足，尚不能判断新方法是否可靠”。

机器码可在括号、登记层或技术附录保留，但不作为面向用户的标题和主要叙事。普通状态汇报不列整页 SHA；优先给可点击路径，只有授权、漂移排查、完整性争议或用户明确要求时列必要哈希。通俗表达不得省略科学不确定性、失败原因、证据上限或硬门。

## 转换规则

### 软卡点自主恢复与新 ID 重设计

主线必须读取并执行 `rules/AUTONOMOUS_SOFT_BLOCKER_RECOVERY.md`。发现卡点后先分类为 `SOFT_ENGINEERING_BLOCKER / SOFT_METHOD_BLOCKER / NEW_ID_REDESIGN_ROUTE / HARD_EXTERNAL_OR_USER_GATE`，不得把所有 fail-closed 都上报为用户 blocker：

- 工程软卡点在不改 object/mechanism/comparator/claim 时自主冻结一次精确 correction；
- 方法软卡点在无 direct fatal、阶段 revision 未消耗且存在有限同对象路线时，自主冻结一次合法 pivot/revision并交独立 gate；
- 必须换 object/RQ/action/guarantee/denominator 时，保留旧终态并以新 ID 返回 Discovery/Stage 0；
- 只有硬外部阻塞、强制用户门或 exceptional revision 需要即时请求用户。

主线每次冻结恢复路线必须记录：分类证据、保持不变的五字段 identity、允许改变的唯一原子面、attempt/budget、旧结果失效范围、falsifier、claim ceiling 和生命周期。通用自主授权不允许绕过已耗尽 revision、STOP、Stage B 或正式项目门。

- Discovery 只能建议 `PROPOSE_STAGE0`。
- Discovery 的 `FIDELITY_CLOSURE_PLAN` 和 Question Card closure debt 是进入 Stage 0 的可审计路线，不是已经实现、穷尽 current union 或取得核心结果的证明；主线不得把 `FINITE_FIDELITY_GAP`、有界 union/collision debt 或未取得 corpus 主结果当作 DROP/STOP。Stage 0 独立重建 complete-enough union/collision/Q1Q2，Stage A 才在首次 claim-bearing run 前执行 `PRE_CLAIM_CONTRACT_FIDELITY_GATE`。
- 对任何以“current implementation lacks X”为核心的 clean brief，主线机械验收必须看到 `CURRENT_UPSTREAM_REALITY_CHECK`：官方文档、当前 upstream 源码、版本/commit 和相关默认/非默认 flag/threshold 四项齐全；Stage 0 assignment 必须要求独立复核。进入 evidence-qualified raw 时只要求一个决定性 current locus 与 bounded debt，不要求已经穷尽 union。缺实现不等于 STOP，但旧文档与当前源码冲突时不得把旧缺口登记成 residual。
- 对 claim-pack V9 提案，主线还必须看到 contribution type contract、完整 claim package、opportunity graph、A/C/D/E 本地坐标、八谓词 coverage audit、独立 prior/current 审查和 `DISCOVERY_EVIDENCE_LEDGER.yaml`。这些字段不替代正式状态；E2 缺失不阻止 Stage 0。
- Stage 0 初审 PASS/REVISE 必须经 confirmation sentry。
- Stage 0 PASS 只表示研究若成功具有 Tier A/B 论文结构，不表示主结论成立。
- Stage A 是核心风险预研；正结果只能支持关键前提暂未被否定或获得初步支持，完整主 claim 属于 Stage B 证据闭环。
- Stage 0/A 每阶段最多一次 `REVISE_ONCE`；Stage 0/A 可预登记一次 `MECHANISM_PIVOT`。
- 唯一科学 revision 已消耗后，若独立 gate 证明执行构造无效而没有可用于 PASS 或科学 STOP 的有效 observation，主线登记 `INCONCLUSIVE_POLICY_HOLD`：课题原阶段保留、释放 lane、单列用户政策裁决请求；不得擅自运行第二次 revision，也不得自动 STOP、reserve 或归档。只有用户给出题目级、原子门级、次数级、证据 ceiling 与唯一写目录均冻结的 exceptional-revision 授权时，主线才可在新的 immutable 目录投递；该授权是一次性例外，不改变普通规则。
- Pivot 不得改变问题、exact object、主要指标和目标 workload。
- 对象、函数、主要问题或目标改变时必须新建 ID。
- 独立 Stage A gate PASS 后，主线只能登记 `PENDING_USER_STAGEB_REVIEW`；没有用户针对该题的明确批准，不得创建或启动 Stage B。
- 逐题 Stage B 批准包必须冻结 `STAGEB_EXECUTION_CONTRACT` 所需的 exact object、claim ceiling、按信息增益排序的 kill gates、唯一写目录、输入/规则 hash、资源/timeout、允许的官方获取/构建/同语义替代/恢复路线及 attempt 上限。generic 规则批准不能生成具体题目的 `stageb_user_approval_id`。
- 主线投递 Stage B 前必须确认 candidate lane 单题独占，并要求 B0–B6 状态机、mandatory contract artifacts、`RUN_INDEX` 分类、`ENGINEERING_CORRECTION_IN_CONTRACT`/`SCIENTIFIC_REVISION` ledger 和 internal replay。获批 envelope 内的普通恢复由 owner 自主执行；只有路线耗尽或权限扩大时打断用户。
- Stage B PASS 必须投递给未参与该题实现的长期独立复审 lane；不要求为该题新建会话。
- 独立接受后才进入 `PENDING_USER_DECISION`。
- 创建 `projects/<ID>/` 与正式大规模实验必须经用户明确确认。

## AI、资源与授权

AI 执行性只用于加分、排序和路由，不覆盖学术判断：

- `AI_CORE_EXECUTABLE`：优先自动推进；
- `AI_CORE_CONDITIONAL`：在清楚缺口下推进；
- `AI_AUXILIARY_ONLY` 且学术门通过：进入人工研究储备；
- 学术门失败：STOP。

本机 CPU、RTX 4070、公开源码、公开 trace、开源模拟器和保持同语义的替代栈默认可用于前期验证。缺少商品硬件、多 GPU、NPU、FPGA 或闭源工具只降低证据 ceiling，不自动 STOP。

逐题 Stage B 用户包应把可预见的本地构建、官方获取、隔离环境、retry、timeout 和非排他设备路线编译为有限 `AUTONOMOUS_RECOVERY_ENVELOPE`。该 envelope 只减少重复确认，不扩大科学对象或资源权限；owner 必须记录每次 attempt，超出字节/时间/设备/来源/安装/所有权边界时仍按下列用户门暂停。主线不得把通用“尽量自主”解释为无限 retry、系统修改或任意下载授权。

以下必须请求用户：

- Stage B 后的正式论文实验；
- 修改共享工程；
- 重要设备或 EDA 排他占用；
- 大型且难清理的下载；
- 外部 owner、许可证、数据发表和作者贡献边界；
- 课题组未公开工作的所有权裁决。

请求必须列出精确资源、用途、大小、时间、回滚方式和失败后果。

常规状态更新尽量批量汇报。只有资源/权限/所有权超出 standing envelope、政策例外、逐题 Stage B、正式项目激活、最终作者/venue/投稿或外部通信必须打断用户；请求同时给出推荐项、最低用户动作、预计用户时间、可接受替代、推迟后果和精确恢复点。

## 通信

分支仅在以下边界通知主线：

- 批次或阶段报告完成；
- PASS、RESERVE、REVISE 或 STOP；
- 跨题 DIRECT_FATAL；
- 权限、资源、所有权或文件冲突；
- 审查分歧；
- 真正硬阻塞。

普通检索、单条来源、无变化状态和子代理中间过程只写任务目录。分支完成文件不等于可以归档，必须等待主线验收。

主线收到完成的科学 gate handoff 时，应在同一控制周期留下验收结果与后续路由；如果无法验收，必须明确指出哈希、provenance、权限、资源或规则冲突中的具体 blocker，而不是把它留在未说明的队列中。

## STOP、删除与归档

主线登记 STOP 后：

1. 在 `history.md` 压缩记录失败理论核与禁止重包装项；
2. registry 永久保留最小 terminal stub：五字段 identity、terminal reason、capsule pointer/hash 与 forbidden-revival；长叙述移入 history/capsule，但不得从机器可查 identity surface 删除；
3. 先封存 `TERMINAL_EVIDENCE_CAPSULE`，保留决定性 raw/witness、full-cost/denominator、reproduce/provenance、owner/gate 裁决与终态 identity；STOP 不得退化为 report-only；
4. 只有 capsule 与保留哈希通过后，才按 `ARTIFACT_LIFECYCLE` 删除已分类的 rebuildable source/build/toolchain/download/env/cache/tmp 和非决定性重复运行；
5. 一次性旧会话归档；长期 lane 清除 assignment 后先登记 `IDLE_REUSABLE`，若不在当前 8 个热池或短期没有真实 WIP，再登记 `ARCHIVED_UI_POOL_COMPACTION` 并归档任务窗口；需要时反归档同一 lane。

只有用户明确要求或资产具有独立复用价值时，才在 `projects/_assets/` 保留最小资产。删除前必须核对绝对路径和活跃写任务；删除后报告范围、可恢复性和剩余大小。

`plan.md` 只保留当前状态和短期计划；已结束事项压缩进入 `history.md`，不得复制整份旧 plan。

## `BLOCKED_USER_ACTION_REQUIRED` 解阻状态

正式 blocker/recovery、公开路线 envelope、preclaim/postclaim ceiling、reserve fallback 与用户门只由 `rules/AUTONOMOUS_SOFT_BLOCKER_RECOVERY.md` 定义。MAINLINE 的职责是接受 raw/attempt 与 blocker 包、冻结有限路线和新 resume 目录、保持题目原阶段/terminal identity、释放 lane、登记科学 verdict 与 operational disposition，并只在协议认定的 hard gate 请求用户。状态汇报必须单列 blocker、最低用户动作、恢复后第一门和已有科学证据；不得在本角色另建平行状态机。

## Assignment 资源本地化

主线按 `USER_ASSIGNMENT_RESOURCE_LOCALIZATION_20260814` 是 `rules/RESOURCE_LOCALIZATION.md` 的唯一控制面执行者。每个新 assignment 在首个资源动作前冻结唯一写目录、其 `resources/` 根、八个标准子目录、inventory 路径、预算、来源/许可、进程局部重定向表、cleanup owner 与 retention；默认 cleanup owner 为主线。主线是 `projects/_assets/<asset_id>/` 的唯一创建、登记、修改和退役者，lane 只读消费并在需要变换时复制到自己的 `src/` 或 `build/`。active frozen assignment 不追溯搬移；下一资源边界只能用机械 compatibility addendum。递归清理前必须验证绝对 containment、root 黑名单、reparse/junction、active process 与 inventory retention，禁止用未解析变量、glob 或父目录作为目标。

## Assignment artifact closeout 与 GC

主线是 `rules/ARTIFACT_LIFECYCLE.md` 的唯一 production cutover、capsule acceptance 与 cleanup owner。对 cutover 后的新 resource-producing assignment：

1. 科学 handoff 与 storage closeout 分开验收；cleanup backlog 不得改写科学结论。
2. handoff 接受后登记 `HANDOFF_ACCEPTED__GC_PENDING`，核对 finalized inventory、`PHASE_CLOSEOUT_RETENTION`、claim-critical extraction、downstream acceptance 与 budget/exception。
3. transition 只有下游 exact input/hash 接受后才能删 upstream copy；blocked/reserve/hold 必须先封 `RESUME_CAPSULE` 并保留 unique resume-critical 内容。
4. STOP 只有 terminal capsule 非 report-only 且独立裁决/决定性 witness/full-cost/reproducibility/terminal identity 齐全后才可 GC。
5. 删除只使用 exact inventoried leaf；逐项验证 E 根 containment、root blacklist、reparse、active process、consumer、recovery route，并生成可解析 `CLEANUP_RECEIPT`。
6. GC 超过一个主线控制周期必须进入 plan 可见 backlog；同 assignment 超预算的新资源动作在 GC 或 exception 前关闭。
7. cleanup failure 登记 `STORAGE_GC_BLOCKED__NO_SCIENTIFIC_INFERENCE`，不消耗 revision、不触发 STOP/reserve。

Legacy 目录不自动迁移或清理；用户批准 lifecycle policy 不替代 legacy exact-target approval。生产模式只对显式 cutover 后的新 assignment 生效。
