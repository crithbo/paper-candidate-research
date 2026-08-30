# 当前状态与短期计划

更新时间：2026-08-24 19:13（Asia/Shanghai）

## 当前目标与停止条件

- 用户已授权把持续目标冻结为：按 `PUBLIC_SINGLE_GPU_CPU_FIRST` 与长期 LLM/VLA 推理系统方向，复用现有长期 lane 持续推进 `Discovery → Stage 0 → Stage A → 独立 Stage A gate`。
- 当前累计独立 Stage A gate PASS 为 `1/5`；Stage 0 PASS、owner 自评和未经过独立 gate 的结果不计入。
- 临时用量监控任务 `01a02f94-8e7d-79f1-8753-b0dc3bcb7e32` 已完成确认并回到 idle；对应 automation 更新时已显示不存在或已移除，不再执行后续检查或重复通知。
- 09:05 已收到并接受 `USAGE_RESET_CONFIRMED__STOP_AFTER_CURRENT_DISCOVERY_WAVE__NO_SUCCESSOR_DISPATCH`：Tibo 明确宣布 reset propagated、至少一个 tracker 显示 global reset completed、账户周额度回升至 99%。Source118 当前 wave 已完整收口，主线从此停止 successor Discovery，不创建 Source119。
- 本次没有点击或使用 banked reset；停止决定来自已闭合的三证据门。

## 本轮持续流水线记录与收口

