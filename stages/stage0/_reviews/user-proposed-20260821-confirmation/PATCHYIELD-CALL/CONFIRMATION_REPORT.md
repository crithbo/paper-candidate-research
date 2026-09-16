# PATCHYIELD-CALL — independent Stage0 confirmation

- Assignment: `STAGE0-C1-20260821-USER-QREFINE-PATCHYIELD-CONFIRMATION`
- Lane: `STAGE0-CONFIRMATION-SENTRY-D`
- Decision: `CONFIRM`
- Confirmed PRIMARY decision: `REVISE_ONCE`
- Confirmed sole atomic gate: `READY_CALL_BOUNDED_BYPASS_16__PROGRESS_INCREMENTAL_FAIR_POLICY_CERTIFICATE`
- Evidence ceiling: `E1_STATIC_PREFLIGHT__NO_LIVE_RESULT_NO_FAIRNESS_FEASIBILITY_CLAIM`
- StageA/B authorized: `false / false`

## 决定性复核

### 1. Live re-execution causal contract

冻结 action 是在同一 admitted set 中从 simultaneously-ready sessions 选择下一份完整、
非抢占 LLM call；模型、agent、tools、dataset、deadline、H100 与 admission 均固定。recorded
service-time replay 不能保留 scheduler-induced batching、KV residence/eviction、prefix reuse、
recompute 与 actual service time，因此 PRIMARY 将 live re-execution 设为主证据是正确修复。

“deterministic”只能指 pins、request bodies、seed rule、initial-state/reset 与执行协议可重放，
不能声称 GPU/agent trajectory逐 token 必然相同。Stage A 必须用 reset/warm-up、policy-order
blocking/counterbalancing、replicated seeds 和同一 sealed evaluator定义端到端 policy estimand；
这属于 preclaim fidelity，不另造 scientific revision。replay继续只能作 live-calibrated
sensitivity。

### 2. Current union 与 closest baselines

冻结 vLLM commit `568afb3a...` 的 `SchedulerConfig` 已含 FCFS、priority、custom
`scheduler_cls`、chunked-prefill与 KV watermark等面；current upstream还在讨论更轻量的
extensible policy hook。因此普通 progress score、priority field 或 scheduler subclass 不构成 N2。

VTC 提供 token-cost fairness与 service-difference bound；DLPM/D²LPM把 prefix locality、
fairness与 distributed load balance结合；Justitia在 vLLM 上对 LLM applications 做
memory-centric demand prediction、fair completion order与 worst-case delay；这些足以吸收
“预测剩余量 + 公平队列”的普通版本。

独立 current check 还补入 SAGA、SMetric 与 NVIDIA Dynamo ThunderAgent：它们分别覆盖
workflow-atomic/KV/fair-share、session-turn-aware locality/load balance，以及 tool-boundary
program pause/resume/forced-resume。它们不是冻结 single-H100、complete-ready-call、
arrival-relative sealed-success、public repair-progress information 的八谓词 direct fatal：
SAGA/SMetric主要改变 workflow/routing/object scale，ThunderAgent引入 pause/admission action。
但 revision certificate 必须逐项说明为何 candidate action不是这些系统的 feature/priority
替换或合法组合。

### 3. 唯一 revision gate 是否原子且可闭合

在不要求实现或正结果的 Stage0 语义下，该 gate仍是一个可审计的静态机制证书：

- complete ready-call/session/tie/batch/KV action grammar映射到 frozen vLLM native surface；
- online information明确排除 sealed result、solution patch与 held-out labels；
- 一个在所有 legal queue states中机械满足 `bypass_i<=16` 的 policy；
- progress state必须改变 policy state/transition或可证明 guarantee，不能仅作为任意 scalar rank；
- 同对象 witness需把 candidate与 FCFS/priority、VTC、DLPM、Justitia以及上述 agent-serving
  subtractors区分；
- full-cost、benchmark-specific claim ceiling与 finite H100 killer保持不变。

这些项共同回答一个问题：是否存在 current-union-external 的 progress-incremental constrained
online action/guarantee。它们不要求 Stage0已有 live gain，因而可以作为唯一静态 revision。

### 4. Stop sentinel 与质量/AI路线

`READY_CALL_BOUNDED_BYPASS_16` 本身只是可测约束；通过 aging/forced dispatch即可附加到
generic priority policy，不能单独充当新 fairness theory。若 revision只交付 score、ranker、
priority/plugin、普通 virtual-time/aging 或 existing agent fair scheduler的组合，则 sentinel
`BELOW_Q2_STOP__GENERIC_PRIORITY_OR_EXISTING_FAIR_LLM_APPLICATION_SCHEDULING` 是机械公平的。

SWE-bench Verified在 2026 已有公开 contamination/能力测量批评；冻结对象仍可作为
benchmark-specific systems workload，但 repository-held-out folds不能消除 model pretraining
contamination。revision与未来论文必须保持“固定 benchmark scheduling”ceiling，不能外推
生产 SLA 或一般 agent能力。

若 certificate真正给出非 generic action/guarantee，AI可完成静态 policy checker、leakage
audit、action witness与实验 ledger；H100只在未来 Stage A成为资源门。因此确认
`REVISE_ONCE`，但不预先确认 Tier B，且不授权 revision执行或 Stage A/B。

## Provenance judgment

PRIMARY decisive source、frozen identities与 current vLLM source均可追溯；新增 current
subtractor来自 official/primary sources。没有决定性 provenance break，因此不是
`PROVENANCE_FAIL`。

## Confirmation conclusion

`CONFIRM`。确认 PRIMARY 的唯一一次静态 revision gate与预登记 STOP sentinel；revision
必须保持原 object/action/deadline/H100/online-information contract，并把 current agent-serving
subtractor纳入 comparator separation。只有主线可投递 revision。
