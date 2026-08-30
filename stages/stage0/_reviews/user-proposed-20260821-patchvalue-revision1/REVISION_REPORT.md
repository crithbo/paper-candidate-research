# PATCHVALUE-COUNTERFACTUAL-REV0 — Stage 0 revision 1

## 唯一 closing recommendation

`REVISION_GATE_CLOSED__PASS_RECOMMENDED__PENDING_INDEPENDENT_STAGE0_CLOSING`

本次实际提交并闭合了唯一静态联合门 `FROZEN_SAME_STATE_BRANCH_FIDELITY__NONATTRIBUTION_CONTINUATION_VALUE_CERTIFICATE`，因此 revision `1/1` 已消耗。结论只建议送未参与本次构造者做独立 closing；没有 Stage A/B 授权。

质量判断保持条件性：若未来 Stage A 的首个 fidelity gate 按本证书执行，具备 `TIER_B_Q2_VIABLE` 的测量论文形状；当前没有实证、性能或因果效果结果。`STRUCTURAL_PAPER_POTENTIAL=TIER_B_CONDITIONAL`，`CURRENT_EVIDENCE_READINESS=E1_STATIC_CERTIFICATE_ONLY`，置信度 `0.70`。

## 修订范围与对象保持

对象未变：冻结 coding agent state `s` 的 `do(A=0)` 吸收式停止，对比 `do(A=h)` 的固定未来完整调用剂量（native terminal-before-h 作为预登记、保留且计费的 arm outcome），并由仅离线的 hidden evaluator `H` 标注。旧 `PATCHYIELD` 未被读取、继承或复活。

这不是把 native `Conversation.fork()` 作为新动作。current OpenHands `Conversation.fork()` 已复制 events、agent 与 agent state；`LocalConversation.fork()` 复用 workspace。故候选只是在这一原生会话 fork 之上定义**外部 whole-mutable-environment isolation**、离线 evaluator firewall，及其对应的 future-dose effect estimator。

## 五项联合证书的裁定

| Conjunct | 裁定 | 静态闭合 |
|---|---|---|
| C1 current native fork catalog | PASS | 明确 native copy 与 shared-workspace 边界；不把 conversation branch 作为贡献。 |
| C2 whole mutable environment SUTVA | PASS (specification) | 可枚举 clone/reset/alias schema、每字段 hash/reset rule 与 fail-closed alias checker。 |
| C3 treatment/evaluator firewall | PASS (specification) | `A=0`/`A=h` grammar、seed rule、prefix equality 和 offline-only evaluator 已冻结。 |
| C4 CAR residual and guarantee | PASS (narrow claim) | 历史 action attribution 与未来 fixed-dose allocation target 分离，并给出 fixed-state, seed-randomized LCB identification frontier。 |
| C5 finite fidelity/full-cost killer | PASS (preclaim specification) | tiny static oracle、自然 coding-state route、equal-budget comparator union、all-arm ledger 与 failure conditions 已冻结。 |

“PASS (specification)”不表示已经 clone、运行分支、调用 evaluator 或观测到优势；这些是未来 Stage A 的 `PRE_CLAIM_CONTRACT_FIDELITY_GATE`，并非本阶段要求的结果。

## 为什么不是 CAR 的改名

CAR 直接减去“同状态分叉、向前 replay、对历史 action 归因”的泛化表述。本题现有可接受窄主张是：对固定 coding-agent call boundary 的**未来 compute dose**，在一个 absorbing-stop 对 fixed-h continuation 的 target trial 中，估计可审计 branch isolation 下的 conditional effect / confidence frontier。历史 step 的 blame、Shapley attribution、route choice、restart、remaining-time prediction 和 generic allocator都不属于主张。

静态 guarantee 是：对固定合法 state `s_i`、已登记独立 seed schedule `omega_r` 与 bounded terminal label，`D_i(h)` 的 simultaneous lower confidence bound 在完整 clone contract 成立时覆盖该 state 的 registered future-dose effect。该性质针对 complete-call grammar、native terminal handling、offline hidden evaluator 及 branch-cost denominator；不是“CAR adapter + difference-in-means”作为论文主张的许可。

## 失败哨兵与 Stage A 首门

预登记失败哨兵仍为 `STOP__CAUSAL_REPLAY_RELABEL_OR_NONIDENTIFIED_BRANCH_EFFECT`。实际 Stage A 的首个、尚未授权的 gate 应立即停止主要机制，若发现任一：字段 hash/reset 不同；workspace/container/tool/model/evaluator 有跨臂可写别名；seed/treatment 在 outcome 后选择；terminal/censoring 被删弃；CAR facet 退化为历史 action attribution；或 complete full-cost ledger 不可形成。

## 来源与修正

未访问网络、未下载新资源。采用冻结 PRIMARY/confirmation/Discovery 材料及其已验收的 source locators。更正 PRIMARY 中两个 locator：FailFast-RestartSmart 为 `arXiv:2608.03222`；Scaling Test-Time Compute for Agentic Coding 为 `arXiv:2604.16529`。详见 `SOURCE_CORRECTION_LOG.md`。
