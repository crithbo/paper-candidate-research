# R66 审计输入快照

- `audit_id`: `RULE-AUDIT-20260815-SOURCE81-82-ZERO-BRIEF-R66`
- 冻结合同：`stages/rule-audit/_assignments/RULE_AUDIT_SOURCE81_82_ZERO_BRIEF_R66.yaml`
- 合同 SHA-256：`6A8316EDD7C15ECBCFB8CA84A109375DD37A80F14042F64EAB906CFCA9DA9B15`
- 范围：仅 Source81、Source82 的 canonical handoff、queue telemetry 与当前共享规则。
- 严格排除：Source83；未读取、联系、等待、暂停或回写它。

## 规范分母

| 周期 | evidence-qualified raw | CLEAN_STAGE0_BRIEF |
|---|---:|---:|
| Source81 | 1 | 0 |
| Source82 | 0 | 0 |

Source81 的唯一 raw 是 `RISCV_GP_WINDOW_DATA_GROUP_LAYOUT...`，状态为 `NOT_ADMITTED_UNFROZEN`，不是 Stage 0 brief 或科学负结论。`S81-CQ01` 与 `S81-CQ02` 均为 `PENDING_UNEXECUTED`、`attempt_count=0`；它们不构成 Source82 证据，也没有被执行。

## Source82 最小事实

- S1 OpenMP detachable task：候选事件时序动作会改写 task completion 语义；剩余动作是通用 task-lifetime 管理。
- S2 ELF RELR：地址重排与 bitmap 连续性只留下通用 packing 内核。
- S3、S4：没有 exact anchor。
- S5 Zig build cache：仍是 locator/RQ backlog，未冻结非通用动作和可闭合材料。
- S6 GNU ar/ranlib：当前符号到成员索引已覆盖对象，剩余为通用 associative-table 结构。

未执行检索、下载、queue、实验、自动化或共享文件写入。
