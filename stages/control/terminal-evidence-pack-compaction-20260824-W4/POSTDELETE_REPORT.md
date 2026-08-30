# Terminal Evidence Pack Compaction Wave 4

## 结果

四个终态 STOP 题的最小 evidence pack 已先生成并冻结，随后删除 39 个精确资源/展开结果目标：`24,426 files / 1,025,354,509 bytes`（约 0.955 GiB）。

| 题目 | 删除文件 | 回收 bytes | 删除后 files | 删除后 bytes |
|---|---:|---:|---:|---:|
| Arrow IPC stream dictionary evolution | 946 | 241,287,176 | 760 | 123,521,817 |
| LLVM Bitcode abbreviation planner | 4,012 | 380,380,455 | 1,329 | 30,223,487 |
| LLVM DWARF callsite reconstructibility | 759 | 348,302,312 | 5,011 | 19,518,720 |
| WebGraph reference forest | 18,709 | 55,384,566 | 655 | 35,827,334 |

`stages/` 在写入本报告前为 `77,099 files / 5,233,766,486 bytes`，已进入数万文件级。D 盘可用约 318.079 GiB。

## Evidence pack

`evidence_pack/` 共 212 files、21,173,118 bytes，四个 topic tree digest 全部在删除前后复算一致。它包含：

- Arrow 两阶段 owner/gate 终态记录与自然输入合同；
- LLVM Bitcode 自然结果汇总、scope/ID-width witness、owner/gate 终态记录；
- LLVM DWARF 自然结果、full-cost、reproduce/provenance、witness 与独立 gate；
- WebGraph matched aggregates、两个 corpus 的 pair-00、case-0043 输入/输出 witness、preclaim 与独立 gate。

原题目录中的报告、handoff、historical manifests、关键结果、自然结果汇总、pair-00 和最小 witness 仍原位保留。16 个关键文件 SHA-256 全部不变；39/39 删除目标 absent；4/4 题目根存在。

## 删除边界

- Arrow：删除展开 PyArrow/psutil 环境、可重新获取 wheels/source excerpts，以及 revision1 重复自然输入；initial 自然输入保留。
- LLVM Bitcode：删除 380 MB 派生 expanded corpus；自然输入、结果汇总与 witness 保留。
- LLVM DWARF：删除下载归档、终态构建树/cache/tmp；musl/blink source、自然输入、日志、结果和 provenance 保留。
- WebGraph：删除结构性输入/展开输出、superseded preclaim natural outputs、两个 corpus 的 pair-01 至 pair-10；aggregates 与 pair-00 保留。

本次不修改终态科学结论、rules、templates、contexts 或任何非终态题目，也未启动 queue、下载、构建或实验。删除内容不能项目内直接 undelete；资源需按保留 provenance 重新获取，展开结果可按 pack、脚本与命令合同重建。

