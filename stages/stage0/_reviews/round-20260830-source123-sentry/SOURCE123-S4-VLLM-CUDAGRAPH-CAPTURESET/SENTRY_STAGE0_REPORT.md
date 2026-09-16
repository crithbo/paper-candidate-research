# SOURCE123-S4-VLLM-CUDAGRAPH-CAPTURESET — Stage 0 SENTRY Report

## 结论摘要

- SENTRY disposition：`CONFIRM`。
- Scientific verdict：`PASS_RECOMMENDED`。
- Quality tier：`TIER_B_Q2_VIABLE`，不支持 `TIER_A_Q1_POTENTIAL`。
- Operational disposition：当前 Stage 0 为 `NONE`；未来若进入 Stage A，原生执行仍是 `BLOCKED_USER_ACTION_REQUIRED`，因为 vLLM 官方 GPU 路线要求 Linux、且不原生支持 Windows。这一资源门既不证明科学 PASS，也不构成科学 STOP。
- Evidence ceiling：`CURRENT_OFFICIAL_SOURCE_AND_PRIMARY_SYSTEMS_EVIDENCE__ZERO_CANDIDATE_RESULT`。
- 搜索/打开预算：`15/16`；build、experiment、implementation、Stage A、Stage B、shared write 均为 `0`。
- 永久隔离：未打开被排除第二题的 context、brief、report、handoff、manifest 或其他 scientific inputs，也不对其作任何推断。

本结论确认的是条件性论文形状，而不是候选性能。Plain ordered-subset DP、knapsack 或按频率挑 capture sizes 本身属于 generic collapse；只有 vLLM-native legality/cost、graph-memory→KV-capacity、有限 horizon、held-out stability 与可重放集成工具共同产生、且胜过 generic comparator，才保留二区贡献。

## 1. Exact object、版本与 native semantics

