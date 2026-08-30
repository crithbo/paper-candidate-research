# 论文候选项目入口

## 核心目标

本项目持续发现、筛选并验证至少达到领域内二区期刊或同等水平、并优先冲击一区的研究课题。全流水线统一使用三级质量标签：

- `TIER_A_Q1_POTENTIAL`：具有一区或同等级潜力，优先投入与推进；
- `TIER_B_Q2_VIABLE`：核心贡献与证据路线足以支持可信二区论文，是允许继续的最低质量线；
- `BELOW_Q2_STOP`：二区论文形状不成立，必须停止。

降低最低目标不降低研究诚信和科学硬门。same-object、最新碰撞、公平当前强基线、自然输入/自然正证据、full-cost、可复现性、证据等级与 claim ceiling 仍必须满足；不得用较低分区目标容忍换对象、弱基线、合成特例、成本遗漏或不可复现结果。

学术潜力决定题目是否保留；AI 可执行性用于加分、排序和自动推进。学术潜力高但当前不适合 AI 主导执行的题目进入 `HUMAN_RESEARCH_RESERVE`，不得因此判为 STOP。

在不放松上述科学硬门的前提下，控制面的运行目标是：尽量提高由 AI 可审计完成的 claim-critical 工作、可发表证据与论文交付量，同时减少用户在常规检索、实现、重放和整理上的时间。低用户投入只影响排队和执行方式，不得压低学术门，也不得让高价值、人工核心题消失。

权限分为三层：`POLICY_AUTHORITY=USER`、`SHARED_FILE_WRITER=MAINLINE`、`AUDIT_PROPOSAL_AUTHOR=RULE_AUDIT_SENTRY`。用户的明确政策批准不需要再请求同一 generic approval，但不会把共享控制文件变成多写者；所有生效修改仍由主线在安全 assignment 边界落盘。

主要范围包括 CUDA/GPU、AI 加速器与 NPU、PIM/NDP、量化与近似计算、算法与数据结构、编译器、运行时、系统、体系结构、理论以及验证调试。CUDA 与非 CUDA 的 Discovery 投入大致按 3:7 分配，但不是录取配额。

## 用户长期研究主线与近期资源优先级

在最低 Q2、优先 Q1 及全部科学硬门不变的前提下，项目的长期产业—学术主线优先对齐：

`面向云边异构 GPU/NPU 与近存计算平台的 LLM/VLA 推理编译、Kernel、运行时、内存系统、性能建模和软硬件协同优化`。

该主线的共同技术核为：AI compiler/IR/lowering/target backend，CUDA/Triton/HIP 与低比特 Kernel，LLM inference runtime、KV/session cache 与 memory planning，CPU/GPU/NPU/NDP 异构执行，workload characterization、roofline/cost model、自动调优和诊断，以及由真实软件 profile 反向约束的内存、互连和加速器架构。云端应用重点包括单 GPU serving、Agent/长会话、KV/前缀缓存、SLO/full-cost 和后续有资源时的 disaggregated inference；端侧重点包括 backend partition/fallback、低比特语义、热/功耗/冷启动和端云协同。VLA/机器人推理、PIM/NDP 和新指令/架构属于与该核心相邻的高价值协同方向。

近期默认资源模式为 `PUBLIC_SINGLE_GPU_CPU_FIRST`：优先使用公开源码、公开模型/trace/benchmark、本机 CPU 与单张 RTX 4070，形成可复现的 compiler pass/backend、Kernel、runtime component、performance model、profiler、benchmark、bit-exact test suite 或 upstream contribution。多机多卡、高速互连、闭源 NPU、真实 PIM、FPGA/EDA/ASIC、私有流量或大规模训练不得被假定为可用；依赖这些资源的题必须明确进入 `BLOCKED_USER_ACTION_REQUIRED`、条件证据路线或 `HUMAN_RESEARCH_RESERVE`，不得因产业相关性跳过资源门或提高 claim ceiling。

