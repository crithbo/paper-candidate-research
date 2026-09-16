# PATCHVALUE-COUNTERFACTUAL-REV0 Independent Stage 0 Confirmation

## 中文结论

- 独立裁决：`CONFIRM`。
- 被确认的 PRIMARY 裁决：`REVISE_ONCE`；本 confirmation 不执行也不消耗该 revision。
- 条件质量档：仅在唯一联合证书门闭合后为 `TIER_B_Q2_VIABLE`；当前不是 Stage 0 PASS。
- 原子门：`FROZEN_SAME_STATE_BRANCH_FIDELITY__NONATTRIBUTION_CONTINUATION_VALUE_CERTIFICATE`。
- 置信度：`0.84`。
- 证据上限：`E1_STATIC_PREFLIGHT__SEARCH_BOUNDED_OPEN__NO_CLAIM_BEARING_RESULT`。
- Stage A/B：`false / false`；本报告不授权进入任何后续阶段。
- 用户操作：无。主线只需把同一个、经下文收窄的原子门交给原 PRIMARY owner 做唯一静态 revision。

PRIMARY 对问题形状的基本判断成立：固定完成调用边界的同一编码代理状态，比较吸收式停止与恰好继续 `h` 个完整调用，是一个可以有限定义、可证伪的同对象反事实问题；缺实现、缺自然正结果或尚未运行 branch replay 都不是 Stage 0 的科学 STOP。可是 PRIMARY 的 current-union 核查遗漏了 current OpenHands 的原生 `Conversation.fork()`。该原语复制事件、agent 与 agent state，却明确共享 workspace，因而既否定了“只有外部会话 fork”这一过宽表述，也没有直接吸收 whole-environment SUTVA 门。这个遗漏必须在同一次 revision 内修正。

## Assignment 与独立性

- Assignment：`STAGE0-C2-20260822-PATCHVALUE-COUNTERFACTUAL-CONFIRMATION`。
- Lane：`STAGE0-CONFIRMATION-SENTRY-D`。
- 本 lane 未参与该题 Discovery 或 PRIMARY。
- PRIMARY canonical manifest：`11/11 PASS`；Discovery canonical manifest：`10/10 PASS`。
- 冻结 assignment、PRIMARY handoff/manifest、Discovery handoff/manifest 与控制文件哈希均机械匹配。
- 未读取、复核或复活被排除的 `PATCHYIELD-CALL`；两题之间不继承状态、证据或质量判断。
- 未执行 revision、agent、rollout、hidden evaluator、模型、容器、数据集、build、benchmark 或任何 claim-bearing 实验。

## Exact object、action 与 estimand

冻结对象仍可保持为同一个 OpenHands/SDK/Qwen/SWE-bench 配置及同一完成 LLM 调用边界的状态 `s`。原子干预必须是：

- `A=0`：从 `s` 开始吸收式停止，不再发生代理调用；
- `A=h`：从 `s` 开始恰好执行 `h` 个完整调用，除非预登记的 native terminal condition 先发生；
- 两臂保留同一任务、base revision、agent/model/decoder distribution、tool grammar、最大调用合同和离线 evaluator；
- evaluator 只能在两臂冻结后离线运行，不能参与选择、提示、路由、重启或提前停止。

目标量可写为

`Delta_h(s) = E_omega[H(F_h(s, omega))] - H(F_0(s))`，

其中 `F_h` 是从同一冻结状态出发的完整 native continuation transition，而不是“剩余时间预测器”或“成功概率分类器”。主张应围绕 coding-state 条件下的未来完整调用剂量—patch value/frontier，并把方差、成本和失败区同时报告。若最终只是用终端成功标签训练停止/路由模型，研究对象已退化，触发失败哨兵。

## Current upstream reality check

### 冻结 pin 与 PRIMARY 已审表面

PRIMARY 固定 OpenHands SDK commit `43376f1868ffd702746080714a59c16d3f69ec12`，并审阅了 `conversation/state.py` 与 `workspace/base.py`。这两份文件证明 state/event persistence 与 workspace 命令/文件接口存在，但不能支持 repository-wide “无 fork”结论。PRIMARY 自身已把该点写成 fidelity debt 而非 absence；这一谨慎边界正确。

### 独立发现的 current native fork

Current official OpenHands SDK 文档把 `Conversation.fork()` 定义为一等原语，并列明 events、agent、agent state 被复制，而 workspace 是 shared。Current official `LocalConversation.fork()` 源码也以 `workspace=self.workspace` 构造 fork。因而：

1. 会话/事件/agent-state 的复制已被 current native union 吸收，不能作为候选新动作；
2. writable repository、container/process、tool external state 与 evaluator side effects 仍未由该原语隔离；共享 workspace 会破坏两个并行/顺序 branch 的 SUTVA；
3. revision 必须核对冻结 commit 是否已经暴露同一 fork，并给出 pin-to-current action map，不能仅审两个基础文件；
4. 候选残差只能是“在 current native fork 之上完成 whole-mutable-environment isolation，并证明 future-dose estimand 的识别与非归因残差”，不能声称发明 conversation branching。

