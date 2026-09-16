# PATCHVALUE-COUNTERFACTUAL-REV0 — 独立 Stage 0 PRIMARY

## 裁决

`REVISE_ONCE`（仅送独立 confirmation；不授权 Stage A/B）。

本题是新对象；未继承 `PATCHYIELD-CALL` 的分数、结果或停止证据。若其单一修订门成功闭合，具有 `TIER_B_Q2_VIABLE` 的条件性测量论文形状；当前是 `STRUCTURAL_PAPER_POTENTIAL=CONDITIONAL_TIER_B`、`CURRENT_EVIDENCE_READINESS=E1_STATIC_PREFLIGHT`。置信度：中等（0.66）。

## 冻结对象与估计量

对象是固定 OpenHands/SDK/Qwen3-Coder FP8/SWE-bench 配置，在一个完成的 LLM 调用边界的同一序列化 agent 状态 `s` 上，比较 `do(stop)` 与 `do(continue h complete calls)`。主估计量为：

`Delta_h(s) = E_omega[H(clone(s), do(A=h), omega)] - H(clone(s), do(A=0))`。

其中 `omega` 是事前登记、独立随机化的 decoder-seed schedule；密封 evaluator 仅在各臂结束后离线给标签，不能进入 snapshot 选择、特征、分配、停止或分支执行。可声明范围仅限 assignment 所列固定 agent/model/decoder/benchmark，不能外推为生产 SLA、通用 agent 能力或任意模型结论。

## 独立发现

1. 当前 SDK 的 `ConversationState` 有持久化 state/event 表面，足以说明“会话状态”不是抽象空壳；但审阅到的 `BaseWorkspace` 接口是 sandbox 文件/命令与 pause/resume 抽象，未提供 whole-state clone/snapshot 合同。该观察不是 absence 结论，也不自动停止：它表明完整 fork 必须由一个可审计的外部、copy-isolated branch harness 闭合。
2. 若只复用同一 prefix 或只随机 decoder seed，而 repository、container、tool output、prompt/history、server/model configuration、RNG schedule 和 evaluator revision 中任一项没有冻结，则不是同一 `s` 的因果对照。并行分支共享可写 worktree、服务端会话或外部工具也会破坏 SUTVA。
3. [Causal Agent Replay](https://arxiv.org/abs/2606.08275) 是最强方法学减项：它已对 agent step 做 `do()`、按随机策略重执行，并讨论 point-of-commitment/confounding 与预算受限的 Monte-Carlo Shapley。它没有直接给出“停止 vs 固定 h 个完整后续调用”的同状态 continuation-value estimand、bit-identical state fork、或固定调用总预算下的随后分配合同；但若本题只是把其 action attribution 改名为估值/路由，则 Q2 贡献被吸收。
4. FailFast-RestartSmart、SWE-Router、test-time rollout/reuse、BAGEN、MARS/SAGA/Cascade/FairBatching等分属失败预测、重启、路由、价值/过程奖励或预算分配。它们是必须全成本比较的强减项，不能替代同状态随机 continuation effect 的基准；反之，本题不得只报终端成功分类、难度预测或普通 bandit allocation。

## 单一修订门

`FROZEN_SAME_STATE_BRANCH_FIDELITY__NONATTRIBUTION_CONTINUATION_VALUE_CERTIFICATE`

这是一个可证伪的联合闭合证书，而非两个独立任务。必须在不换对象的前提下同时给出：

1. 一个可枚举的 clone schema，覆盖 writable repository/worktree、agent history、prompt、tool outputs、container/filesystem state、model/server configuration、decoder distribution/seed schedule、call index、task/base revision、evaluator/harness revision；每一字段均有 hash 或 reset transcript。
2. 停止与 continuation 从同一 prefix hash 分叉，具有不同 worktree/seed/branch identity，且无共享可写状态；任何外部不可重放工具要么进入记录并可重放，要么从可识别总体排除。
3. 一个与 CAR 的 facet separation：治疗是未来计算分配的 absorbing `stop` 对固定完整继续 `h`，而非过去 action 责任归因；给出对 seed-wise estimator、censoring/selection、branch interference 的识别假设，以及不能退化为 terminal classifier、router/restart 或 generic allocation 的形式化非平凡量。
4. 一个有限 Stage A preclaim gate：至少一个合法小 snapshot 的两分支 replay，比较 prefix/state/reset hashes 与 offline evaluator isolation；在完整成本 ledger 下，若 state equality、evaluator isolation、branch independence 或 CAR-separation 任一失败，则停止本机制。该 gate 不要求当前运行 agent 或观察正收益。

通过该原子门，潜在 N3 是自然 coding trajectory 中、同一状态下继续计算的条件效果及其 harm/variance 分层；可选 N2 仅是固定总调用预算、共同最小预算之后的 allocation，不能反客为主。

## 公平比较与 full cost

所有比较器拥有相同 prefix、snapshot candidate information、模型/decoder 分布、最大调用预算和 evaluator。不允许以测试结果、未来 branch outcome 或 hidden evaluator 输出决定选择。最小 union：固定继续、固定停止、同信息 failure/restart policy、SWE-Router 类 route、rollout reuse、过程/结果 value、以及简单已登记随机 allocation。逐臂计入 agent/LLM、工具、GPU/CPU、clone/reset、container、evaluator、predictor/calibration 与失败 fallback 成本；按 repository-disjoint calibration、难度层和 branch variance 报告，不把成功概率与节约混为一个无量纲分数。

## 72 小时 / Stage A falsifier（未授权执行）

在冻结的少量 public SWE-bench task/state 下，首先只执行上述 fidelity gate；随后才允许测量。以下任一项即使产生表面正结果也停止主要 claim：clone schema 不完整、evaluator 泄漏、分支干扰、已登记 seed 随机化不成立、CAR facet 无法区分，或 full-cost 下相对于同信息 union 不存在预注册 Pareto/support。没有正结果不是当前 Stage 0 的负证据。

## 独立性与边界

未执行 agent、rollout、隐藏测试、模型/容器/数据下载、构建、benchmark 或任何 claim-bearing 计算。只持久化两份小型官方源文件；资源缺失不能作为科学停止依据。本 `REVISE_ONCE` 只建议主线投递独立 confirmation；该 reviewer 无状态变更或 Stage A/B 授权。