用户提供的课题组代码仓库 `C:/Users/15383/Desktop/Codex/project/resnet50_int8` 只作为主线冻结后的只读外部研究输入，不是本项目的共享写目录，也不自动成为候选证据。该仓库包含 ResNet50 INT8、DeepSeek 算子图/模板、28-slice NDP 配置与 execplan、地址重映射、roofline/TTFT 模型、功能模型、RTL 与服务器回传合同；但当前工作树长期 dirty，真实 VCS/license/server 运行、功能 RTL 修改、上传、lease 和正式 return 均仍受其自身规则和用户明确授权约束。每个使用该仓库的新 assignment 必须冻结 exact commit、允许读取的 current 文件及其哈希、dirty/禁止输入边界和唯一写目录；默认不得修改原仓库，若需变换只能把获准且哈希固定的最小输入复制到本 assignment 的 `resources/src`。

已公开的导师/课题组方向——大算力高能效芯片、GPGPU、PIM/NDP、低比特 LLM 推理软硬件协同、长上下文 LLM 的 GPU–DIMM-PIM 协同、可重构/NDP 数据流与通信，以及 VLA speculative inference——用于 advisor/resource alignment 与来源优先级，不代表未公开资源、设备或合作权限已经存在。近期 Discovery 优先寻找能在公开 CPU/单 GPU 路线完成语义闭合、机制验证和主要软件证据，并能与组内 NDP/RTL/性能模型形成可审计桥接的 opportunity family；硬件实现与服务器结果只作为 assignment 明确获批后的更高证据层。

产业协同只在题目通过科学硬门后用于排序加分，不是录取配额、论文质量替代物或 broad category cooldown。建议每个候选登记 `strategic_alignment=CORE / TRANSFERABLE / ADJACENT`、可交付的 `industry_artifact_route` 和 `resource_realism`，但这些字段不能补偿 same-object、current collision、公平强基线、自然/canonical 证据、full-cost、可复现性或 claim ceiling 失败。与主线较远但学术价值高的题仍按原规则推进、暂存或停止；六个 Discovery lane 继续是来源视角而非固定领域槽位，CUDA/非 CUDA 的 3:7 仍只作近似投入目标。

Discovery 使用六个长期主来源会话和一个周期性测量观测会话，而不是按 CUDA、量化、编译器等领域划分。领域是候选标签和专业审查维度；新发现方法必须先通过历史论文时间切片回测。

Discovery 的规范工作单元是去重后的 `OPPORTUNITY_FAMILY`，规范交付是可证伪 `RESEARCH_CLAIM_PACKAGE`，而不是论文条目或模型自报分数。claim package 至少冻结 exact object、自然/canonical 场景、问题或机会、原子动作、机制、信息条件、公平比较器、预期效果/保证、full-cost、边界/失败区、最小 falsifier、贡献类型和依赖。先按 `METHOD_ALGORITHM / SYSTEM_ARCHITECTURE / COMPILER_TOOL / MEASUREMENT_CHARACTERIZATION / BENCHMARK_DATASET / THEORY_FORMAL / REPLICATION_NEGATIVE` 的类型合同判断论文结构，再映射到项目内部 Q1/Q2 档；该映射不降低任何科学硬门。

Discovery 前端按项目级 `$research-topic-discovery` skill 运行“有界非证据 seed portfolio → exact public anchor → 一个 primary RQ（仅在真实范围歧义时增加至多两个同对象备选）→ ordinary 或 selective pre-RQ source closure → 不变的 evidence-qualified raw gate → contribution-type-specific deep review → clean brief 或诚实 abstention”。skill 只规定操作顺序，不能改变 `rules/ROLE_DISCOVERY.md` 的权限、状态、预算或科学门。seed 不得主张新颖性、当前 absence 或科学质量，也不计 locator、raw、C0 或候选分母。进入 raw 仍必须冻结 exact identity、同对象问题/估计量、claim endpoint、反事实后果、非通用判别、一个 current-source locus、最低 falsifier、有限闭合路线与 full-cost 初界；完整 current union、最强碰撞、完整小 witness、工程接口和主结果可以登记为有界 closure debt，在 C0/deep 或独立 Stage 0 闭合。已知 direct fatal、换对象/降保证、generic wrapper/solver 或无有限路线仍不得进入。评分只能安排工作顺序，不能补偿科学硬门失败；整批零提案合法。规范 benchmark 可用 `CANONICAL_BENCHMARK_ONLY` 进入测量/benchmark 论文入口，但不得外推自然部署结论。

行为改变型 Discovery assignment 必须冻结 `DISCOVERY_CLAIM_PACK_MODE=OFF / SHADOW / PRODUCTION`。`SHADOW / PRODUCTION` 额外读取 `rules/DISCOVERY_CLAIM_PACK.md`；缺少字段或未通过独立回测时 fail closed 为 `OFF`。六个长期槽位上限不因方法升级改变；方法质量与 3/6 席调度必须分开验证。

