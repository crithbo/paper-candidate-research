# Rule Audit Report

## 中文摘要

- 发现的问题：Source26 没有证明“检索更深仍然没有题”，而是证明了三件不同的事。19 个报告 locator 中，6 个被当前实现、历史重复、通用残差或已退休对象健康淘汰；9 个仍是公开证据未闭合；另外 S2 的 4 个只是 CUDA/NPU/PIM/chiplet 类别名，缺精确身份、Question Card 和逐项来源记录，属于执行/遥测不足，不能作为 4 个经过科学筛查的题。
- 对推进速度或研究质量的影响：证据三联策略提高了“尽早发现不成立方向”的质量，却没有提高 raw 或 brief 产出。Source25 是 `66 seed → 24 reported locator → 20 exact → 1 raw → 0 brief`；Source26 是 `66 → 19 reported → 15 exact → 0 raw → 0 brief`。如果继续只增加创意措辞或检索页数，最可能继续围绕成熟 LLVM/MLIR、工具仓库和 MLPerf 表面打转。
- 创意机制判定：多种引擎和视角确实被执行，但它们主要改变了问题表述和局部对象名，没有实质改变送入证据闭合的贡献分布。15 个可审计精确 locator 中，10 个仍是 compiler/tool/method constructor，5 个是 measurement/N3/benchmark，0 个是闭合的 theory/formal 或 exact system-architecture，S2 也没有留下任何 exact GPU/NPU/PIM 对象。15/15 都落在成熟工具或 benchmark 表面。
- 建议修改：下一轮只运行一次 assignment-local `SOURCE27_ORIGIN_GROUNDED_ORTHOGONAL_RESIDUAL_V1`。保持现有创意模板和 Question Card，不增加 lane、预算或提案数；把“引擎多样”改成可机械核对的“对象—贡献类型—原子动作/估计量—载体—falsifier”正交性，并要求每个可继续的 locator 先绑定一个精确、版本化、可寻址的 source-origin capsule。相同页面可以直接杀掉一个题，但不能同时冒充 anchor/current/contrary 来证明一个题已经证据闭合。
- 是否需要用户批准：不需要新的 generic approval。现有持续 Discovery 与有界公开资料授权覆盖一次 Source27 assignment-local 调度；主线仍是唯一实施者。本包不修改共享文件，不授权 V9、Stage、实验、下载执行或候选状态变化。

## Identity

