# 主线控制会话规则

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

## 并发与在制品

`DISCOVERY_ACTIVE_SOURCE_LANES=6`，对应既有长期 `S1`–`S6`；`DISCOVERY_PER_STAGE_MAXIMUM=6`，不允许第七个生产 Discovery 来源。原 `BASE_ACTIVE_SEATS=4` 与“两条热 Discovery”限制已被用户 `DISCOVERY-SIX-LANES-DIRECT-20260811` 对 Discovery 调度显式覆盖；其他阶段的既有单阶段上限仍不超过 4。maintenance 或 backtest 同时只允许一个当前角色 active，同一 packet 仍严格串行。已经通过上游 gate、在 standing authority 内且资源 ready 的 Stage0/StageA 科学 handoff 可以与六路 Discovery 共存，不能为了维持来源并发而延迟下游验收。任何并发都不允许新建逐题任务、增加共享 writer、合并独立角色或预读下一 assignment。

burst 在 ready queue 为空、maintenance/backtest 结束、出现共享写冲突/重复 assignment/规则漂移或 pilot 验收失败时立即归零。`BLOCKED_USER_ACTION_REQUIRED`、未批准 Stage B、无冻结包、同一回测 packet 的下一角色均不构成 ready science。

### R7 Discovery 质量模式（当前 dormant）

每个 Discovery assignment 必须冻结 `DISCOVERY_QUALITY_MODE=OFF / SHADOW / PRODUCTION`；默认与当前生产值均为 `OFF`：

- `OFF`：完全沿用当前 v8.7+R5-P0 的 canonical Discovery 决策；并发由当前六来源用户授权控制，不使用 R7 的 breadth/depth 调度映射。不得要求 R7 产物，也不得把 R7 草案用于候选裁决。
- `SHADOW`：只生成非 canonical 审计产物；不能创建、删除或改变 `PROPOSE_STAGE0 / DROP`，不能改变候选状态、ready queue 或生产调度。
- `PRODUCTION`：只有 registry 已登记 R6/v8.8 calibrated gate、R7 独立 blind PACKER→EXECUTOR→AUDITOR PASS、两波 noncanonical shadow 全部通过，且 exact patch scope 未变化时，才可在下一安全 assignment 边界冻结。任一失败或 `UNKNOWN / CONTAMINATION_UNKNOWN / NOT_CALIBRATED` 都回到 `USER_POLICY_DECISION_REQUIRED`，不得自动第二次 revision、repack 或切换。

R7 旧提案中的“两条 breadth / breadth+depth-redteam”调度映射已被六来源直接并行授权取代，不能再用于减少 canonical lane 数。若以后启用 `SHADOW`，只能在六个现有 assignment 上模拟质量排序和 repair-vector 产物；若以后启用 `PRODUCTION`，也不得自动改变六来源并发数，除非用户再次明确修改调度。R7 质量语义与当前并发授权相互独立。

合格 depth backlog 只在以下条件同时满足时成立：具名 `UNIQUE_OPPORTUNITY_FAMILY`；exact object 与 preliminary atomic action 可表达；current/generic/contrary/carrier 至少一个来源角色未闭合；没有已知 `DIRECT_FATAL`。形成 canonical brief，或有证据地得到 `STRUCTURAL_DROP / NOT_ADMITTED_UNFROZEN / RESOURCE_BLOCKED` 后释放 depth slot。`OFF` 模式不使用该 backlog 改变调度。

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

默认四席位：

### 普通供给期

1. 主线；
2. Discovery 来源 A；
3. Discovery 来源 B；
4. Stage 0 批审或候选执行 lane。

### 决定性证据期

1. 主线；
2. 一个 Discovery 或测量观测；
3. 一个候选执行 lane；
4. Stage gate、独立复审或第二个候选执行 lane。

高价值 Stage A/B 活跃时，应减少浅层 Discovery 并发。

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
- 启用 selective depth 的完整六路周期中，每个 lane 在看到任何 strong-model 结果前最多冻结一个 `PRE_RQ_CLOSURE_NOMINATION` 或 `NONE`。主线必须等待六路 nomination barrier 完成，再按 skill reference 的机械顺序结果无关选择至多两个 `gpt-5.6-sol / high` 一层 packet；看到结果后不得 backfill，也不得增加 lane、检索预算、raw 容量或提案配额。
- V9 的下一次评价单位必须是实际 `CLEAN_STAGE0_BRIEF` 及其独立 Stage 0 repair/decision 反馈；零 brief 的 family 批次只计覆盖和成本，不能构成 precision 分母，也不能据此强行 PASS。
- 当前持续停止条件为累计五个独立 Stage A gate PASS。每个新 PASS 都停在 `PENDING_USER_STAGEB_REVIEW`；本持续授权不产生 Stage B 权限。

