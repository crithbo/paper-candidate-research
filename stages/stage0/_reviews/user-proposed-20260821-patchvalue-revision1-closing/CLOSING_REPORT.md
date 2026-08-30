# PATCHVALUE-COUNTERFACTUAL-REV0 — Independent Revision1 Closing

## 中文结论

- 独立裁决：`DISAGREE_STOP__FAILURE_SENTINEL_TRIGGERED`。
- 对 revision1 owner 建议的判断：不同意 `REVISION_GATE_CLOSED__PASS_RECOMMENDED`。
- 质量档：`BELOW_Q2_STOP`。
- 触发的冻结哨兵：`STOP__CAUSAL_REPLAY_RELABEL_OR_NONIDENTIFIED_BRANCH_EFFECT`。
- 科学 revision：`1/1` 已由 owner 消耗；本 closing 不允许也不执行第二次 revision。
- 证据上限：`E1_STATIC_CERTIFICATE_ONLY__FORMAL_NEGATIVE__NO_CLAIM_BEARING_RESULT`。
- Stage A/B：`false / false`；本报告不授权自动阶段转换。
- 置信度：`0.91`。

这不是因为缺 agent、rollout、hidden evaluator、模型、自然正结果或实验。revision1 的静态证书本身在冻结 exact object 和唯一非重标保证上失败：它把“恰好继续 `h` 个完整调用”改成了“授予最多 `h` 个槽位、native terminal 可提前结束”的 intention-to-treat；同时把 Causal Agent Replay（CAR）人为限制为历史 action attribution，而实际新增的 formal property 只是普通 difference-in-means 加 Hoeffding/Bonferroni 下界，未形成 target-specific full-cost Pareto frontier 证书。

## Assignment、独立性与完整性

- Assignment：`STAGE0-C2R1-20260822-PATCHVALUE-COUNTERFACTUAL-REVISION1-CLOSING`。
- Lane：`STAGE0-CONFIRMATION-SENTRY-D`。
- 本 lane 未参与 revision1 构造；只审阅 assignment 列明的 revision1、prior confirmation 与 PRIMARY 最小材料。
- 冻结 assignment SHA-256 与合同一致。
- Revision1 handoff/manifest 与合同一致，canonical entries `8/8 PASS`；confirmation `4/4 PASS`；PRIMARY `11/11 PASS`。Manifest 的两行 `#` 元数据不计 entry，也不是错误。
- 没有网络、下载、新资源、第二次 revision、agent、rollout、evaluator、模型、container、build、benchmark 或 experiment。
- 未读取或复活 `PATCHYIELD-CALL`，也未修改任何上游或共享控制文件。

## Re-review traceability matrix

| 冻结 conjunct | Owner 主张 | 独立 closing | 结论依据 |
|---|---|---|---|
| `C1_CURRENT_NATIVE_FORK_CATALOG` | PASS | `PARTIALLY_ADDRESSED` | 正确承认 native conversation fork 是 baseline 且 local fork 共享 workspace；但只列四个 surface，没有冻结 pin/current 的完整 symbol/version map，也没有对 remote/server-side fork、branch-from-event/navigation/persistence 等 current same-object surfaces 给出明确 inclusion/exclusion。该缺口单独不足科学 STOP，但不能支持“complete catalog”。 |
| `C2_WHOLE_MUTABLE_ENVIRONMENT_SUTVA` | PASS (specification) | `NOT_CLOSED` | 列出了字段类别，却没有可执行 schema 的类型/必填约束、canonical serialization、hash 算法、reset 命令与顺序、alias discovery/closure 规则。`public_tool_state_hash`、`process_reset_transcript_hash` 等是字段名，不是可执行 checker；“未枚举的 mutable parent”仍可穿透。 |
| `C3_TREATMENT_AND_EVALUATOR_FIREWALL` | PASS (specification) | `FAIL__FATAL` | frozen object 是 exact `h` complete calls；证书允许 `terminal-before-h` 并把它保留为 arm outcome，因此实际 treatment 是 grant/cap `h`，不是 realized dose `h`。保留 early terminal 能避免删失，却不能识别 exact-dose effect。 |
| `C4_CAR_RESIDUAL_AND_GUARANTEE` | PASS (narrow claim) | `FAIL__FATAL` | CAR 不只处理“历史 blame”；prior confirmation 已核到它可在完整 state 上做 action/context/policy intervention并向前 replay。Stop-vs-continue 是该框架的 current policy/action 特例。Revision 的新增 estimator 是普通样本均值，bound 是 textbook Hoeffding/Bonferroni；没有 full-cost 或 comparator-dominance 的 simultaneous bound，故“certified frontier”未成立。 |
| `C5_FINITE_FIDELITY_AND_FULL_COST_KILLER` | PASS (preclaim specification) | `PARTIALLY_ADDRESSED` | natural route、comparator 名单和成本字段是有限 checklist；但 tiny oracle 仍只是 named inputs/outputs，没有 executable manifest/checker contract，且 C4 没有把随机 full-cost 向量纳入 frontier guarantee。 |

Priority-1 的 `C3` 与 `C4` 均未被 fully addressed；按照独立 re-review 边界，不能接受 owner 的 PASS recommendation。

## 决定性形式攻击 1：exact-h treatment 未被识别

冻结对象要求

`A_h = do(execute exactly h future native complete LLM calls)`。

Revision1 实际定义

`A_h = grant h call slots; if native terminal occurs at k<h, retain TERMINAL_BEFORE_H`。

令 `N(A_h)` 为实际完成调用数。只要 native terminal 有正概率，便存在 `P[N(A_h)<h] > 0`。因此证书估计的是

`E[H | assigned cap h] - E[H | assigned stop]`，

而不是

`E[H | do(N=h)] - E[H | do(N=0)]`。

