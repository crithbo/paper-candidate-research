# 用户批准记录

- 批准文本：`好的，按这个方案先清理，不继续解除阻塞等`
- MAINLINE 的有界解释：仅清理前一轮已经逐项说明的两个非终态题目的冗余/过期/可重建叶目录；保留题目根、报告、结果、handoff、manifest、关键日志、witness、inventory/provenance，以及能够继续恢复的最新 exact source/cache/tool/evidence。
- 不获授权的动作：解除 blocker、恢复 Stage A、运行构建/实验/下载、改变候选科学结论或正式状态、迁移到 E 盘、删除整个题目。
- 删除方式：Windows `Remove-Item -LiteralPath` 对 39 个预先冻结并机械验证的绝对叶目录逐项执行；不使用 glob、环境变量、相对路径或递归题目根。
- 预计逻辑回收：13,754,691,459 bytes（12.810 GiB），356,723 files。
- 可恢复性：删除项本身不提供项目内 undelete；其精确身份、报告、失败证据、资源清单和当前恢复入口原位保留，可按保留合同重新获取或构建。