candidate lane2 与 gate lane2 只有在至少两题已经独立 Stage0 PASS、资源 ready 且可形成互不冲突的 StageA assignments 时反归档。Stage0 PRIMARY(N+1) 与 confirmation(N) 只有在至少两个完整 brief 已 ready 时才流水；同 packet 的 PACKER→EXECUTOR→AUDITOR 始终串行。

每个调度控制周期登记：`ready_queue_count`、`active_lane_count`、`completed_handoff_wait_cycles`、`handoff_rework`、`duplicate_work`、`shared_write_conflict`、`rule_revision_drift`，以及分开的 `divergence_seed_count`、`divergence_engine_count`、`rq_candidate_count`、`rq_ready_count`、`rq_backlog_count`、`selected_locator_count`、`locator_only_count`、`source_closure_queue_count`、`evidence_qualified_raw_count`、`bounded_closure_debt_count`、`seed_backlog_count`、`raw_screen_row_event_count`、`repeat_or_rescreen_row_event_count`、`unique_opportunity_family_count`、`candidate_grade_deep_review_count`、`stage0_brief_count`、`clean_stage0_brief_count`、`decisive_stagea_observation_count`、`stagea_pass_count`。seed/RQ/source-closure 字段只诊断创意与闭合漏斗，不属于科学 precision 分母。R7 兼容遥测另记 `discovery_breadth_assignment_count`、`discovery_depth_redteam_assignment_count`、`failure_kernel_lookup_count`、`prebrief_adversarial_check_count` 和 `stage0_repair_vector_counts`；在 `OFF` 模式下未执行的行为计数必须写 `NOT_APPLICABLE_MODE_OFF`，不得伪装为零。所有字段都只作诊断，不是配额。旧字段 `decisive_stagea_observation` 只作兼容别名，不得与 count 重复相加。并在可测时报告每个 `CLEAN_STAGE0_BRIEF` 与 `DECISIVE_STAGEA_OBSERVATION` 的用户/model 成本；无法测量时写明 `NOT_YET_MEASURABLE`，不得填零。

`ATOMIC_REPAIR_TRACE_V1` 当前只以 `STAGE0_ATOMIC_REPAIR_TRACE_MODE=SHADOW` 安装 P0；新 assignment 必须冻结 mode 与相关规则/模板 hash，缺模式按 `OFF`。主线为独立确认的 Stage 0 `REVISE_ONCE` 建立 append-only 原始 cohort，分母不因后续 Stage 0 STOP/HOLD、资源等待或未成熟删除；直接 Stage 0 PASS 与 direct fatal 不进入该 repair cohort。主要分子只计独立 Stage A gate PASS，owner self-pass 不计；资源失败、policy hold、invalid construct、human reserve 与未成熟分别作为 censoring/maturity 报告，不得科学化或补零。正向转化必须同时披露 full-cost 状态；`NOT_YET_MEASURABLE / LEGACY_PARTIAL` 原样保留。该 telemetry 只是描述性 pipeline conversion，不是接受概率、科学证据、录取门或配额；P0 字段缺失、冲突或 participant overlap 不改变任何候选裁决。任何 mandatory admission/preclaim/closing/fail-closed P1 行为必须先通过独立 PACKER→EXECUTOR→AUDITOR 回测并由主线显式 cutover。

claim-pack shadow/production 另登记：`opportunity_family_relation_counts`、`critical_source_recall`、`false_structural_drop_count`、`first_party_feature_late_discovery_count`、`decision_ready_facet_completeness`、`claim_source_coverage`、`contradiction_disclosure_count`、`independent_search_completion`、`audit_minutes_or_model_cost`、`duplicate_deep_review_count`、`decision_stability_under_perturbation`、`contribution_type_diversity`、`E1_count`、`E2_count`、`EB_count`、`EH_count`、`stage0_material_repair_count` 和可用时的 later central-claim survival。不可测写 `NOT_YET_MEASURABLE`，不得填零或反推配额。