- Source106 已 `6/6 COMPLETE_ACCEPTED`，本轮 `0 clean brief / 0 Stage 0 dispatch`。因 Source105 有一个 clean brief，当前连续零产出 streak 仅为 `1`，不触发 Rule Audit。
- Source107 六路 context/ACK 已 `6/6 ACCEPTED`，且均确认 `scientific_or_resource_action_started=false`、无差异；现已按同一冻结合同启动。它回到最贴近就业与本机资源的单 GPU LLM software surface：TorchInductor/Triton、CUDA graph/compile cache、MoE routing、cold-start/SLO、KV/session memory 和 IREE/MLIR/TVM；canonical 方法和科学门均不变。
- Source107 已 `6/6 COMPLETE_ACCEPTED`，本轮 `0 clean brief / 0 Stage 0 dispatch`。S5 的四个 RQ 被当前 vLLM/SGLang/PyTorch/MoE union 闭合，一个只停在 locator-only；不形成候选 STOP 或类别排除。
- Source106+Source107 构成连续两个完整六路零 brief 周期，已满足 `RULE-AUDIT-SENTRY` 触发条件；主线下一步并行冻结一次 proposal-only first-failed-conversion 审计与不等待审计的 Source108 canonical Discovery。
- Source108 六路与 A4 proposal-only audit 的 context/ACK 已 `7/7 ACCEPTED`，均确认未提前启动且无差异，现已分别获得冻结范围内的 START。Source108 只做 exact public artifact + replication-negative/measurement/benchmark contribution-type allocation rotation，不改变 canonical 方法、科学门或候选状态，且禁止读取并行 A4 输出。
- A4 已 `COMPLETE_ACCEPTED__NO_CHANGE`：Source106/107 的第一失败转换仍是 selected RQ/source closure → evidence-qualified raw，主因 current union/具名来源族饱和，次因 exact public carrier + non-generic action gap；未发现规则、模板决策、执行或资源聚合缺陷。无 shared patch，不回写 Source108。
- Source108 已 `6/6 COMPLETE_ACCEPTED`，本轮 `0 raw / 0 clean brief / 0 Stage 0 dispatch`。S1 有完整不重复 exact-artifact bounded closure；S3 有 1 个有效 locator；S2/S4/S5/S6 的 predecessor exact-repeat 或 pre-RQ nonadmission 均已从 valid 分母剔除，不作科学负推断。
- 下一轮 Source109 将只在 assignment 边界使用 A4 已允许的具名来源族临时降权，并把 Source106–108 已闭合 identity 直接展开为显式 denylist，避免隐藏 predecessor hold 再次造成执行性重复；canonical 方法与全部科学门不变，不再立即叠加新 Rule Audit。
- Source109 六路 context/ACK 已 `6/6 ACCEPTED`，均无差异且未提前启动，现已获得 START：来源轮换到 TensorRT-LLM、ONNX Runtime/GenAI、llama.cpp heterogeneous offload、TGI 与 LLVM/MLIR/NVVM/Triton backend；每个 seed/RQ 在检索前必须逐项记录显式 denylist 判定。
- Source109 已 `6/6 COMPLETE_ACCEPTED`，共约 10 个 valid selected locator，但仍为 `0 evidence-qualified raw / 0 clean brief / 0 Stage 0 dispatch`。显式 denylist 消除了 Source108 的主要执行性重复；剩余失败回到 current union、exact carrier/action 不足和 pre-RQ nonadmission。
- Source110 六路与 A5 proposal-only audit 已 `7/7 ACK ACCEPTED`，均无差异、未提前启动，现已分别获得冻结范围内 START。Source110 轮换到 OpenVINO GenAI、ExecuTorch/XNNPACK、llama.cpp CPU kernels、MNN-LLM 与 OpenXLA/MLIR；A5 与 Source110 双向隔离。
- A5 已 `COMPLETE_ACCEPTED__PATCH_RECOMMENDED__BACKTEST_REQUIRED`：显式 denylist 有效消除执行性重复并提高 honest valid-locator 分母，但没有改善 raw/brief yield。`EXPLICIT_PREDECESSOR_IDENTITY_DENYLIST_V1` 只登记为待独立 backtest/prospective shadow 的 proposal；当前不安装 mandatory shared 行为、不启动回测、不修改 Source110。
- Source110 已 `6/6 COMPLETE_ACCEPTED`，本轮 `0 evidence-qualified raw / 0 clean brief / 0 Stage 0 dispatch`。OpenVINO/ExecuTorch/llama.cpp CPU/MNN/OpenXLA 路线均在 current union、exact artifact/action 不足或 pre-RQ nonadmission 处收口；不作类别排除或 STOP 推断。
- 06:05 重置核验仍为 `NOT_RESET`；下一轮 Source111 将优先转向 KernelBench/TritonBench/TileLang/ThunderKittens 等公开 kernel corpus、compiler measurement 与 benchmark-validity 来源，继续使用显式 assignment-local denylist，mandatory shared proposal 仍不安装。
- Source111 六路 context/ACK 已 `6/6 ACCEPTED`，均无差异且未提前启动，现已获得 START；来源包括 KernelBench、TritonBench、TileLang、ThunderKittens、Helion 与 Liger Kernel，仍只允许公开静态 closure 和非 claim preflight，不授权构建或实验。
- Source111 已 `6/6 COMPLETE_ACCEPTED`，本轮 `0 raw / 0 clean brief / 0 Stage 0 dispatch`。KernelBench/TritonBench、TileLang、kernel corpus shape、Liger/Helion 与 target-native DSL 路线均在 current union、缺 exact artifact/action 或 pre-RQ nonadmission 处闭合；Source110+111 连续零 brief，下一步触发隔离 A6 并继续 Source112 VLA/multimodal rotation。
- Source112 六路与 A6 proposal-only audit 已 `7/7 ACK ACCEPTED` 并获得 START。A6 初始因简化 context 缺 claim/evidence ceiling、forbidden inputs 与 `resource_root:null` 而 REFUSE；主线机械修复后重 ACK 为 READY，旧拒绝 ACK 保留。Source112 没有机器人硬件时只允许静态 source/trace/canonical benchmark 证据，不作部署 claim。
- A6 已 `COMPLETE_ACCEPTED__NO_CHANGE`：Source110/111 都在 valid locator/RQ→raw 首次失败，主因 current union/具名来源饱和，次因 exact artifact/action/endpoint gap；explicit denylist 保持 assignment-local，mandatory shared 版本仍不安装且 A5 backtest 未启动。A6 未读或影响 Source112。
- Source112 已 `6/6 COMPLETE_ACCEPTED`，本轮 `0 raw / 0 clean brief / 0 Stage 0 dispatch`。公开 VLA 路线已覆盖 action acceleration、adaptive chunk、visual-token reuse 与 relaxed acceptance；其他 RQ 缺 same-object canonical trace、exact artifact/action 或 decision endpoint。没有机器人部署证据，不形成部署 claim、STOP 或 broad exclusion。
- Source113 六路 context/ACK 已 `6/6 ACCEPTED`，均无差异且未提前启动，现已获得 START；转向 BurstGPT、LMSYS/ShareGPT、Vidur、Mooncake trace 与 public agent trajectories。任何 trace 题必须冻结事件/session/prefix schema、反事实决策端点和 full-cost，泛化 realism 批评不准入。
- Source113 已 `6/6 COMPLETE_ACCEPTED`，本轮 `0 raw / 0 clean brief / 0 Stage 0 dispatch`。现有公开 trace 普遍不能同时冻结 arrival time、session/prefix/cache event 与固定 decision endpoint；这只证明当前 trace 对冻结 RQ 不足，不构成 serving/agent 方向或 trace family 的科学 STOP。Source112+113 连续零 brief，下一步并行触发 A7 与 Source114 performance-model/theory rotation。
- Source114 六路与 A7 proposal-only audit 已 `7/7 ACK ACCEPTED` 并获得 START。Source114 转向 Vidur、LLMCompass、GenZ、serving simulator、roofline 与 queueing/formal control；模型误差只有在改变固定系统决策且 full-cost 可闭合时才准入。
- A7 已 `COMPLETE_ACCEPTED__NO_CHANGE`：Source112 首失败为 valid locator→raw，Source113 多数更早停在 RQ/pre-RQ→valid locator；VLA/trace evidence ceiling 保持，当前具名家族及不完整 trace carrier 近期降权。A5 mandatory denylist 仍未安装、未回测，A7 未读或影响 Source114。
- Source114 已 `6/6 COMPLETE_ACCEPTED`，本轮 `0 raw / 0 clean brief / 0 Stage 0 dispatch`。当前模型/理论载体要么已由 Vidur 等 simulator 覆盖同一 estimand/decision endpoint，要么未冻结可改变决策的 exact object、units 与 guarantee；不形成 theory/model 方向 STOP。
- Source115 六路 context/ACK 已 `6/6 ACCEPTED`，均无差异且未提前启动，现已获得 START；转向 exact upstream issue/test/commit、miscompilation、regression 与 negative replication。旧 issue 或 release note 不足以证明当前缺口；必须同时核对当前文档、当前源码及默认/非默认 flags。
- Source115 已 `6/6 COMPLETE_ACCEPTED`，本轮 `0 raw / 0 clean brief / 0 Stage 0 dispatch`。所有 lane 都在 raw 前停下：当前文档、当前源码/flags、exact test/commit 与同对象 fault/negative-replication endpoint 无法同时闭合；不形成科学 STOP 或资源推断。
- Source114+115 连续两个完整六路周期均为零 brief，已按规则冻结 A8 proposal-only first-failed-conversion 审计；A8 只读 Source114/115/A7，禁止读取 Source116、联网或修改共享文件。
- Source116 已冻结为 merged patch + regression test lineage 来源轮换：从确切已合并 patch、parent/current source、changed test/benchmark 出发，再寻找当前同对象 residual。它不采用 A8 的未来输出，不改变 canonical 方法或硬门。
- A8 与 Source116 的 bootstrap-only context 修复后，7/7 新 ACK 均为 `READY`、无差异且未提前启动；主线已接受并分别放行。旧 REFUSE/失效 ACK 尽可能保留为 lane-local evidence；该修复只消除 plan/registry 整文件 hash 的自循环，不改变科学状态或权限。
- Source116 已 `6/6 COMPLETE_ACCEPTED`，本轮仍为 `0 raw / 0 clean brief / 0 Stage 0 dispatch`。merged patch/test lineage 提高了 exact locator 质量，但没有闭合 parent/current source/test/flags 与同对象 current residual；不能把已有 patch 当 novelty 或 fault 证据。
- A8 已 `COMPLETE_ACCEPTED__NO_CHANGE`：merged patch/test lineage 只保留为有界来源排序试点，不升级 admission/yield/novelty/fault 规则；A5 mandatory denylist 仍未安装、未回测。
- Source117 已冻结为公开低比特格式、量化语义与跨后端 conformance/interoperability 来源轮换，覆盖 ONNX QDQ、GGUF k-quants、torchao、ExecuTorch、OpenVINO、StableHLO/MLIR；六路 ACK 已 `6/6 READY`、无差异且无提前动作，主线已接受并放行。
- Source117 已 `6/6 COMPLETE_ACCEPTED`，本轮 `0 raw / 0 clean brief / 0 Stage 0 dispatch`。规范与实现已经暴露 per-channel/opset/contrib selector、GGUF layout、StableHLO quantize/dequantize 等边界，但没有同一自然模型/fixture、current backend pair、固定 decision endpoint 与非通用 residual 的联合闭合。
- Source116+117 连续两轮零 brief，A9 proposal-only 诊断与 Source118 已隔离冻结。Source118 转向 PyTorch Profiler/Kineto、Perfetto、公开 Nsight schema、vLLM metrics、OpenTelemetry GenAI 与 rocprofiler 的细粒度事件归因；只有能改变固定优化决策并计入 observer effect/full-cost 的题才准入。六路 Discovery ACK 已接受并启动；A9 初始 REFUSE 精确指出 Source116/117 旧 inline state 漂移，主线已机械标记 superseded，现等重 ACK。
- Source118 已 `6/6 COMPLETE_ACCEPTED`，本轮 `0 raw / 0 clean brief / 0 Stage 0 dispatch`；profiler/schema、插桩路径和部分 observer-effect 合同可定位，但没有 canonical workload/public trace、固定 optimization decision endpoint、fair current attribution comparator 与 full-cost 的联合 packet。
- A9 重 ACK 已接受并在 proposal-only 隔离边界内收尾；停止信号不粗暴中断其 handoff。A9 完成后只做机械验收与 lane 回 `IDLE_REUSABLE`，不再派 successor。
- A9 已 `COMPLETE_ACCEPTED__NO_CHANGE`：exact-carrier tuple 保留为 identity/closure-quality 工具，但降级为 raw/brief yield 干预；merged-patch ordering 与 low-bit conformance 仅保留战略/排序价值，当前具名 carrier 近期降权。无 shared patch，A5 backtest 仍未启动。
- `CRFEPOCH-HBMPIM-LLM-GEMV-REV0` 保持 Stage 0 `BELOW_Q2_STOP` 终态，Source107 只读 registry identity hold，不读其 Stage 0 输出或聊天。

