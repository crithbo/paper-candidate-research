# Stage B 独立复审会话规则

## 适用会话

- `STAGEB-INDEPENDENT-REVIEW-LANE-1..2`

使用长期复用独立 review lane，不按候选新建会话。默认 `gpt-5.6-sol / high`，不自动使用 xhigh，max 全局禁止。Reviewer lane 未参与被分配候选的 Stage B 实现，不改候选材料，也不补做决定性实验；主线用冻结 artifact、assignment 隔离和参与者检查保证独立性。每次新 assignment/follow-up 必须显式写 model/thinking。

lane 一次只审一题，使用唯一 review 子目录；完成并经主线验收后回到 `IDLE_REUSABLE`。没有用户批准的 Stage B 包时，主线将空闲 Stage B review 任务窗口登记为 `ARCHIVED_UI_POOL_COMPACTION` 并保持冷归档；有包时反归档原独立 lane。不得预读队列中其他候选，不得把前一题未登记事实带入下一题。若该 lane 曾参与某题实现或决定性实验，必须回避该题，但可以继续审查其他题。

## 最小读取

1. `AGENTS.md`
2. `plan.md`
3. 主线冻结的 `ASSIGNMENT_CONTEXT.yaml`；context-slice production 前双读本题 `registry.yaml` 记录
4. 本文件与 `academic-research-suite/SKILL.md` 的独立证据/复现审查流程
5. 候选从 brief 到 Stage B 的最小材料、运行 manifest、q1 calibration 与 handoff
6. `templates/INDEPENDENT_REVIEW_REPORT.md`、`templates/Q1_COMPARATOR_MATRIX.md`

只写独立 review 目录。

新会话先生成 `BOOTSTRAP_ACK.yaml`；主线接受前不得形成裁决、补做实验或改候选材料。

## 核心判断

回答：

> 一名理性的二区审稿人是否会认可其为完整、可信、可复现的论文；并且一名一区审稿人是否可能认可其潜力？

必须独立给出 `TIER_A_Q1_POTENTIAL / TIER_B_Q2_VIABLE / BELOW_Q2_STOP`。不要求顶会范式创新或全量投稿实验。`TIER_B_Q2_VIABLE` 是最低接受线；它只允许贡献广度或证据规模低于一区，不允许核心贡献、same-object、最新碰撞、公平强基线、自然正证据、full-cost、可复现性或证据诚实性缺失。

## 必查

1. exact object、N1/N2/N3 和主 claim 是否跨阶段一致；
2. 具名基线是否同对象、同信息、可部署、完整计价；
3. 至少一个主要 claim 是否有决定性正证据；
4. 主要消融、成本和失败模式是否闭合；
5. 主 workload 与正交验证是否排除 synthetic 特例；
6. 最新碰撞分类是否准确，是否存在 `DIRECT_FATAL`；
7. analytical/simulator/GPU/RTL/FPGA/P&R/silicon evidence 与 claim ceiling 是否一致；
8. 未完成项是否只是正式实验扩展，而非唯一正证据；
9. venue family、读者、贡献与证据形状是否匹配；
10. 版本、输入、命令、配置、结果和哈希是否可审计；
11. 候选 Q1 参考的发表状态、分区口径、阅读范围和 comparator matrix 是否可靠；
12. 独立增加或替换至少一篇 Q1/同等级参考后，最低论文充分性是否仍成立；
13. AI 重放比例、人工边界和资源请求是否诚实；
14. 组内所有权和未公开贡献边界是否需要用户裁决。
15. `STAGEB_EXECUTION_CONTRACT`、work breakdown、environment lock、recovery ledger、claim-evidence matrix 与 run index 是否存在，且 topic/assignment/approval/hash 一致；
16. B0–B6 是否按冻结 kill-gate 顺序执行，是否有影响主要 claim 的 gate 被错误标为 `NOT_APPLICABLE`；
17. claim-bearing 数字是否全部来自未 invalidated 的 run；`ENGINEERING_CORRECTION_IN_CONTRACT` 是否保持对象/机制/比较器/workload/指标/保证/claim 不变并完整重跑，科学变化是否正确计入 `REVISE_ONCE`；
18. 实际下载、build、retry、timeout、设备与替代路线是否位于逐题 `AUTONOMOUS_RECOVERY_ENVELOPE`，postclaim blocker 是否诚实保留部分证据与未闭合 gate。

对 implementation-absence 型贡献，必须重新核验 current upstream commit/tag、官方 current 文档、源码路径与全部相关 flag/threshold/config；不得以旧文档、旧版本或关闭现有能力制造贡献和弱基线。

## 公平基线

通常冻结当前部署、最近论文、竞争性简单方法和可选 oracle ceiling。组合基线只有在版本兼容、同信息、可实现、成本完整并保持同函数/协议时公平。

表达同一动作不等于覆盖新算法；还需比较复杂度、在线信息、运行/编译开销、扩展性、解质量和保证。不可部署万能 union 不得作为拒稿理由。

## 性能与近似专项

必须检查：

- same-function/quality/SLO；
- 当前强实现与匹配调优预算；
- 冷启动、编译、预处理、转换、内存、同步、元数据与回退；
- full-cost 后收益；
- 方法变化—机制指标—端到端结果因果链；
- 趋势、推广区域和无收益/退化边界；
- 近似方法的完整质量/误差—成本 Pareto；
- 多次运行、方差和统计。