研究问题分层前端另冻结 `DISCOVERY_RQ_FRONTEND_MODE=OFF / SHADOW / PRODUCTION` 与方法 revision/hash。`RQ_REFINEMENT_STAGED_EVIDENCE_V1` 在共享规则中安装后仍须先通过独立 PACKER→EXECUTOR→AUDITOR 历史时间切片回测；未通过前只能 `SHADOW`，缺模式或校准记录一律 fail closed 为 `OFF`。它只移动 RQ、source closure、current-union 与 Q2 判断在漏斗中的位置，不降低 same-object、direct fatal、公平强基线、自然/canonical 证据路线、full-cost、可复现性或独立 Stage 0 门。

问题来源只是发现线索，不是录取门。假设失效、瓶颈迁移、自然结构、目标变化、规模/在线/近似化以及异常/原语错配是常见入口；直接算法/软件改进和测量、刻画、benchmark gap 同样合法。题目不能被强迫套入某个来源分类，也不能仅因没有异常案例而停止。

当连续两个完整的六路 Discovery 控制周期均没有形成 `CLEAN_STAGE0_BRIEF` 时，主线必须在不停掉下一轮 canonical 筛选的前提下，把零产出诊断交给长期 `RULE-AUDIT-SENTRY`。诊断先定位第一个失败转换，再对上一轮试点逐项声明 `RETAIN / DOWNGRADE / REMOVE`，下一周期只冻结一个有界改变；不得把每次零产出都叠加为新的 production micro-rule。重复低 yield 或 current-union 吸收只能让具名来源族在下一冻结周期临时降权，不能形成 broad category cooldown、RELATED 排除或录取配额。V9 保持非生产；下一次方法评价只使用实际 `CLEAN_STAGE0_BRIEF` 及其独立 Stage 0 反馈形成可识别分母，不再以一批零 brief 的普通 family 强行判定精度。

## 学术贡献入口

每个题目至少选择一条创新路线：

- `N1`：新抽象、新机制、新表示或新动作；
- `N2`：已知动作上的新算法、联合优化、近似、数据结构或复杂度增量；
- `N3`：自然 workload 中新的稳定规律及其利用机制。

只有验证/调试赛道原则上要求真实 fault。算法、近似、体系结构、编译器和系统题可以由性能、内存、能效、编译时间、解质量、误差或理论保证形成论文。

软件性能优化可以独立形成 N2 贡献，但必须是非平凡、可推广、完整计价的新算法或新求解结构；普通调参、仅替换参数、单点微优化和弱基线提速不构成论文。

## 项目结构

- `plan.md`：唯一的人类可读当前状态与短期计划；每次整体重写。
- `history.md`：压缩保存已结束状态、规则变化和可复用经验。
- `registry.yaml`：候选与任务的唯一机器可读状态源；只由主线修改。
- `rules/`：按阶段和职责拆分的权威规则。
- `templates/`：标准报告与交接模板。
- `stages/discovery/`、`stages/stage0/`、`stages/stageA/`、`stages/stageB/`：候选流水线工作区。
- `stages/rule-audit/`：长期规则审计会话的只提案工作区；不得作为候选证据。
- `projects/`：仅存放 Stage B 通过、独立复审接受并经用户确认后的正式论文尝试。
- `projects/_assets/<asset_id>/`：仅由主线创建、登记、修改或退役的只读共享科研资产；assignment-local 缓存不得直接充当共享资产。
- `.agents/skills/`：项目级执行技能，不属于候选证据；Discovery 的规范操作 runbook 为 `.agents/skills/research-topic-discovery/SKILL.md`。

## 工作体系

主线负责用户沟通、长期角色会话池、任务队列、状态转换、资源授权、机械验收和跨阶段交接；唯一更新 `plan.md`、`history.md`、`registry.yaml`、`rules/` 与 `templates/`。不得为每个候选或每次审查新建一次性会话；只有缺少对应长期角色槽位时，才按实际并发需要建立 2–4 个可复用槽位。六个既有 Discovery 来源 `S1`–`S6` 是固定长期槽位，不属于逐题新建；按用户 `DISCOVERY-SIX-LANES-DIRECT-20260811` 授权同时运行。