## 当前 lane 看板

| lane | thread | 状态 | assignment / context | 下一动作或门 |
|---|---|---|---|---|
| `MAINLINE` | `01a02e08-06de-7281-89ab-eb4965cccc92` | `ACTIVE__CONTINUOUS_PIPELINE_CONTROL` | 当前控制会话 | 跟踪六路 handoff；clean brief 到达即连续路由下游 |
| `RULE_AUDIT` | `01a02e08-0b16-7ed2-bfc4-f37b5ad86992` | `COMPLETE_ACCEPTED__NO_CHANGE__IDLE_REUSABLE` | `RULE-AUDIT-20260824-SOURCE116-117-PATCH-CONFORMANCE-A9`; `stages/rule-audit/RULE-AUDIT-20260824-SOURCE116-117-PATCH-CONFORMANCE-A9/handoff.yaml` | 无 shared patch；successor 已停止 |
| `DISCOVERY-S1` | `01a02e08-0dca-7291-9b4c-ae4e2720c9a3` | `COMPLETE_ACCEPTED__ZERO_BRIEF__IDLE_REUSABLE` | `DISCOVERY-S1-20260824-SOURCE118-PROFILER-TELEMETRY-ATTRIBUTION-V1`; `stages/discovery/round-20260824-strategy-source118/S1-boundary-contradiction/handoff.yaml` | reset 已确认；停止 successor dispatch |
| `DISCOVERY-S2` | `01a02e08-1076-7df0-83cf-74b2844a3507` | `COMPLETE_ACCEPTED__ZERO_BRIEF__IDLE_REUSABLE` | `DISCOVERY-S2-20260824-SOURCE118-PROFILER-TELEMETRY-ATTRIBUTION-V1`; `stages/discovery/round-20260824-strategy-source118/S2-bottleneck-transfer/handoff.yaml` | reset 已确认；停止 successor dispatch |
| `DISCOVERY-S3` | `01a02e08-1344-7ce2-8f95-85d13a47ffa1` | `COMPLETE_ACCEPTED__ZERO_BRIEF__IDLE_REUSABLE` | `DISCOVERY-S3-20260824-SOURCE118-PROFILER-TELEMETRY-ATTRIBUTION-V1`; `stages/discovery/round-20260824-strategy-source118/S3-natural-structure/handoff.yaml` | reset 已确认；停止 successor dispatch |
| `DISCOVERY-S4` | `01a02e08-1606-71b0-89d9-3fc204478b08` | `COMPLETE_ACCEPTED__ZERO_BRIEF__IDLE_REUSABLE` | `DISCOVERY-S4-20260824-SOURCE118-PROFILER-TELEMETRY-ATTRIBUTION-V1`; `stages/discovery/round-20260824-strategy-source118/S4-objective-constraint/handoff.yaml` | reset 已确认；停止 successor dispatch |
| `DISCOVERY-S5` | `01a02e0a-e6cf-7051-adc8-514d53e55549` | `COMPLETE_ACCEPTED__ZERO_BRIEF__IDLE_REUSABLE` | `DISCOVERY-S5-20260824-SOURCE118-PROFILER-TELEMETRY-ATTRIBUTION-V1`; `stages/discovery/round-20260824-strategy-source118/S5-scale-online-approx/handoff.yaml` | reset 已确认；停止 successor dispatch |
| `DISCOVERY-S6` | `01a02e0a-eb25-73f3-9e8f-938e9e4c81a9` | `COMPLETE_ACCEPTED__ZERO_BRIEF__IDLE_REUSABLE` | `DISCOVERY-S6-20260824-SOURCE118-PROFILER-TELEMETRY-ATTRIBUTION-V1`; `stages/discovery/round-20260824-strategy-source118/S6-direct-algorithm-software/handoff.yaml` | reset 已确认；停止 successor dispatch |
| `MEASUREMENT-M1` | `01a02e0b-b1d1-76c1-96fa-9351d6d80066` | `IDLE_REUSABLE` | 无 active assignment | 只按后续周期或明确测量触发运行 |
| `STAGE0-PRIMARY` | `01a02e0b-b609-7202-bda9-a2e8b08794b6` | `COMPLETE_ACCEPTED__STOP__IDLE_REUSABLE` | `STAGE0-PRIMARY-20260824-CRFEPOCH-HBMPIM-LLM-GEMV-REV0`; `stages/stage0/_reviews/source105-crfepoch-hbmpim-llm-gemv-rev0/primary/handoff.yaml` | `BELOW_Q2_STOP`，fixed six-command program→routine hoist；不进入 SENTRY/Stage A |
| `STAGE0-SENTRY` | `01a02e0b-eb8d-7c90-afb0-ac52bd0548ad` | `IDLE_REUSABLE` | 无 active assignment | 只接收 primary PASS/REVISE confirmation 包，不预读 |
| `CANDIDATE-L1` | `01a02e0c-2a04-7063-b397-c3cf8970b9f9` | `BLOCKED_USER_ACTION_REQUIRED__QREFINE_REBOOT_PENDING` | 原冻结 QRefine Stage A | 等已批准协调重启；不占新题 WIP |
| `CANDIDATE-L2` | `01a02e0d-74ca-78c2-b027-83b0335c35e3` | `IDLE_REUSABLE` | 无 active assignment | 首个独立 Stage 0 PASS 且资源 ready 后接收 Stage A |
| `CANDIDATE-L3` | `01a02e0e-45b3-76b3-9257-07a736fae7d8` | `BLOCKED_USER_ACTION_REQUIRED__V8_WINDOWS_CXX_SDK` | 原冻结 V8 Stage A | 等 Windows C++/SDK 或精确新授权；不占新题 WIP |
| `STAGEA-GATE` | `01a02e0e-8490-72d1-96c1-48354804e8ca` | `IDLE_REUSABLE` | 无 active assignment | 等候 Stage A owner handoff 后独立审查 |
| `STAGEB-REVIEW` | `01a02e0f-c147-7ae3-8df9-3d45405f72e1` | `DORMANT__NOT_AUTHORIZED` | 无 | 保持 dormant；持续授权不包含 Stage B |
| `BACKTEST-PACKER/EXECUTOR/AUDITOR` | 三个既有长期 thread | `DORMANT__NO_APPROVED_BACKTEST` | 无 | P1 未获 backtest assignment，保持三角色隔离 dormant |

