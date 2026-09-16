# Rule Audit Report

## 中文摘要

- 发现的问题：现行规则已经覆盖主要阶段职责与科学方法，但尚未达到“所有会话可无损整批重开”的控制面闭环。最大风险不是缺科学规则，而是每个分支仍被要求通读 1.68 MB 的历史型 `registry.yaml`，`plan.md` 又没有 lane 级当前任务看板；Stage B hardware skill、canonical 工件和初始化脚本存在命名/目录不一致；正式论文 owner/reviewer 的会话池、mode 和主线状态衔接也不完整。
- 对推进速度或研究质量的影响：新会话可能从历史 `ACTIVE/PENDING` 字样误认当前任务、漏读硬件 Stage B skill、创建双重合同、把文件写到 topic 根而非 assignment 根，或混淆正式论文作者与独立 reviewer。科学门本身不会自动降低，但执行错误、返工和越权风险较高。
- 建议修改：保留用户建议的 `AGENTS.md` 主入口 + `plan.md` 当前状态 + 每角色 rule 结构；增加 assignment 级 `ASSIGNMENT_CONTEXT.yaml`、plan lane 看板、AGENTS 角色启动表和重开握手；对齐 Stage B skill/templates；补正式论文 lane/mode/state。
- 是否需要用户批准：用户已明确提出该信息架构目标，不需要再次请求同一 generic policy approval。由 Mainline single-writer 在安全边界实施。分支读取 full registry 改为签名 context slice 应先 shadow 验证，不直接切换。

## Identity