`STAGE0_REPAIR_VECTOR` 可多选：`OMITTED_CURRENT_SAME_OBJECT / OMITTED_FIRST_PARTY_FEATURE / OMITTED_GENERIC_KERNEL / ATOMIC_ACTION_UNCLEAR / NATURAL_CARRIER_GAP / FULL_COST_GAP / Q2_SHAPE_GAP / NO_MATERIAL_REPAIR`。它只描述 Stage0 是否补回 cutoff 前可获得而 Discovery 遗漏的材料，不改变 PASS/RESERVE/REVISE/STOP；科学 STOP 也可以是 `NO_MATERIAL_REPAIR`。

### Discovery claim-pack V9（已批准安装，生产需校准）

新 assignment 冻结 `DISCOVERY_CLAIM_PACK_MODE=OFF / SHADOW / PRODUCTION`、protocol hash、output schema hash 与资源边界。当前没有独立 auditor PASS、两波 prospective shadow 和主线 cutover 记录时，canonical 值保持 `OFF`。`SHADOW` 必须与 legacy canonical 输出隔离；`PRODUCTION` 只能在下一安全 assignment 边界生效。

claim-pack 工作按 `OPPORTUNITY_FAMILY` 去重。主线为优先族分配 `EXPLORE / INDEPENDENT_PRIOR_CURRENT_AUDIT / SYNTHESIS_PREFLIGHT` 任务角色并保持生成—决定性查重独立；角色可由现有 S1–S6 长期 lane 承担，不增加 lane 上限。一个 family 的 query lock、claim ID、signature 与已查范围必须冻结，避免重复深审。

Stage 0 输入使用固定字段顺序的 neutral packet：保留技术事实、来源、locator、版本、冲突和 ceiling，移除模型自报置信度、说服性形容词、来源 lane 身份和 venue prestige 作为证据。E2 只有 assignment 明确资源 allowlist 才可调度；它不是 Stage 0 admission gate，失败不得改变 academic/collision/evidence 结论。

V9 生产 cutover 必须来自独立 PACKER→EXECUTOR→AUDITOR：paired same-snapshot legacy/V9、污染审计、新 blind holdout、贡献类型/负例覆盖、风格与证据顺序鲁棒性、预登记 noninferiority/停止规则，以及两波非 canonical prospective shadow。小样本 replay 只能标记 `PILOT_NOT_CALIBRATED`。方法与 3/6 席调度分别回测；本 patch 不改变六槽上限。

健康度只用于诊断，不形成配额。不得用 mixed-row-event→proposal 比率诊断 recall；Stage 0 clean-brief precision 或决定性 Stage A observation 效率连续异常时，先修正发现方法、对象冻结和基线定义，不降低学术门。

## 模型路由

下表是当前 registry/plan 的可替换调度映射，不是科学政策。assignment 应冻结所需能力等级与当次实际模型；模型名称变化不得改变质量门。

| 会话工作 | 模型与思考 |
|---|---|
| Discovery 六个长期广筛 lane `S1`–`S6` | `gpt-5.6-terra / high` |
| Discovery 测量观测 `M1` 与历史回测 | `gpt-5.6-terra / medium` |
| Stage 0 | `gpt-5.6-terra / high` |
| Stage A/B 候选执行 lane | `gpt-5.6-sol / high` |
| Stage A gate | `gpt-5.6-sol / high` |
| Stage B 独立复审 | `gpt-5.6-sol / xhigh` |
| 主线机械验收 | `gpt-5.6-sol / medium` |
| 哈希、格式、清单 | `gpt-5.6-terra / low` |

用户 `USER_DISCOVERY_SIX_LANES_TERRA_HIGH_20260815` 已将六个长期 Discovery 广筛 lane 的默认思考强度从 `medium` 提升为 `high`，自 Source41 安全六路边界起持续生效；已冻结或运行中的旧 assignment 不追溯改写。该授权不改 M1、历史回测、lane 数、容量、预算、配额或任何科学门。R40 后只有在新 assignment 显式启用项目 skill selective-depth profile 时，才可按六路 nomination barrier 结果无关选择全周期最多两个 `gpt-5.6-sol / high` pre-RQ closure packet；不设置固定 S3/S4 slot，不因 breadth 提升而扩容。

出现复杂等价性、理论、组内边界或决定 PASS/STOP 的矛盾时升级 Sol；模型成本不得改变学术门。

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
2. 从活跃 registry 移除或保留简短 terminal 项；
3. 验证保留清单后删除详细报告、运行、下载和重复审查材料；
4. 一次性旧会话归档；长期 lane 清除 assignment 后先登记 `IDLE_REUSABLE`，若不在当前 8 个热池或短期没有真实 WIP，再登记 `ARCHIVED_UI_POOL_COMPACTION` 并归档任务窗口；需要时反归档同一 lane。