## 下游连续路由

1. 每个 Discovery handoff 到达后，主线做一次风险相称的机械验收；clean brief 立即进入 Stage 0 PRIMARY，不等待六路全部结束。
2. Stage 0 PRIMARY 的 PASS/REVISE 必须交给 SENTRY 独立确认；direct fatal 与科学 STOP 仍按原规则登记，不用一次修补规则挽救。
3. 独立 Stage 0 PASS 且资源 ready 后，投递空闲 candidate lane；首次 claim-bearing observation 前必须过 `PRE_CLAIM_CONTRACT_FIDELITY_GATE`。
4. Candidate owner 结果必须交给未参与实现的 Stage A gate；只有独立 gate PASS 才累计为 `1/5` 目标进度并停在 `PENDING_USER_STAGEB_REVIEW`。
5. 本持续授权不包含 Stage B、正式项目、大规模资源、系统安装、课题组仓库修改或外部通信。

## 保留 blocker 与不变量

- 09:05 用量监控已确认 full reset：Tibo 落地公告、global-reset tracker 完成、账户周额度 99%；未使用 banked reset。successor Discovery 已停止，当前 A9 仅做已启动 handoff 收口。
- QNN 题保持 `BLOCKED_USER_ACTION_REQUIRED`：缺设备、运行时、成对 512/4096 产物及只读接口材料；释放 S1 做 Source103 不改变该题状态或恢复点。
- QRefine 与 V8 保持原 Stage A blocker；没有新的 claim-bearing observation，scientific revision 不因等待而消耗。
- P0 `ATOMIC_REPAIR_TRACE_V1` 仍只是 optional、non-decisional `SHADOW`；P1 mandatory 行为未安装、未回测。
- 既有 STOP、DROP、terminal identity 不复活；新对象或新研究问题使用新 ID。
- 会话迁移保持 `OPERATIONALLY_COMPLETE`；只给 Source107 六路生成新 context/ACK，不触发其余长期 lane 重新 ACK。

