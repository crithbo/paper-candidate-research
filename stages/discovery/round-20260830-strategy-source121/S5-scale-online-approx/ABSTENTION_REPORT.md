# Source121 S5 honest abstention

## 中文摘要

本轮按 exact-carrier-first 顺序筛查了 10 个在线/规模化 KV memory 机会族，使用完预冻结的 24 次一手来源调用。没有形成 clean brief。

最接近的方向是“现有 KV 压缩方法在真实多轮会话中的排序是否稳定”。但 SCBench v2（ICLR 2025）已经以同一 KV-cache 对象建立 multi-turn/multi-request shared-context benchmark，评估 StreamingLLM、SnapKV、PyramidKV 等方法，并明确报告 sub-O(n) memory 方法在后续请求退化。这直接吸收了本轮 primary RQ 的一般测量结论。

把 residual 改为“自然聊天数据”也没有闭合：LMSYS-Chat-1M 有真实 conversation 结构，但平均仅两轮、平均 prompt 很短且访问文件需接受许可；Mooncake 的公开 conversation trace 有时间、输入/输出长度和 hash IDs，却没有可重放文本与质量 oracle。拼接两种 carrier 会换成构造性对象，并不能仅靠 carrier 替换形成可信 Q2 贡献。

## Disposition

- Canonical outcome: `HONEST_ABSTENTION__ZERO_CLEAN_BRIEF`.
- Scientific STOP: `NO`; no candidate entered raw or registry.
- Resource blocker: `NO`; the decisive stop is direct collision plus carrier/object insufficiency.
- Search-bounded statement: only the 10 predeclared carriers and 24 primary-source calls were considered; no global novelty or absence claim is made.
- Successor/backfill: `FORBIDDEN`; usage-reset soft-pause is respected.