只有用户明确要求或资产具有独立复用价值时，才在 `projects/_assets/` 保留最小资产。删除前必须核对绝对路径和活跃写任务；删除后报告范围、可恢复性和剩余大小。

`plan.md` 只保留当前状态和短期计划；已结束事项压缩进入 `history.md`，不得复制整份旧 plan。

## `BLOCKED_USER_ACTION_REQUIRED` 解阻状态

`BLOCKED_USER_ACTION_REQUIRED` 是正式、可恢复、非终态，可从 Stage 0/A/B 进入并在原阶段恢复。它适用于外部资源或人工动作阻止执行、且尚无 claim-bearing observation 的情形。主线必须：

1. 拒绝把下载、权限、许可、设备、数据、网络或工具链失败登记为 STOP，拒绝自动放入 `HUMAN_RESEARCH_RESERVE`，也不得归档课题；
2. 冻结失败记录和输入合同，登记 `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`；
3. 使用 `templates/USER_BLOCKER_PACKET.md` 立即向用户报告精确、有限、可操作的解阻请求；
4. 将科学 revision 额度保持未消耗；用户解阻后在新的 resume 子目录按同一合同继续，旧失败目录不可覆盖；
5. 把 blocked 题保留在原阶段和 registry，释放执行 lane 去做别题；等待期间不占正在执行 WIP，但仍计入 blocked backlog；
6. 只有真实机制负证据才允许 STOP。`HUMAN_RESEARCH_RESERVE` 仅用于长期人工核心研究或用户明确选择暂存。

窄化例外：用户可在同一题的授权中预先批准 `USER_DIRECTED_RESERVE_FALLBACK`。只有授权列明的有限获取/构建/修订路线和预算全部有机械 `EXHAUSTED` 证据后，主线才可把题目可逆转为 `HUMAN_RESEARCH_RESERVE__USER_DIRECTED_RESOURCE_BLOCKED__NO_SCIENTIFIC_INFERENCE` 或 `HUMAN_RESEARCH_RESERVE__USER_DIRECTED_POLICY_HOLD__NO_SCIENTIFIC_STOP`。转换不得产生科学负推断、不得消耗资源型 scientific revision、不得删除 blocker/合同/哈希/resume point；registry 必须登记授权 ID、耗尽证据和 `RESUME_FROM_RESERVE` 的用户专属恢复门。未满足这些条件时仍保持 `BLOCKED_USER_ACTION_REQUIRED` 或 `INCONCLUSIVE_POLICY_HOLD`。

任何主线状态汇报必须单列 blocked 课题、阻塞原因、需要用户做什么、恢复后第一门和是否已产生科学证据。

### 公开资料自主解阻授权

在 `USER_BLOCKER_AUTONOMOUS_OPEN_SOURCE_ACQUISITION_20260814` 下，主线可以不再逐项请求相同的 generic 下载/构建许可，而应为每个 blocker 冻结一个题目级恢复合同：公开或开源来源、确定性选择规则、许可证和 provenance、下载/存储/CPU/wall/attempt 上限、唯一 resume 目录、允许的便携工具链或隔离构建，以及资源失败时保持无科学推断。恢复合同不得改变题目、object、commit、语义、比较器、科学门或 revision 次数。

主线仍不得把该授权扩展为系统级安装、全局环境修改、私有或闭源材料、凭据绕过、外部通信、无限重试、Stage B、V9、STOP 复活或正式项目。资源门通过后才恢复原阶段；旧 blocker 和 initial 目录保持 immutable。

## Assignment 资源本地化

主线按 `USER_ASSIGNMENT_RESOURCE_LOCALIZATION_20260814` 是 `rules/RESOURCE_LOCALIZATION.md` 的唯一控制面执行者。每个新 assignment 在首个资源动作前冻结唯一写目录、其 `resources/` 根、八个标准子目录、inventory 路径、预算、来源/许可、进程局部重定向表、cleanup owner 与 retention；默认 cleanup owner 为主线。主线是 `projects/_assets/<asset_id>/` 的唯一创建、登记、修改和退役者，lane 只读消费并在需要变换时复制到自己的 `src/` 或 `build/`。active frozen assignment 不追溯搬移；下一资源边界只能用机械 compatibility addendum。递归清理前必须验证绝对 containment、root 黑名单、reparse/junction、active process 与 inventory retention，禁止用未解析变量、glob 或父目录作为目标。