当前持续目标由用户最新指令更新为累计五个经独立 Stage A gate 接受的 PASS；Stage 0 PASS、owner 自评与未经过独立 gate 的结果不得计入。达到五个前，主线持续复用现有 Discovery、Stage 0、候选执行和 Stage A gate 长期槽位；完整科学 handoff 优先于新一轮浅筛验收。

每个 assignment 必须冻结其规则版本/哈希。已经运行的 assignment 保持冻结规则直到 handoff；新规则只在下一安全 assignment 边界生效，除非只是不会改变科学判断的机械兼容修复。

用户批准 `USER_ASSIGNMENT_RESOURCE_LOCALIZATION_20260814` 后，每个新 assignment 还必须冻结 `rules/RESOURCE_LOCALIZATION.md` 的版本/哈希，并把主动下载、复制、解压、隔离安装、构建、可配置缓存、临时文件与日志定位到 `<唯一写目录>/resources/` 的八个标准子目录；canonical `RESOURCE_INVENTORY.yaml` 保留在唯一写目录根部。所有重定向只作用于进程，不得改系统/用户环境或注册表；不能可靠重定向时在资源动作前 fail closed。Codex、Windows、驱动、浏览器、IDE 与预装运行时既有系统缓存不属于项目资产，也不承诺位于 D 盘。只有主线可登记 `projects/_assets/<asset_id>/` 共享资产；递归清理只能针对机械验证后的 frozen resource root 或其 inventory descendant。

## 推进优先的验收与汇报

验收强度必须与风险相称，不能把重复哈希、全树清单复算或格式洁癖变成常规科研瓶颈：

- 日常 Discovery 批次、普通检索记录、无状态变化的 shadow 输出和低风险交接，默认只做一次最小验收：必需文件存在且可读、身份/assignment/写目录/结论一致、关键表或样本计数合理、没有越权写入。主线可以抽查关键文件，不要求递归重算整个目录。
- Stage 0/A/B 状态转换、claim-bearing 结果、用户批准边界、共享规则变更、正式项目/投稿包、删除迁移、污染/泄漏/冲突争议属于高风险边界；只在这些边界对决定性输入、报告、handoff、原始证据和必要 manifest 做针对性完整校验。Stage B 与正式项目的可复现性门不降低。
- 已被主线接受且声明 immutable 的同一 artifact，若路径、大小、时间戳和上游状态均无变化，后续角色复用既有验收记录，不反复全量复算。只有发现漂移、冲突、损坏、跨边界迁移或科学争议时升级复核。
- manifest 优先覆盖 canonical/claim-critical 文件；辅助日志不要求为了“全收录”拖慢交接。只要摘要、路径和哈希可无歧义解析，空格或大小写等纯格式差异不得阻塞科学推进，可在下一次安全写入时顺手规范化。
- 非关键清单或元数据错误应形成一次有界机械修正，不得要求分支反复重封包，也不得阻塞互不依赖的科研工作。哈希仍用于证明不可变性和定位漂移，不再作为每个控制周期的仪式性动作。

面向用户的主线报告默认使用简明中文，先讲“得到什么、为什么、下一步、是否需要用户动作”。内部机器状态码保留在 `registry.yaml`、handoff 或附录中；除非用户要求、正在排查歧义或需要精确授权，正文不堆叠长状态码和 SHA 列表。不可观测成本写成“本次运行环境没有提供精确统计，未作估算”；保持旧模式写成“现阶段继续沿用原方法，不切换到新方案”。不得用通俗化掩盖不确定性、科学负证据、资源 blocker 或 claim ceiling。

分支会话分为论文来源 Discovery、测量观测、Discovery 回测、Stage 0 批审、候选执行 lane、Stage A gate lane、Stage B 独立复审 lane，以及一个长期 `RULE-AUDIT-SENTRY`。Discovery 负责论文谱系、问题来源和竞争机制；领域真实性与新颖性由独立 Stage 0 审查。规则审计会话面向用户解释现行规则、发现流程缺陷并形成可审计的变更提案，但不得直接修改主线控制文件。Stage 0 PASS 后，主线把冻结候选包投递到空闲的长期候选执行 lane；Stage A 完成后投递到独立 gate lane。只有 gate PASS、进入 `PENDING_USER_STAGEB_REVIEW` 并经用户逐题查阅明确批准后，执行 lane 才可接受该题 Stage B。上下文连续性由候选目录、合同、命令、结果与 handoff 保证，不要求候选永久绑定单独会话。各 lane 一次只处理一个冻结 assignment，写入题目唯一目录，完成并经主线验收后清空 assignment 再复用；不得把前一题的未登记事实带入下一题。

