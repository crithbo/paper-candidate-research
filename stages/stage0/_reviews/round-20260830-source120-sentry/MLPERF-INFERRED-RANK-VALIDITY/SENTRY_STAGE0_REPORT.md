# MLPERF-INFERRED-RANK-VALIDITY SENTRY confirmation

## 中文摘要

- Disposition: `CONFIRM`
- Scientific verdict confirmed: `PASS_RECOMMENDED`
- Operational disposition: `READY`
- Quality tier: `TIER_B_Q2_VIABLE`
- Evidence ceiling: `CANONICAL_MLPERF_BENCHMARK_VALIDITY_ONLY__NO_MAIN_RESULT`
- Model route: `gpt-5.6-sol/high`（本次用户命令临时覆盖）

## 独立核验

### Exact object

对象是版本固定的 MLPerf Inference Edge 公开结果中，同一 release、submitter/division/availability、system、benchmark、accuracy、implementation/software 与 power contract 下，可同时辨认的 measured base/target scenario rows。估计量限于官方推导值相对直接 measured target 的数值误差、校准、rank correlation、pairwise/top-k reversal、missingness 与跨 release 稳定性；不外推真实部署性能。

### 官方公式与 current source

MLCommons 当前官方规则明确允许：SingleStream 推导 MultiStream 为 `8 × SingleStream 99th-percentile latency`；MultiStream 推导 Offline 为 `8000 / mean_latency_ms`；SingleStream 推导 Offline 为 `1000 / mean_latency_ms`。accuracy 与 power 从 base result 继承。相同规则同时规定 SingleStream 的正式 scenario metric 为 90th-percentile early-stopping latency、MultiStream 为 99th-percentile query latency、Offline 为 measured throughput。因而推导跨越了不同 query shape、统计量与运行语义，形成可证伪的 benchmark-validity 对象，而非纯单位换算。

当前官方 v5.1/v6.0 result repositories 各自提供版本化 `summary_results.json`，submission structure 固定 system/benchmark/scenario 路径。v5.1.1 release history还记录了“已有 Offline 时跳过推导 Offline”的 checker 改动，证明 release pinning、measured/inferred 判别和 preprocessing 版本必须进入合同。

### 最强基线与碰撞

最强基线是：（1）官方推导公式本身；（2）完全匹配的直接 measured target scenario；（3）零偏差/完美 calibration null；（4）仅作诊断的 per-release/per-benchmark calibration。官方 benchmark papers、规则和既有 MLPerf characterization 使用相同结果对象，但本次有界第一方检索未发现同一 exact matched-pair 的 measured-vs-inferred value/rank audit。故 `DIRECT_FATAL=NO`，collision 保持 `SEARCH_BOUNDED_OPEN`。

### Q2 形状

若 Stage A 证明 exact eligible pairs 足够，且观察到稳定、材料性的 error 或 rank reversal，则“多 release 规范化公开数据集 + 确定性 parser + matched-pair protocol + missingness/uncertainty + reporting recommendation”形成可信 Q2 benchmark/measurement 论文。Q1 仍需广泛有效的替代 estimator 或更一般的 benchmark-governance 结论。当前不假设主结果成立。

### Bounded Stage A killer

在结果值计算前固定两份官方 release summaries、一个官方 test-submission corpus、匹配键和 inferred/measured 判别规则；手工复核一个 SingleStream/MultiStream/Offline 同系统 witness；随后先输出 eligible pair counts 与 missingness。若 measured/inferred 无法无歧义区分、exact pairs 太少、完整 corpus 的 preregistered material error 不超过 2% 且无稳定 pairwise/top-k reversal，或 release heterogeneity 破坏固定估计量，则停止该方向。正结果也只支持冻结的 canonical benchmark-validity claim。

## 限制与完整性

本次未运行 parser、未计算 pair count/error/rank、未实现候选，也未启动 Stage A/B。结论只确认条件性论文形状。使用了 AI-assisted research tools；决定性事实核对自 MLCommons 官方规则、官方 inference/source 与官方 results repositories。

## Pause

usage-reset soft-pause 在本 SENTRY handoff 后生效：本 lane 不派 successor；该信号不影响科学判断。
