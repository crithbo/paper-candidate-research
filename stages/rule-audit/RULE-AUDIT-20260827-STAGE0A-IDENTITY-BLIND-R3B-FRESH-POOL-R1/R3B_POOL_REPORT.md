# R3B 新批次候选池审计报告

## 当前处置

本目录是在 MAINLINE 先前要求 fresh R3B 时形成的未封存备选草案。随后 MAINLINE 以更晚的精确指令要求先完成既有 A3 的 hash-pinned seal，因此 R3B 没有生成 handoff/manifest、没有交给 reviewer，也不是当前 Phase B 路线；若以后恢复，必须由 MAINLINE 重新明确冻结。

## 原始提案结论

R3 原 24 项的分层闭合不足，不能进入 Phase B，也不能用 A3 对个别条目做结果后补丁。已另建完全新批次 R3B：四个贡献层各 6 项，共 24 项；每项都在 2026-08-27 通过 USENIX 官方页面核对标题、年份、会议、Open Access 声明和 PDF 下载入口。

R3B 与 R1/R2 的 13 个身份、R3 原 24 个身份及其已知别名的交集为 0。新池没有发给任何 reviewer，没有生成中性包，也没有启动 Stage 0、Stage A 或任何科学/资源动作。

## 设计

- 四层固定为 `METHOD_SYSTEM / COMPILER_FORMAL / MEASUREMENT_BENCHMARK / HARDWARE_MEMORY`，每层 6 项。
- 排序先按身份识别风险 `LOW → MEDIUM → HIGH`，同风险内按冻结 `identity_key` 的 uppercase SHA-256 升序。
- 每层排序前 3 项形成目标样本，第 4 项形成预登记 reserve，余下 2 项仅是同层 fallback。因此整体形状为 12 个 target、4 个 reserve、8 个 fallback。
- 风险只描述 reviewer 识别论文身份的可能性，不是质量分、预期 PASS 标签或结果先验。
- 任一条目在 MAINLINE 冻结后的最小复核中发生标题、全文入口或排除身份冲突，只能 fail closed；不得跨层借项或按结果替换。

确定性顺序预览如下。这是 identity-bearing 控制数据，禁止放入 reviewer packet：

| 层级 | target 3 | reserve 1 | fallback 2 |
|---|---|---|---|
| METHOD_SYSTEM | M03, M06, M04 | M01 | M05, M02 |
| COMPILER_FORMAL | C03, C06, C04 | C05 | C02, C01 |
| MEASUREMENT_BENCHMARK | B06, B03, B01 | B04 | B02, B05 |
| HARDWARE_MEMORY | H03, H01, H06 | H04 | H05, H02 |

## 预检证据边界

预检只使用官方 venue 页面及其公开下载入口。没有下载论文到项目目录，也没有读取这些新候选的 Stage 0/Stage A 结果、gold label 或预期结论。官方摘要只用于确认论文对象与贡献层归属，不能充当后续 gate 判断。

24 个页面均来自 USENIX 的 OSDI 2020 或 ATC 2023 页面；官方页统一包含 Open Access 说明和 PDF 下载链接。代表性页面包括：

- https://www.usenix.org/conference/osdi20/presentation/wei
- https://www.usenix.org/conference/osdi20/presentation/nelson
- https://www.usenix.org/conference/atc23/presentation/duplyakin
- https://www.usenix.org/conference/atc23/presentation/jang

完整 24 项 URL、身份 key、SHA 和贡献层理由见 `R3B_CANDIDATE_SOURCE_POOL.yaml`。

## 与 R3 的隔离

旧 R3 的 Phase A/A2 及其 24 项身份保持原样封存。本 R3B 草案没有复用 A3 中的两个修正身份；但 MAINLINE 后来明确要求对既有 A3 做最小封存，因此本段不再主张 A3 不得使用。A3 是否接受及 Phase B 是否启动仍完全由 MAINLINE 决定。

## 建议的 MAINLINE 下一边界

MAINLINE 可机械验收本目录 manifest 后，以新 assignment ID 冻结 R3B。后续 Packer 只需对 24 个官方页做一次最小可得性复核、按冻结顺序生成 12+4 的 fresh neutral IDs，并保证 identity key 只留在独立 key 文件中。任何 reviewer 在 key 解封前都不得得到标题、作者、会议、URL、引用、系统名或可搜索原句。

本报告不建议修改生产规则；它只是替换失败回测批次的 proposal-only 新输入。标签为 `NO_CHANGE__FRESH_BATCH_REQUIRED`。
