# Discovery 方法回测登记

本目录保存 Discovery 方法的历史时间切片回测，不保存候选新颖性证据。

标准路径：

`stages/discovery/_method-backtests/<OPPORTUNITY_LENS>/<METHOD_REVISION>/`

每次回测至少包含：

- `sealed_input_manifest.yaml`：独立 packer 生成的发表前输入包与时间截止；
- `method_output.md`：Discovery 方法在不知道目标论文内容时产生的结果；
- `backtest_review.md`：独立 auditor 揭示目标后进行的恢复率、误报和污染审计；
- `handoff.yaml`：`CALIBRATED / REVISE_METHOD / REJECT_METHOD` 结论与文件哈希。

角色必须分离：

1. `PACKER`：选择 3 个正例和至少 1 个负对照，建立 sealed input；
2. `EXECUTOR`：只读取 sealed input，运行待测 Discovery 方法；
3. `AUDITOR`：揭示目标，核验 2/3 恢复率、负对照 abstention 和污染边界；
4. 主线只做机械验收和登记。

截至 2026-08-03 00:52（Asia/Shanghai），本目录没有已完成回测；完成数为 `0`。
