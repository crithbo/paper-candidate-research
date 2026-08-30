# DISCOVERY-M1-MEASUREMENT-OBSERVATORY 启动记录

## 会话身份

- Session: `DISCOVERY-M1-MEASUREMENT-OBSERVATORY`
- Role: 周期性横向 Discovery 测量观测会话
- Primary opportunity origin: `O8_MEASUREMENT_CHARACTERIZATION_OR_BENCHMARK_GAP`
- Discovery method revision: `v2`
- Workspace: `D:\project\writing\reserch`
- Sole writable directory: `stages\discovery\round-20260803-v8\M1-measurement-observatory\`
- Default cadence: `EVERY_TWO_WAVES_OR_TRIGGERED`
- Startup date: `2026-08-03`（Asia/Shanghai）
- Current state: `WINDOW_ESTABLISHED_WAITING_MAINLINE_TRIGGER`

本文件只建立长期窗口并冻结权限、门禁和唤醒契约。本轮没有启动检索、数据采集、trace/profile 下载、benchmark、GPU/NPU/FPGA 使用、候选生成或 Stage 0 提交。

## 完整读取声明

启动前已按磁盘当前内容完整读取：

1. `AGENTS.md`
2. `plan.md`
3. `registry.yaml`
4. `rules\ROLE_DISCOVERY.md`
5. `templates\TOPIC_BRIEF.md`
6. `C:\Users\15383\.codex\skills\academic-research-suite\SKILL.md`
7. `C:\Users\15383\.codex\skills\academic-research-suite\ars\deep-research\WORKFLOW.md`

由于未来观测范围可能覆盖 GPU、NPU/NDP、PIM、量化、体系结构和 accelerator compiler，另按 ARS 根技能要求完整读取：

8. `ars\academic-paper\references\hardware_design_papers.md`
9. `ars\academic-paper\references\npu_ndp_architecture_papers.md`

未读取其他角色规则或历史候选证据。启动时未收到 M1 的独立 backtest handoff、生产波次输入包或具体测量缺口。

## 使命

在主线按 cadence 或具体缺口唤醒后，从有来源、可复核的公开 workload、trace、profile、benchmark 和跨平台测量材料中寻找：

- 跨合理切片仍成立的稳定规律；
- 成本曲线的拐点或阶段转换；
- 方法、平台或配置的排名反转；
- benchmark 覆盖、聚合、权重或指标造成的评价偏差；
- 随规模、在线信息、精度、稀疏度或系统边界变化出现的效应；
- 能改变研究决策、评价结论或机制设计的 benchmark gap。

M1 可以把经验证的机会路由给 S1–S6，也可以在门禁满足后形成 `MEASUREMENT_MECHANISM` 路线的 O8 brief。只有数据收集、dashboard 或 benchmark 扩容而没有稳定规律、决策后果、评价修正或利用机制的工作不进入候选。

## 当前硬门禁

### G0：启动边界

本轮只允许创建 `STARTUP.md` 与横向测量计划。`G0` 完成不等于回测通过、生产授权或候选资格。

### G1：主线唤醒

没有主线明确触发，不进行外部检索或任何数据动作。触发至少应给出：

- 触发类型：两波 cadence 或具体缺口；
- 关联波次、问题或待解释观察；
- 允许的对象、领域标签和时间边界；
- 资源、访问、设备和写入边界；
- 期望输出与截止点。

### G2：方法 v2 独立回测

M1 首次生产前必须取得按 `ROLE_DISCOVERY_BACKTEST.md` 完成的独立 packer–executor–auditor 回测 PASS。回测通过前只能准备方法、清单和协议，不能生产 Stage 0 候选，不能写 `PROPOSE_STAGE0`。回测只校准发现方法，不构成新候选的自然 headroom、新颖性或可行性证据。

### G3：数据与执行授权

本次委托没有授权数据采集或 benchmark。后续即使被唤醒，也只在触发范围内使用公开、合法、同对象材料；正式大规模实验、现有项目写入、重要设备占用、商品硬件测量或正式论文尝试仍需用户确认。

### G4：证据 ceiling

所有未来结论必须停在实际完成的证据等级：

- 公开表格或论文数字只能支持已公开条件下的比较；
- trace/profile 重分析只能支持该来源、版本、语义和采样边界内的观察；
- analytical/cycle/simulation 结果不能写成 RTL、FPGA、ASIC 或 silicon 实测结论；
- 跨平台结论必须锁定或披露语义、版本、precision、shape、batch、sparsity、fallback、host/transfer、冷暖态及成本边界；
- 缺少真实设备不会自动终止高潜力问题，但必须降低 claim ceiling。

## 禁止事项

- 不修改 `plan.md`、`history.md`、`registry.yaml`、`rules\`、`templates\` 或其他会话目录。
- 不创建、升级或裁决候选，不自行创建 Stage 0。
- 不从单一异常点、工具/API 名、issue、dashboard 需求或 limitation 句子反推论文。
- 不把不可比平台、不同语义、不同质量或不完整成本的结果合并成排名。
- 不把“检索范围内未发现”写成绝对首次。
- 不因 AI 执行性或商品硬件缺口单独判定学术 STOP。
- 不置顶、不创建其他任务或会话。

## 唤醒输入契约

主线下一次触发时，M1 先确认以下最小输入；缺项只报告缺口，不越权补写主控：

| 字段 | 要求 |
|---|---|
| `trigger_id` | 唯一触发标识 |
| `trigger_type` | `EVERY_TWO_WAVES` 或 `GAP_TRIGGERED` |
| `wave_context` | 关联波次或候选缺口 |
| `question_or_gap` | 待刻画对象及为什么现在需要测量 |
| `allowed_sources` | 公开 workload/trace/profile/benchmark 范围 |
| `time_slice` | 检索与版本时间边界 |
| `resource_boundary` | 下载、计算、设备、许可与写入授权 |
| `backtest_handoff` | M1 v2 回测状态与证据路径 |
| `expected_output` | 横向观察、路由建议或获准后的机会包 |

## 后续状态转换

```text
WINDOW_ESTABLISHED_WAITING_MAINLINE_TRIGGER
  -> TRIGGER_RECEIVED_SCOPE_CHECK
  -> BACKTEST_STATUS_CHECK
  -> PLAN_ONLY_BLOCKED_BY_BACKTEST
     或 ACTIVATED_FOR_PUBLIC_MEASUREMENT
  -> OBSERVATION_REPORTED
  -> WAITING_NEXT_CADENCE_OR_TRIGGER
```

任何 `PROPOSE_STAGE0` 路径都必须额外满足：M1 v2 回测 PASS、主线生产触发、完整 O8 观察链、论文谱系、至少两个非同义机制、具名公平基线、72 小时 probe、decisive falsifier、无 `DIRECT_FATAL`，并使用 `templates\TOPIC_BRIEF.md`。当前不满足这些条件。

## Startup 结论

长期窗口已建立，横向测量方法已另见 `MEASUREMENT_PLAN.md`。当前应保持空闲，等待主线按“两波一次或具体缺口触发”的 cadence 唤醒。
