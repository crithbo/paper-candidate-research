# Rule Change Proposal：AFFIRMATIVE_CLIFF_WITNESS_LOCAL_ACTION_SURVIVAL_V6

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260814-SOURCE21-MACHINEOUTLINER-FEEDBACK-R24`
- `proposal_id`: `AFFIRMATIVE_CLIFF_WITNESS_LOCAL_ACTION_SURVIVAL_V6`
- `decision_label`: `PATCH_RECOMMENDED__ASSIGNMENT_LOCAL_NEXT_BOUNDARY`
- `user_policy_approval_required`: `false`（仅一个 assignment-local 周期）
- `backtest_required`: `false`

## Problem statement

V5 的 C0 从 Source21 恢复了一个 Machine Outliner clean brief，但 PRIMARY 与独立 confirmation 均判 `REVISE_ONCE`。Discovery 没有完整扣除 CGData 已有 global discovery，也没有确认 small witness 的候选动作在 early local overlap pre-pruning 后是否仍进入 later selector。因此“selection-only”原子动作可能建立在被提前缩小的 action set 上。

## Current rule and gap

- `rules/ROLE_DISCOVERY.md` 已要求 current upstream reality check、atomic action skeleton 和 current union；硬规则方向正确。
- V5 assignment 将 D1 的 action skeleton 定义为结果前静态字段，但没有机械要求 witness 沿候选生成→前序剪枝→selector input 存活。
- 最小修复是 assignment-local witness trace，不是把 Stage 0 的完整 action catalogue 前移。

## Proposed minimum delta

| 文件 | 字段 | V5 | V6 |
|---|---|---|---|
| 下一轮 `control/CONTROL.yaml` | profile | `AFFIRMATIVE_CLIFF_PARTIAL_PRIMITIVE_RESIDUAL_V5` | `AFFIRMATIVE_CLIFF_WITNESS_LOCAL_ACTION_SURVIVAL_V6` |
| 同上 | D1 | atomic action skeleton | atomic action skeleton + witness-local preselection survival |
| 同上 | raw/C0 eligibility | 文字要求 identity filter | 机械要求 exact project/version/source locus；excluded 不得消费 C0 |
| 同上 | capacity | locator48/raw24/C0 12/deep12 | 完全不变 |
| 六路 assignment | survival scope | 无 | 仅即将进入 D1 的 C0；一个 witness、一个 claimed mode、四节点、复用现有 artifact budget |
| S3/S4 assignment | type adaptation | carrier/measurement route | 使用 observation-survival，不机械套用 compiler enumeration |

## Exact witness-local contract

每个即将进入 D1 的 selection/optimization 型 C0 必须记录：

1. `claimed_pipeline_mode`；
2. `action_origin_locus`；
3. `preselection_transform_chain`，至少覆盖 legality、canonicalization、dedup/merge、overlap/conflict prune 中实际存在者；
4. `selector_input_locus`；
5. `witness_survival_status`；
6. `claim_alignment_after_trace`。

状态与动作：

- `SURVIVES_TO_SELECTOR`：可保持 selection-only；
- `PRUNED_BUT_SAME_OBJECT_RECOVERABLE`：在 brief 前明确改为 enumeration/retention + selection，重做 generic/current/full-cost 检查；
- `PRUNED_BY_LEGALITY_OR_OBJECT_CHANGE`：`STRUCTURAL_DROP`；
- `UNKNOWN_UNFROZEN`：`NOT_ADMITTED_UNFROZEN`，不得 brief。

S3/S4 将 origin/transform/selector 对应为 observation source、filter/aggregation/normalization、estimand input，保证测量信号没有在处理链中改变对象或含义。

## Capacity and lane plan

- 六 lane，不增加并行数。
- 每路 locator≤8、fresh raw≤4、C0≤2。
- 全局 locator≤48、fresh raw≤24、C0≤12、deep≤12。
- deep ceilings：`S1=2, S2=2, S3=1, S4=3, S5=2, S6=2`。
- survival trace 不增加 artifact 数；每个 C0 的五角色 ceiling 不变。
- 未用容量失效；不得结果感知补位。

## Discovery/Stage0 boundary

Discovery 的 survival trace 只对一个 witness 和一个明确 mode 作 source-level 可达性检查。以下仍全部属于 Stage 0：

- 全 target/backend/mode/flag action catalogue；
- 完整 current/prior collision；
- recurrence、FPT/certificate、degeneration map；
- Q1/Q2 与 generic-kernel 最终裁决；
- 是否授权 revision/Stage A。

Discovery 不执行源码、构建、实验、benchmark 或实现。

## Safety invariants

- Q2 minimum preserved: 是
- Q1 priority preserved: 是
- Same-object preserved: 是
- Latest/current collision preserved: 是
- Fair current strong baseline preserved: 是
- Natural input/evidence preserved: 是
- Full-cost preserved: 是
- Reproducibility preserved: 是
- Claim ceiling preserved: 是
- STOP non-revival preserved: 是
- User StageB approval preserved: 是
- Network-security exclusion preserved: 是
- V9 remains OFF: 是

## Validation plan

- Historical backtest: 无
- Prospective unit: 一个完整六路 assignment
- Mechanical checks: 漏斗对账、exact raw identity、excluded-C0=0、每个 D1 有 survival trace、状态与 claim 对齐、无 backfill
- Negative controls: early-pruned illegal action、paper-owned constructor、selector/config、generic wrapper、changed object 和 current direct absorption仍不得 brief
- Feedback measure: 若产生 brief，独立 Stage 0 是否仍发现由 preselection survival 遗漏导致的 first-party omission/action ambiguity
- No positive quota: clean brief 可为 0
- Stop: 单周期后不自动续跑；成本失控、trace 伪装 complete catalogue 或账目失真即回滚

## Decision request

主线可依据既有持续授权，在下一安全边界生成一个 V6 control 和六路 assignment，无需重复请求用户 generic approval。

仍禁止修改共享文件、增加 lane/容量、启用 V9、恢复网络安全题、联系 Discovery、启动任何 Stage/实验/下载/自动化。永久共享规则修改必须另行提交用户批准。