- `audit_id`: `RULE-AUDIT-20260823-FULL-SESSION-RESTART-READINESS-A2`
- `trigger`: 用户准备之后重开全部会话，要求确认规则与 skill 足以恢复全部职责和工作方法
- `requested_by`: USER
- `date`: 2026-08-23
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260823-FULL-SESSION-RESTART-READINESS-A2/`
- `shared_files_modified: false`

## Question and scope

- User/process question: 所有主线/支线是否能仅靠项目文件在新会话中恢复身份、任务、方法、权限、状态和交接？
- Rules inspected: 全部生产角色规则、资源规则、条件 claim-pack 入口、两个项目级 skills 及其 references/assets/init script、关键模板。
- Candidate examples inspected: 未读取候选科学材料；只使用 `plan.md` 与 registry 控制面结构作为重启风险证据。
- Out of scope: 候选科学重审、Discovery/Stage 执行、共享 patch 直接应用。

## Current authoritative behavior

现行 `AGENTS.md` 已经实现用户建议的主框架：它定义全局目标/权限/流程，并在“新会话最小读取入口”中列出各角色对应的 rule；`plan.md` 被定义为当前状态；`registry.yaml` 是机器状态源；角色文件定义职责和阶段门。

大多数角色规则均具备完整的 identity、minimum read、write boundary、ordered work、decision、blocker、handoff。Discovery 还明确强制读取项目级 `$research-topic-discovery`，角色规则负责权限/硬门，skill 负责操作顺序，分工正确。

问题在于现行启动链仍写成：每个 lane 通读 `AGENTS.md + plan.md + registry.yaml + role + minimal upstream`。`registry.yaml` 是包含大量历史/兼容记录的 24,985 行文档，不是适合每个分支直接定位当前任务的短启动合同。`plan.md` 当前主要按题目叙述，没有列出每个长期 lane 的当前 assignment、精确写目录和下一动作。

## Evidence of a problem or of correct behavior

| Observation | Source/artifact | Repeated? | Classification |
|---|---|---:|---|
| AGENTS 已明确列出全部主要角色→rule 映射 | `AGENTS.md` “新会话最小读取入口” | 是 | Correct behavior |
| Discovery role 与 skill 的“规则管权限/硬门，skill 管操作顺序”分层清楚 | `ROLE_DISCOVERY.md`; `research-topic-discovery/SKILL.md` | 是 | Correct behavior |
| Registry 约 1.68 MB/24,985 行/262 顶层记录，并含大量历史 `ACTIVE/PENDING` 字面状态 | `registry.yaml` | 是 | Restart/read-surface defect |
| Plan 没有 lane→assignment→write dir→next action 的重启看板 | `plan.md` | 当前持续 | Control-plane template gap |
| Candidate role 未把 `$hardware-stageb-runner` 列为硬件/GPU/NPU Stage B 条件必读 | `ROLE_CANDIDATE_OWNER.md`; `AGENTS.md` | 当前持续 | Skill routing gap |
| Stage B 规则要求 `STAGEB_EXECUTION_CONTRACT/WORK_BREAKDOWN/ENVIRONMENT_LOCK/RECOVERY_LEDGER/CLAIM_EVIDENCE_MATRIX/RUN_INDEX`，templates 只覆盖其中一部分 | role + `templates/` | 当前持续 | Template gap |
| Hardware initializer 生成 `TASK_CONTRACT.yaml` 等另一套工件，并固定写 topic root，而不是 frozen assignment write directory | hardware skill assets/script | 当前持续 | Execution contract defect |
| Hardware reference 仍把 `stages/stageB/_shared/` 描述为 authoritative shared target，而生产规则已改为 `projects/_assets/<asset_id>/` | `evidence-and-escalation.md` | 当前持续 | Stale reference |
| AGENTS 的正式流程已到 `FORMAL_PROJECT_ACTIVE → SUBMISSION_PACKAGE_READY`，Mainline state machine/pool 仍主要停在 `FORMAL_CANDIDATE` 且未列正式项目 owner/reviewer lane | `AGENTS.md`; `ROLE_MAINLINE.md`; `ROLE_PAPER_PROJECT.md` | 当前持续 | Cross-role state/pool gap |
| Formal project role 没有强制 assignment mode 区分 owner 与 independent manuscript reviewer，templates 仅泛称 | `ROLE_PAPER_PROJECT.md` | 当前持续 | Independence/readability gap |

## Root cause

规则曾围绕运行中的长期聊天逐步演化，科学语义已经很全，但“聊天记忆为零”的 cold-start 路径没有作为单独产品验收。历史 registry 兼具日志、状态和兼容记录；Stage B skill 则早于后续 canonical contract/resource-localization 规则，因而发生漂移。继续堆叠更多角色规则不会解决这些问题。

## Risk analysis

- False-negative risk: 低到中。规则硬门完整；但新会话可能因漏读 current assignment/source closure 状态而错误 abstain 或重复工作。
- False-positive/weak-paper risk: 低。科学门未缺；但 Stage B 双合同或旧 initializer 可能造成证据不可审计。
- Scientific-integrity risk: 中。最危险的是把旧 registry 状态当当前、独立 reviewer 角色混淆、或 claim-bearing run 未使用 canonical Stage B contract。
- Resource/time risk: 高。每分支重复通读巨大 registry、重建上下文和修复模板漂移会显著浪费会话容量。
- State-migration risk: 中。改变分支 registry 读取方式必须 fail-closed、保留 full-registry fallback 并先 shadow。
- Terminal-revival risk: 若 context slice 丢失 terminal identity/STOP 信息则有风险；因此 slice 必须带 registry hash、terminal/direct-collision digest，缺失时回退 full registry或停止，而不是猜测。

## Recommendation

- Decision: `PATCH_RECOMMENDED`
- Minimum effective change: 实施 P0 restart contract + Stage B contract alignment + formal-project routing clarification；P1 assignment context slice 先做 shadow。
- Why a smaller operational fix is insufficient: 只在每个新聊天手工粘贴一段提示仍依赖人工记忆，无法机械证明 role、hash、write boundary、independence 和 current assignment 一致。
- Non-relaxable gates preserved: Q2、same-object、latest collision、强基线、natural/canonical evidence、full-cost、reproducibility、claim ceiling、STOP non-revival、逐题 Stage B/正式项目用户门全部不变。

## Recommended architecture

### 1. `AGENTS.md`：唯一主入口和路由表

只保留全局目标、不可放松门、权限、状态主干、资源原则和“会话启动表”。启动表每行写清：角色、必读 rule、必读/条件 skill、条件协议、canonical 输出、是否可改变状态。

### 2. `plan.md`：唯一人类可读 current snapshot

文件顶部新增 `当前 lane 与重启看板`，只列 active/pending/blocked/idle lane：`lane_id / role / assignment_id / topic / state / exact assignment/context path / write directory / next action / user action`。已终止长叙事移到 history，只在 plan 保留影响当前调度的一句话。

### 3. `registry.yaml`：完整机器状态，不再是普通分支的人类启动载荷

Mainline 与争议 Rule Audit 继续读 full registry。普通分支读取 mainline 生成的 `ASSIGNMENT_CONTEXT.yaml`：它是带 full registry hash 的只读投影，不是第二状态源。缺失、hash 漂移、terminal/collision 摘要缺失或字段冲突时，分支 fail closed 交 mainline，不自行解释。

### 4. Role rule：回答“该角色做什么、怎么判断、写哪里、何时交接”

不把查询配方或工程命令重复塞回 AGENTS。Discovery 查询/闭合流程继续留在 skill；Stage B 工程 runbook 条件加载 hardware skill；正式项目写作/完整性/审稿流程由 academic-research-suite 路由。

### 5. Skill：回答可复用的操作方法

Skill 不能改状态/科学门，必须被 AGENTS/role 显式路由。skill assets 和 initializer 必须生成 role 所要求的 canonical 工件，不能创建第二套权威合同。

## Validation and rollback

- Historical cases/backtest required: P0 文本路由和模板对齐不改变科学裁决，不需论文时间切片；context slice 替代 full-registry 读取需 cold-start shadow。
- Shadow-run plan: 选 Mainline、Discovery、Stage0、StageA owner、StageA gate、StageB owner/reviewer、Rule Audit、Formal Project owner/reviewer 各一份正/负启动包；新会话只读 proposed bootstrap set，输出 `BOOTSTRAP_ACK.yaml`，与 full-registry owner 结果机械比较。
- Success criteria: 角色/assignment/topic/write dir/next action/forbidden actions/required skill/terminal+revision+resource+user gates 100% 一致；零越权；零 stale assignment；Stage B canonical 工件 6/6；formal reviewer 独立性明确。
- Failure criteria: 任一会话需靠旧聊天才能确定下一步；context 遗漏 terminal/collision/revision/user gate；initializer 写到 assignment 外；skill 与 role 产生双合同。
- Rollback condition: context shadow 有任何决策/权限/终态差异，继续 full registry，修正 slice schema，不切换；Stage B initializer validation 失败则保留旧脚本禁用状态并手工使用 canonical templates。

## Mainline handoff

- User approval already present: `yes`，用户明确要求采用 AGENTS 主入口、plan 当前状态、角色 rule 路由，并确保全会话可重开。
- Files proposed for change: `AGENTS.md`, `plan.md`, `rules/ROLE_MAINLINE.md`, `rules/ROLE_CANDIDATE_OWNER.md`, `rules/ROLE_PAPER_PROJECT.md`, hardware skill `SKILL.md`/reference/assets/script, Stage B templates, 新 `templates/ASSIGNMENT_CONTEXT.yaml` 与 `templates/BOOTSTRAP_ACK.yaml`。
- Registry migrations proposed: 不改候选科学状态；只登记 restart schema/version、current context paths、skill/template hashes、formal-project compatibility alias。
- Existing active/blocked/hold/terminal topics affected: 科学状态全部不变；active frozen assignments 不换规则，只生成只读 restart context/compatibility addendum。
- Shared files modified: `false`

