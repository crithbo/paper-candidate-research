# R40 Discovery skill consolidation audit

## 结论

建议按“大幅精简、保留硬门、重排 source-closure 顺序”实施，并在实施完成后恢复六路 Discovery。

当前持续零 clean brief 不是单一模型能力问题。主要原因是三类因素叠加：

1. 多轮 assignment-local 修复留下了正确但分散的局部约束，执行会话很难判断哪些是永久规则、哪些已经试验结束；
2. typed carrier/action/estimand、Question Card 与 source closure 的顺序倒置，最需要深读公开材料的路线反而在获得深读资格之前被挡住；
3. 题源长期收敛于成熟 product/API/configuration/selector/RA 表面，产生了很多健康 current-union/generic-kernel 淘汰，但对 measurement、formal、benchmark validity 和真正 target-specific algorithm residual 的公开锚点调查不足。

六路 `gpt-5.6-terra / high` 应保留。全周期最多两个 `gpt-5.6-sol / high` packet 也应保留，但资格必须移到 pre-RQ anchor closure：强模型的任务正是闭合共同定义的 carrier/action/estimand，而不能要求这三个字段在调用前已经完整。

## 社区方案中值得吸收的机制

本审计把 GitHub 采用量、维护主体、明确的工作流、可复现产物与科学诚实边界当作参考信号，不把 star 数等同科学有效性。

| 公开方案 | 值得吸收 | 不采用 |
|---|---|---|
| Microsoft ResearchStudio Idea Spark | 先做真实文献 grounding；机制优先查询；区分 core/adjacent/off-topic；coverage check；先诊断 bottleneck，再生成一个可证伪 idea；独立 coherence/adversarial check | 其针对 ML Oral idea 的大规模池、外部连接器、固定 pattern composition 和计算预算不适合直接移植；本项目也不能把未碰撞写成 novel |
| K-Dense scientific-agent-skills | 发散、假设生成、critical-thinking 分离；研究技能采用渐进式 disclosure；广受采用说明 skill 作为稳定运行手册比散落会话提示更容易被实际调用 | 生物医学数据库和强制可视化等领域特定要求不移植 |
| AI4S research-explorer | 多维度探索、逐步落盘、每个引用必须是本次真实获取、候选只是建议而非新颖性结论 | 5–10 topics、20–30文献和评分排序不能成为本项目配额或录取门 |
| agent-research-skills idea-generation/novelty-assessment | 生成与 harsh-critic 分离、迭代检索、最近工作检查、清楚的上下游 skill handoff | 1–10 分补偿评分、二元 Novel/Not Novel、自报 confidence、最多10轮无界查新不适合本项目 |
| academic-research-suite | 研究问题收敛、来源核验、反方检查、证据层级、显式局限与可复现检索 | 不把完整写作流水线前移到 Discovery |

参考：

- https://github.com/microsoft/ResearchStudio/tree/main/ResearchStudio-Idea
- https://github.com/K-Dense-AI/scientific-agent-skills
- https://github.com/ai4s-research/ai4s-skills
- https://github.com/lingzhi227/agent-research-skills

## R17–R39 小规则清理

### 永久保留

- 六路长期会话与 `terra/high` breadth；不增加第七路。
- same-object、direct/current collision、公平 current strong baseline、自然或 canonical 证据、full-cost、可复现、Q2 和 claim ceiling。
- 五字段全历史 exact/terminal identity；`RELATED_ONLY` 不得自动排除。
- source-closure queue 的 attempt-before-call、拒绝/404/零字节也计数、零尝试不得 `EXHAUSTED`。
- seed/RQ/raw/deep/brief 分母分离；零 brief 合法。
- Discovery 与 Stage 0 的职责分离：完整 current union、正式 Q2 和完整 action catalogue 不在 raw 前穷尽。
- 具体公开材料缺口必须进入 closure queue；资源失败不形成科学负结论。
- 类型化 raw/brief 合同，但只在 source closure 后作为门。

### 降级为 advisory 或单周期调度

