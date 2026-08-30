# 项目根压扁路径异常归档报告

## 结论

项目根下 24 个以 `projectwritingeserchstagesdiscovery...` 开头的文件均已移动到本目录的 `quarantine/`。这些文件是 Windows 绝对路径在转义/拼接时丢失分隔符形成的异常产物，不是规则文件，也不是 registry 指向的 canonical Discovery 交付。

- 原项目根异常文件：24 files / 13,173 bytes。
- canonical counterpart：24/24 存在。
- 与 canonical 完全相同：3；不同的早期/部分版本：21。
- shared/canonical 文本引用：0。
- 移动后：原路径 24/24 absent；quarantine 内容哈希 24/24 与移动前一致；canonical counterpart 哈希 24/24 不变。
- 当前项目根只保留 `AGENTS.md`、`plan.md`、`registry.yaml`、`history.md` 四个共享文件及规范目录。

用户点名的 `RQ_CANDIDATE_S4-112-RQ05.md` 根目录异常副本只有一行 `PRE_RQ_NONADMISSION` 摘要；正确 canonical 文件位于 `stages/discovery/round-20260824-strategy-source112/S4-objective-constraint/`，并由该 lane 的 handoff/manifest 与 registry 登记。异常副本没有独立候选、科学结论或规则权威性，故只作可恢复隔离，不合并到 `rules/`。

本次没有修改任何 canonical Discovery 文件、rules、templates、候选状态或科学结论，也没有启动 queue、检索、下载、构建或实验。

