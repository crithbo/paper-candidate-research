# Source40 selective-depth pilot — user approval receipt

- `approval_id`: `USER_APPROVED_SOURCE40_CARRIER_COMMITMENT_SELECTIVE_DEPTH_CLOSURE_V1_20260815`
- `approval_date`: `2026-08-15`
- `proposal_id`: `SOURCE40_CARRIER_COMMITMENT_AND_SELECTIVE_DEPTH_CLOSURE_V1`
- `decision`: `APPROVED_FOR_MAINLINE_IMPLEMENTATION_AT_NEXT_SAFE_ASSIGNMENT_BOUNDARY`
- `shared_file_writer`: `MAINLINE_ONLY`
- `applies_to`: `SOURCE40_ONE_COMPLETE_SIX_LANE_CYCLE_ONLY`

## Approved mechanics

1. 六路 breadth 继续使用 `gpt-5.6-terra / medium`。
2. 全周期最多选择 2 个在 targeted evidence outcome 之前冻结、与结果无关的 closure packet，允许升级到 `gpt-5.6-sol / high`。
3. 强模型只判断 exact carrier、原子动作、estimand、最明显 generic-solver/current-union 反方，以及有限 oracle/witness/falsifier 路线。
4. 强模型不得改写 RQ、结果感知补位、宣称 novelty/Q2、决定 clean brief/科学状态或代替独立 Stage 0。
5. 已形成 RQ 但缺具体公开材料时，必须进入 `SOURCE_CLOSURE_QUEUE`；不得仅因 Question Card 尚未完整而停止检索。
6. 不增加 lane、seed/raw/closure 容量、检索/资源预算、提案配额或下游门槛；保持无 outcome-aware backfill。
7. 保持 same-object、direct-fatal、current-union、公平当前强基线、自然或 canonical carrier、full-cost、最低 falsifier、可复现性、Q2、claim ceiling 与 STOP 不复活门。

## Approved acceptance and stop conditions

- pre-RQ 淘汰不得再引用只应在 raw/Question Card 阶段闭合的字段；
- 已形成 RQ 的具体公开资料缺口进入 closure queue 的覆盖率必须为 100%；
- 记录两个强模型 packet 是否至少一个完成实质闭合或提前阻止一个可预见的弱 raw；
- 用实际 clean brief 及其独立 Stage 0 反馈评估 downstream precision，不设最低产出配额；
- 若两个强模型 packet 都仅复述输入、引入对象/RQ 漂移或未产生任何实质闭合，则该升级在一轮后停止，不扩大到六路。

## Boundary

本授权允许主线在 Source39 完成后的 Source40 安全边界冻结并实施上述 assignment-local 指令。它不授权回写 Source38/39，不授权共享门槛放松、V9、网络安全题、额外 lane/预算/容量、Stage/实验、停止题复活或本规则审计会话直接修改共享控制文件。