- “至少四种发散引擎”和七种视角轮换：改为覆盖提醒，不再形成执行负担。
- 每个 seed 固定写 2–3 个 RQ：改为一个 primary，只有真实范围歧义时增加最多两个同对象 alternative。
- 近期饱和主题回避：只允许下个冻结周期的 source weighting，不得变成成熟项目/ISA/API/缓存/索引/编译器的类别禁令。
- typed actionable residual portfolio：作为 raw/deep 的类型路由，不再作为 pre-RQ eligibility。
- action-enumeration/non-product survival：改为 contribution-type-specific cheapest anti-collapse check，不再对所有题统一要求。
- ownership bridge：吸收其阶段分离语义，不保留额外命名 pilot 或重复 artifact。

### 明确撤销或不复活

- 固定 S3/S4 强模型槽位。
- universal non-product coupling gate/shadow。
- broad opportunity-family cooldown 或把相同平台当 exact identity。
- 结果感知 backfill、强制 Top-N、proposal quota、可补偿评分和多数投票。
- 每连续两轮零 brief 就叠加一条新 production micro-rule。以后审计必须对上一试验给出 `RETAIN / DOWNGRADE / REMOVE`，一次只测一个变化。
- 在 strong packet 调用前要求完整 final RQ、exact carrier/action/estimand tuple；这正是 Source50 出现 0/2 eligible 的直接流程缺陷。

## 新的稳定结构

1. `ROLE_DISCOVERY.md` 只保留权限、硬门、状态和输出合同。
2. `.agents/skills/research-topic-discovery/` 保存可执行的产题顺序、query/source roles、pre-RQ anchor closure 和两个强模型 packet。
3. templates 只承载记录字段，不重复长篇决策说明。
4. 每个新 Discovery assignment 同时冻结角色规则和 skill 的版本/哈希；缺失时 fail closed。
5. 六路先完成普通 breadth 与最多一个 depth nomination；所有 nomination 冻结后，主线按结果无关的机械顺序选择最多两个 `sol/high` 子代理 packet。
6. 强模型只闭合 carrier/action/estimand、最明显 current/generic 反方和有限 oracle/falsifier。其结果回到原 lane，再走完整 raw、C0/deep 和 clean brief 门。

## 风险与控制

- **弱 raw 增加**：pre-RQ closure 会增加可调查分母，但 raw gate本身不变；Stage 0 不接收 closure packet。
- **强模型变相改题**：冻结 anchor/object/guarantee/question/source 后才运行，禁止 replacement、backfill 和 novelty/Q2 verdict。
- **六路等待 barrier**：barrier 只选择强 packet，breadth handoff可先完成；两个 packet 可并行，不能阻塞无关下游验收。
- **skill 与规则漂移**：assignment 同时冻结两者 hash；权威冲突时规则优先并报告主线。
- **社区方案过拟合**：只吸收结构机制，不复制外部阈值、评分、模型自信或领域专用流程。

## 验收

首次恢复周期不以必须产出 brief 为成功条件。检查：

- pre-RQ 淘汰不再引用 raw/Question Card 后置字段；
- 每个具体公开材料缺口 100% 进入 closure packet/queue 或给出已知 fatal；
- strong packet nomination 在结果前冻结，0–2 个调用均可机械解释；
- 若调用强模型，至少一个完成实质字段闭合或提前发现一个具名 fatal；否则触发停止升级；
- raw→brief 与 brief→Stage0 repair vector 可对账；
- 无对象漂移、结果补位、hard-gate regression、共享写冲突或资源越界。

## 授权与实施

用户本轮已明确授权更新规则、完成 skill 并在验收后恢复选题，因此标记 `MAINLINE_IMPLEMENTATION_AUTHORIZED`。本审计会话仍遵守 single-writer：只提供 draft 和 exact patch spec；共享文件由主线在 Source52 未投递的安全边界单写。旧 Source52 snapshot 不得静默改写或复用；恢复时创建新的冻结 assignment identity。