因此 current fork 是材料性收窄，不是 direct fatal。只要 separate worktree/container/tool-state/evaluator firewall 能以 same-agent、same-task、same-call-boundary 的计划静态定义，就没有换对象。

## 最强碰撞与非归因边界

### Causal Agent Replay（CAR）

CAR 是决定性最强减项。它已经把 agent state 建模为系统提示、工具和完整历史，支持 `do_resample`、`do_action`、`do_observation`、`do_context`、`do_policy`，从同一状态向前重执行，并提供 contrastive estimator、point-of-commitment 与预算受限 Monte-Carlo Shapley。它还明确指出 live tools/side effects 的 faithful replay 边界，以及用 common random numbers 识别 direct effect 的需求。

所以“从状态分叉、重跑未来、用最终结果做差”已被 CAR 覆盖。PatchValue 只有在同一次 revision 中同时给出以下残差时才不被吸收：

- treatment 是吸收式 stop 与恰好 `h` 个完整未来调用的资源剂量，而非某个既有 action/observation 的归因；
- 给出 coding-agent 特有的 whole-environment SUTVA/consistency 合同与 offline hidden-evaluator firewall；
- 给出不是 CAR 简单重标的 estimator、识别命题、误差/样本界、单调性反例证书或 certified frontier 性质之一；
- 在固定总调用预算、相同 prefix 信息和完整成本下，对 CAR adapter、固定继续/停止、routing、restart、rollout reuse 和普通 allocation 做公平比较。

CAR 没有直接给出上述完整联合合同；bounded search 未发现同对象 direct fatal。但 `SEARCH_BOUNDED_OPEN` 保留，不能从未检出推出 absence。

### 其他强减项

- `SWE-Router`：在部分轨迹上作模型路由并给出 Bayes-optimal routing；动作是模型选择，不是同模型 future-dose effect。
- `FailFast-RestartSmart`：预测失败并提前终止/重启；动作含 fresh restart，与固定状态的 continuation treatment 不同。
- agentic coding test-time scaling：多 rollout 的摘要、选择和复用；是完整预算基线，不自动识别同状态 `Delta_h(s)`。
- `BAGEN`：剩余预算/进度估计与 early stop；是必须排除的 remaining-time relabel，但不是同一 identified branch effect。

这些工作不会自动导致 STOP，却共同压低贡献上限：若 revision 只产出 predictor、router、restart policy、generic allocation 或普通 difference-in-means wrapper，则不足 Tier B。

## 唯一联合证书门的机械判定

门名保持不变，不新造第二门。要把 `FROZEN_SAME_STATE_BRANCH_FIDELITY__NONATTRIBUTION_CONTINUATION_VALUE_CERTIFICATE` 判为 closed，唯一 revision 必须把下列五个 conjunct 一次性封闭：

| Conjunct | Stage 0 静态闭合要求 | 失败含义 |
|---|---|---|
| `C1_CURRENT_NATIVE_FORK_CATALOG` | 固定 pin/current `fork` 的 plan→native-action map；逐字段列出 deep-copied、reset、shared/aliased 与外部状态 | 若把 current fork 当候选动作，属于 current absorption |
| `C2_WHOLE_MUTABLE_ENVIRONMENT_SUTVA` | 完整 clone schema：repo/worktree、filesystem/container/process、agent history/state、prompt/tool outputs、model/server config、decoder seed schedule、call index、task/base revision、evaluator/harness；每字段有 hash/reset/checker 规范 | 若 shared state 可跨臂写入或 reset 不可有限审计，branch effect 不可识别 |
| `C3_TREATMENT_AND_EVALUATOR_FIREWALL` | prefix-equality 检查、预提交 seed/coupling 规则、`A=0`/`A=h` 完整 transition、offline-only evaluator 非泄漏规则 | 若未来结果能影响 treatment 或分支，退化为 routing/hidden-test leakage |
| `C4_CAR_RESIDUAL_AND_GUARANTEE` | CAR facet matrix；明确 target-specific estimator/identification/formal guarantee；说明为何不是 action attribution、普通 replay 或 generic allocation | 若只有 CAR adapter/relabel 或无非平凡性质，Q2 kernel 消失 |
| `C5_FINITE_FIDELITY_AND_FULL_COST_KILLER` | tiny deterministic checker/oracle 规范、自然 public coding states、相同总调用预算、强 comparator union、完整成本 ledger 与预登记 falsifier | 若只能靠开放式实现计划或遗漏 branch/full costs，不可进入 Stage A |

这五项围绕同一个可证伪命题：在 current native fork 以上，能否对同一编码代理状态的未来完整调用剂量形成 SUTVA 成立、可识别且非 CAR 归因重标的 value/frontier 证书。它们不是五次修订，也不改变 exact object、agent、task、ABI/接口或 outcome contract。

### Stage 0 / Stage A 边界修正

Stage 0 revision 应交付 clone/reset transcript 的**可执行静态规范、字段哈希规则、预期 checker 输出和 killer 条件**，而不是已经运行的 transcript、branch witness 或 empirical non-equivalence 结果。实际 fork replay、prefix equality、两臂隔离和自然 state 的经验分离属于 Stage A 首个 `PRE_CLAIM_CONTRACT_FIDELITY_GATE`。把运行结果前置为 Stage 0 录取条件将违反当前阶段语义；相反，只写“以后实现”而不给完整 schema、action map、识别命题和有限 checker 也不能关闭 revision。

