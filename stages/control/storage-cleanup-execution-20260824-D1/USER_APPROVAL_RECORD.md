# 用户清理批准记录

- 用户原文：`批准精确 leaf target、预计回收量、恢复方式及证据保留包`
- MAINLINE 有界解释：只批准支线清单中四个无歧义 `DELETE_CANDIDATE_REBUILDABLE` build leaf；不批准 dedup、archive、downloads、source、toolchain、assets、blocked、reserve 或 pending gate 目标。
- 预计回收：`7,084,221,562 bytes`（约 6.60 GiB）。
- 删除方法：逐个 literal absolute leaf，删除前重新验证路径、bytes/files、reparse、active process 和证据保留包。
- 恢复方式：依据保留的 source/provenance/build contract/command log/reproduce/manifest 重建；不承诺原构建树可直接恢复。
- 删除是不可从项目内直接撤销的；重建需要相应官方源码、工具链和 CPU 时间。