完整角色目录仍包括六个 Discovery 来源与 M1、Stage 0 双审、候选执行、Stage A gate、Stage B 独立复审、`RULE-AUDIT-SENTRY` 以及相互隔离的回测 PACKER/EXECUTOR/AUDITOR。当前六个 Discovery 来源 `S1`–`S6` 全部保持 active 并直接并行，不再归档后轮转；每个来源仍一次只处理一个冻结 assignment。其他长期角色继续按真实 WIP 反归档，优先复用原任务，不新建逐题会话。任务窗口归档只是 UI/调度压缩，不改变题目状态，不删除任务目录、合同或证据，也不能用来掩盖 blocker。单个回测的三种角色仍不得由同一会话兼任；没有获批回测时三者全部保持冷归档。迁移前的一次性候选会话完成当前交付后归档，不再新建同类会话。

正式流程：

`Discovery → Stage 0 → Stage A → PENDING_USER_STAGEB_REVIEW → Stage B → 独立复审 → PENDING_USER_DECISION → 用户正式项目批准 → FORMAL_PROJECT_ACTIVE → SUBMISSION_PACKAGE_READY`

旁路：

`Stage 0 / Stage A / Stage B → HUMAN_RESEARCH_RESERVE`

可恢复等待：

`Stage 0 / Stage A / Stage B ↔ BLOCKED_USER_ACTION_REQUIRED → 原阶段 RESUME_FROM_BLOCKER`

## 新会话最小读取入口

新会话按一条固定链启动：

`AGENTS.md → plan.md → assignment context → 一个角色规则 → 该角色要求的 skill/templates → 最小上游材料`

`AGENTS.md` 只负责目标、权限、角色路由和跨阶段硬门；`plan.md` 只负责当前 lane、assignment、blocker、下一动作和用户门；角色规则负责“本角色如何做”；skill 负责可执行步骤。不得要求普通分支靠遍历历史目录或猜测旧会话上下文恢复工作。

每个新 assignment 优先读取主线冻结的 `ASSIGNMENT_CONTEXT.yaml`，并在任何科学动作或资源动作前写 `BOOTSTRAP_ACK.yaml`。context 至少列出角色、assignment/topic、唯一写目录、冻结规则/skill/template 哈希、最小输入、禁止输入、资源根、预算、当前状态、下一门和恢复点；ack 必须逐项确认路径可读、哈希一致、权限边界和下一动作。旧会话只能在主线接受新会话 ack 后归档。

`ASSIGNMENT_CONTEXT_V1` 当前以 `context_mode=DUAL_READ_SHADOW` 引入：主线与规则审计始终读取完整 `registry.yaml`；普通分支在 context 存在时同时读取 context 和与本题相关的 registry 记录并报告差异。只有经过冷启动回放证明无状态遗漏、且主线显式切换为 production 后，普通分支才可用 hash-pinned context 代替完整 registry 启动；缺失、歧义或哈希漂移时 fail closed 并回主线，不得自行扩读全库补语义。

六个 Discovery 来源与 M1 还必须完整读取 `.agents/skills/research-topic-discovery/SKILL.md`；选择 source/query allocation 时读取 `references/source-portfolios.md`，assignment 启用 selective depth 时读取 `references/selective-depth.md`。每个新 Discovery assignment 冻结该 skill revision 与内容 SHA256。skill 是操作 runbook，若与本文件或 `rules/ROLE_DISCOVERY.md` 冲突，以共享规则为准并 fail closed 报主线。

当冻结 assignment 的 `DISCOVERY_CLAIM_PACK_MODE` 为 `SHADOW / PRODUCTION` 时，Discovery、Mainline、Discovery Backtest 与 Stage 0 还读取共同协议 `rules/DISCOVERY_CLAIM_PACK.md`；`OFF` 或旧冻结 assignment 不读取该协议改变 canonical 判断。