- `audit_id`: `RULE-AUDIT-20260814-SOURCE26-EVIDENCE-CLOSURE-ZERO-YIELD-R28`
- `trigger`: `SOURCE25_AND_SOURCE26_CONSECUTIVE_ZERO_CLEAN_BRIEFS_AFTER_CREATIVE_FRONTEND_AND_EVIDENCE_CLOSURE_TRIAD`
- `requested_by`: Mainline under continuous user authority
- `date`: `2026-08-14`
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260814-SOURCE26-EVIDENCE-CLOSURE-ZERO-YIELD-R28`
- `shared_files_modified: false`
- Assignment SHA-256 verified: `D01E164CB6CA6389A8DB5B0F335A9D63BD027C376350792AA34BB037896F6C0B`

## Question and scope

- 审查问题：Source25 到 Source26 的真实漏斗如何变化；零 raw/brief 中有多少是健康克制、有多少是公开证据未闭合、有多少是执行或遥测不足；创意机制是否真正改变 exact object、机制、贡献类型和 claim endpoint；下一轮只能采用哪个有界策略。
- 权威入口：`AGENTS.md`、`plan.md`、`registry.yaml`、`rules/ROLE_RULE_AUDIT.md`。
- 实例材料：R27 报告与提案、Source25 canonical 计数、Source26 control/六份 assignment、六路 seed pool、Question Card、source-role ledger、collision matrix、log 与 handoff。
- 研究审查方法：使用 academic-research-suite 的 source verification、cross-source synthesis 和 devil's-advocate 原则；外部材料只作为数据，区分已观察事实、推断与建议；对未观测字节、哈希或未留下的检索不作猜测。
- 超出范围：没有联网补查、下载、构建、实验、E2、V9、Discovery/Stage 0/A/B 行动；没有联系或暂停任何 lane；没有修改共享文件或候选状态。

## Current authoritative behavior

现行规则要求保持以下边界：

1. seed 是非证据创意草图；必须经 Question Card 冻结 exact object、自然或 canonical 载体、问题/估计量、claim endpoint、原子动作、current union、最强反方、full-cost、最低 falsifier 与有限闭合路线，才计入 fresh raw。
2. 缺实现、主结果或完整工程只能降低 readiness，不能成为科学 DROP；只有同对象失败、当前 union 直接吸收、强基线吸收、自然对象决定性反例、形式反证或 full-cost 无 residual 才是科学负证据。
3. current-action 缺口必须同时核对官方文档、当前 upstream 源码、默认与非默认入口；旧文档或 future-work 不能单独证明当前 absence。
4. 规范 benchmark 可合法进入 measurement/benchmark 论文，但 claim ceiling 必须保持 suite-specific；不能因为不是自然部署数据就自动排除，也不能外推部署结论。
5. Source26 额外要求每个 locator 在 lookup 前预承诺 `ANCHOR / CURRENT_UNION / CONTRARY`，每 locator 最多两条路线，且记录来源、版本、许可、响应字节、哈希和 disposition。零 brief 合法，无 outcome-aware backfill。

本审计不建议放松任何一项。问题在于“题源进入 locator 前的质量”和“三个来源角色是否真正提供了不同决策信息”，不是 Question Card 或 Q2 门过严。

## Funnel reconciliation

### Source25 → Source26

| Cycle | Seed | 报告 locator | 可审计 exact locator | 有 concrete source record | Raw | C0 | D1/Deep | Brief |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Source25 | 66 | 24 | 20 | 不可从 canonical handoff 统一计算 | 1 | 1 | 0/0 | 0 |
| Source26 | 66 | 19 | 15 | 16（含 S2 的 1 个非 exact 类别） | 0 | 0 | 0/0 | 0 |

Source26 的变化不是“同样 19 个精确题都被更深文献否定”：

- locator 报告数减少 5，可审计 exact locator 也减少 5；exact locator 率从 `20/24=83.3%` 降为 `15/19=78.9%`。
- 19 个所谓 source-role triad 中，只有 15 个绑定到精确 identity；S2 的 4 个仍是类别。
- 六路合计只持久化了 S3 的 3 个小型官方快照，共 100,314 bytes；其余公开页面大多没有 runtime-observed response bytes 或内容哈希。这个事实不表示页面“没读”，但表示 Source26 没有把多数决定性证据变成可复核、可内容寻址的 artifact。
- 没有一条 triad 展示三个 provenance-independent 的证据家族。不同来源组织不是科学硬门，但当前事实说明 `CONTRARY` 经常只是重复 `CURRENT_UNION` 或同一 landing/document family，而不是独立、decision-bearing subtractor。

### Source26 六路漏斗

| Lane | Seed | 报告 locator | Exact | 主要结果 | Raw/Brief |
|---|---:|---:|---:|---|---:|
| S1 | 8 | 2 | 2 | MOPS/Zfa 的朴素“原语缺失”被当前 LLVM 反证；更强动作、carrier 与直接论文碰撞未闭合 | 0/0 |
| S2 | 12 | 4 | 0 | 四项仍是 CUDA movement、NDP/PIM mapping、NPU command memory、chiplet full-cost 类别；只有 CUDA 路线留下两个页面 | 0/0 |
| S3 | 12 | 2 | 2 | ONNX 明显动作被 stock ORT union 压缩；MLPerf history 仍缺受控 estimand 与 decision consequence | 0/0 |
| S4 | 12 | 3 | 3 | HPC 当前对象已退休；Automotive/Inference 缺机器可复核的联合 resource panel 与 holdout | 0/0 |
| S5 | 12 | 4 | 4 | Binaryen/Yosys/PRIVATE_TOOLCHAIN 被当前 union、历史族或 generic origin 吸收；Protobuf 仍未 source-close | 0/0 |
| S6 | 10 | 4 | 4 | SME 是重复 family，SVE 退化为 policy/cost model；AArch64 load/store 与 cooperative matrix 仍未闭合 | 0/0 |

逐 locator 的 exact identity、creative engine、endpoint、载体、source-role 执行和分类见 `AUDIT_METRICS.yaml`。

## Three-way cause classification

### 1. Healthy structural abstention：6/19

这 6 项有足够的同对象负信息，因此零产出是正确行为：

- S4 MLPerf HPC：冻结问题要求 current suite panel，但官方对象已退休。
- S5 Binaryen：ReReloop/current pass union 与既有 Wave224 containment 吸收朴素 residual。
- S5 Yosys：与既有 Yosys/ABC 映射族重合，并有 generic SAT/mapping 风险。
- S5 PRIVATE_TOOLCHAIN：合同禁止 generic MLIR layout origin，且已有 PRIVATE_TOOLCHAIN absorption。
- S6 AArch64 SME：registry 已记录同 family 当前 PCS/LLVM/GCC union absorption。
- S6 AArch64 SVE：当前 LoopVectorize/AArch64 TTI 已枚举相关 action，剩余只是 policy/cost-model restatement。

这些结论不依赖缺实现、缺结果或 AI readiness，也没有复活任何 STOP。

### 2. Public evidence unclosed：9/19

S1 两项、S3 两项、S4 两项、S5 Protobuf、S6 两项均有 exact identity，但还不能可信进入 raw。共同缺口不是“论文结论没做出来”，而是以下一种或多种：

- 原子动作仍用“更强联合算法”“bounded-recourse constructor”等占位语，未从 source action catalogue 中分离出来；
- natural/canonical carrier 的 version/hash、reader/oracle 或 small witness 未冻结；
- current union 有所闭合，但 strongest contrary 或直接论文碰撞仍只是同一官方页面的重复；
- measurement 题缺机器可读 panel、固定 estimand、holdout 或 native decision consequence；
- full-cost 维度被列出，但没有与 exact comparator 和 falsifier 形成一条有限证书路线。

其中 S3 的 MLPerf history 不能仅因“不是自然 carrier”而排除，因为 canonical benchmark route 合法；但该卡同时缺 confound-controlled estimand 和非 controller 的 decision consequence，所以本轮 locator-only 仍然合理，没有发现确定的误淘汰。

### 3. Execution/telemetry limited：4/19

S2 的四项不能被视为四个科学 negative：

- 没有 exact versioned trace、simulator/runtime、NPU target 或 chiplet platform；
- 没有逐项 Question Card、collision matrix、creative-engine 映射或 target-specific counterfactual artifact；
- 三项没有 concrete source record；CUDA 项只有 Nsight capability page 与 NVTX，仍没有固定 trace/estimand/current action union；
- handoff 自报“四个 precommitted triad”，但 artifact 不足以复核这些 triad 实际执行。

这与 Source25 的 S2 缺口同型，说明 R27 的 exact-locator 与 telemetry 修复没有在该 lane 落地。它是重复执行缺陷，不是科学门导致的低发现率。

## Did the creative mechanisms materially diversify topics?

### 得到的正价值

- 66 个 seed 确实覆盖多种引擎和角色；S1/S3/S4/S5/S6 的 seed pool 可追踪，conclusion-first 与 no-backfill 得到遵守。
- Source26 比 Source25 更早显露 6 个当前 union、重复、generic 或 retired negative，说明创意层没有压倒证据克制。
- 精确对象名确有一部分变化：MOPS、Zfa、ONNX release family、Protobuf descriptor、AArch64 load/store 等不是简单复制 Source25 的 VSETVLI 文本。

### 没有发生的实质变化

- 在 15 个 exact locator 中，10 个仍是 compiler/tool/method constructor，5 个是 measurement/N3/benchmark；没有闭合的 theory/formal 或 exact system-architecture locator。
- S2 原本承担 GPU/NPU/PIM/architecture bottleneck，但 4 项全都停在抽象类别；因此可审计 exact GPU/NPU/PIM object 是 0。
- 15/15 exact locator 都来自成熟 named tool/benchmark surface。成熟表面不是禁区，但这里出现了明显的 current-union 饱和：LLVM/MLIR、Binaryen、Yosys、PRIVATE_TOOLCHAIN、Protobuf、ONNX、MLPerf。
- 多种引擎反复收敛到两个熟悉 endpoint：`bounded/joint constructor` 或 `ranking/characterization`。这说明引擎标签改变了叙事角度，却没有机械强迫 exact object、action/estimand、carrier 与 falsifier 真正正交。
- Source25 已暴露 MLPerf/MLIR/SPIR-V/成熟 compiler surface；Source26 又回到相同 source class。没有 evidence delta 时，这种轮转是低收益重采样。

结论：创意前端本身不是无效的，但当前“8 engines/7 perspectives”只是覆盖证明，不是 topic-quality 证明。下一轮应把 diversity 的机械对象从 engine 名改为 research contract 的正交轴。

## Source-role precommit audit

Source26 的三联 precommit 有两种不同效果：

1. 对结构性排除有效。一个 current source、退休页面或 registry dedup 就能决定题目不应继续；这时同一来源兼任多个角色不会制造假阳性。
2. 对“仍可能继续”的 locator 不够。大量 ledger 把同一 repository/docs family 同时标为 anchor/current/contrary；这只能说明该项目的表面被看过，不能说明 carrier、当前 action catalogue 和 strongest independent subtractor 都已经闭合。

因此下一轮应采用最小 role-collapse 规则：

- 若一个来源给出 direct absorption、retirement、same-family dedup 或 generic-kernel fatal result，可以直接结构排除，不要求为了形式补齐三份来源。
- 若 locator 要保持可进入 raw 的可能，同一页面不得同时算完三个角色。至少要有一个版本化 carrier/anchor artifact、一个当前 source/action-union artifact，以及一个 primary contrary route或边界明确的 `NOT_FOUND_WITHIN_SEARCH` 记录。
- 这不是要求 Discovery 得到核心结论，也不是把 Discovery 变成 Stage 0；它只要求卡片的最便宜 source handles 可复核。Stage 0 仍独立做领域新颖性、强基线与 Q2 判断。

## Recommendation

- Decision: `PATCH_RECOMMENDED__ASSIGNMENT_LOCAL_PILOT_ONLY`
- 唯一下一策略：`SOURCE27_ORIGIN_GROUNDED_ORTHOGONAL_RESIDUAL_V1`
- 共享规则：本轮 `NO_SHARED_RULE_PATCH`；现有 v8.7、创意模板和 Question Card 保持。
- 为什么更小的修复不够：只修 S2 文件格式会恢复可审计性，但不能改变 15/15 exact locator 仍收敛到成熟 surface；只增加检索页数会继续给未命名的 constructor 搜材料；再增加 creative engine 则只会扩展措辞。

### Source27 单一有界流程

`offline seeds → exact source-origin mapping → pairwise contract orthogonality → ≤3 locator precommit → evidence-role closure → Question Card → raw/C0/deep/brief`

1. 每 lane 最多两个 `SOURCE_ORIGIN_CAPSULE`，每 capsule 最多 6 个离线 seed，总 seed 仍不超过 12。capsule 只冻结 exact versioned public artifact/URL、object class、允许的 carrier 类型和来源选择规则，不预判结果或新颖性。
2. seed 生成仍在 candidate-directed lookup 前完成；随后每个要入 locator 的 seed 必须能映射回一个 exact capsule，并写出 `claim endpoint + atomic action/estimand + native/canonical carrier + one cheapest falsifier`。不能写出则留在非证据 backlog。
3. 每 lane 最多 3 个 locator，比 Source26 的 4 个更低；无最低数、无补位。任意同 lane 两个 locator 必须在 `{exact object, contribution type, action/estimand, carrier, falsifier}` 至少两个轴上不同。engine 名或 perspective 名不算差异。
4. Source25/26 的同 exact identity 或同 `tool surface + endpoint` 组合进入一轮 cooldown；只有预先冻结的 current-source/primary-paper/evidence artifact 增量才可再选。这是调度去重，不是 STOP 或永久禁区。
5. evidence triad 的每 locator 路线、字节和存储 cap 不变。结构负例允许一个决定性来源提前结束；可继续 locator 禁止单一页面完成全部角色，并至少持久化可内容寻址的 anchor/current-union artifact，无法做到时明确记为 telemetry/source-unclosed。
6. 缺实现或主结果不阻止 raw；只要 exact object、union 外可攻击 residual、carrier、full-cost、falsifier 与有限闭合路线已来源化，就按现行 Question Card 进入 raw。
7. 零 raw/brief 继续合法；不以 outcome 调整 capsule、locator 或 lane 数。

### 六 lane source-origin 约束

| Lane | Source27 origin | 明确不再接受的低信息入口 |
|---|---|---|
| S1 | 一个版本化 spec/ABI/ISA 与 current producer/consumer 语义边界；必须能定位双方 source path | “某 LLVM feature 可能还可优化” |
| S2 | exact GPU/NPU/PIM profiler trace、result export、simulator/runtime version 或 command schema；先冻结 estimand 和可改变它的 native action | CUDA movement、NPU memory、chiplet cost 等类别词 |
| S3 | 小型 versioned natural change chain、manifest/API slice 与 stock reader；目标是稳定规律及 decision consequence | model zoo/registry/cache/index 主页和无版本集合 |
| S4 | 已知可机器读取的 current benchmark rules + export/schema + native comparator；canonical-only 合法 | 只有 landing page、没有 panel 的 suite 名 |
| S5 | target-specific partial primitive + stock checker/oracle + formal invariant/counterexample route | generic solver、generic MLIR/layout、仓库 README 构造器 |
| S6 | current backend/ISA source 中明确存在两个以上 native legal actions，加 exact program/test carrier | 未枚举 action catalogue 就先命名 joint/DP constructor |

这些是 source scheduling 约束，不是录取配额，也不要求每个 lane 必须出题。

## Risk analysis

- False-negative risk：预计下降。exact object/endpoint/action 在 locator 前互相校验，减少 S2 类“类别先结束”；canonical measurement route不会被自然载体措辞误伤。
- False-positive/weak-paper risk：不增加。Question Card、current union、strong baseline、full-cost、falsifier、Q2 与独立 Stage 0 均不变；source-role closure更严格。
- Scientific-integrity risk：下降。把结构负例、source-unclosed 和 telemetry-limited 分开，不再把网页角色标签当作独立证据。
- Resource/time risk：单题 source closure会更集中，但 locator ceiling从4降至3，lane/总字节/存储/尝试数均不增加。
- Accessibility bias：仍偏向公开、版本化、可内容寻址的对象。这是 AI 自主执行目标的现实排序因素，不是学术 STOP；高价值人工核心题仍可在后续被识别并进入 reserve。
- State-migration risk：无。Source25/26 immutable，任何旧 locator 不自动升级。
- Terminal-revival risk：无。STOP 不复活；cooldown 也不是状态转换。

## Validation and rollback

- Historical/time-slice backtest required: `NO` for this one-cycle source scheduling pilot；它不改变 scientific admission rule。若要永久写入共享规则或把 source-origin capsule 变成新 canonical method，另做独立审计并按 AGENTS 判断是否需要时间切片回测。
- Prospective validation: Source27 一轮，六 lane 与原预算不变。
- 机械成功条件：
  1. `reported_locator_events == auditable_exact_locators`；
  2. 100% selected locator 有 capsule、seed、endpoint、action/estimand、carrier、falsifier 路径；
  3. 同 lane pairwise orthogonality 100%；
  4. 可继续 locator 不出现 same-document three-role closure；结构负例可早停；
  5. retrieval telemetry 可复核，未观测值不猜测；
  6. funnel 必须分别报告三类 disposition，科学硬门违例为 0；
  7. brief 数没有最低阈值。
- 科学观察指标：exact locator 中的 contribution-type/object distribution、raw/locator、健康结构负例率、source-unclosed率、telemetry-limited率，以及任何 brief 的独立 Stage 0 决定。不能为了改善指标改题或放松门。
- Rollback condition：若出现 capsule 后 outcome-aware 换源、同一页面虚构三角色、abstract bucket 计 exact locator、超预算、无 ledger、科学门漂移或 STOP 重开，该 profile 一轮后失效，下一 assignment 回到现有 v8.7 frontend；不迁移任何候选状态。

## Mainline handoff

- User approval already present: `YES__ONE_ASSIGNMENT_LOCAL_SOURCE27_SCHEDULING_UNDER_EXISTING_CONTINUOUS_AND_PUBLIC_SOURCE_AUTHORITY`
- Files proposed for change: 仅由主线在下一安全边界创建 Source27 control 与六份 lane assignment；本包不请求现在修改 `AGENTS.md`、`rules/`、`templates/`、`plan.md` 或 `registry.yaml`。
- Registry migrations proposed: `NONE`；主线只在 Source27 实际启动/完成时按现有 single-writer 职责登记。
- Existing active/blocked/hold/terminal topics affected: `NONE`
- Backtest/V9/Stage/experiment authorized: `false`
- Shared files modified: `false`
