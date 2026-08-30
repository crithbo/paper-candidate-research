# PATCHYIELD-CALL — independent Stage 0 revision-1 closing

## 裁决

`STOP__REVISION_GATE_NOT_CLOSED__BELOW_Q2_GENERIC_OR_INFEASIBLE_FAIRNESS_CONTRACT`。

唯一 revision 已实际消耗，并且所需的 all-legal-state guarantee 在冻结对象中不可行。
这不是缺 H100、实现、live run 或性能结果的结论；它由冻结的 complete-call、batch
capacity 与 bypass 定义直接导出。因此不能送入 Stage A，也不能再给同 ID 的第二次 revision。

## 独立性与输入完整性

我没有参与 revision-1 的构造；曾参与该题 revision 前 PRIMARY，故仅将其视为冻结输入，
未继承其 `REVISE_ONCE` 裁决。closing 重新从合同和固定 action grammar 推导反例，revision
owner 的 disposition 不作为证据。冻结输入 handoff/manifest 的给定 SHA 均匹配；没有读取
QREFINE 或 QNN，也没有网络、脚本、构建、模拟、H100、vLLM、agent 或 benchmark 执行。

## Same-object counting proof

令 `Q` 为一个 scheduler epoch 内 25 个**不同 session**的 admitted、simultaneously-ready、
complete、nonpreemptive LLM call。该状态不使用 sealed result、future tool output、admission
变更、routing、preemption 或任何额外动作。冻结 action grammar 没有 ready-set cardinality
上限；唯一相邻容量条件是每个 dispatch batch 至多 `B=8`。

任何合法 policy（包括 progress-aware policy、reservation、FCFS、priority、VTC/DLPM/
Justitia-style ordering 或 custom `scheduler_cls`）都必须将 25 个 call 分入至少四个非空
batch。前三个 batch 最多容纳 24 个 call；因所有 call 属于不同 session 且均在 epoch 开始
ready，第四 batch 中任一 call 前已有 24 个 other-session call 被 dispatch。按冻结定义其
bypass 为 24，而硬 cap 为 16：`24 > 16`。

batch 内 simultaneity 不改变下界：前三批各批内的 call 互不先后，但第四批仍在三个完整
batch 之后。选择较小 batch、改变 tie、保留 KV、添加 progress state 或预留 slot 都只会
改变哪一个 call 最后，不能把 25 个完整 call 放进前三批。

## 为什么没有合法修复

要规避反例至少需要：限制 ready/admitted queue、改变 admission/rejection、提高 batch
capacity、改变 bypass 指标、允许 pause/preemption/routing，或只对 active subset 施加公平。
这些都是合同明确禁止的 object/action/guarantee 改动。把 score/aging 接到 vLLM priority
或 custom scheduler 既不能满足全状态 cap，也退化为 generic/current fair scheduling。故
N2 非 generic residual 不存在。

## Comparator / claim ceiling

vLLM FCFS/priority/custom scheduler 是 native substrate；VTC、DLPM/D²LPM、Justitia、
SAGA、SMetric 与 ThunderAgent 是强 subtractor。它们不需构成八谓词 direct fatal：本题自身
不可满足的保证先决条件已使 comparator-separation 主张无从成立。

证据 ceiling 仅为 `STATIC_CONTRACT_FEASIBILITY`：不主张 live fairness、deadline success、
progress prediction value、SWE-bench agent capability 或生产 SLA。有限 H100 Stage A route
也不可被启动，因为首个静态 falsifier 已对全行动空间失败。

## Required closing gate table

| 关闭检查 | 独立结果 |
|---|---|
| 25 ready calls 在冻结 grammar 下合法 | PASS：arbitrary finite admitted ready set，未冻结 queue bound。 |
| `B=8` 且 action 为 complete nonpreemptive calls | PASS：合同明确。 |
| all-state `bypass<=16` | FAIL：25-call state forces one bypass=24。 |
| native/progress/tie/reservation 能修复 | FAIL：只改变 batch assignment，不能降低下界。 |
| non-generic progress action/guarantee 存活 | FAIL：feasibility prerequisite 已不成立。 |
| resource/result 缺失是否影响裁决 | 不适用；未作为停止理由。 |

## 下一步

主线应将本 closing 的 STOP 建议送未参与此 closing 的 confirmation sentry，再决定正式状态。
不得自行启动 Stage A/B 或另造 revision。