任何 assignment 只要可能执行下载、复制、解压、环境创建、构建、可配置缓存或临时文件动作，还必须完整读取 `rules/RESOURCE_LOCALIZATION.md` 与 `templates/RESOURCE_INVENTORY.yaml`。旧的 active frozen assignment 不追溯搬移；只在后续资源动作前接受主线冻结的 compatibility addendum。

角色与强制运行入口如下；未列出的其他角色规则和历史候选证据默认不读：

| lane | 权威角色规则 | 强制 skill / 模式 | 条件协议或 reference | canonical 输出 | 正式状态写权 |
|---|---|---|---|---|---|
| 主线 | `rules/ROLE_MAINLINE.md` | 控制面；学术判断用 `academic-research-suite` | assignment 冻结的共同协议 | context、assignment、验收与 registry | 主线唯一 |
| Discovery S1–S6、M1 | `rules/ROLE_DISCOVERY.md` | `$research-topic-discovery` + 学术检索审证 | source portfolio、selective depth；claim-pack 非 OFF 时读共同协议 | `TOPIC_BRIEF`、evidence ledger、handoff | 无，只建议 |
| 回测 PACKER/EXECUTOR/AUDITOR | `rules/ROLE_DISCOVERY_BACKTEST.md` | 三角色隔离、冻结方法合同 | 被测方法协议；严格 forbidden inputs | sealed pack、method output、review、handoff | 无 |
| Stage 0 PRIMARY/SENTRY/DECISIVE | `rules/ROLE_STAGE0_REVIEW.md` | `academic-research-suite` 检索/审稿/核验 | claim-pack 非 OFF 时读共同协议 | `STAGE0_REPORT`、Q1 matrix、handoff | 无，只建议 |
| Stage A/B 候选执行 | `rules/ROLE_CANDIDATE_OWNER.md` | `academic-research-suite`；硬件 Stage B 强制 `$hardware-stageb-runner` | 资源本地化；逐题 Stage B 合同 | `STAGEA/STAGEB_REPORT`；Stage B canonical 六件套 | 无，只建议 |
| Stage A gate | `rules/ROLE_STAGEA_REVIEW.md` | `academic-research-suite` 独立审查 | assignment 的 evidence/claim ceiling | independent review、handoff | 无，只建议 |
| Stage B 独立复审 | `rules/ROLE_STAGEB_INDEPENDENT_REVIEW.md` | 独立证据与复现审查 | owner-conflict 回避 | independent review、handoff | 无，只建议 |
| 长期规则审计 | `rules/ROLE_RULE_AUDIT.md` | proposal-only + `academic-research-suite` | audit assignment 的允许/禁止输入 | audit report、change proposal、handoff | 无 |
| 正式论文项目 | `rules/ROLE_PAPER_PROJECT.md` | `FORMAL_PROJECT_OWNER` 或 `INDEPENDENT_MANUSCRIPT_REVIEW` + academic pipeline | 逐题 formal approval、资源本地化 | plan、claim matrix、repro package、manuscript audit、release packet | 无；主线登记 |

角色规则必须明确该角色的输入、输出、停止条件、资源、通信、模型与子代理边界；skill 不能改变共享规则、状态或科学门。若二者冲突，以本文件和角色规则为准并 fail closed 报主线。

## 全会话重开协议

1. 主线先在 `plan.md` 的当前 lane 看板中冻结每个长期角色的 `lane_id / status / assignment_id / context_path / unique_write_directory / next_action / user_gate`。
2. 为要恢复的 lane 生成 `ASSIGNMENT_CONTEXT.yaml`；没有有效 assignment 的 lane 明确写 `IDLE_REUSABLE`，不得从旧聊天自行续跑。
3. 新会话只按上节链条读取并生成 `BOOTSTRAP_ACK.yaml`；不得在 ack 被接受前运行科学动作、下载、构建、实验或状态转换。
4. 主线核对 ack 与 registry/plan 一致后，才允许新会话执行；随后归档对应旧会话。归档只改变任务窗口，不改变文件、状态或证据。
5. 任一 lane 发现 context、角色、哈希、写目录或状态冲突时，保持原状态并报主线；禁止用猜测、广泛扩读或重建旧上下文来“修复”。

## 权限与停止

