# 未决课题状态对账报告

## 结论

上一次 `20` 个的统计不是最新状态。按最新 plan、registry 末端记录和已封存 handoff 去重后，当前共有 **24 个非终态课题**。

变化公式：`20 - 2 个后来确认 STOP + 6 个后来新增的非终态题 = 24`。

## 必须更正的旧记录

1. `LLVM-APX-PREFIX-PRESSURE-PARETODP` 已由 R12 独立 Stage A gate 确认 `STOP / BELOW_Q2`，且已有 terminal stub，不再是未决题。
2. `PARQUET-PAGE-COSEGMENT` 的 exceptional R3G 独立 gate 已于 2026-08-11 `CONFIRM_STOP`，不是“等待 gate”。
3. `S5-OCCUPANCY-CLIFF-JOINTCODEGEN` 的 resume4 已完成 8/8 natural MIR、8/8 MachineVerifier、8/8 replay，并通过 preclaim fidelity；`user_action_required=false`。应从资源 blocker 改为 `READY_UNSCHEDULED_STAGEA`。
4. `ROCKSDB-DICT-COVER` 的旧 NVD 资源 blocker 已被后续 E-root resource/preclaim 工作取代；最新独立 gate 是“无科学推断且无合法单一 revision route”。应记为 policy/execution hold，而不是旧资源 reserve。
5. Source120–123 后来新增了 6 个非终态题，旧统计完全没有纳入。

## 当前 24 个的原因分布

| 原因 | 数量 |
|---|---:|
| 人工研究储备或用户政策储备 | 8 |
| 外部系统、设备、运行时、模型或 Linux/CUDA 资源 blocker | 8 |
| 工程/方法预算耗尽后的 execution 或 policy hold | 6 |
| 已通过资源/preclaim、等待重新排期 | 1 |
| 等待用户 Stage B 决定 | 1 |
| **合计** | **24** |

当前没有仍在运行的 candidate assignment；活跃 candidate lanes 均已释放。Discovery clean brief/Stage0 queue 不作为未决课题重复计数，只有获得 topic ID 且非终态的题进入分母。

## 正式记录更新建议

由 MAINLINE 在一个安全写边界完成：

- 更新 `registry.yaml` 的 canonical candidate status；
- 将 APX、PARQUET 移入/对齐 terminal stub，清除旧 nonterminal 摘要；
- 清除 S5 的 stale blocker，登记 `READY_UNSCHEDULED_STAGEA`；
- 清除 RocksDB 的 stale resource-reserve 原因，登记 `NO_VALID_REVISION_ROUTE` policy hold；
- 将六个 Source120–123 新非终态题登记进统一候选状态面；
- 在 `plan.md` 写入 24 题的原因计数，避免 lane board 代替完整 topic inventory。

本审计不直接修改共享文件。

