# Rule Audit Report

## 中文摘要

- 发现的问题：现行 Stage 0 与 Stage A 的科学硬门总体合理，但项目尚无一组“已知达到 Q2 或同等级、按论文当时信息截断、身份与结果盲化”的正控来估计误杀率。现有候选的最终状态混合了题目质量、资源、构造有效性和用户门，不能直接解释为审查过严。
- 对推进速度或研究质量的影响：若只统计字面 `PASS`，正确的 `HUMAN_RESEARCH_RESERVE`、`BLOCKED_USER_ACTION_REQUIRED`、`INCONCLUSIVE_POLICY_HOLD` 和一次合法修订都会被误计为失败；反过来，若不设负控，放松硬门也可能被误认成“召回率提高”。
- 建议修改：暂不改规则。先运行严格双盲的 `PACKER → EXECUTOR → AUDITOR` 历史时间切片回测；只有 PACKER/AUDITOR 知道既有论文金标，执行支线必须把输入当作自己刚发现的普通新题。Stage 0 采用 12 个真实 Q2+ 或同等级正控和 4 个结构性负控，Stage A 主分母只采用 8 个经本机资源预检可执行的正控。
- 是否需要用户批准：用户已明确批准推进并要求优先本地资源充分的案例。本报告不授权资源动作、共享规则修改或候选状态转换；仍需主线冻结回测 assignment 并投递隔离角色。

## Identity

- `audit_id`: `RULE-AUDIT-20260826-STAGE0A-Q2-LOCAL-RESOURCE-BACKTEST-R1`
- `trigger`: 用户要求用真实 Q2 论文回测 Stage 0/Stage A，并判断是否过严；随后要求优先选择本地资源足够的案例。
- `requested_by`: `USER`
- `date`: `2026-08-26`
- `write_directory`: `E:/project/writing/reserch/stages/rule-audit/RULE-AUDIT-20260826-STAGE0A-Q2-LOCAL-RESOURCE-BACKTEST-R1`
- `shared_files_modified: false`
- `scientific_or_resource_action_started: false`

## Question and scope

- User/process question: 当前 Stage 0 与 Stage A 是否把本可形成 Q2+ 论文的题目错误淘汰；以“75%”为直觉目标时应如何定义分母与成功。
- Rules inspected: `AGENTS.md`；`rules/ROLE_STAGE0_REVIEW.md`；`rules/ROLE_CANDIDATE_OWNER.md`；`rules/ROLE_STAGEA_REVIEW.md`；`rules/ROLE_DISCOVERY_BACKTEST.md`；`rules/ROLE_RULE_AUDIT.md`。
- Candidate examples inspected: 现有 Stage 0 comparator matrices、已登记通过/停止/保留/阻塞案例，以及 `CASE_POOL.yaml` 中列出的公开论文与 artifact。
- Out of scope: 执行论文实验；下载、构建或安装；改变任何候选状态；修改 `plan.md`、`registry.yaml`、共享 `rules/` 或 `templates/`；Stage B。

## Current authoritative behavior

1. `rules/ROLE_STAGE0_REVIEW.md` 把 Stage 0 定义为“条件性论文潜力筛选”，不要求主结果已经成立，也不应因实现或接口尚未闭合而直接淘汰，只要 exact object、同函数保证和有限闭合路线成立。
2. `rules/ROLE_CANDIDATE_OWNER.md` 要求 Stage A 在首个 claim-bearing observation 前通过 `PRE_CLAIM_CONTRACT_FIDELITY_GATE`；代理对象、残缺动作、错误分母或缺失 full-cost 的结果不能支持 PASS/STOP。
3. `rules/ROLE_STAGEA_REVIEW.md` 要求独立 gate 区分科学失败、资源 blocker、证据不足、保留和一次合法修订；Stage A 正结果只是关键前提的初步支持。
4. `rules/ROLE_DISCOVERY_BACKTEST.md` 已提供时间切片、PACKER/EXECUTOR/AUDITOR 隔离、禁看未来信息和正负控校准的基本框架，可复用于本回测。

以上书面规则没有把“必须立即可实现完整论文”设为 Stage 0 门，也没有把“没有本机资源”定义为科学 STOP。主要风险在执行口径和统计归类，而非科学硬门本身。

## Evidence of a problem or of correct behavior

