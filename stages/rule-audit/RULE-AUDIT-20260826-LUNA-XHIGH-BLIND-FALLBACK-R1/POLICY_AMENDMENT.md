# Policy Amendment R1

## A. Luna reasoning override

在 `E:/project/writing/reserch` 的模型路由中，所有 `model = gpt-5.6-luna` 的真实工作 turn 统一设置：

`thinking = xhigh`

具体包括：

- hash、manifest、bootstrap、格式检查、监控和状态 relay；
- Stage A 的 build/log/format 等机械阶段；
- 正式项目中的机械整理、格式和文件检查；
- 后续新增的任何 Luna 路由。

兼容语义：

- `xhigh_default_allowed` 改为“仅 Luna 允许”；Terra 与 Sol 的 xhigh 仍默认禁止。
- `max` 对所有模型仍默认禁止。
- idle/not-loaded lane 不为应用本修改而唤醒；下一真实 assignment/follow-up 显式使用 `gpt-5.6-luna / xhigh`。
- 正在运行的 turn 不打断。

## B. Double-blind continuation gate

### B1. One bounded retry

MAINLINE 可在验收 PACKER v2 后，把 exact neutral v2 subtree 投递给一名不同于首位污染 reviewer 的 fresh Stage 0 reviewer。仍不得释放 auditor key 或透露 backtest/论文/Q2/已知成功。

### B2. Stop trigger

以下任一发生即停止 blind arm：

1. 第二名 fresh reviewer 对任一案例输出 `BLINDING_CONTAMINATION`；
2. router/审查者发现 batch-level 信息使“其余案例也是历史成功/控制样本”成为可推知；
3. v2 的随机 ID、路径或文本扫描出现身份泄漏。

污染仍为 0 科学判断，不计 PASS/STOP 分母。

### B3. Nonblind fallback

触发后创建 `NONBLIND_RULE_COMPATIBILITY_AUDIT`，允许 reviewer 知道案例来自既有成果，但不得在看到 auditor expected disposition 后回填理由。建议两阶段冻结：

1. `NB1_RULE_ONLY_DECISION`: 按现行 Stage 0/Stage A 条款逐项填写 object、collision、comparator、evidence、full-cost、resource route、decision 和理由；冻结哈希。
2. `NB2_GOLD_COMPARISON`: 再读取 gold key，对照是否误杀、错误放行或仅存在资源/构造差异。

结果标签：

- `NONBLIND_RULE_COMPATIBILITY_SURVIVAL`
- `NONBLIND_RULE_COMPATIBILITY_STOP`
- `NONBLIND_NEGATIVE_CONTROL_CORRECT_REJECTION`
- `NONBLIND_NEGATIVE_CONTROL_FALSE_PASS`

禁止把这些标签转换成 blind recall 或“通过率达到 75%”。

## C. Reporting

最终报告必须分列：

- blind reviewer attempts / contamination / completed scientific decisions；
- nonblind positive compatibility；
- nonblind negative-control specificity；
- resource/implementation construction validity；
- 哪些结论可用于规则补丁，哪些仅是有偏辅助证据。

