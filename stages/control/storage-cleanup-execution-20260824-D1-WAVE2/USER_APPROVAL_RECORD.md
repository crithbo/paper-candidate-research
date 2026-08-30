# D1 Wave 2 用户批准与有界解释

- 用户要求删除所有 STOP 题目中报告以外的内容，并按建议去重，目标把百万文件降至数万。
- 项目硬门要求 canonical report/results/handoff/manifest、决定性日志、最小 witness、inventory/provenance 和 reproduce 保留；MAINLINE 不把“报告以外”解释为删除科学证据。
- 仅删除 16 个已确认 STOP 题目下的 rebuildable expanded source、toolchain、downloads、cache/work leaf；blocked、reserve、pending gate 和 state ambiguity 全部排除。
- Wave 2 预计删除 `14,094,392,859 bytes`、`548,008 files`。
- 仅清理 STOP 无法降至数万：CVC5 与 S5 Occupancy 两个 blocked topic 本身已有 368,125 files，全部非终态保留后项目下限仍约 40 万级。
- 删除不可项目内直接撤销；恢复需要官方重新获取/解压/构建。

