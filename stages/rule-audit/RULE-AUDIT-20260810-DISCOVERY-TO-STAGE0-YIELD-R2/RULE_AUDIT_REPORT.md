# Rule Audit Report

## Identity

- `audit_id`: `RULE-AUDIT-20260810-DISCOVERY-TO-STAGE0-YIELD-R2`
- `trigger`: R1 后的 Discovery→Stage 0 路径产生两个高信息案例：Wave39 WebGraph 的 broad mechanism 被当前 `BvCompZ`/Zuckerli 吸收并在一次 revision 后建议 STOP；Wave41 HNSW 在潜力重筛后被 FastHNSW/FastKCNA 与 generic b-matching 大幅扣除。Wave42/43 潜力重筛继续零提案。
- `requested_by`: 用户经主线冻结 assignment
- `date`: 2026-08-10（Asia/Shanghai）
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260810-DISCOVERY-TO-STAGE0-YIELD-R2/`
- `shared_files_modified: false`
- `USER_APPROVAL_REQUIRED: true`

## Question and scope

- User/process question: 判断 Discovery→Stage 0 的低 yield 主要来自 current-source/paper collision 不足、原子动作命名不足、Stage 0 门过严，还是合理高淘汰；在不要求核心结论/实现且不降低 hard gates 的前提下，提高 brief precision 与 Stage A yield；判断是否应正式启动 v8.8 回测及后续最小 patch。
- Rules inspected: `AGENTS.md`；`rules/ROLE_RULE_AUDIT.md`；`rules/ROLE_DISCOVERY.md`；`rules/ROLE_STAGE0_REVIEW.md`；`rules/ROLE_MAINLINE.md`；`templates/TOPIC_BRIEF.md`；`templates/STAGE0_REPORT.md`。
- Candidate examples inspected: R1 报告/提案；Wave39 WebGraph Discovery brief、collision matrix、Stage 0 PRIMARY、SENTRY confirmation、revision 交付；Wave40/41 HNSW Discovery 与 Wave41 Stage 0 PRIMARY；Wave42 SPLIDT 与 Wave43 Kafka/Flink 潜力重筛。
- Out of scope: 不重新裁决 WebGraph、HNSW 或任何终态题；不改变 revision budget；不创建或恢复候选；不运行文献下载、实验、Stage 0/A/B 或自动化；不修改共享文件。
- Evidence snapshot: `registry.yaml` 的 authoritative machine snapshot 为 `updated_at=2026-08-10T18:17:00+08:00`，SHA-256 `CC8B3ED0F0079BE6EC8906FBF527440D2AD1A5EC07BC1D04D6861F9F311439BA`。当时 WebGraph revision 为 `RECOMMEND_BELOW_Q2_STOP`、closing confirmation 尚排队；HNSW 为 `STAGE0_CONFIRMATION_ACTIVE`。本审计不预判后续 closing/confirmation。

## Current authoritative behavior

1. `rules/ROLE_DISCOVERY.md`“论文机会包”“三遍发现法”要求当前 anchor、前置、后续/竞争工作、反证、actual artifact，以及 problem/object/decision/constraint/algorithm/guarantee/evidence 的 facet comparison。
2. 同文件“Discovery 保真计划与 Stage A 保真执行门”规定：Discovery 不需要实现、核心实验或主结论；只需完整原子动作、真实 comparator/native semantics、小 witness 与有限闭合路线。真正的 `PRE_CLAIM_CONTRACT_FIDELITY_GATE` 在 Stage A 首个 claim-bearing run 前闭合。
3. 同文件“新颖性与基线”规定：action space 能表达同一动作不自动吸收新算法；只有同一核心方法/保证/成本边界才是 `DIRECT_FATAL`。
4. `rules/ROLE_STAGE0_REVIEW.md`“目标”“PASS 条件”“资源与可执行性边界”规定：Stage 0 是“若假设成立”的条件性论文潜力筛选，不要求实现、证明、正结果或已闭合小 witness；Stage 0 只审计 fidelity plan 的有限性与 same-object。
5. 同文件同时要求 Stage 0 独立重做 current upstream 与最新 paper collision，并在性能/算法题上明确非平凡算法增量、full-cost、推广和 Stage A killer。
6. R1 提案尚未获批、未成为生产规则；Wave35–43 只是更严格执行 v8.7 已有的“action-space overlap 不等于 algorithmic absorption”原则。

## Evidence of a problem or of correct behavior

| Observation | Source/artifact | Repeated? | Classification |
|---|---|---:|---|
| Wave39 WebGraph brief只检查 Java `BVGraph`/API 并把“全局 forest 是否存在”留给 Stage 0；Stage 0 随即在冻结日前的 first-party Rust `webgraph 0.6.2` 找到 `BvCompZ`，并补入 Zuckerli。 | Wave39 brief/collision matrix；WebGraph Stage 0 `SOURCE_AUDIT.md` | 是，构成 sentinel | Discovery current-source 与 paper collision 执行不足；不是现行 latest-collision 门过强。 |
| WebGraph 的 `1→0, 2→0` witness 是可并存 siblings，不能区分动作；“global forest”又被 `BvCompZ` 的 forest+depth-DP+greedy-refill 吸收。 | WebGraph PRIMARY、confirmation、revision action audit | 是 | Discovery 原子动作/最小 divergence witness 不足；broad claim 的高淘汰合理。 |
| WebGraph Stage 0 revision 最终要求 actual successor lists、native costs、final `BvCompZ` output 与 strictly better forest；revision 因没有 native-realizable output 而建议 STOP，尽管报告承认 bounded native search 是有限 Stage A route。 | WebGraph confirmation/revision | 一例但边界明确 | Stage 0/Stage A 证据边界存在模板与执行风险；不能据此自动推翻该题结论。 |
| Wave40 HNSW 因 action gap 未冻结而 DROP；Wave41 按 R1 纠偏后命名 layerwise b-matching+repair 并送 Stage 0。 | Wave40/41 Discovery logs | 是 | R1 的 action-space 纠偏方向有效：未实现不再自动阻断潜力重筛。 |
| HNSW brief只覆盖原始 HNSW、hnswlib、FAISS，把最新 paper collision 保持 `SEARCH_BOUNDED_OPEN`；Stage 0 随即找到冻结日前的 FastHNSW/FastKCNA（PVLDB 2025）及 generic b-matching genealogy。 | HNSW brief；Stage 0 `SOURCE_AUDIT.md` | 第二个 sentinel | Discovery paper genealogy/algorithm-kernel subtractor 不完整，导致 brief precision 低。 |
| HNSW 的 broad global/layerwise claim 被 FastHNSW 吸收，plain b-matching 被 generic genealogy 吸收；只剩 integrated connected degree-bounded selector/repair property。 | HNSW Stage 0 report/matrix | 是 | Stage 0 的 subtraction 合理，REVISE 而非直接 STOP 也符合条件性筛选。 |
| HNSW revision gate要求 realizable six-vector metric instance和各 comparator exact outputs，虽然报告同时声明不要求 implementation/result。 | HNSW Stage 0 report/handoff | 第二例 | “model-level action certificate”与“native realization result”未分层；有把 Stage A fidelity probe 前移的风险。 |
| Wave42 SPLIDT 没有命名 delta constructor、保证或完整 action interface，并诚实记录 source/config 不可达而不作 absence 推论。 | Wave42 log/matrix/handoff | 是 | 合理零提案；action 未定义，不是因为缺实现或 Stage 0 过严。 |
| Wave43 Kafka/Flink 都保留潜在 Tier B 形状，但无法冻结不改变 fetch/retention 或 checkpoint/recovery guarantee 的完整动作；没有声称 current union 吸收。 | Wave43 log/matrix/handoff | 是 | 合理零提案；same-object/guarantee 仍未闭合。 |
| 两个进入 Stage 0 的新 brief 均遗漏了 Stage 0 在同一冻结日迅速找到的决定性 pre-cutoff 近邻；样本仅 2，不可外推为全库比例，但足以触发方法回测。 | Wave39/41 end-to-end trace | 2/2 sentinel | Discovery→Stage 0 precision 问题，需回测而非直接放宽门。 |

## Bottleneck attribution

### 1. Discovery current-source/paper collision不足：`PRIMARY BOTTLENECK`

两个新 brief 都没有在提交前覆盖最接近的 current same-object implementation/paper。WebGraph 只看 Java 主树，漏掉同一作者/first-party Rust release 与 CLI；HNSW 只看 anchor/native libraries，漏掉 2025 global layer builder 和 candidate method kernel。现行规则已经要求这些材料，因此首先是执行/模板可机械验收性不足，而不是需要降低 latest collision。

`SEARCH_BOUNDED_OPEN` 仍可合法送 Stage 0，但它不能替代最小 current collision bundle。开放状态应表示“在已完成最近 same-object paper、current first-party artifact family 与 generic kernel scan 后仍可能有未知工作”，而不是把最近竞争工作整体留给 Stage 0。

### 2. 原子动作命名不足：`CO-PRIMARY BOTTLENECK`

WebGraph 的 broad action 与 witness 都未越过当前 pipeline；HNSW 的 b-matching+repair 还没有定义 capacity-respecting integrated repair 和其 property。Wave42/43 进一步表明，纠正 action-space 误判并不会自动产生 brief：没有 complete action/guarantee 仍应零提案。

需要的不是已实现动作，而是可审计的 model-level action certificate：冻结信息、合法动作集、baseline transition/algorithm、candidate transition/algorithm、非平凡 property、model-level divergence witness 与 native realization falsifier。它必须足以证明“研究假设是什么”，但不需要证明假设在真实 artifact 上已经成立。

### 3. Stage 0 门过严：`SECONDARY BOUNDARY DEFECT, NOT GLOBAL GATE FAILURE`

Stage 0 对 BvCompZ、FastHNSW 和 b-matching 的减法是合理的；PRIMARY/SENTRY 也正确保留了窄 residual 的一次 revision。因此不建议降低 Stage 0 的 same-object/current collision/strong-baseline 门。

风险在 revision certificate 的证据类型：要求实际 native costs、final implementation outputs 或 realizable natural/native witness，可能等价于提前执行 Stage A 的 small-witness/fidelity probe。Stage 0 可以要求抽象或形式 action-divergence certificate、算法状态/转移/复杂度 skeleton 与有限 native test；只有 actual native realization、checker/reader closure 或性能/自然 headroom 才应进入 Stage A preclaim gate。

这一澄清只影响未来 admission boundary，不改变 WebGraph 当前 revision/closing 状态，也不预判 HNSW confirmation。

### 4. 合理高淘汰：`SUBSTANTIAL AND EXPECTED`

Wave42/43 的三条方向都停在“完整动作或保证未定义”，且没有把资源/transport 伪装为科学反证；这是高标准 Discovery 应有的零提案。WebGraph broad claim 与 HNSW broad global claim也确被当前工作吸收。提高 precision 不以提高 brief 数量为验收指标，零提案必须继续合法。

## Recommended precision and yield mechanism

### A. Discovery brief precision gate

每个 `PROPOSE_STAGE0` 在现有三遍发现法后增加一个机械 gate：

1. `CURRENT_COLLISION_MINIMUM_SET`：至少一个最近 same-object paper；所有已知 first-party/current implementation family（含 sibling repo、released crate/package、CLI mode）；candidate 所用 generic algorithm kernel；current flags/config；各自 facet verdict。
2. `ATOMIC_ACTION_CERTIFICATE`：exact object/guarantee、information、legal action set、baseline decision rule、candidate decision rule、nontrivial property/complexity target、model-level divergence witness、full-cost dimensions、native realization falsifier。
3. `REPLAY_OR_RESIDUAL`：若 baseline 在相同信息和完整成本下可重放 candidate rule/property，则 DROP；若只共享 action space，则保留为强基线。
4. 决定性 source route 因具体 transport/resource 不可达时，不得声称 absence；raw line 使用 `NOT_ADMITTED_UNFROZEN` 或 `RESOURCE_BLOCKED`，不是科学 STOP。

### B. Stage 0 evidence boundary

Stage 0 可要求：current-source/paper subtraction、完整 model-level action、一个抽象/形式合法的 divergence witness、算法/property skeleton、有限 Stage A killer。

Stage 0 不应要求作为 PASS 前提：candidate implementation、native comparator output、实际 native cost matrix、成功 small-witness run、自然 headroom 或 performance result。若 model action与finite native test都清楚，native realization 应成为 Stage A 的第一个 `PRE_CLAIM_CONTRACT_FIDELITY_GATE`；若 model action本身仍只是“用 DP/ILP/b-matching/repair”，则仍可 `REVISE_ONCE` 或 STOP。

不新增正式状态。现有 `PASS_RECOMMENDED` 配合 `FINITE_FIDELITY_GAP` 足以表达“paper shape成立、native realization待 Stage A falsify”。

### C. Stage A yield without admission relaxation

1. 只对 Stage 0 独立确认后的 Tier A/B 题使用 R1 的 `STAGEA_YIELD_PRIORITY`，不能覆盖学术质量。
2. 优先具有：current collision已闭合、atomic certificate清楚、native small witness finite、自然 corpus和强 baseline可达、full-cost可观测的题。
3. Stage A 第一个 killer直接测试 native realization/replay，不先建设大系统；若被 current implementation重放或同对象 closure失败，快速科学 STOP。
4. 发现率和 Stage A PASS 数量只作健康度结果，不作配额；验收指标应是 brief precision、preclaim fidelity closure率和 decisive-observation率。

## Risk analysis

- False-negative risk: 当前为中高。两个 sentinel brief 都遗漏决定性 pre-cutoff近邻；另一方面，若 collision minimum set被误解为穷尽检索，也会制造新的 false negative。
- False-positive/weak-paper risk: 接受 model-level witness而把 native realization留到 Stage A，会增加少量 Stage A 快速失败；通过完整 current-collision bundle、独立 Stage 0和first-killer fail-closed控制。
- Scientific-integrity risk: 中。最大风险是把未运行的 native witness写成已证 action gap，或反向把缺 native result写成结构性 STOP；提案要求显式区分 evidence、hypothesis和future falsifier。
- Resource/time risk: 中。每个 brief增加 current sibling-artifact、recent same-object paper与generic-kernel scan；上限固定为有限 source bundle，不要求穷尽。
- State-migration risk: 低。只适用于未来 brief和回测；不迁移 active/blocked/hold/terminal states。
- Terminal-revival risk: 必须为零。WebGraph 若最终 closing STOP、以及其他历史 STOP，都只可作为 negative control，不得重开、重命名或重新投入。

## Recommendation

- Decision: `BACKTEST_REQUIRED`
- User approval: `USER_APPROVAL_REQUIRED`；本报告不构成批准。
- Minimum effective change: 把 R1 的 algorithmic residual纠偏与本轮的 `CURRENT_COLLISION_MINIMUM_SET + ATOMIC_ACTION_CERTIFICATE + MODEL_VS_NATIVE_WITNESS_BOUNDARY` 合并为一个 sealed v8.8 backtest；通过后再请求用户二次批准最小生产 patch。
- Why a smaller operational fix is insufficient/sufficient: 仅提醒 Discovery“多搜论文”不足以防止 first-party sibling implementation遗漏，也不能解决 Stage 0 witness前移；直接修改规则又可能增加弱 brief。时间切片回测是最小安全步骤。
- Non-relaxable gates preserved: Q2、same-object、current collision、公平当前强基线、自然对象、full-cost、可复现、claim ceiling、证据诚实、STOP不复活、Stage B逐题审批全部保持。

## Validation and rollback

- Historical cases/backtest required: 是。独立 `PACKER → EXECUTOR → AUDITOR`，executor 对结果标签盲化，cutoff先于决定性来源与后续阶段结果。
- Required sentinel set: WebGraph broad/current `BvCompZ`；HNSW broad/FastHNSW+generic b-matching；SPLIDT、Kafka、Flink 未冻结动作；至少 6 个历史 Stage 0 PASS形状（含唯一 Stage A PASS）；至少 6 个 direct/changed-object/ordinary-wrapper负对照；至少 4 个 resource/unfrozen非科学失败例。
- Shadow-run plan: 回测通过后，仅在两个未来 Discovery wave并列生成 old-path与v8.8-path日志；不改变 canonical decision，不运行实验/下载；每 lane固定 top-3 deep、最多2 briefs。
- Success criteria:
  1. WebGraph 的 `BvCompZ`/Zuckerli 与 HNSW 的 FastHNSW/generic b-matching 在 proposal boundary前 `2/2` 被捕获；broad claim leakage为 `0/2`。
  2. 100% proposed briefs包含 complete collision minimum set和atomic action certificate；`SEARCH_BOUNDED_OPEN`不得缺最近same-object paper字段。
  3. 100% Stage 0 replay cases区分 model-level certificate与native-realization result；不得仅因缺实现、native output或正结果而STOP。
  4. 6/6结构性负对照不被包装；至少5/6历史正形状进入candidate-grade deep review，至少4/6保留为proposal或明确未冻结而非结构性误杀。
  5. 4个resource/unfrozen案例至少3个不被标为scientific structural drop；所有terminal revival为0。
  6. 两个shadow wave中，Stage 0不得再补出一个冻结日前、属于minimum set且会直接吸收broad claim的遗漏来源；零提案仍允许。
  7. StageA priority历史回放将唯一既有PASS置于前半，但不取消任何Tier A/B题。未来至少6个Stage0-confirmed题只观测preclaim fidelity closure与decisive-observation率，不设置PASS配额。
- Failure/rollback condition: 任一 hard gate被削弱、负对照被包装、terminal被复活、source minimum膨胀为无界检索、或Stage0再次要求candidate实现/正结果作为条件；保持v8.7生产规则并登记失败核。

## Mainline handoff

- User approval already present: 否。`USER_APPROVAL_REQUIRED`。
- Files proposed for change after successful backtest and second approval: `rules/ROLE_DISCOVERY.md`、`rules/ROLE_STAGE0_REVIEW.md`、`rules/ROLE_MAINLINE.md`、`templates/TOPIC_BRIEF.md`、`templates/STAGE0_REPORT.md`。
- Registry migrations proposed: 无候选状态迁移；若用户批准回测，主线只登记一个 consolidated v8.8 method-backtest assignment。
- Existing active/blocked/hold/terminal topics affected: 无。HNSW active confirmation与WebGraph closing保持主线当前流程；任何terminal STOP不复活。
- Shared files modified: `false`