普通调参、手工特化、精度不公平或实现成熟度差异必须拒绝。

## Q1/Q2 独立重校准

参考集合通常 3–5 篇，至少完整阅读最近两篇的方法、实验、消融和限制。Reviewer 必须独立增加或替换至少一篇参考，降低候选方选择偏差。

一区档可接受：

- `PARITY_PLAUSIBLE`
- `NEAR_Q1_PLAUSIBLE_WITH_BOUNDED_GAP`

近一区允许：

- 少一个额外 workload/平台；
- 更大规模或更长运行待补；
- 统计、敏感性或补充消融待加强；
- 工程化、写作和 venue-specific 展示待完成；
- 更高等级硬件证据待用户补充，而当前窄 claim 已成立。

不能作为 bounded gap：

- 核心贡献未成立；
- `DIRECT_FATAL` 未排除；
- 基线弱或不公平；
- full-cost 收益消失；
- 没有自然正证据；
- 结果不可复现；
- 剩余实验决定方法是否有效。

若未达到上述一区档，但完整二区论文形状已由同对象贡献、强公平基线、自然 workload、full-cost 和可复现决定性证据支撑，可标记 `TIER_B_Q2_VIABLE`。如果这些核心项任一失败，必须为 `BELOW_Q2_STOP`。

参考论文不是 novelty evidence；只有同对象且公平时才是实验基线。不得因参考论文实验更多而单独拒绝，也不得因候选百分比更大而自动接受。

## 研究诚信

- 区分结果、推断和假设；
- 核验 primary sources、版本、日期与阅读范围；
- “未发现”只表示检索边界；
- 不提升证据等级；
- 不把同作者/同 oracle/重复 seed 当独立；
- 位精确语义和系统关键成本必须冻结；
- 数字评分不能覆盖 hard gate。

Reviewer 可以重放候选提供的入口、做只读源码核验和独立计算检查；不得新增主要机制、修复候选实现或生成唯一正结果。

Stage B 属于高风险边界，claim-critical 原始结果、关键代码、环境锁、比较器和复现入口仍须严格核验；但同一已接受 immutable artifact 不在多个小步骤中反复全量复算，辅助日志和无歧义的 manifest 格式差异也不单独阻塞。校验应围绕“能否改变主要 claim”取样和升级，发现真实漂移或复现失败时才扩大到全量。

新规则 Stage B 包必须至少独立 clean-replay 一个 claim-critical deterministic subset，或对 stochastic/environment-sensitive 结果按预注册 tolerance、环境字段和不比较项重算。Reviewer 不得为了让 replay 通过而修改命令、实现或 tolerance；无法重放时返回明确的 `CANNOT_VERIFY` 与影响 ceiling。若只缺机械工件或 hash，可请求不改变科学语义的 bounded corrigendum；若需要改变机制、比较器、workload、指标、保证或主要 claim，则必须按 scientific `REVISE_ONCE` 处理，不能由 reviewer 直接修复。

## 结论

使用 `templates/INDEPENDENT_REVIEW_REPORT.md`，分开给 scientific verdict（`ACCEPT_RECOMMENDED / REVISE_ONCE / INCONCLUSIVE_POLICY_HOLD / STOP / CANNOT_VERIFY`）与 operational disposition（`READY / BLOCKED_USER_ACTION_REQUIRED / RESERVE_RECOMMENDED / EXECUTION_OR_GC_HOLD / NONE`）。

只有主线可以登记 `INDEPENDENT_REVIEW_ACCEPTED` 并进入 `PENDING_USER_DECISION`。完成后通知主线并等待验收，不自行创建正式项目或启动大规模实验。

面向用户的摘要须用中文说明主要 claim 是否可信、最强反证、证据上限和下一项用户决定；机器码与 SHA 作为精确登记或附录，不代替可读结论。

## 资源阻塞不等于论文失败

资源与执行 blocker 的状态/恢复语义统一引用 `rules/AUTONOMOUS_SOFT_BLOCKER_RECOVERY.md`。Reviewer 只核验 preclaim/postclaim evidence ceiling、attempt/路线耗尽、resume 包和未执行 gate；不得把未执行变成 `BELOW_Q2_STOP`、自动 reserve、归档或消费 revision。只有完整计价的真实负结果、结构吸收、反例或碰撞支持科学 STOP。
## 资源本地化引用

任何独立 replay 的下载、复制、解压、环境、build、cache、tmp 和 log 必须遵守 `rules/RESOURCE_LOCALIZATION.md` 并记录 inventory。主线登记的 `projects/_assets/<asset_id>/` 只读消费；需变换时复制到本 assignment 的 `src/` 或 `build/`。

## Artifact lifecycle closeout review

Cutover 后的新 StageB/review assignment 读取 `rules/ARTIFACT_LIFECYCLE.md`，但正式项目/StageB 的更强复现合同优先。Reviewer 核对 claim-critical run、environment lock、RUN_INDEX、minimum replay、full-cost 和 downstream formal-project input 是否在 capsule/retention plan 中；不得删除或重写候选材料。任何 cleanup-caused replay gap 为 `CANNOT_VERIFY`/GC blocker，不得为了让生命周期通过而降低证据门。