## 存储清理清单与执行状态

- RULE_AUDIT 已完成 `RULE-AUDIT-20260824-STORAGE-CLEANUP-INVENTORY-D1`，MAINLINE 机械验收 3/3 manifest 通过；没有删除、移动、压缩或修改候选/科学状态。
- 清理前初始项目约 `41.17 GB`、`stages/` 1,019,083 files；四轮精确删除、最小 evidence pack 与根路径异常隔离后 `stages/` 为 `77,102 files / 5,233,771,245 bytes`，D 盘空闲约 `318.079 GiB`，已进入数万文件级。
- RULE_AUDIT 原始 pre-delete review pool 为 `13,747,115,994 bytes`，只作审计基线；实际三轮均由 MAINLINE 在独立执行 assignment 中重新量化、冻结保留包并机械校验。
- blocked、reserve、pending gate 默认仍为 `DO_NOT_TOUCH_NONTERMINAL`。Wave 3 是用户对 CVC5/Occupancy 两题精确叶目录的题目级例外授权，只允许存储压缩，不允许解除 blocker、运行科研或改变状态。
- canonical report/results/handoff/manifest、关键日志、witness、inventory/provenance 与最新 exact recovery entry 保持默认保留；后续任何进一步清理仍需新的精确 leaf target 与证据依赖检查。

