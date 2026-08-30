# 规则审计报告：Source16 语义残差分流仍零 brief

## 1. 审计结论

建议在下一安全 assignment 边界运行一次 `PROBLEM_EVIDENCE_FIRST_DIVERSE_SOURCE_V1`，但不修改任何科学录取门，也不把“必须产出 brief”设为指标。

Source16 的零产出不是“same-object 等硬门过严”的证据。七个结构性淘汰都有当前动作并集、对象错位、通用包装或完整构造已被吸收等实质理由。真正可修的是发现前端：R21 增加了 anchor/current-union/subtractor/carrier 字段，却没有真正改变题源；六路仍主要从成熟 LLVM/MLIR、GPU 后端、运行时和 profiler 功能面出发。至少 10/36 个 raw 又是已知重复、包含变体或饱和 family，导致有限深审预算被旧对象占用。

R21 仍有正向作用。Source13/14 的深审后结构性淘汰为 17/23（73.9%），Source16 降到 7/12（58.3%）；剩余 5/12 是 `NOT_ADMITTED_UNFROZEN`，而不是科学 STOP。这说明前置语义分流减少了一部分“深挖后才发现根本不成立”的浪费，但没有解决题源独立性和可闭合证据不足。

## 2. 为什么四源分流仍然没有形成 clean brief

### 2.1 字段齐了，证据角色却没有真正分开

不少卡片用同一份第一方功能文档同时充当“机会锚点”“当前动作并集”和“最强减法器”。这能够证明产品已经做了什么，却很难证明还存在一个重要、自然且可攻击的问题。类似地，回归测试或 verifier 是正确性 oracle，不自动构成自然 workload carrier，更不能单独支持 Q2 重要性。

所以问题不是少填字段，而是缺少独立的问题证据：近期原始论文的未解限制、已有公开测量异常、形式边界、版本化自然语料或可复核的跨层失配。

### 2.2 题源仍在成熟 current union 内打转

S1–S6 的 36 个 raw 几乎都来自成熟编译器、运行时、后端和 profiler 表面。此类对象公开文档完整、实现动作丰富、回归测试密集，适合作为 current-union 减法器，却是高度饱和的机会起点。Source16 因而再次发现大量“当前系统已经有这个动作”或“只剩通用调度/包装”的结论。

这只构成对该类成熟公开工具表面的局部稀缺信号，不能外推成 GPU/NPU、算法、测量、benchmark、理论或架构协同整体缺题。

### 2.3 去重与三周期休眠没有在 raw 之前落地

审计至少识别出 10/36 个已知重复、包含变体或已饱和 family。Source16 的 assignment 本来要求避开 Source15、历史对象和活动题，但执行中仍重新纳入 AMDGPU/NPU ordering、TensorRT、多个 profiler、CUTLASS/XLA/OpenVINO、MLIR ArmSME 等身份。

休眠应是调度去重，不是科学结论；但若不在 raw 计数之前执行，就会反复消费相同证据缺口。

### 2.4 同对象门没有错，门的位置有偏差

R21 原意是在浅层冻结 same-object witness skeleton，在 brief 前补齐完整原子动作。Source16 的部分 lane 却在 D1 前要求“两套完整合法计划”“两个完整输出”或“两套 native legal plans”。这把一部分应在 Discovery 深审/brief 阶段闭合的内容前移，可能错过“问题已清楚、同对象骨架成立、但完整构造尚待有限闭合”的题。

不能因此放松 same-object。正确调整是：raw 只证明同对象义务和分离张力；D1 证明 witness skeleton 与有限闭合路径；clean brief 才冻结完整动作、同类型公平比较器、自然 carrier、full-cost 和最小 falsifier。Stage 0 再独立审查新颖性与论文形状。

### 2.5 深审分配与执行纪律不一致

六路机械地各做两条深审，没有任何 lane 使用第三深度。S4 报告零个 pre-outcome D1，却仍做了两条深审；S1 有两个 raw 行没有最终 disposition 映射；S6 汇总的结构性淘汰数与明细不一致。这些不是科学问题，但会使“为什么零产出”不可精确归因，也会浪费深度。

