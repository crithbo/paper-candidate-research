# RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP 用户审阅包

## 中文摘要

- 当前结论：独立 gate 裁决 `STOP`，质量标签 `BELOW_Q2_STOP`。
- 最重要证据：4 个结果无关保留的自然函数中，candidate best 的 text/frame 坐标全部被当前 LLVM default/union 可执行点覆盖；独立重算 useful residual=`0/4`，text/frame p50/p90 均为 `0 B`，candidate 另增加 CPU/wall 规划成本。
- 最大边界：这只停止冻结 `WL_ZCMP_PARETO_DP` 在固定 LLVM/RV32/4-function contract 下的方向，不外推到全部 Zcmp、全部 CFG、其他 corpus 或 runtime 不可能性。
- 建议用户选择：接受本窄机制 STOP；无需提供资源或批准 Stage B。
- 预计用户投入：仅在需要时查阅本包，无执行动作。

- Stage: `Stage A independent gate`
- Lane id: `STAGEA-GATE-REVIEW-LANE-1`
- Assignment id: `STAGEA-G1-20260814-RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP-RESUME1-CLOSING-V8.7`
- Decision: `STOP`
- Quality tier: `BELOW_Q2_STOP`
- Confidence: `0.94`
- Evidence ceiling: `BOUNDED_STAGEA_SCIENTIFIC_NEGATIVE__FROZEN_MECHANISM_AND_NATURAL_4_FUNCTION_DENOMINATOR_ONLY`
- Claim-bearing observation obtained: `yes`
- Scientific revision consumed: `no`
- Pending user Stage B review: `no`
- Stage B authorized: `false`
- Stage B user approval id: `null`

## What is established

Preclaim fidelity gate 在自然结果前关闭。23 个 canonical Embench modules、273 个函数经预登记结构规则筛出 5 个对象；`freeecc` 在任何 candidate-vs-union outcome 前因 exact replay 不再有跨调用 scalar virtual register 而排除，最终 4 个函数不是按收益选择。

Candidate `11/11`、current union `72/72` native pipelines 成功。四个 candidate best 坐标分别为 `28/16`、`38/16`、`28/16`、`16/16 B`，每个均被至少 17 个 union arms（包括 default）覆盖。独立 nearest-rank 重算得到 text/frame p50/p90 全零，useful residual=`0/4=0%<10%`，CPU 与 wall 差值均为正。

## What is not established

没有证明全部 candidate assembly identity 都已存在于 union：`8/11` assembly hashes 不同；其中一个未覆盖的 `38/32 B` 坐标被 `28/16 B` union 点严格支配。没有目标 runtime 数据，也没有完成一般 CFG、其他宽度、其他 LLVM 版本或其他自然 corpus 的研究。因此 STOP 不得写成一般不可能性结论。

## Exact object and narrow claim boundary

边界是 LLVM commit `ba5bccfe01368f76e74d6ff4c35f1330e155b4ba`、RV32IMAC+Zcmp、ILP32、O2、one-call scalar、`w<=4`、冻结 Embench exact replay denominator、18-arm current union 和预登记 primary/full-cost rule。Candidate 与 comparator 共享同一输入与 stock verifier/assembler/linker/readers。

## Fair baseline and full-cost status

18 个 arm 都可单独执行；决定性 best-coordinate coverage 在 4/4 上由 default arm 本身即可达到。Full-cost 包含 planner、native continuation、CPU/wall、peak memory、temporary artifacts、verification 与 fallback；runtime 不可用且未估算。冻结成功规则要求 strict text/frame/spill primary benefit，其他成本维度或未知 runtime 不能替代该门。

## Reproducibility and integrity

Owner manifest 独立复算 `54/54 PASS`。所有 assignment 指定 claim-critical hashes 匹配。审查只做现有 artifacts 的静态重算；没有改 owner 包、运行新实验、修改共享控制或访问其他候选证据。

## Recommended next state

- `STOP`
- Lane: `IDLE_REUSABLE_AWAITING_MAINLINE`
- Stage B: `false`
- `stageb_user_approval_id=null`

本包只用于用户和主线查阅，不授权 Stage B、正式论文项目或共享状态变更。