### D1 Wave 1 已批准并执行

- 用户已批准精确 leaf target、预计回收量、恢复方式及证据保留包；MAINLINE 将批准有界解释为四个无歧义 `DELETE_CANDIDATE_REBUILDABLE` build leaf，不包含 downloads/source/toolchain/assets/dedup/archive 或任何非终态题目。
- 已删除 RISCV ZCMP `resume1/b`、LLVM DWARF `resume1/build`、WebGraph initial `build` 与 revision1 `build`，合计逻辑回收 `7,084,221,562 bytes`（约 6.60 GiB，13,102 files）。
- 删除前四个路径均通过 literal absolute path、workspace boundary、fresh bytes/files、zero reparse、zero active heavy process 与 evidence-package hash 检查；删除后目标 4/4 absent，topic roots 4/4 present。
- canonical reports/results/handoff/historical manifests/provenance/reproduce/minimum witness 全部保留，抽查关键 SHA-256 无漂移。历史 manifests 中原 build entries 作为 pre-delete identity/rebuild record 保留，授权缺失由 cleanup execution ledger 解释。
- D 盘 post-delete 空闲约 `290.282 GiB`。其余 pre-delete review pool 尚未获本 wave 删除授权，继续保持不动。

### D1 Wave 2 STOP-only 清理已执行