## 3. 下一轮六路有界题源方案

只运行一个完整六路周期。六个长期 lane 和并行上限不变；每路最多侦察 8 个轻量 locator，在 raw 计数前完成身份、活动状态和休眠检查，最多接纳 6 个全新 raw。全局 raw 上限仍为 36；没有足够新题时允许少于 6，不得用重复对象补数。

深审总上限仍为 12，但预先改为 S1=1、S2=2、S3=2、S4=3、S5=2、S6=2。每一条实际深审都必须先满足 pre-outcome `D1_ATTACKABLE`；若某路不足，容量留空，不按结果跨路补位。S4 只有在事先形成三条 D1 时才可使用第三条。

| Lane | raw≤6 的问题证据优先组合 | 深审上限 |
|---|---|---:|
| S1 | 2 个 GPU/NPU 编译器—运行时—硬件契约矛盾；2 个 LLVM 单一生态之外的跨版本语义变化；1 个带公开 conformance oracle 的架构/ABI 边界；1 个复制失败或一致性失配 | 1 |
| S2 | 2 个由近期测量/论文证据锚定的数据移动、互连、DMA 或 host-device 瓶颈；2 个有自然 workload 的编译器—运行时—架构 full-cost 瓶颈；1 个有公开模拟器/分析模型的 NDP/PIM/加速器协同；1 个非加速器系统瓶颈算法 | 2 |
| S3 | 3 个先冻结 carrier、后寻找机制的 checksum/version 固定自然语料或 trace；2 个 GPU/NPU workload、operator、shape 或 phase 演化历史；1 个跨平台/跨编译器版本演化语料 | 2 |
| S4 | 2 个由已有实证或 benchmark log 锚定的测量有效性/干扰问题；2 个公开版本化提交上的覆盖或排名稳定性缺口；1 个复制/负面刻画；1 个 GPU/NPU 能耗、尾延迟或 host overhead 的 full-cost 刻画 | 3 |
| S5 | 2 个带 canonical instance family 和 stock checker 的 target-specific 理论/形式问题；2 个带公开模型/模拟器和自然 workload 的架构协同或近似问题；1 个非编译器 online/recourse 问题；1 个仅在论文 artifact 未含完整构造且 current union 未表达时接纳的编译器/加速器问题 | 2 |
| S6 | 2 个由近期论文限制及公开 I/O artifact 锚定的 GPU/NPU 直接算法；1 个架构数据移动/放置协同；2 个饱和编译器后端之外的通用算法、数据结构或系统实现原则；1 个带可执行 checker 的理论构造 | 2 |

表内数量是题源配比指引和上限内构成，不是录取或提案配额；某一类型找不到合格对象时允许空缺。

本轮把成熟 LLVM/MLIR/OpenXLA/TensorRT/OpenVINO/CUTLASS 和现有 profiler 功能面降为减法器/比较器，而不是主要机会来源。S1、S2、S5、S6 每路最多允许 1 个此类表面作为 primary origin；S3、S4 必须从自然 carrier 或问题证据出发。这不排斥真正由新版本、新论文或新公开 carrier 触发的外部变化。

S4 必须保留 `MEASUREMENT_CHARACTERIZATION` 和 `BENCHMARK_DATASET` 的独立入口，不要求附着在新机制上。S5/S6 明确排除通用 formal wrapper、通用 scheduling/layout/packing/solver 包装，以及论文 artifact 已经拥有完整构造的题。

## 4. 证据字段与阶段边界

下一轮每个卡片分别记录：

1. `problem_bearing_opportunity_anchor`：近期原始论文/公开 artifact 的限制、版本化测量异常、形式边界，或带自然后果的当前语义分歧；
2. `current_native_union`：冻结日期附近官方文档、源码、默认与非默认开关表达的动作并集；
3. `strongest_independent_subtractor`：能直接吸收或反驳 residual 的最强独立证据；
4. `versioned_natural_carrier`：可版本化、可复核的自然对象、语料、trace、workload 或 benchmark population；
5. `stock_correctness_or_semantic_oracle`：checker、verifier、回归测试或原生语义 oracle。

