# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260823-FULL-SESSION-RESTART-READINESS-A2`
- `proposal_id`: `SESSION_RESTART_BOOTSTRAP_AND_STAGEB_CONTRACT_ALIGNMENT_V1`
- `decision_label`: `PATCH_RECOMMENDED`
- `user_policy_approval_required`: `false__USER_DIRECTION_ALREADY_EXPLICIT`
- `backtest_required`: `P0_NO__P1_CONTEXT_SLICE_COLD_START_SHADOW_REQUIRED`

## Problem statement

项目科学规则已基本完整，但新分支 cold start 仍依赖通读巨大历史 registry 和旧聊天的隐含定位；Stage B hardware skill 与生产角色/模板/资源目录已发生漂移；正式论文 owner/reviewer 的主线会话池与状态衔接未完全显式化。这些会造成重启返工、双合同、写目录错误或独立性混淆。

## Current rule

- File/heading: `AGENTS.md / 新会话最小读取入口`
- Current behavior: 所有 lane 都读 full `registry.yaml`，再读一个 role 和最小上游。
- Why insufficient: registry 是 1.68 MB 历史型机器记录，存在大量早期/兼容 `ACTIVE/PENDING` 字样；普通分支没有一个唯一 current assignment projection。

- File/heading: `ROLE_CANDIDATE_OWNER / Stage B` 与 hardware skill
- Current behavior: role 要求六个 canonical 工件；skill 初始化另一组文件并写 topic root。
- Why insufficient: 新会话可能维护两套合同，且 assignment/resource root 不符合当前冻结目录语义。

- File/heading: `ROLE_MAINLINE / 状态机与长期角色池`; `ROLE_PAPER_PROJECT`
- Current behavior: AGENTS 已描述正式论文阶段，Mainline pool/state 未完全接上；paper role 同时覆盖 owner/reviewer 但无强制 mode。
- Why insufficient: 重启后无法仅凭角色路由稳定区分作者 lane、独立审稿 lane 和用户最终门。

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| `AGENTS.md` | 新会话最小读取入口 | prose role map + all lanes read full registry | 加一张 canonical startup table；Mainline/争议 audit 读 full registry，普通 branch 读签名 `ASSIGNMENT_CONTEXT.yaml`，必要时 fail-closed fallback |
| `AGENTS.md` | 全会话重开协议 | 无 | Mainline-first freeze → per-lane context → new-session bootstrap ack → mainline accept → old task archive |
| `plan.md` | 文件顶部 | 按题目叙述当前/已完结状态 | 增加 current lane dashboard；终态长叙事移 history |
| `templates/ASSIGNMENT_CONTEXT.yaml` | new | 无 | full-registry-hash-pinned current projection；含 role/lane/assignment/write boundary/read set/skill/resource/terminal/revision/user gates/next action |
| `templates/BOOTSTRAP_ACK.yaml` | new | 无 | 新会话回报 identity、hashes、下一动作、forbidden inputs、write boundary 和 contamination declaration |
| `ROLE_CANDIDATE_OWNER.md` | minimum read / Stage B | 未强制 hardware skill | 硬件/GPU/NPU/EDA Stage B 必须读 `$hardware-stageb-runner`; 全部 Stage A/B 使用 `$academic-research-suite` 选定 experiment/repro workflow |
| `AGENTS.md` | role startup table | hardware skill 未列 | 条件 skill 路由显式化 |
| Stage B templates | canonical artifacts | 缺 4 个模板 | 补 `STAGEB_WORK_BREAKDOWN.yaml`, `ENVIRONMENT_LOCK.yaml`, `AUTONOMOUS_RECOVERY_LEDGER.yaml`, `RUN_INDEX.yaml`; 复用已有 contract/matrix |
| hardware skill assets/script | initializer | 生成 `TASK_CONTRACT` 等，并写 topic root | 只接受 mainline 冻结的 exact assignment write directory；生成/复制 canonical six artifacts、RESOURCE_INVENTORY 与 resources 八目录；旧文件只读兼容 |
| hardware reference | shared target | 尚提 `stages/stageB/_shared/` authoritative | 改为只允许 mainline 登记 `projects/_assets/<asset_id>/`; legacy exact frozen input only |
| `ROLE_MAINLINE.md` | state/pool | 未完整列 formal paper lanes | 加 formal project owner + independent manuscript reviewer reusable lanes；明确用户 formal approval 后的状态链 |
| `ROLE_PAPER_PROJECT.md` | assignment preflight | owner/reviewer 共用而 mode 隐式 | 必须冻结 `FORMAL_PROJECT_OWNER / INDEPENDENT_MANUSCRIPT_REVIEW`; 逐一列 templates 与 academic-suite workflow |
| `registry.yaml` | restart control record | 无统一 context index | 只登记 context schema/version/path/hash/plan hash；不迁移候选科学状态 |

## Safety invariants

- Q2 minimum preserved: yes
- Q1 priority preserved: yes
- Same-object preserved: yes
- Latest collision preserved: yes；context 必须携带 terminal/current-collision digest 或 fail closed
- Fair current strong baseline preserved: yes
- Natural input/evidence preserved: yes
- Full-cost preserved: yes
- Reproducibility preserved: strengthened by Stage B artifact alignment
- Claim ceiling preserved: yes
- STOP non-revival preserved: yes；context 遗漏 STOP/terminal 信息即失败
- User StageB approval preserved: strengthened；initializer 必须验证 topic-specific approval

## State and compatibility migration

- Existing states affected: none scientifically.
- Existing assignments affected: active frozen assignments retain their rules; mainline may attach a read-only restart context/compatibility addendum without changing scientific semantics.
- Template compatibility: existing Stage B artifacts remain immutable; new canonical templates apply to new Stage B assignments. Existing `TASK_CONTRACT/PROGRESS/RESULT_SUMMARY` may be consumed as auxiliary legacy files, not canonical authority.
- Old filename compatibility: `FORMAL_CANDIDATE` retained as historical alias; new formal project activation follows AGENTS canonical states. `stages/stageB/_shared` remains read-only only for an exact old frozen asset reference.
- One-time migration required: mainline creates current-lane dashboard and one context file per lane that will be reopened.
- Rollback path: continue old full-registry read and manual canonical Stage B templates; do not delete old files.

## Validation plan

- Historical/time-slice cases: no science backtest for P0. P1 cold-start tests cover active, blocked, hold, terminal, revision-consumed, pending user StageB, resource-localized, Discovery selective-depth, backtest blind role and formal-project roles.
- Negative controls: missing context, stale plan hash, wrong lane/role, write path escape, omitted terminal digest, wrong skill hash, missing topic-specific StageB approval, owner assigned as independent reviewer.
- Expected behavior changes: lower read load, deterministic assignment recovery, one canonical Stage B contract, explicit formal-project routing.
- Forbidden regressions: any scientific disposition change, STOP revival, reduced collision/quality gate, broader resource authority, reviewer independence loss.
- Acceptance threshold: 100% identity/authority/state/next-action match; 0 unauthorized writes; 0 decision drift; Stage B initializer creates only assignment-local expected paths; all role bootstrap acknowledgements pass.

## Decision request

Mainline may implement this already user-directed, behavior-preserving restart architecture at the next safe control boundary. It must not archive old tasks until corresponding new tasks have produced accepted bootstrap acknowledgements. The context-slice read optimization must remain shadow/fallback-capable until cold-start validation passes. No Discovery/Stage/experiment/Stage B/formal project is authorized by this proposal.