## 识别、随机性与可证伪性

固定状态的随机 treatment 消除了普通 treatment-selection confounding，但不自动解决以下问题：

- **Consistency**：相同 `A=h` 必须对应相同 native complete-call grammar；tool retry、terminal condition 和 condensation 都须固定。
- **SUTVA**：fork 之间不得共享可写 repo、container/process、tool service 或 evaluator cache；current shared workspace 是已知反例。
- **Randomness**：独立 seed schedule 可以识别各臂边际期望；若用 common random numbers 降方差，必须把 coupling 与边际不变性单独证明，不能混写成独立样本。
- **Interference/order**：branch 执行顺序不能改变 model server、rate limit、tool cache 或 task filesystem。
- **Outcome**：hidden evaluator 只在冻结后离线运行，并计入成本；不能向 agent 或 allocator 回流。

最小 falsifier 是任一字段 hash/reset 不一致、任一共享可写对象发生跨臂污染、同一预登记 treatment 产生不同合法 action grammar、或把 evaluator/未来 outcome 输入决策。任一项出现即否定本估计量的确认基础，而不是等待大规模性能结果。

## Full-cost 与条件 Tier B 形状

条件 `TIER_B_Q2_VIABLE` 仍成立，但不是 Q1 主张。一个可信 Q2 论文至少需要：

- 自然 public SWE-bench repo/task/state，repository-disjoint calibration，并按难度和 branch variance 分层；
- 固定继续、固定停止、CAR adapter、同信息 failure/restart、SWE-Router 类 routing、rollout reuse、value/process reward 与预登记 allocation 的 strongest union；
- 每臂计入 LLM token/GPU、tool CPU/wall、clone/reset/worktree/container、storage、evaluator、predictor/calibration、失败 fallback 和 wasted branch compute；
- 分开报告 patch-value/quality、成功率、wall/compute 与成本，不合并成无量纲分数；
- target-specific identification/estimation 或 certified frontier 的非平凡贡献，且失败区/no-gain 区诚实。

如果上述门闭合而 Stage A 后结果为负，仍可能形成有价值的测量/负结果边界；但 Stage 0 现在只判断潜力。若 revision 关闭后仍只有 generic target-trial Monte Carlo、CAR relabel 或 generic budget allocator，则 `BELOW_Q2_STOP`。

## Failure sentinel

`STOP__CAUSAL_REPLAY_RELABEL_OR_NONIDENTIFIED_BRANCH_EFFECT` 是机械正确的唯一科学失败哨兵，但只能在 revision 的静态证书真正失败时触发：

1. current native fork/CAR 已覆盖全部候选动作与保证，残差只有命名变化；或
2. whole mutable environment 无法在不改变 fixed agent/object 的情况下隔离，导致 consistency/SUTVA/branch identity 不成立；或
3. 没有 target-specific 非平凡 estimator/identification/frontier 性质，只剩 terminal classifier、routing、restart、remaining-time prediction 或 generic allocation。

未实现、没有 positive result、尚未运行 native branch、网络/模型/hidden test 不可用均不满足该哨兵。

## Devil's-advocate stress test

最强反方叙事是：CAR 已提供同状态干预与向前重执行，OpenHands 又已提供 conversation fork；PatchValue 只是选择一个 horizon `h`，对结果作 Monte Carlo 差分，再把它用于预算分配。若这是 revision 的全部内容，论文没有新的因果对象、算法或保证，且 shared workspace 会让所谓同状态分支失效。该反方目前足以阻止 PASS，却不足 STOP，因为 current fork 明确不隔离 workspace，CAR 也没有把“同一 coding state 的固定 future-call dose、whole-environment SUTVA、offline evaluator 与 full-cost frontier”作为完整同对象合同。唯一 revision 正是用一个有限联合证书决定这块残差是真实机制还是重标。

## Discovery repair vector

- Codes：`OMITTED_CURRENT_SAME_OBJECT`、`OMITTED_FIRST_PARTY_FEATURE`。
- Materiality：材料性。Current OpenHands first-party `Conversation.fork()` 必须进入 action catalog，且其 shared-workspace 边界决定 SUTVA 证书的核心残差。
- Cutoff availability：是；current official docs/source 可在冻结日期前后直接核查。
- 是否改变独立科学裁决：`NO`。它收窄 revision，并提高失败哨兵的机械性，但不把该题直接吸收或提升为 PASS。

## 最终裁决与下一动作

`CONFIRM` PRIMARY 的 `REVISE_ONCE`。主线应把保持原名、带上述五个 conjunct 的唯一原子门交回原 PRIMARY owner；本 sentry 不执行 revision。Revision 若静态闭合，只能请求另一未参与 revision 的 closing；若落入失败哨兵，则科学 STOP。不得授权 Stage A/B，也不得把本结论迁移给 `PATCHYIELD-CALL`。

