# 存储清理执行报告：D1 Wave 2

## 结果

MAINLINE 按用户 STOP-only 清理授权，删除 16 个 confirmed STOP topic 下的可重建 expanded source、toolchain、downloads、binary 与 temporary work leaf。共删除 `548,008 files`、逻辑字节 `14,094,392,859`（约 13.13 GiB）。16/16 目标删除后 absent，8/8 topic/resume/revision roots 仍存在，关键证据哈希抽查 7/7 无漂移。

加上 Wave 1，累计删除：

- `561,110 files`
- `21,178,614,421 bytes`（约 19.72 GiB）

D 盘当前空闲约 `304.358 GiB`。

## 文件数变化

- `stages/`：从清理前 1,019,083 files 降至 457,986 files。
- `stageA/`：清理后 444,300 files。
- `stage0/`：清理后 1,003 files。
- RISCV ZCMP：清理后约 2,323 files，主要是 runs/witness/corpus/report。
- LLVM DWARF：清理后约 5,770 files，主要是保留的 musl/blink resources、witness/results/report。
- WebGraph：清理后约 19,364 files，其中约 16,741 files 是 initial/revision results，作为科学证据保留。

## 为什么不能降至数万

当前两个非终态 blocker 即占：

- CVC5-ALETHE-SHAREMAP：160,844 files；
- S5-OCCUPANCY-CLIFF-JOINTCODEGEN：207,281 files。

二者合计 368,125 files，占当前 Stage A 的 82.9%。按项目硬门 blocked/reserve/pending 不能因空间清理破坏恢复入口。因此仅靠 STOP 清理后的现实下限仍约 40 万级；要降至数万，必须另行批准对非终态目录做可逆 archive-to-E 或明确撤回/转终态，不能直接删除。

## 保留与恢复

保留了 report/results/handoff/historical manifest、关键日志、reproduce、最小 witness、runs/corpus/inputs、inventory/provenance。RISCV/LLVM/WebGraph/FlatBuffers/Rust 的 deleted source/toolchain/download 内容均需依据保留的 exact commit、URL/hash、toolchain freeze 和 command contract 重新获取或构建；项目内没有直接 undelete。

LLVM DWARF 的 musl/blink resources、FlatBuffers sources、Arrow assets 因依赖/证据边界未完全闭合而保留。所有 blocked、reserve、pending gate 和 state-ambiguity topic 均未进入删除范围。
