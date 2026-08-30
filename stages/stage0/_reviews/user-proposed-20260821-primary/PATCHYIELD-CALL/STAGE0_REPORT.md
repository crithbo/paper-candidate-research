# Stage 0 PRIMARY — PATCHYIELD-CALL

## 裁决

`REVISE_ONCE`，只允许关闭一个原子门，且需独立 confirmation 后才生效：
`READY_CALL_BOUNDED_BYPASS_16__PROGRESS_INCREMENTAL_FAIR_POLICY_CERTIFICATE`。

此次不是因缺 H100、模型、容器、live 重放结果或自然收益而拒绝。相反，live
re-execution 取代固定服务时间 replay 的修复是必要且正确的。问题在于当前候选仅给出
“用 progress feature 排序并限制 bypass”的研究意图，没有给出一个非 generic 的在线
动作/状态/保证，因此还不能与现有 LLM application scheduling 和 fair LLM serving
工作区分为 N2 算法贡献。

## 冻结对象与公平边界

对象保持为冻结的 OpenHands/SDK、Qwen3-Coder FP8、vLLM、SWE-bench Verified、单 H100，
在已 admitted、同时 ready 的 session 中选择下一个**完整、非抢占** LLM call。deadline
严格锚定 `arrival_i + tier_i×60s`；live 运行必须保留 batching、prefix reuse、KV
residency/eviction、recompute 和实际 service time。recorded replay 只能是 sensitivity/
debug，不能作为因果主证据。

`READY_CALL_BOUNDED_BYPASS_16` 已给出可测的安全下限，但还缺少两项闭合：(1) 一个
session 的 successive ready calls、batch membership 与 equal-ready ties 如何进入 complete
action set；(2) policy 如何在**不读取 sealed evaluator/held-out result/solution patch**的
条件下同时保证 hard bypass cap 与可比较的 success objective。仅把预测分数传给
vLLM priority queue 仍是 native extension/wrapper。

## 当前 union、碰撞与公平基线

| 比较器 | 当前能力 / 文献能力 | 对本题的后果 |
|---|---|---|
| vLLM current scheduler | FCFS、priority、custom `scheduler_cls`、KV watermark/async surface | 完整 native union；候选不能以“可自定义 priority”当贡献。 |
| VTC (OSDI 2024) | token-cost fairness、理论 service-difference guarantee | 是公平性强基线；bypass=16 不能被当作新的 fairness theory。 |
| DLPM / D²LPM (2025) | prefix-locality 与 fairness | 必须对齐 KV/prefix 维度，不能只比 FCFS/EDF。 |
| Justitia (2026) | vLLM 上的 task-parallel LLM-agent application scheduling 与 fairness/worst-case service | 最近且危险的 direct-method subtractor；其 task/app completion 与候选 agent-call 层极近。 |
| EDF、SRPT/remaining-time、Cascade/SAGA 类与同容量 outcome-agnostic learned scheduler | 同信息的 queue/success scheduling union | 全部需要现场 re-execution；offline outcome oracle 仅可作 ceiling。 |

Justitia 不在本有限核验中被证明为同一**冻结 agent、公开 progress feature、arrival-relative
sealed evaluator success**对象的完全覆盖，因此不作直接 STOP；但它使“用优先级加公平”
没有论文残差。该残差只能是 progress information 在完整同信息行动空间中的、可证明或
可反证的增量，而不是一个服务参数调节。

## 唯一 revision 门

修订不得换模型、SWE-bench split、deadline、H100、non-preemptive call 或在线信息。它需
静态提交一份闭合证书：

1. 完整 ready-call action grammar（session/call/tie/batch/KV state）与全部 native
   vLLM controls 的 mapping；
2. progress feature、预测目标、repository-held-out partition 与不可用 outcome 信息的
   leakage proof/审计；
3. 一个可执行的 bounded-bypass policy：证明任何 legal queue state 都不会超过 16，且
   声明 score 与 deadline success 的单调/competitive/regret/feasibility 保证之一；
4. 至少一个小型同对象 action-divergence witness：FCFS、priority、VTC/DLPM-style 与
   Justitia-like fair policy 均可合法运行，但候选的 constrained action 不是它们的参数
   重命名；
5. 完整 full-cost mapping 与 H100 Stage A 预注册 falsifier。

如果只能交付 priority score、普通 learned ranker、field selector、replay，或无法把
hard cap 与目标信息独立定义，唯一 revision 后应 `STOP`，sentinel 为
`BELOW_Q2_STOP__GENERIC_PRIORITY_OR_EXISTING_FAIR_LLM_APPLICATION_SCHEDULING`。

## 潜力、readiness 与有限 Stage A killer

若该门关闭，N2 可以是 target-native 的 constrained online policy 与 guarantee，形成
条件性 `TIER_B_Q2_VIABLE`；当前则为“有潜力但机制未闭合”，不是 PASS。Q1 需要超出
单一 benchmark 的稳定效果与更强的 collision separation。

readiness 是 `E1_STATIC_PREFLIGHT` 并有外部 H100 resource gate。资源不构成停止理由。
在 Stage A 通过静态 identity/token/determinism gate 后，killer 为：每个 repository-held
out fold × tier × load × seed 均记录全成本；无稳定增量成功、任一 `bypass_i>16`、或
完整成本 Pareto 被 same-information union 支配，即停止。任何 live run 之前，replay
不得作为证据。

## 硬门结论

- same-object / canonical carrier：PASS（只可声称 benchmark，不可声称生产 SLA）。
- current-source reality：PASS；vLLM 有 policy/custom scheduler 与 KV 控制，故它们是
  baseline union，不是 candidate novelty。
- 直接碰撞：`SEARCH_BOUNDED_OPEN`；Justitia 是强 near-direct subtractor。
- 非 generic N2：**未闭合**，故给一次原子 revision。
- full-cost 与有限 H100 killer：PASS，尚未执行。

**下一状态建议：仅送独立 confirmation；不授权 Stage A/B。**
