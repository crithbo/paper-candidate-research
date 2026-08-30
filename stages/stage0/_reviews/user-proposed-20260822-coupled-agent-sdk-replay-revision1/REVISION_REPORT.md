# COUPLED-AGENT-SDK-REPLAY-REV0 — sole Stage 0 revision

## 唯一 disposition

`REVISION_GATE_NOT_CLOSED__RETURN_TO_STAGE0_STOP_SENTINEL`

科学 revision `1/1` 已消耗。触发项为 `GENERIC_TOKEN_COUPLING_OR_PAIRED_STATISTICS_ONLY`，因此建议主线按冻结哨兵 `STOP__GENERIC_TOKEN_COUPLING_OR_NONISOLATED_SDK_BRANCH` 交独立 closing，而不是给第二次修订或 Stage A/B。

这不是资源、实现、硬件、自然正结果或实验缺失造成的停止。静态审查能够写出正确的两臂状态安全协议，却不能给出 assignment 所要求、超出 CAR + Coupled Token Generation + native fork/rerun + generic paired estimator 的 target-specific algorithmic residual。

## 联合门裁定

| Conjunct | 静态结果 | 原因 |
|---|---|---|
| C1 native transition induction | conditionally sound | 在每臂 native kernel 与正确 sampler 条件下可以作归纳；它不产生新算法。 |
| C2 isolation catalog | conditionally sound | frozen `fork()` 复制 agent/events/agent_state，但 alias workspace；所有非可审计外部 state 只能 split/reset/fallback。 |
| C3 sampling marginals | sound with stated ceiling | exact processors/warpers 后 Gumbel-Max 保持 categorical law；不等价于 stock RNG bit trace。 |
| C4 split/fallback/uncomparable | sound as conservative protocol | independent fallback 保持两边 marginal，但不提供 coupling advantage。 |
| C5 nonproduct frontier | **FAIL** | 所有 purported guarantees 分解为 token-level Gumbel coupling、native single-arm transition、copy/reset hygiene、independent fallback 和 paired-mean covariance identity。 |

因为该门是 C1–C5 的合取，C5 的结构性失败使门不闭合。

## 核心科学理由

令两臂 terminal labels 为 `Y_0,Y_1`。candidate 可正确写出

`Var(Y_1-Y_0)=Var(Y_1)+Var(Y_0)-2Cov(Y_1,Y_0)`。

然而 keep-shared/split/fallback labels 既不约束 `Cov(Y_1,Y_0)` 的符号或下界，也不改变每臂的 native state law：

- token 相同前的 shared Gumbel 是 Coupled Token Generation 的 token-level construction；
- tool/workspace mutation时的 split 是 ordinary copy-on-write / state isolation；
- non-idempotent or unobservable transition 时的 independent fallback 恢复 independent rollout；
- abort/uncomparable 的 conservative accounting只能防止偏差，不能产生 sample/variance guarantee；
- CAR 已提供 stochastic intervention/replay，并且 frozen SDK 已有 `fork()` 与 `rerun_actions()` 作为 branch/replay baseline。

因此“agent transition labels”只是安全会计层。除非它能选择或构造某个 union 外的合法 transition、给出与 labels 有关的非平凡 approximation/complexity/direct-effect guarantee，或证明 a priori covariance/cost frontier，它不构成 N2。候选目前没有这种 action、theorem 或 decision problem；只提供了正确但通用的 composition。

## 保持的正确边界

冻结 SDK 的 `rerun_actions()` 还明确警告 file/terminal/API/browser actions 可非幂等且建议 reset workspace。正确协议必须把这类 transition 送到 split/fallback，而不能用 replay 成功率填补。冻结 Qwen/Transformers route 只允许分布相同的 categorical Gumbel-Max 声明，禁止 bitwise native RNG equivalence。任何 hidden evaluator、另一条分支的 tool output 或 future outcome都不得进入保留 pair的选择。

这些限制保证静态 protocol 不虚假，却同时显示 CoARSE 没有可保留的非通用 paper kernel。

## 结论和不允许的替代

不可通过以下方式修补：增加 feature/threshold、把 fallback 包装成 frontier、只报告 matched seeds、以自然 16 tasks 或未来性能取代保证、或另起 generic solver/allocator。这样都未改变本次 failure branch。若未来提出 union 外的 action/object，应使用新 topic ID，而不是复活本题。
