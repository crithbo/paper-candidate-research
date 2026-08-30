# 存储清理执行报告：D1 Wave 1

## 结果

用户批准精确 leaf target、预计回收量、恢复方式及证据保留包后，MAINLINE 仅删除了四个无歧义、可重建的 build leaf。四个目标均在删除前通过 literal absolute path、workspace 边界、fresh bytes/files、zero reparse、zero active heavy process 与 evidence-package hash 校验。

| 删除目标 | 逻辑字节 | 文件数 | 结果 |
|---|---:|---:|---|
| `D:/project/writing/reserch/stages/stageA/RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP/resume1/b` | 1,616,913,835 | 2,645 | absent after delete |
| `D:/project/writing/reserch/stages/stageA/LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY/resume1/build` | 2,678,702,281 | 4,238 | absent after delete |
| `D:/project/writing/reserch/stages/stageA/WEBGRAPH-REFERENCE-FOREST/build` | 2,092,765,095 | 4,668 | absent after delete |
| `D:/project/writing/reserch/stages/stageA/WEBGRAPH-REFERENCE-FOREST/revision1/build` | 695,840,351 | 1,551 | absent after delete |

合计逻辑回收 `7,084,221,562 bytes`（约 6.60 GiB），共删除 13,102 个 build 文件。D 盘 post-delete 空闲约 `290.282 GiB`。

## 证据保留

- 四个 topic/resume/revision 根目录全部保留。
- assignment/context、报告、结果、handoff、历史 manifest、命令与成本日志、资源/构建 provenance、最小 witness 和关键分析结果全部保留。
- 抽查 `RISCV ANALYSIS.json`、RISCV/LLVM-DWARF/WEBGRAPH initial/revision results 与 DWARF witness contract 的 SHA-256，均与 pre-delete evidence package 一致。
- blocked、reserve、pending gate 与其资源目录完全未触碰。

历史 manifest 中原本列出的 rebuildable build 文件现在会缺失；manifest 本身保留，作为删除前身份/哈希与重建验证记录。该差异由 `PREDELETE_EVIDENCE_PACKAGE.yaml` 和 `CLEANUP_EXECUTION_LOG.yaml` 明确授权与解释，不改变科学结论。

## 恢复性

- RISCV：使用 commit `ba5bccfe01368f76e74d6ff4c35f1330e155b4ba`、保留源码/工具链/语料及 `REPRODUCE.md` 重新构建。
- LLVM DWARF：使用 commit `e72ba6cf366a3180cbf5a8690d9e50665880ab76`、官方 archive hash、`BUILD_PROVENANCE.yaml` 与 jobs=2 的 Ninja targets 重新构建。
- WebGraph initial：使用冻结 crates、MSYS2/CLANG64 工具链合同和 process-local Cargo target 重新构建。
- WebGraph revision1：从保留的 initial source/toolchain 与 `REVISION_CONTRACT.yaml` 重建；revision 本身禁止网络。

这些目录不可从项目内直接 undelete；恢复需要重新构建及相应 CPU 时间。

## 未执行范围

没有删除 downloads、source checkout、toolchain、assets、Rust acquired/extract/prefix、dedup candidates 或 archive candidates。它们仍需独立的内容/依赖/恢复核验和新的精确执行边界。