- 用户要求删除 STOP 题目的非报告内容并去重；MAINLINE 依照科学证据硬门，保留 report/results/handoff/historical manifest、关键日志、reproduce、最小 witness、runs/corpus/inputs、inventory/provenance，只删除 16 个可重建 expanded source/toolchain/download/bin/work leaf。
- Wave 2 删除 `548,008 files`、逻辑回收 `14,094,392,859 bytes`（约 13.13 GiB）；16/16 target absent、8/8 topic roots present、关键证据哈希抽查 7/7 无漂移。
- Wave 1+2 累计删除 `561,110 files`、逻辑回收 `21,178,614,421 bytes`（约 19.72 GiB）。`stages/` 从 1,019,083 降至 457,986 files；D 盘空闲约 `304.358 GiB`。
- 不能仅靠 STOP 清理降至数万：CVC5 与 S5 Occupancy 两个 blocked topic 合计 368,125 files，占当前 Stage A 的 82.9%，按规则不得删除。所有 blocked/reserve/pending/state-ambiguity topic 均未触碰。
- LLVM DWARF musl/blink resources、FlatBuffers sources、Arrow assets 因证据/依赖边界未完全闭合而继续保留；历史 manifests 中被授权删除的 rebuildable entries 作为 pre-delete identity/rebuild record 保留。

### D1 Wave 3 两个非终态题目压缩已执行

