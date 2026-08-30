# D1 Wave 3 删除后报告

## 结果

用户批准的两个非终态题目压缩已完成。39 个冻结叶目录全部删除，合计 `356,723 files`、`13,754,691,459 bytes`（约 12.81 GiB）。没有删除题目根，没有运行下载、构建、实验或解除 blocker，也没有修改候选科学状态。

- `CVC5-ALETHE-SHAREMAP`：删除 151,700 files、7,358,766,483 bytes；从 160,844 files 降至 9,144 files，当前逻辑体积 278,669,711 bytes。
- `S5-OCCUPANCY-CLIFF-JOINTCODEGEN`：删除 205,023 files、6,395,924,976 bytes；从 207,281 files 降至 2,258 files，当前逻辑体积 587,665,218 bytes。
- `stages/` 删除后、写入本 wave 最终报告前为 101,269 files、6,237,862,789 bytes；`stageA/` 为 87,577 files、6,005,738,254 bytes。
- D 盘删除后可用空间为 340,644,884,480 bytes（约 317.250 GiB）。

## 保留与验收

- 39/39 精确目标 absent；两个 topic root 均存在。
- CVC5 最新 resume12 的 exact `resources/src`、pinned Cargo cache、relay/env、logs 以及 `build/smoke/conftest.exe` 保留。删除范围特意从整个 `resources/build` 收窄到 inventory 明确标为可删的 `build/carcara-target`。
- Occupancy 的 `resume3-r3d/verified` exact tool binaries 与整个 `resume4-safe-recovery/resources`（8 个自然 MIR、sysroot/重放/preclaim 证据）保留。
- 最新 CVC5 blocker/handoff/inventory/manifest 与 Occupancy resume4 handoff/preclaim/unblock/inventory/MIR manifest 等 13 个关键文件 SHA-256 全部与删除前一致。
- 历史 manifests 中指向已删除可重建资源的条目继续作为 pre-delete identity 记录；本 execution ledger 解释其授权缺失。

## 状态与恢复

本次只有存储压缩效果：`candidate_or_scientific_states_changed=false`，`blockers_resolved_or_resumed=false`。删除内容不能从项目内直接 undelete；需要时可按保留的 exact identity、resource inventory、失败日志和恢复合同重新获取或构建。当前不继续解除阻塞。