把 early terminal 作为 outcome 是一个诚实的 ITT 设计，但它不能把 assignment effect 变回 exact-dose effect。可选逃逸均改变冻结合同：

1. terminal 后强迫继续调用会违反 native terminal semantics；
2. 只保留能完成 `h` 次的 branch 会按 post-treatment compliance 选择，产生 selection/principal-stratum 问题；
3. 把 treatment 改名为“最多 `h` 次/授予 `h` 个槽位”会改变 frozen exact estimand。

Revision1 没有给出 principal-stratum、instrumental-variable 或其他 exact-dose identification 命题，也没有冻结合法的 terminal-free state family。因此 C3 对原 exact object 不成立，命中 `NONIDENTIFIED_BRANCH_EFFECT`。

## 决定性形式攻击 2：CAR residual 与 frontier 退化

### CAR facet 不是有效分离

Revision matrix 把 CAR 写成“历史 action/observation/context/policy 的责任归因”，再把 PatchValue 写成“prefix 之后的 future allocation”。该二分过窄。Prior confirmation 的 decisive CAR reading 已确认：CAR 从完整 agent state 出发，允许 `do_action`、`do_context`、`do_policy` 等 intervention，并重执行未来 outcome distribution。把 intervention point 放在当前 completed-call boundary，并令 policy 为 stop 或 continue，是其 replay/action-policy family 的直接实例。

所以“未来”与“历史”的命名差异不能形成 N1/N2。Whole-environment isolation 与 offline evaluator firewall 是 coding-agent replay 的必要 fidelity infrastructure，但本身不把普通 CAR target trial 变成新算法或新保证。

### LCB 是普通 Monte Carlo bound，不是 target-specific certified frontier

Revision 定义

`Z_{i,r,h}=H(F_h(s_i,omega_r))-H(F_0(s_i))`，`D_{i,h}=mean_r Z_{i,r,h}`，

并给出

`L_{i,h}=D_{i,h}-sqrt(2 ln(2 n |H| / alpha)/R)`。

若 `Z∈[-1,1]`、seeds 独立且 family 在分析前固定，这个式子可作为保守的普通 simultaneous lower bound；其数学有效性不等于非平凡贡献。证书仍有四个机械缺口：

- `|H|` 没有定义为 horizon set，且符号 `H` 同时已用于 evaluator；registered horizon family 未在 schema 中枚举。
- bound 只覆盖 outcome difference，不覆盖随机的 token/GPU/tool/wall/clone/evaluator cost，也不覆盖多 comparator 的 cost-adjusted dominance。
- “after comparing matched all-arm cost”没有定义 Pareto order、cost estimator、cost confidence region 或 simultaneous dominance rule。
- bound 对任意 bounded Monte Carlo difference 都成立；complete-call grammar、OpenHands fork 和 coding state 只出现在数据标签中，没有产生 target-specific recurrence、identification theorem、error improvement 或 complexity property。

因此所谓 `simultaneous_lower_confidence_frontier_with_full_branch_cost` 实际只有 outcome LCB 加一张成本字段表。它恰好落入 gate 明令排除的 `CAR_relabel / generic_Monte_Carlo`，命中失败哨兵的另一分支。

## C2/C5 为什么不是本裁决的资源或 readiness 借口

Stage 0 不要求 checker 已实现或 branch 已运行；但 assignment 明确要求的是 executable static specification，而非开放式字段清单。Revision1 没有给出 `branch_manifest.yaml` 的实际 schema、字段类型、canonicalization/hash/reset/alias semantics 或确定性 validation procedure，只有期望字符串。这使 C2/C5 不能计作 closed。

即使把这些工程性静态细节全部视为未来 Stage A fidelity work，C3 的 exact-treatment mismatch 与 C4 的 CAR/generic-bound failure仍然保留。因此本结论不是把 Stage A readiness 前置，也不是因缺实现而 STOP。

## Current union 与 full-cost 边界

- Native `Conversation.fork()` 被正确降为 existing baseline；这一点不构成贡献。
- Shared workspace 说明 current native fork 尚未自动提供 whole-environment isolation，但“需要更严格的 replay harness”是 measurement fidelity requirement，不是独立 N2。
- Comparator 名单覆盖 fixed stop/continue、CAR adapter、restart、router、rollout reuse、value/process reward 和 random/uniform allocation，方向正确。
- Full-cost 字段覆盖面方向正确，但 revision 没有一个能够对 outcome 与这些成本共同给出 certified frontier 的静态保证。
- `SEARCH_BOUNDED_OPEN` 保持；本 closing 无网络且不从未检出推断 absence。STOP 依据是冻结证书内部的 treatment/guarantee 失败，而不是文献传输或 current-source 缺口。

## 为什么不是 `INCONCLUSIVE_POLICY_HOLD`

若只有 C1 catalog 不全或 C2 checker 细节不足，revision 1/1 已消耗后应倾向 `INCONCLUSIVE_POLICY_HOLD`，因为那只是尚不能 PASS 且没有科学反证。但本包还提供了可直接复算的形式负证据：

1. registered treatment 与 frozen exact-h treatment 不同；
2. declared nontrivial frontier 实际是 CAR-compatible target trial 加 generic Hoeffding/Bonferroni outcome bound，且没有 full-cost Pareto certificate。

这两项正对应预登记 failure sentinel，不需要第二次 revision 或 empirical result 才成立。因此 HOLD 不适用。

## 最终建议

主线应机械登记本 closing 建议为 `DISAGREE_STOP__FAILURE_SENTINEL_TRIGGERED / BELOW_Q2_STOP`。只有主线可以修改 registry；本 lane 不做状态转换、不自动归档、不启动 Stage A/B。不得把该结论回写或用于复活 `PATCHYIELD-CALL`。