- 用户明确批准按已说明方案先清理、暂不解除阻塞。MAINLINE 冻结 39 个 CVC5/Occupancy superseded 或 rebuildable 资源叶目录；39/39 literal path 位于两个题目根下、0 root/descendant reparse、0 相关活跃进程。
- 删除前复核发现 CVC5 最新 `resources/build` 含需保留的 smoke executable，目标已安全收窄为 inventory 明确标记可删的 `build/carcara-target`；`resources/src`、pinned Cargo cache、relay/env/logs 与 smoke executable 原位保留。
- Wave 3 删除 `356,723 files / 13,754,691,459 bytes`。CVC5 从 160,844 降至 9,144 files；Occupancy 从 207,281 降至 2,258 files。39/39 targets absent，13/13 关键文件哈希不变，6/6 recovery directories 与 2/2 topic roots 保留。
- Occupancy `resume3-r3d/verified` exact tools 和整个 `resume4-safe-recovery/resources`（8 MIR/sysroot/preclaim evidence）保留；两个题目的科学/候选状态与 blocker 均未改变，也未运行下载、构建、实验或 queue。
- Wave 1–3 累计删除 `917,833 files / 34,933,305,880 bytes`。删除内容不能项目内直接 undelete，需要时按保留 identity、inventory、日志和恢复合同重新获取或构建。

### 项目根压扁路径异常已隔离

- 用户点名的 `projectwritingeserchstagesdiscovery...RQ_CANDIDATE_S4-112-RQ05.md` 属于 Windows 路径转义/拼接失败后落在项目根的压扁文件，不是合法目录，也不是 rule。项目根共发现 24 个同类文件、13,173 bytes；24/24 均有正确 canonical counterpart，且没有 shared/canonical 文本引用。
- 3 个与 canonical 完全相同，21 个是更早的短版/部分版本。为保留失败写入证据而不污染项目根，24 个全部移动到 `stages/control/root-path-anomaly-quarantine-20260824-P1/quarantine/`；原路径 24/24 absent、归档哈希 24/24 一致、canonical 哈希 24/24 不变。
- 项目根现在只保留 `AGENTS.md / plan.md / registry.yaml / history.md` 四个共享文件及规范目录。Discovery 的 canonical Markdown 继续留在 `stages/discovery/`，不迁入 `rules/`；5,829 个 Markdown 合计仅约 9.84 MiB，不是当前空间主因。
- 大于等于 1 MiB 文件只读去重扫描发现 306 个 exact-duplicate groups，逻辑重复上限约 `1,536,805,890 bytes`。主要来自 PARQUET pending-gate replay、reserve toolchain、STOP 结果证据和 sealed backtest；当前未删除、硬链接或改路径。后续若继续，优先另冻 terminal evidence-pack compaction，不触碰 pending/reserve/blocked。

### D1 Wave 4 终态 evidence-pack 压缩已执行

- 用户批准 Arrow、LLVM、WebGraph 等终态 STOP 题先制作最小不可变 evidence pack，再删除重复输入和 expanded result copies。范围冻结为 Arrow IPC、LLVM Bitcode、LLVM DWARF、WebGraph 四题；39 个精确目标、24,426 files、1,025,354,509 bytes，0 reparse、0 相关活跃进程。
- 删除前物理生成 `evidence_pack/`：212 files、21,173,118 bytes；四题 tree digest 4/4 复算一致。pack 覆盖最终 owner/gate 结论、Bitcode 自然汇总与 witness、DWARF natural/full-cost/provenance、WebGraph pair-00/case-0043/matched aggregates、Arrow 两阶段终态记录。
- 已删除 Arrow 展开依赖与 revision 重复自然输入、Bitcode 380 MB 派生 corpus、DWARF 下载归档与终态 build/cache/tmp、WebGraph 结构域展开输出/preclaim 副本及两 corpus 的 pair-01..10。39/39 targets absent，16/16 关键原位证据哈希不变，pack 4/4 digest 不变，4/4 题目根保留。
- Wave 4 回收 `1,025,354,509 bytes / 24,426 files`。四轮累计删除 `35,958,660,389 bytes / 942,259 files`；科学终态、rules/templates/contexts 与所有非终态题均未改变。
