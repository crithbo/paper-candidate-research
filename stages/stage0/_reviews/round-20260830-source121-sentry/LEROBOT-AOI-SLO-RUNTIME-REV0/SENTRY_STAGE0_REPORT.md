# LEROBOT-AOI-SLO-RUNTIME-REV0 SENTRY confirmation

## 独立结论

- Disposition: `CONFIRM`
- Scientific verdict confirmed: `PASS_RECOMMENDED`
- Operational disposition: `READY`
- Quality tier: `TIER_B_Q2_VIABLE`
- Evidence ceiling: `STATIC_CURRENT_SOURCE_AND_FULLTEXT_UNION__NO_EFFECTIVENESS_RESULT__CANONICAL_ONLY_UNTIL_MEASURED_NATURAL_TRACE`
- Model route: `gpt-5.6-sol/high`（本次用户命令临时覆盖）
- Current-cycle usage reset confirmed: `false`

## Current union and direct subtraction

当前 LeRobot async client 的发送门确为 `queue_size / action_chunk_size <= chunk_size_threshold`；server observation queue 只保留最新 observation；client 对 `timestep <= latest_action` 的返回动作丢弃，并对相同 timestep 的重叠动作聚合。现有 stack 已覆盖 occupancy scheduling、latest-only server admission、stale-timestep legality 与 overlap aggregation，候选不能把这些写成新贡献。

RTC 已吸收 generic no-idle/delay-robust action-chunk continuity；A2C2/FutureRTC 吸收基于最新 observation、policy features或预测 execution-time visual/state 的 stale-context correction；RAPID/ActFovea 吸收动态触发、stale chunk preemption/discard、fresh re-query、short-horizon/hold 与 richer-signal safeguarding；AoI/UoI literature吸收 freshness threshold/index scheduling。

这些来源与冻结 residual 存在 material subtraction，但没有单一来源同时覆盖 pinned LeRobot distributed protocol、timestamp/queue/completed-latency-only information、explicit contributor-age SLO、joint send/admission与相同 full-cost contract，因此 `DIRECT_FATAL=NO`。

## Client-local monotonic provenance age

当前 `TimedObservation.timestamp` 是 client `time.time()`，server 又用自己的 `time.time()` 相减；跨主机时该 one-way latency 只有在时钟同步成立时才有意义。returned `TimedAction.timestamp` 由 observation timestamp 加 action index × `environment_dt` 生成，是 nominal logical action time，不是 server generation timestamp。

候选不得跨主机相减 wall clocks。合法 route 是 client capture 时登记 `(echoed_wall_timestamp, observation_timestep) -> client_monotonic_capture`；returned chunk 的 first action 回显该 pair，client据此恢复 origin。未聚合 action 的 age 为 `monotonic_execute - monotonic_capture(origin)`；聚合 action 的保守 age 是所有非零 contributors age 的最大值，weighted age只能作为 secondary metric。

## No-wire-change legality ceiling

no-wire-change 在静态上有限可行：first returned action携带原 observation timestamp/timestep；重复 timestep 可由 timestamp pair区分。但 current `_aggregate_action_queues` 在生成 aggregated `TimedAction` 时只保留新 action timestamp，并丢失旧 contributor origin，所以必须维护与 action queue严格同构的 client-side provenance sidecar，并随每次 aggregate/trim/reorder同步更新。

任何 pair collision、float echo不一致、lost sidecar、queue/provenance长度或 timestep不同步、未知 contributor、monotonic ordering不可能、或必须新增 wire identifier的情况，都必须在 claim-bearing run 前 fail closed。若无 wire change 无法唯一恢复 origin，则冻结对象不成立，不能以协议修改冒充续跑。

## Natural latency carrier

最低自然 carrier 是实际同机 client/server policy inference timing与公开 LeRobot-compatible task outcome的 joined trace；它能决定 compute-jitter 下的首个机制门，但只支持 canonical ceiling。真实 LAN/robot timing可提高 external-validity ceiling。recorded episodes没有 runtime timing，纯 injected delay没有自然 workload分布，二者不能单独支持部署 claim。

## Strong static grid and RTC fairness

最强同栈 baseline 必须联合调优：`g ∈ {0.0,0.1,...,1.0}`（含官方 default 0.5和推荐 0.5–0.6）、允许的 fps、actions-per-chunk、aggregation function；在独立 validation split选择后冻结到 test。另含 offline latency-adjusted static threshold。候选与 baseline保持 policy/checkpoint/task/seed、offered observation stream、action representation、aggregation semantics、control rate、request/bytes budget、hold/idle/safe-stop accounting一致。

RTC只在不改变 policy family/action semantics且接口可比时作为运行 baseline；否则作为强 literature comparator，不能强行组成万能 union。A2C2/FutureRTC等使用更丰富信息或训练模块，作为 upper alternatives而非同信息 baseline。

## Q2 shape

条件性 Tier-B 形状成立：若工作交付 protocol-level contributor-age semantics、low-information constrained controller、exhaustive legality witness、自然 timing/task trace artifact、matched static grid/RTC comparison与完整 calls/bytes/GPU/queue/discard/idle/safe-stop/task-success ledger，并证明 age在 equal occupancy/matched cost下提供稳定 decision value，则构成聚焦 systems/robot-runtime 论文。

若算法退化为 scalar threshold retuning或generic AoI rule，必须 STOP。当前 residual窄于 RTC/LeRobot，且无实现/结果，因此不具 Q1 ceiling。

## First Stage A killer

第一步穷举短 trace：queue length ≤4、两个 overlapping chunks、duplicate observation timesteps、reordered returns、全部四种 aggregation functions、empty-queue/must-go与 wall-clock jumps。将 sidecar age/admission与完整 event-history reference oracle比较。

通过 legality 后，才可 replay measured same-host traces，并在 equal occupancy和matched request cost下比较完整 static grid。任一合法 trace隐藏 age-budget violation、origin ambiguity、协议变化、unaccounted hold/safe-stop，或 measured traces中 age相对 occupancy无增量 decision/value，立即杀死方向。正结果上限仅为 preliminary non-falsification。

## 限制与完整性

本次未读取 Source122 queue，未实现候选、下载 trace、build/experiment或启动 Stage A/B；未写共享状态。所有决定性事实来自 LeRobot official source/docs、primary papers与冻结 PRIMARY 输入；AI-assisted tools用于检索与综合。
