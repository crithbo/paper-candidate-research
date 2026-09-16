# Rule Change Proposal：AFFIRMATIVE_CLIFF_PARTIAL_PRIMITIVE_RESIDUAL_V5

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260814-SOURCE19-20-CONSECUTIVE-ZERO-YIELD-R23`
- `proposal_id`: `AFFIRMATIVE_CLIFF_PARTIAL_PRIMITIVE_RESIDUAL_V5`
- `decision_label`: `PATCH_RECOMMENDED__ASSIGNMENT_LOCAL_NEXT_BOUNDARY`
- `user_policy_approval_required`: `false`（仅本次有界试点）
- `backtest_required`: `false`（不改变 canonical 判断；永久共享化前需要一轮 prospective 反馈）

## Problem statement

Source19/20 合计报告 60 个 fresh raw，只有 1 个 D1、1 个 deep、0 个 clean brief。至少 24 条以 `NOT_ADMITTED_UNFROZEN` 结束，却没有一次有界 source-repair；至少 22/74 个 locator 又是重复、活动、历史或包含项，部分仍被计入 raw。Source20 的近期论文先行策略至少产生 8 条 direct-paper/paper-owned constructor 吸收。增加 raw、deep 或 lane 数不能修复这个漏斗。

## Current rule and execution gap

- 权威位置：`rules/ROLE_DISCOVERY.md` 的“筛查日志状态与漏斗计数”“Discovery 保真计划与 Stage A 保真执行门”“输出与结论”。
- 当前权威语义：unfrozen 不是 STOP；Discovery 不要求实现/结果；action gap 可以带有限闭合计划送 Stage 0；raw/repeat/unique/deep/brief 必须分开。
- 执行缺口：Source19/20 assignment 没有 `C0 source-closure`，部分 lane 在 D1 前要求两套完整计划；贡献类型和 paper-owned constructor 又被过早二元化；漏斗单位混计。

## Proposed minimum delta

| 文件 | 字段 | 当前 assignment 语义 | V5 单周期语义 |
|---|---|---|---|
| 下一轮 `control/CONTROL.yaml` | profile/order | recent limitation 或广泛问题锚点后立即要求完整 D1 | source affirmative cliff → partial primitive → C0 closure → D1 → paper/current collision → deep |
| 同上 | capacity | locator≤48、raw≤36、deep≤12 | locator≤48、fresh raw≤24、C0≤12、deep≤12；不增加总 lane |
| 同上 | funnel units | 各 lane 对 raw/excluded 口径不一致 | 强制分开 locator、excluded-before-raw、fresh raw、C0、D1、deep、brief |
| 六路 assignment | C0 budget | 无 | 每路≤2；每个 family/facet 一次；每个 C0≤5 个决定性 artifact 角色 |
| 六路 assignment | deep | `1/2/2/3/2/2` 或对称配置 | `S1/S2/S3/S4/S5/S6=2/2/1/3/2/2`，总计12 |
| S3/S4 assignment | contribution routing | natural carrier/benchmark 类型容易固定过早 | raw 前允许一次类型重路由；按最终类型合同审查，不降低自然/代表性门 |
| S1/S2/S5/S6 assignment | paper role | 近期论文常作为生成起点 | current-source residual 先行；近期论文主要作最强 subtractor |

不直接编辑任何共享文件。若单周期和 Stage 0 反馈支持永久化，主线再向用户提交 `ROLE_DISCOVERY.md` 的澄清 patch；本提案不预先宣告其生效。

## Exact V5 control contract

1. `DISCOVERY_CLAIM_PACK_MODE=OFF`，canonical v8.7 不变。
2. 六 lane 同时复用；每 lane `locator_ceiling=8`、`fresh_raw_ceiling=4`、`C0_source_closure_ceiling=2`。
3. 全局 `locator≤48`、`fresh_raw≤24`、`C0≤12`、`deep≤12`。
4. deep ceilings：`S1=2, S2=2, S3=1, S4=3, S5=2, S6=2`。
5. C0 必须在 closure outcome 前冻结；排序只看肯定性问题证据、源码局部原语、公开 carrier/oracle、缺失 facet 数和 locator 顺序。
6. C0 必须已有 exact object/guarantee、affirmative cliff、source-located partial primitive、provisional non-generic residual，且无 direct collision、changed-object、selector 或 generic-wrapper 硬失败；最多缺 union map、carrier/oracle pin、small witness 三项中的一项。
7. 每个 C0 最多一次 closure、最多五个决定性 artifact 角色；失败后不能 outcome-aware backfill。
8. D1 要求 source-closed union、独立 subtractor、natural carrier、stock oracle、action skeleton 和 small witness；不要求实现、结果或两套完整程序。
9. brief 仍必须满足完整原子动作、same-object、current-source、强公平 baseline、自然证据、full-cost、复现路径、falsifier 和 fidelity plan。
10. 零 brief 合法；不设任何提案配额。

## Safety invariants

- Q2 minimum preserved: 是
- Q1 priority preserved: 是
- Same-object preserved: 是
- Latest/current collision preserved: 是
- Fair current strong baseline preserved: 是
- Natural input/evidence preserved: 是；类型重路由不会把 benchmark 当自然 workload
- Full-cost preserved: 是
- Reproducibility preserved: 是
- Claim ceiling preserved: 是
- STOP non-revival preserved: 是
- User StageB approval preserved: 是
- Network-security exclusion preserved: 是
- V9 remains OFF: 是

## State and compatibility migration

- Existing states affected: 无
- Existing assignments affected: 无；Source19/20 保持冻结完成
- Existing briefs/candidates affected: 无；Verilator/QEMU 继续独立 Stage 0，不作为 V5 PASS 证据
- Template compatibility: 现有 `TOPIC_BRIEF.md` 可继续使用
- One-time migration required: 无
- Rollback: 下一安全边界不再冻结 V5；保留所有 ledger、dormancy、结构负证据和状态

## Validation plan

- Historical/time-slice cases: 不做；这不是 V9 或 admission-method backtest
- Prospective unit: 一个完整六路 assignment
- Negative controls: paper-owned exact constructor、current selector/config、generic wrapper/solver、changed-object 和 known repeat 必须继续在 D1 前失败
- Process acceptance: 七级漏斗对账；fresh raw 中已知 repeat/active/hold/STOP/dormant=0；100% deep 有 D1；C0 一次性且无结果感知补位
- Scientific observation: 记录 C0→D1、D1→brief 和每个 clean brief 的独立 Stage 0 repair vector；不规定最低 brief 数
- Forbidden regressions: 不能把 C0 当候选状态，不能降低 hard gate，不能扩大资源、lane、V9 或题源范围到网络安全
- Stop condition: 单周期结束即停止 V5 自动续跑；零 brief 或账目失真时重新审计，不扩大容量

## Decision request

主线可依据现有 `USER_ADAPTIVE_DISCOVERY_CONTINUE_UNTIL_FIVE_STAGEA_PASS_20260814`，在下一安全边界创建一次 V5 assignment-local control 和六路 assignment，无需向用户重复请求 generic approval。

现阶段仍禁止：修改共享规则/模板、启用 V9、增加 lane/容量、恢复网络安全题、启动任何 Stage/实验/下载/自动化。若未来要把 V5 永久写入共享文件，必须依据 prospective 结果另交用户批准。

