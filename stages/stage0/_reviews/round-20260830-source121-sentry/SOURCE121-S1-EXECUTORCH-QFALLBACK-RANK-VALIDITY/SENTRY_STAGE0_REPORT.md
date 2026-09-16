# SOURCE121-S1-EXECUTORCH-QFALLBACK-RANK-VALIDITY SENTRY confirmation

## 独立结论

- Disposition: `CONFIRM`
- Scientific verdict confirmed: `PASS_RECOMMENDED`
- Operational disposition: `READY`
- Quality tier: `TIER_B_Q2_VIABLE`
- Evidence ceiling: `CONDITIONAL_CANONICAL_EXECUTORCH_BENCHMARK_VALIDITY_ONLY__NO_RESULT`
- Model route: `gpt-5.6-sol/high`（本次用户命令临时覆盖）
- Current-cycle usage reset confirmed: `false`

## Current tool/paper union subtraction

ExecuTorch 当前第一方工具已原生提供 delegation table、ETRecord/ETDump、Inspector operator/delegate/end-to-end events、`Method::execute` 与 source-to-runtime numerical discrepancy。XNNPACK 文档还公开 partitioning、layout preparation、runtime init/execute 与可选内部 profiling。因此，收集 delegated share/subgraph count/timing、画 dashboard、做普通 profiling 或单次 numerical check 均被 current union 直接扣除，不能作为论文贡献。

ExecuTorch system paper、native developer tools、nn-Meter、MLPerf Mobile 与 LiteRT delegate benchmark共同构成强基线：前两者覆盖同对象 observability，nn-Meter 是 held-out latency prediction 的方法上限，MLPerf Mobile约束 full-SUT/quality discipline，LiteRT扣除 delegate latency dashboard 邻接空间。

## Boundary observability ceiling

Inspector 将一个 delegate call 暴露为单一 event，并可关联内部 handles/ops；XNNPACK 可提供额外内部 profiling，但当前没有一个 canonical field 直接等价于 boundary conversion/layout/synchronization causal cost。layout passes、delegate init/execute、portable fallback 与 host work在源码/文档中可定位，却不能从一个 event 无歧义分解。

因此，boundary terms 只能作为预注册、互不重叠的 predictive features，并必须对 profiling-off end-to-end truth 校准；不得写成已直接测得的因果成本。

## Exact residual and model panel

保留对象是固定 ExecuTorch source model、input/quality threshold、pinned CPU target与预提交 `.pte` configurations。endpoint 是 delegated share、subgraph fragmentation、delegate-only timing等 proxies 是否保持 profiling-off full-cost configuration rank，以及 held-out model prediction error。

当前官方 export code明确列出 `HuggingFaceTB/SmolLM2-135M`、`Qwen/Qwen2.5-0.5B`、`Qwen/Qwen3-0.6B`，并提供 Qwen3 XNNPACK 8da4w 路线。两模型 calibration + 一模型 held-out 的三模型 panel 在静态上成立；Stage A 前仍须冻结 exact model revisions、licenses、tokenizer/config hashes和 reacquisition route。

## Strongest proxies and full-cost fairness

必须公平比较：（1）delegated node/share；（2）delegated subgraph count；（3）delegate-only ETDump time；（4）profiling-on `Method::execute`；（5）profiling-off repeated wall-clock rank；（6）nn-Meter-style predictor ceiling。所有 configurations保持 source model、tokenizer/input、quality threshold、threads/affinity与 warm/cold state一致；unsupported/failed cells留在 denominator。

full-cost 必须拆分 export/quantization/lowering、program load/init、artifact size、portable fallback、delegate/host work、validation、observer effect与repetition；不得重复计价。

## Q2 shape

条件性 Tier-B 形状成立：若公开三模型 panel能展示 native proxies 的稳定 ranking-validity boundary、材料性 reversal 或验证过的 safe-proxy region，并交付可重放 trace/manifest与完整 cost/quality ledger，则形成聚焦的 measurement/benchmark paper。一个 CPU target与一个 framework限制 Q1 ceiling。若仅复述 Inspector 输出或 delegated share 已解释全部 cells，则低于 Q2。

## First Stage A killer

第一门仅用最小官方模型和结果无关的 legal configurations：portable-only、XNNPACK standard、XNNPACK `extended_ops`（若支持）；相同 quantization/input/quality；partition table；ETDump on；external timer profiling on/off；初始化分离；一次 determinism replay。

以下任一项杀死方向：没有不同 fallback topology 的合法 configs；features必须双计或使用 target rank信息；instrumentation使排名变化超出 uncertainty；quality contract失败；profiling-off truth不可重放；或 held-out rank不优于简单 native proxies且不产生 decision-changing information。正结果上限仅为 preliminary non-falsification。

## 限制与完整性

本次未读取 queued LeRobot，未实现候选、下载资源、build/experiment或启动 Stage A/B；未改写共享状态。结论来自当前官方 ExecuTorch文档/源码、冻结 PRIMARY 输入和原始论文。AI-assisted tools用于检索与综合。