冻结对象是 vLLM `v0.28.0`、commit `2cf0a69` 的 V1 single-GPU serving configuration，动作只改变 `CompilationConfig.cudagraph_capture_sizes` 的合法有序子集，不改变模型、request/sampling/output semantics、scheduler、CUDA Graph mode、LoRA/speculation 配置或 `CudagraphDispatcher`。官方 release 页面将 v0.28.0 直接钉到 `2cf0a69`（[vLLM v0.28.0 release](https://github.com/vllm-project/vllm/releases/tag/v0.28.0)）。

独立源码核验得到：

1. `CompilationConfig` 明确暴露 CUDA Graph mode、capture sizes、max size、warmups、copy-input、compile sizes 和 graph partition 等配置；manual `cudagraph_capture_sizes` 会覆盖默认生成逻辑（[v0.28.0 compilation.py](https://github.com/vllm-project/vllm/blob/v0.28.0/vllm/config/compilation.py)）。
2. `_set_cudagraph_sizes` 的 balanced/throughput 路线使用 `[1,2,4]`、8-step 到 256、再 16-step 到上限；`performance_mode=interactivity` 则先捕获 `1..min(max,32)` 的每个 size，再接同一后续网格。它是必须纳入的 current native baseline，而不是候选新动作（[v0.28.0 vllm.py](https://github.com/vllm-project/vllm/blob/v0.28.0/vllm/config/vllm.py#L1740-L1899)）。
3. dispatcher 将 token 数映射到不小于它的最近 capture size；超过 max、CUDA Graph disabled、mode 不合法或找不到匹配 key 时返回 `CUDAGraphMode.NONE`。FULL/PIECEWISE key、uniform decode、LoRA multiplicity 与允许/禁止 mode 都参与合法性（[v0.28.0 cudagraph_dispatcher.py](https://github.com/vllm-project/vllm/blob/v0.28.0/vllm/v1/cudagraph_dispatcher.py)）。
4. `enforce_eager` 会关闭 CUDA Graph 并清空 sizes；speculative token 与 sequence-parallel rounding/filtering 会改变可用 capture sizes。候选不得绕过这些 native semantics。

因此 exact object 与 action 可定义，且“输出一个合法 config list、保持 dispatcher 不变”的 same-function 合同成立。

## 2. Current union 与 `performance_mode` baseline

当前 same-object union 至少包括：

- v0.28.0 balanced 默认网格、throughput mode、manual override、max-size cap；
- `performance_mode=interactivity` 的 1–32 dense capture；
- `FULL / PIECEWISE / FULL_DECODE_ONLY / FULL_AND_PIECEWISE / NONE`；
- upward padding、无 key/超上限 eager fallback；
- LoRA specialization、uniform decode、speculative decoding、sequence parallelism 与 attention-backend legality；
- `enforce_eager`、warmups、copy-input、compile-size 与 graph-partition controls；
- multimodal encoder 的 budget-based capture manager，但它处理 encoder token budgets，是不同 exact object，不能直接覆盖本题 text-backbone V1 dispatcher action。

官方仓库的反证搜索只找到 manual/inferred grids、logging/statistics、不同对象的 multimodal budget manager，以及 current CUDA Graph modes；没有找到 v0.28.0 text-backbone dispatcher 上用冻结 calibration trace、在 startup+graph-memory 双预算下自动选择 capture portfolio 并对 held-out finite horizon 计完整成本的 integrated selector。该 absence 仅标为 `SEARCH_BOUNDED_OPEN`，不作 global-first 声明。

## 3. 最强相邻工作与 direct-fatal audit

### 3.1 决定性 subtraction

- vLLM Lazy CUDA Graph RFC 指出默认会捕获 67 个图、可能花费超过 10 秒且许多图不会使用；其动作是在首次命中 runtime shape 时 lazy capture，且 issue 已 `Closed as not planned`。它改变在线 capture 时点，不是冻结 calibration 后的 pre-serving portfolio selector（[RFC #20098](https://github.com/vllm-project/vllm/issues/20098)）。
- Medusa 在离线阶段 materialize KV-cache initialization 与 35 个 CUDA Graph，在线恢复；它报告 ShareGPT trace，并明确 lazy capture 只是把 capture latency 分散到请求上。它攻击 restoration/materialization，不选择 no-archive 部署中的 budgeted subset（[Medusa, ASPLOS 2025](https://minhui-xie.github.io/papers/asplos25-medusa.pdf)）。
- Foundry 把 graph topology 和 execution context 离线持久化，并以 deterministic memory layout、kernel binary reload 与 topology template 重建图；它覆盖 15 个配置/三类模型，并能把 512 个图压缩到 12–25 个 topology templates。它是最强 conditional system baseline，但要求 offline archive/context materialization，信息与部署假设不同（[Foundry, arXiv:2604.06664](https://arxiv.org/abs/2604.06664)）。
- TensorRT-LLM 官方研究已经系统比较 x2、+64、+8 固定 grids，展示 padding、graph metadata memory、KV capacity、throughput 和 startup 的真实权衡；其 future work 明确提出“解析 serving logs 自动计算最佳 graph sizes”。这强烈收窄 novelty，但仍是未来工作而非当前 implemented vLLM selector（[TensorRT-LLM study](https://nvidia.github.io/TensorRT-LLM/1.3.0rc14/blogs/tech_blog/blog20_Tuning_CUDA_Graph_Batch_Sizes_for_Higher_Output_Throughput.html)）。
- 一维/顺序约束的 optimal clustering/segmentation 早已有多项式动态规划。因此“有序点开设 + 向上分配 + opening/assignment cost”的 plain DP 不能形成论文贡献（[R Journal sequential DP](https://journal.r-project.org/articles/RJ-2016-022/)）。

### 3.2 八谓词判断

| Direct-coverage predicate | 结论 | 理由 |
|---|---|---|
| Same object/function/protocol | 部分满足 | v0.28.0 native config/dispatcher 是 exact object；Medusa/Foundry/TRT-LLM 不是同一冻结对象。 |
| Same scenario/workload | 未满足 | 相邻工作未冻结同一 calibration/chronological held-out finite horizon。 |
| Same or weaker information | 未满足 | native grid 无 trace；lazy 用 first-use；materialization 用 offline archive；候选只用冻结 calibration。 |
| Atomic action covered | 未满足 | manual config 暴露动作，但没有 inspected implementation 自动解 dual-budget trace-conditioned subset。 |
| Same/stronger legality and guarantee | 部分满足 | native semantics 最强；外部系统改变 archive/restoration 或 runtime assumptions。 |
| Same non-worse full-cost endpoint | 未满足 | TRT-LLM 最接近，但不是 vLLM held-out finite-horizon integrated selector；Foundry 改变 startup 假设。 |
| Comparable scale/platform/version | 部分满足 | exact v0.28.0 可定位；外部研究多为不同 engine/version 和大型 GPU。 |
| Sufficient read depth | 满足 | exact source、官方 issue/blog、Medusa/Foundry 全文或实现说明均已核验。 |

`DIRECT_FATAL=false`。manual expressibility、future-work sentence 或不可部署 union 不能替代相同信息、动作、保证与 full-cost 的实现证据。

## 4. Generic-collapse gate 与残余贡献

最强反对意见是：本题很可能只是把经典一维 ordered facility/segmentation DP 包在 vLLM 参数调优外壳里；TensorRT-LLM 又已公开相同 padding—memory—startup tradeoff，并直接建议未来 log-based tuner。若候选只用 descriptor frequency 和 per-size opening cost，或只输出一个更稀疏 list，则应判 `BELOW_Q2_STOP`。

当前仍允许 Tier B 的唯一原因是一个有限、可证伪的 target-native residual：

- legality state 必须覆盖 FULL/PIECEWISE、LoRA、uniform decode、speculation/SP 与 eager fallback；
- cost model 必须把 graph metadata/residency 映射到 KV-capacity 和并发损失；
- objective 必须从 profiling/capture 之前开始，到预登记 held-out service horizon 结束；
- selector 必须 result-independent，并在 chronological model/trace holdout 上稳定；
- 集成工具必须保持 native outputs/dispatcher semantics；
- target-native policy 必须胜过同预算 frequency/top-k 与只含 generic ordered-DP 特征的 comparator。

这些条件在 Stage 0 具有有限闭合路线，不要求现在已有正结果；但任何一项无法闭合都应在 Stage A killer 处结束本题。

## 5. Strongest baselines 与公平性

最低公平 baseline union：

1. vLLM v0.28.0 balanced default；
2. `performance_mode=interactivity`；
3. throughput mode；
4. manual memory-saving grid、同 cardinality 与同 measured graph-memory uniform grids；
5. `enforce_eager`；
6. 同预算 frequency/top-k；
7. 只使用 descriptor frequency/opening cost 的 generic ordered DP；
8. source-pinned lazy RFC implementation（若能 faithful 实现，否则报告为 unavailable，不模拟）；
9. TensorRT-LLM x2/+64/+8 只在 legality 可同构时作为 translated fixed-grid baseline；
10. Medusa/Foundry 在其 offline archive/deterministic-address 假设成立时作为 conditional stronger system baselines；
11. 小域 exhaustive subset oracle 仅作 ceiling，不是 deployable comparator。

所有可部署 policy 必须使用相同 model、request order、sampling/output、scheduler、CUDA Graph mode、LoRA/speculation、cache temperature、horizon 和失败分母。不得把 Foundry、offline oracle 与其他组件拼成现实中不可部署的 universal union。

## 6. Full-cost 与 Q2 breadth

Full-cost ledger 至少包括：observer/profiler、selector、warmup/capture、dry-run 与 live capture、server-ready wall time、graph count、metadata/resident memory、KV-capacity/concurrency loss、padding compute、eager fallback、TTFT/TPOT/ITL/P99、throughput、storage/archive（适用时）、OOM/失败与 exact finite horizon。TensorRT-LLM 已显示更多 graphs 会线性增加 capture phase、占用额外 GPU memory 并压缩 KV cache，因此只报 replay throughput 属于无效分母。

可信 Q2 最低形状：至少 8 个公开模型、3 个 architecture/model families；BurstGPT 加一个 official canonical carrier；至少 3 个预登记 horizons、3 个 startup/graph-memory budget regimes；positive 与 negative regimes；chronological trace holdout 与 model holdout；完整 native/simple/conditional-system/oracle baselines；重复 raw metrics、exact config/commit/model/trace hashes 与可重放 artifact。vLLM benchmark CLI 明确支持 BurstGPT，提供了自然载体入口（[vLLM Benchmark CLI](https://docs.vllm.ai/en/stable/benchmarking/cli/)）。

该 breadth 足以支持 `TIER_B_Q2_VIABLE`；单张 GPU 不支持跨 GPU architecture 或生产规模外推，所以当前不支持 Q1。

## 7. Stage A killer

在任何 claim-bearing run 前必须通过 fidelity gate：exact `2cf0a69`、真实 `CudagraphDispatcher`、真实 capture descriptors、合法性 checker、hook-off/hook-on process control、完整成本单位与一个 exhaustive `1..64` small witness。

首个高信息 probe：一个可公开获得的小模型、一张获批 Linux/CUDA GPU、两个预登记 startup/graph-memory budgets、一个 chronological calibration/held-out split；比较 balanced、interactivity、throughput、manual `[1,2,4,8,16]`、eager、equal-budget frequency、generic ordered DP 与 exhaustive oracle。

任一条件触发 kill：

1. 所有预登记 cell 中，候选相对每个可部署强 baseline 都没有至少 5% cumulative full-cost 优势；
2. native/interactivity/frequency/generic-DP 在全部 cell 中均距 exhaustive frontier 不超过 5%；
3. target-native features 相对 generic DP 没有增益；
4. held-out window 反转、需要结果后选择 trace/cell，或 gains 只来自分母重定义；
5. graph memory→KV capacity、profiling、capture、server-ready 或 failure cost 计入后优势消失；
6. outputs、request semantics、scheduler 或 dispatcher legality 发生任何改变。

正结果最高只支持 `PRELIMINARY_NON_FALSIFICATION`，不能直接证明论文主 claim。

## 8. Linux/CUDA resource—science separation

vLLM 官方 GPU 安装要求写明 OS 为 Linux，并说明 Windows 不受原生支持；WSL 或 community fork 是替代路线（[official vLLM GPU requirements](https://docs.vllm.ai/en/latest/getting_started/installation/gpu/)）。当前项目策略不授权假定 WSL，因此未来 native Stage A 执行需要 MAINLINE 冻结兼容 Linux/CUDA 环境或另获精确授权。

这只产生未来 `BLOCKED_USER_ACTION_REQUIRED`：

- 资源可用不证明科学 PASS；
- 资源不可用不证明科学 STOP；
- 当前 SENTRY 不请求下载、构建、实验或用户动作；
- Stage A 未获授权，scientific revision 未消耗。

## 9. 最终建议

`CONFIRM / PASS_RECOMMENDED / TIER_B_Q2_VIABLE`。

首个未闭合门不是新的 Stage 0 revision，而是未来 Stage A 的 `PRE_CLAIM_CONTRACT_FIDELITY_GATE` 与 Linux/CUDA resource gate。MAINLINE 若接受本报告，应保持候选为条件性 PASS，不得把 PRIMARY/SENTRY 的一致意见改写成性能成立；也不得在未冻结资源与 fidelity assignment 前直接实现或运行候选。

## 10. 限制与完整性声明

- 当前无 candidate implementation、benchmark result 或 claim-bearing observation。
- Latest-collision 结论为 `SEARCH_BOUNDED_OPEN`，不是穷尽或 global-first 声明。
- GitHub tag API 直接请求失败，但官方 release 页面与 tag-pinned raw source 均把 v0.28.0 锁定到 `2cf0a69`。
- 本审查由 AI 辅助完成；所有决定性事实均回到官方源码、官方文档/issue、官方技术研究或原始论文核验。