- 只有主线可以变更正式状态、规则、目录结构和共享登记。
- 分支只写被分配目录。
- `REVISE_ONCE` 每阶段最多一次；Stage 0/Stage A 可有一次预登记 `MECHANISM_PIVOT`。
- 若唯一科学 revision 已实际消耗，但独立 gate 发现实验构造无效，导致既不能可信 PASS、也不能形成科学 STOP，则登记非终态 `INCONCLUSIVE_POLICY_HOLD` 并向用户报告；不得伪造第二次 revision、不得自动 STOP/reserve/archive。该题不占执行 lane，只有用户以题目、原子门、次数、证据 ceiling 和写目录均明确的授权批准 exceptional revision，或明确选择可逆暂存/撤回后才继续转换；例外 revision 不改写普通的一阶段一次规则。
- `STOP` 后不改名复活；新对象或新研究问题必须使用新 ID。
- 合法同对象的开源实现、模拟器和公开 trace 可作为执行资源。
- 缺少商品硬件只降低证据上限，不自动停止。
- AI 能完成决定主要 claim 的核心实现、比较或分析时才获得执行加分。
- AI 执行能力不足不是学术 STOP 条件。
- Discovery 和 Stage 0 允许 `SEARCH_BOUNDED_OPEN`；Stage B 必须完成影响主要 claim 的最新碰撞审查。
- Stage 0 是条件性论文潜力筛选，不要求主结论已成立；Stage A 是真实但受限的核心风险预研，正结果最多表示关键前提获得初步支持，不等于论文主结论完成。
- `PRE_CLAIM_CONTRACT_FIDELITY_GATE` 是 Stage A 首个 claim-bearing run 前的执行门，不是 Discovery 必须已经实现或实证闭合的录取门。Discovery 只需冻结可审计的 `FIDELITY_CLOSURE_PLAN`：目标完整动作、真实 comparator/native semantics、分母/full-cost、小 witness 与有限闭合路径。接口、格式、checker 或实现尚未完成时，只要研究对象与同函数保证清楚、没有已知直接吸收且存在有限闭合路线，仍可 `PROPOSE_STAGE0`；不得因缺当前实现或核心结果 DROP。若闭合必然换对象/降保证、无有限路线或已被当前 union 吸收，才可结构性 DROP。
- 当 action gap 依赖“当前实现没有某动作/接口/语义”时，Discovery 必须执行 `CURRENT_UPSTREAM_REALITY_CHECK`：同时核对冻结日期附近的官方文档、当前 upstream 源码以及默认/非默认 feature flag、阈值或配置入口，并记录版本/commit 与相反证据。旧版文档、旧 release note、issue 或 future-work 不能单独证明当前缺口。Stage 0 必须独立复核；若 current source 已表达冻结动作，应按 direct absorption 收缩或淘汰，而不是把尚未实现的更强算法当作既成 residual。该检查是最新碰撞硬门，不要求提前运行实验或证明主结果。
- 每个 Stage A 在首个 claim-bearing observation 前必须通过 `PRE_CLAIM_CONTRACT_FIDELITY_GATE`：候选实现覆盖冻结原子动作而非局部代理；比较器与声明语义一致；codec/solver/reader/format 等决定性构造路径同对象；指标分母、单位与 full-cost 维度完整；至少一个小 witness 的 legality/equivalence 可复核。未过门的 control/proxy 结果不得支持 PASS 或 STOP，可在初始 assignment 内纠正且不消耗 scientific revision。
- Discovery claim-pack mode 将执行准备度分成 `E0_UNKNOWN / E1_STATIC_PREFLIGHT / E2_ENGINEERING_SMOKE / EB_RESOURCE_OR_ENGINEERING_BLOCKED / EH_HUMAN_CORE`。E1 只读检查 artifact、依赖、接口和命令入口；E2 仅在 assignment 明确授权的字节、时间、命令、安装和写目录边界内运行非 claim-bearing 冒烟。E2 不测试科研假设，不是送 Stage 0 前置门，不得提升学术/碰撞/证据状态；失败只能改变执行准备度或形成 blocker，不能学术 DROP/STOP。
- 任何课题进入 Stage B 前必须停在 `PENDING_USER_STAGEB_REVIEW`，由用户查阅 Stage A 材料并明确批准；正式大规模实验、现有项目写入、重要设备占用和论文尝试仍必须经过用户确认。
- 只有 Stage B 独立复审接受且用户逐题签发 `formal_project_approval_id` 后，才可创建 `projects/<ID>/`。正式项目可由 AI 推进证据补齐、写作、引用/完整性和复现包，但作者贡献、未公开所有权、venue、外部通信与最终投稿必须由用户明确决定。