| Observation | Source/artifact | Repeated? | Classification |
|---|---|---:|---|
| 当前项目候选的 PASS/STOP 比例不是已知正控分母，无法估计误杀率 | `registry.yaml` 与既有阶段材料的只读抽查 | 是 | measurement gap |
| 若要求 Stage 0 和 Stage A 各自都达到 75%，端到端仅为 56.25% | `BACKTEST_PROTOCOL.md` | 恒定 | metric-definition defect |
| 正确 reserve/block/hold 若混入 PASS 分母，会把资源现实误判为科学过严 | 三份阶段角色规则 | 是 | reporting ambiguity |
| HNSW、egg、ALEX、PGM-index、cvc5、Carcara 等存在公开、可缩小的 artifact 路线 | `CASE_POOL.yaml` 中的官方论文/项目页 | 是 | supports local-resource pilot |
| Pythia、Berti、BOLT、A Mess 的完整路线明显偏 Linux/大 trace/硬件计数器 | 论文 artifact README/官方仓库 | 是 | correct routing control, not Stage A denominator |

## Risk analysis

- False-negative risk: 统一把所有贡献类型要求成同一种“自然 workload + 性能提升”形状，可能误伤 measurement、benchmark、formal/tool 论文；把工程预检失败当科学失败也会产生伪误杀。
- False-positive/weak-paper risk: 单独追求通过率会诱导弱化 same-object、current collision、强基线或 full-cost。必须同时设置 4 个 direct-fatal 负控，且负控误放行不可由正控召回率抵消。
- Scientific-integrity risk: 已发表并不自动等于项目金标。PACKER 必须在论文身份揭盲前确认其在历史 cutoff 下确实满足本项目硬门；不满足者移出“qualified positive”分母并记录原因。
- Resource/time risk: Windows、无 WSL、本机 CPU/单 RTX 4070 是本轮硬资源边界。重型论文只测试正确路由，不计入 Stage A operational denominator。
- State-migration risk: 本试点只产生校准报告，不修改既有 assignment 或 topic 状态。
- Terminal-revival risk: 负控只用于规则校准，不复活任何已 STOP 题目。

## Recommendation

- Decision: `BACKTEST_REQUIRED`
- Minimum effective change: 无 production 规则修改；先冻结并执行 `BACKTEST_PROTOCOL.md`。只有重复、可归因的误杀模式出现后，才提出一个最小规则澄清或补丁。
- Why a smaller operational fix is insufficient/sufficient: 仅统计现有 registry 结果无法区分候选质量、资源阻塞、构造失败和审查误杀；一个盲化、分层、带负控的诊断试点是最小可识别方案。
- Non-relaxable gates preserved: Q2 minimum、same-object、历史 cutoff 下的 latest collision、公平强基线、自然/canonical 证据、full-cost、可复现性、claim ceiling、STOP non-revival、用户 Stage B 门全部不变。

## Validation and rollback

- Historical cases/backtest required: 12 个正控 + 4 个负控的 Stage 0；其中 8 个通过资源预检的正控进入 Stage A 主分母。
- Shadow-run plan: PACKER 封装；Stage 0 EXECUTOR 与 Stage A owner/gate 在未知论文身份、venue 和最终结果的条件下判断；AUDITOR 揭盲、复核硬门并分类错误。
- Success concealment: 执行任务不得出现“回测、论文、Q2、正控、已有成果、预期通过”等提示；不得提供作者实现或 artifact 路径。若执行者识别出身份，该案按污染作废并使用预登记替补。
- Success/failure criteria: 见 `BACKTEST_PROTOCOL.md`。试点只能给出 `PILOT_SUPPORTS_CONFIRMATORY`、`PILOT_FLAGS_OVERSTRICTNESS` 或 `INCONCLUSIVE`，不得直接把 production 规则宣告“已校准”。
- Rollback condition: 任一身份泄漏、cutoff 泄漏、资源选择受结果影响、PACKER/EXECUTOR/AUDITOR 角色冲突，整批作废并重封；不迁移任何科学状态。

## Mainline handoff

- User approval already present: 是，用户在当前任务明确批准按本地资源优先方案推进。
- Files proposed for change: 当前无共享文件变更；若回测发现重复误杀，再另案提出最小 patch。
- Registry migrations proposed: 无。
- Existing active/blocked/hold/terminal topics affected: 无。
- Shared files modified: `false`