测试套件只能充当 oracle，不能独自替代自然 carrier。纯功能/API/backend 文档不能同时充当机会锚点，除非其中包含可复核的实际失效、测量或有效性证据。

Discovery 应交付的是可证伪且可闭合的研究合同，不是实现和结果：

- 方法/编译器：D1 需 same-object witness skeleton、可能 residual 和有限源码闭合路线；
- 架构：固定 workload、精度、容量和技术边界，给出机制比较草图与证据 ceiling，不要求 RTL 或结果；
- 测量/benchmark：固定 carrier、estimand、独立 comparator、后果与 falsifier；
- 理论：固定问题、信息/复杂度模型、已知界和分离实例族。

clean brief 再补齐完整原子动作、类型适配的公平 comparator、有界 current-union/genealogy、自然 carrier、full-cost 与 fidelity plan。Stage 0 独立决定 Q1/Q2 潜力、最新碰撞和可修复缺口。不得因为尚未实现或尚无核心结果在 Discovery 淘汰。

## 5. carry-forward 与三周期休眠的机械规则

family/facet 身份键固定为：`exact object + research question + invariant guarantee + missing/residual facet`。

- 首次 `NOT_ADMITTED_UNFROZEN` 只能获得一次预登记的 source-only closure；
- 同一 facet 再次缺失后，记为 `DORMANT_SOURCE_SATURATED_UNFROZEN`，跳过三个完整六路周期；它不是 STOP、reserve 或候选正式状态；
- 只有在 raw 接纳前记录外部 delta 才能提前重入：旧 cutoff 后的新官方 release/tag/commit 改变动作并集、新独立原始论文/artifact、新公开自然 carrier/oracle/checker，或用户/主线明确的题目级授权；
- 重复同一限制的论文、后端改名或无动作变化的文档更新不重置计数；
- 重入时保留旧 ledger，只允许一次新的有界 closure；再次缺同一 facet 后重新开始三周期；
- 对象、研究问题或保证发生实质变化时是新 family，不是旧题复活；终态 STOP 永不重入。

所有 Source16 的 carry-forward/休眠以各 lane 已冻结 ledger 为准，不能靠回忆重置，也不能因需要补满 raw 而绕过。

## 6. 验收、收益和风险

机械验收：raw 前纳入的已知 repeat/active/hold/STOP/dormant 数必须为 0；每条 deep 都有预结果 D1；raw→unique→D1→deep→brief 数字可对账；五类证据字段分开；成熟工具 primary-origin 上限满足；没有按结果替补。

预期收益不是承诺更多 brief，而是提高可识别分母的质量：减少重复和当前 union 内的浅变体，把深度投向带独立问题证据、自然 carrier 和有限闭合路线的对象；同时保留测量、benchmark、理论和架构协同入口。即使仍为零，也能区分“问题证据不足”“source closure 不足”和“真实 current-union 饱和”。

主要风险是题源定位成本上升、短期 raw 变少，以及临时限制成熟编译器表面可能漏掉真正新变化。通过每路 locator≤8、raw≤6、总深审≤12、外部 delta 重入和单周期试点控制风险。

若出现 raw 严重枯竭、高质量编译器题被错误压制、文献闭合成本明显超出普通 Discovery，或后续 Stage 0 的 repair vector 没有改善，应在下一安全边界撤销该 assignment-local profile，保留全部 ledger，不改变科学状态。若再次零 brief，不自动重复同一 profile，也不切换 V9；canonical Discovery 可继续，但主线应再次选择新的有界题源策略。

## 7. 权限判断

依据现有 `USER_ADAPTIVE_DISCOVERY_CONTINUE_UNTIL_FIVE_STAGEA_PASS_20260814`，主线可在下一安全 assignment 边界实施这一轮有界、资源不扩张、科学门不改变的题源试点，无需重复请求 generic approval。

若要把它永久写入共享规则/模板、自动化休眠过滤、增加资源或并行数、改变 V9、科学阈值或阶段权限，仍必须另行获得用户批准。本报告不直接实施，也未联系或暂停任何 Discovery lane。