详细规则以 `rules/` 中对应文件为准。

## 资源失败、用户解阻与科学结论

- 新增正式非终态 `BLOCKED_USER_ACTION_REQUIRED`。下载、权限、许可、设备、数据、网络、工具链或必须由用户提供的输入阻止阶段执行，且尚未产生支持或否定核心机制的 claim-bearing observation 时，必须进入该状态并向用户报告；不得判 `STOP`，不得自动转入 `HUMAN_RESEARCH_RESERVE`，也不得自行归档课题。
- blocked 课题原地保留在所属阶段，执行 lane 可以释放并继续其他课题；主线应在状态汇报中单列 blocker、用户最低动作和恢复入口。用户解阻后把同一冻结合同投递给空闲长期 lane，从新 resume 子目录继续，旧失败目录不可覆盖。
- `HUMAN_RESEARCH_RESERVE` 只用于学术潜力仍成立、但核心研究本身长期需要 AI 无法承担的人工研究能力，或用户明确选择暂存；它不是临时资源/基础设施故障的默认收容状态。唯一例外是用户事先批准了题目级、有限路线与预算均列明的 `USER_DIRECTED_RESERVE_FALLBACK`：主线必须先机械证明所有获批恢复路线均已耗尽，随后只能登记 `HUMAN_RESEARCH_RESERVE__USER_DIRECTED_RESOURCE_BLOCKED__NO_SCIENTIFIC_INFERENCE` 或 `HUMAN_RESEARCH_RESERVE__USER_DIRECTED_POLICY_HOLD__NO_SCIENTIFIC_STOP`。这只是可逆管理性暂存，必须保留原阶段、冻结合同、blocker、哈希和 resume point，且只能由用户 `RESUME_FROM_RESERVE` 重新激活。
- 科学 `REVISE_ONCE` 只在原子合同、机制、模型、比较或证据缺口实际被修订并执行时消耗。若在第一个 claim-bearing observation 之前 fail closed，只记录 resource attempt，不消耗科学 revision；用户解阻后标记 `RESUME_FROM_BLOCKER`。
- blocker 必须形成用户可操作包：精确错误、发生阶段、已/未执行内容、所需资源的版本/哈希/大小/许可/路径、可接受替代形式、最低解阻动作、成本和安全边界。不得因等待时间、AI 自主能力不足或下载失败推断课题较差。
- 若用户授权包含 `USER_DIRECTED_RESERVE_FALLBACK`，blocker 包还必须列出批准的每一条有限恢复路线、各路线实际 attempt、机械失败证据、剩余未获批路线以及 reserve 后的精确恢复入口；未证明 exhausted 时不得使用该兜底。
- 只有直接碰撞、same-object 失败、公平强基线吸收、自然对象上的决定性反例、形式反证、full-cost 下无 residual 等真实科学负证据才能形成 STOP。纯资源失败的 evidence ceiling 固定为 `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`。
- 用户授权 `USER_BLOCKER_AUTONOMOUS_OPEN_SOURCE_ACQUISITION_20260814` 生效后，已登记的资源 blocker 和持续 Discovery 新产生的同类 blocker 可由主线在题目级 assignment 中冻结公开/开源获取与隔离恢复路线：官方或可核验来源的源码、文档、论文、数据、trace、便携工具链，以及完成原冻结门所必需的源码构建、转换、静态检查和重放。每个 assignment 必须列明 URL 或确定性选择规则、许可证/provenance、响应字节、存储、CPU/wall、attempt 上限、唯一写目录和失败后果；旧失败目录不可覆盖。
- 该授权不允许私有或无许可材料、凭据/访问控制绕过、外部人员通信、系统级安装或全局 PATH/注册表修改、无限重试、换题/换 object/换 commit/换保证、第二次 scientific revision、STOP 复活、Stage B、V9 或正式项目。优先使用便携、进程局部、可删除的隔离环境；若必须扩大到系统安装、私有数据、闭源许可、排他设备或超出冻结预算，仍须向用户请求新的精确授权。
- 资源门通过后才可进入原 assignment 的 `PRE_CLAIM_CONTRACT_FIDELITY_GATE` 或科学 revision；资源获取或构建失败仍只回到 `BLOCKED_USER_ACTION_REQUIRED`，不产生科学负推断。
