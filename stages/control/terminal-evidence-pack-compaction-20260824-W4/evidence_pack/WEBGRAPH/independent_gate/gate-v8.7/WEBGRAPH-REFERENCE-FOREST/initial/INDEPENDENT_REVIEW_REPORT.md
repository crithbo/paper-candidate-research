# WEBGRAPH-REFERENCE-FOREST — 独立 Stage A Gate Report

## 1. 最终裁决

- Assignment：`STAGEA-G1-20260810-WEBGRAPH-REFERENCE-FOREST-INITIAL-CLOSING-V8.7`
- Role：`INDEPENDENT_STAGEA_GATE_REVIEW`
- Decision：`REVISE_ONCE`
- Confidence：`0.97`
- 当前质量层级：`TIER_B_Q2_VIABLE__CONDITIONAL_ON_ONE_ATOMIC_REVISION`
- 当前 evidence ceiling：`PRELIMINARY_NATIVE_SIZE_SUPPORT__NO_FULL_COST_DOMINANCE__RANDOM_ACCESS_REGRESSION__TWO_NATURAL_GRAPHS_ONLY`
- Scientific revision consumed：`false`
- Resource blocker：`null`
- `pending_user_stageb_review=false`
- `stageb_user_approval_id=null`
- `StageB=false`

本裁决既不接受 size-only `PASS`，也不把当前可界定的实现/等最优解选择缺口误判为结构性 `STOP`。冻结机制已在同一 native object 上产生真实、非 tie 的完整动作 residual；但预注册 full-cost success rule 被 construction、RSS 和 random-access 结果明确否决。一次不换对象、不扩 corpus、不改 primary bits objective 的有限 revision 是唯一合规下一步。

## 2. 输入、权限与独立性

只读取了本题 Stage 0 decisive 最小包和冻结 Stage A owner 包；没有读取其他题目作为证据，没有修改 owner、主控、规则或模板，没有运行候选研究实验、revision 或 Stage B。

冻结输入复核：

| 输入 | 独立复核 |
|---|---|
| Stage 0 decisive manifest | `AA9C965999B885FEAF95367C2B20C10C05934061F6ECBDCC341EBDECBF22314B`; 2/2 PASS |
| Stage 0 decisive report | `E99137221AB044BAFFF26F634EAF2CA9E787B44FD6CB0BB60E1890693619989D` |
| Stage 0 decisive handoff | `64D0E33509CC22DBAD67276CFA193B212934BCFFB6D5DC8EE8F66F5B33FB399C` |
| Owner manifest self | `4B9AD7373D306847726B9BDD00820AA29FBCC89528FC46E1CF72A9885150A818` |
| Owner manifest entries | `66,809/66,809 PASS`; missing 0; mismatch 0; covered bytes `4,816,355,476` |
| Owner handoff | `2C5BB293F32E3DA2C02EC0A362238B4552BC87EF23235900ECAF69C6CE74113B` |
| Owner report / results / user packet | `8F6440A2AE2B57536974D6970A30D45D1A7A50AF6F15A7EDCEA6B6A014CBDE42` / `A7E4E387E87073683F776A64AB16AB4A9D04E98B2A12C5BDDB703AD851DBC397` / `BFC3B6F70E7E38F27013A49C2BEE19B370D6438F51A16F810CD6786B2320DEC3` |

`cross_assignment_contamination=false`。本报告中的“复算”均为冻结数据的只读验证，不是新增研究 observation。

## 3. Preclaim fidelity 审计

### 3.1 冻结时序与 exact object

`EXPERIMENT_CONTRACT.yaml` 的 SHA-256 为 `87DBA013BA6883F63CA45C9EAA476672BF22AB8CE195A1A61246C73F5336A950`，标记于任何 claim-bearing run 之前冻结。结构域的节点数从内部不一致的 12 修正为 24，发生在生成/执行和 observation 之前，只使已声明的 successor universe 合法，没有依据结果改合同。缺失 EF 的第一次 tiny attempt 也发生在 claim-bearing observation 之前并被保留为失败记录。

冻结对象保持为：固定顺序、精确 successor lists；WebGraph `0.6.2`、BE、Gamma/Unary/Gamma/Gamma/Zeta(3)、interval 4、`W=4`、`D=3`、chunk 128；输出是 native `.graph/.offsets/.properties`，并由未改语义的 sequential/random reader 读取。候选只替换 reference-selection decision rule。

### 3.2 38,372 exhaustive oracle

我从 `tiny-candidate-audit.tsv` 的完整合法 action/cost table 独立枚举 depth-bounded forests，得到：

- 合法 forests：`38,372`；
- optimum：`148` bits；
- lexicographic optimum vector：`0,0,0,0,1,1,0,4,0`；
- candidate 与 final BvCompZ 均为同一 `148`-bit vector；
- candidate/baseline 的 `.graph/.offsets/.properties/.ef` 哈希逐项相同；
- native writer additivity、sequential、offset、EF random reader 与 4,096-query checksum 闭合。

因此 preclaim gate 是 fidelity PASS，而不是 positive scientific evidence。它足以排除 proxy codec、非法 action、writer/reader 换对象和 tie/rounding 伪差异。

## 4. Comparator 与 same-object 审计

### 4.1 Final BvCompZ 是可执行同对象 strongest baseline

released source 到 baseline tree 只有 `mmap_helper.rs` 的 Windows rustdoc-to-comment 非语义修正。baseline 与 candidate tree 的语义差异仅位于 `bvcompz.rs`：候选在同一 native action-cost table 上保留并实际执行 final BvCompZ 的 `update_references_for_max_length` 加 `find_additional_references_greedily`，随后才执行 exact complete-action DP；另有单独 baseline binary/native writer replay。

这不是 `best-of` synthetic union，也不是只减去 best-parent prefix。比较器是同一 released final pipeline、相同 lists/order/codes/window/depth/chunk/writer/readers 和相同信息。候选 diff 还逐 action 断言 estimator cost 等于 native writer bit delta，并断言 action-cost sum 等于写出的 graph-stream bits。

### 4.2 自然对象

- LAW `cnr-2000`：官方 native graph，保留 published native vertex order；仅为 released Rust mmap reader 追加一个零 padding byte，原始文件与派生文件均冻结，encoded bits/successor lists 不变。
- SNAP `Wiki-Vote`：官方 edge rows，预先冻结为 ascending original integer-ID order；方向不变、精确 duplicate 规则和 self-loop 规则固定；exact lists SHA-256 为 `0C6E2D232478628E55EA153B268392E474628F39E2E77A247578676381FBB848`。

两者都承载同一 fixed-ordered immutable graph compression object。证据范围只能是这两张图和这一组小 `W,D` 配置，不能外推到所有 WebGraph corpus、默认/更大配置或一般最优性/实用性。

## 5. Claim-bearing evidence 独立复算

### 5.1 Frozen 2,048 structural domain

从全部 2,048 条 candidate audit 直接重算：

| 项目 | 结果 |
|---|---:|
| Strict non-tie divergence | `531` |
| Tie-only different vector | `45` |
| Identical vector | `1,472` |
| Exact worse | `0` |
| Baseline / exact sum | `1,207,081 / 1,205,227` bits |
| Total saving / max per case | `1,854 / 16` bits |
| First strict case | `case-0043`, `561 -> 560` bits |
| States / transitions | `9,065,896 / 35,606,057` |

`531/2048` 不是 tie、byte padding、flag 或 reader artifact；`case-0043` 的 separate baseline writer 也保持 561 bits。该结果真实攻击“final BvCompZ 是否已经吸收完整合法动作优化”这一最高风险前提。

### 5.2 Natural results 与方向

从每个 chunk audit、raw run metrics 和实际文件重新求和/哈希：

| Corpus | Strict chunks | BvCompZ / exact bits | `.graph+.offsets` saving | Native payload saving | Build elapsed ratio | RSS delta |
|---|---:|---:|---:|---:|---:|---:|
| cnr-2000 | `2,053/2,544` | `9,319,309 / 8,763,554` | `72,792 B` | `72,793 B (4.897%)` | `104.672x` | `+3,690,496 B` |
| Wiki-Vote | `54/56` | `876,503 / 875,555` | `136 B` | `135 B (0.114%)` | `13.036x` | `+2,740,224 B` |

Wiki-Vote 的 `.properties` 多 1 B，所以 `.graph+.offsets` saving 136 B 与 native payload saving 135 B 同时正确；没有方向或分母误读。所有八组自然 output 文件的 bytes/SHA-256 均与 `natural-summary.json` 匹配；baseline/candidate 的初始 reader checksum 相同。

Reader replay 的 10 个 post-warmup repeats 采用冻结 analyzer 的 lower-median p50 与 nearest-rank p90，复算得到：

- cnr-2000 random p50/p90：`1.094x / 1.083x`；
- Wiki-Vote random p50/p90：`1.042x / 1.056x`；
- sequential 无一致方向，但 random access 在两图均有同方向回退；
- 每一 track 的 sequential/random checksums 都稳定且跨 variant 相等。

这说明性能回退不是语义错误，但它确实否决了冻结的 access no-regression 条件。

## 6. 为什么不是 PASS 或 STOP

### PASS 不成立

冻结 natural success rule 要求至少一个严格持久化 graph+offset residual，同时 reader/access 不得在测量噪声之外回退；full-cost Pareto rule 还禁止把单一 size gain 冒充总体优化。尽管 size 条件在两图均成立，candidate 的 build elapsed 为 `104.67x/13.04x`、RSS 更高，random-access 也稳定回退。因此当前只能支持 native-size premise 的 `PRELIMINARY_SUPPORT`，不能支持 full-cost Stage A PASS。

### STOP 也不成立

STOP 需要同对象直接吸收、无自然 residual、形式反证或完整 full-cost absorption。这里 final BvCompZ 并未吸收 complete-action optimum，且两张冻结自然图都有真实持久化 size residual。当前 exact implementation 在 `BTreeMap<Vec<depth>, full-reference-vector>` 中复制长 vector；在 `W=4,D=3` 时状态空间仅 256，这给出一个有限、可执行且不改 optimum 的 dense-state 修复。access 风险可能更结构性，但可以只在 equal-bit optima 内用静态 reference-chain work tie-break 作一次决定性测试。故当前负结果是混合 tradeoff，不是已闭合的结构性科学 STOP。

## 7. 唯一冻结 revision gate

Gate ID：`SCALABLE_DENSE_FRONTIER_AND_EXACT_OPTIMAL_ACCESS_TIEBREAK_GATE`

这是唯一允许的 Stage A scientific revision；不得拆分、扩展或转为 corpus/config search。

### 7.1 冻结输入与对象

- Parent owner manifest：`4B9AD7373D306847726B9BDD00820AA29FBCC89528FC46E1CF72A9885150A818`
- Parent handoff：`2C5BB293F32E3DA2C02EC0A362238B4552BC87EF23235900ECAF69C6CE74113B`
- Parent contract：`87DBA013BA6883F63CA45C9EAA476672BF22AB8CE195A1A61246C73F5336A950`
- Tiny input：`2DD06C1B5118618027DDB96087FBCEF1BE3A996AA091A8D5EE568D0984BC6739`
- Structural manifest：`76AFBD0E5C207C267F91AD519C56A628E19E4B756AB49678C8CE83E0F3FA481A`（2,048 cases）
- cnr-2000 padded graph / properties：`1679E1AFACE9A1E211DBC6A79C4FEEE6A4BE4A1CB0079E0F6AF9DB4479CE4FAF` / `0852D952C16ABCEF0F838747B820A669703BE5B53D78977185AAA9FA9877A946`
- Wiki-Vote exact lists：`0C6E2D232478628E55EA153B268392E474628F39E2E77A247578676381FBB848`
- Baseline `bvcompz.rs`：`0567152C09D4718A823F3D2E650D6FA2AA4BA1BAAD6031D7E49616B06658A175`
- Native configuration、chunk boundaries、writer/readers、primary graph-stream bits objective 全部不变。

### 7.2 唯一允许的科学改动

1. 把 `BTreeMap<Vec<depth>, full-reference-vector>` 替换为 base-`D+1` dense state IDs、rolling exact-cost arrays 和 compact backpointers；完整合法 action set、native `c_i(delta)`、exact optimum 不变。
2. 每个 chunk 先严格最小化 primary graph-stream bits；只在 primary bits 完全相等的 optima 中，按预注册静态 tuple 最小化：`(sum_i reference_chain_depth_i, max_i reference_chain_depth_i, lexicographic delta vector)`。
3. tie-break 只能读 action table、所选 references 和由其确定的 chain depths；禁止读取或学习 reader timings、query trace、corpus identity 或事后性能结果。

禁止：新增 corpus、改变 vertex order/codes/`W`/`D`/chunk、搜索配置、改变 primary bits objective、使用 reader-timing oracle、选择性 fallback、换 codec/backend、扩大 claim。

### 7.3 Fidelity 与复现门

在 claim-bearing revision run 前必须全部通过：

- tiny 仍枚举 `38,372` forests、primary optimum 148 bits，并由独立 oracle 验证新 tie tuple；
- 2,048 cases 的 baseline/exact primary bit totals 逐 case 等于初轮；exact worse 为 0，`case-0043` 仍为 `561/560`；
- 两张自然图 primary totals 仍为 `8,763,554` 和 `875,555` exact bits，baseline totals 不变；
- baseline native output hashes 必须复现初轮；candidate output hash可因合法 equal-bit tie-break 改变，但必须新冻结，且 successor-list equality、writer/additivity、offset、sequential/random reader 和 checksum 全部 PASS；
- audit 必须证明每个 changed action 只来自 equal-primary-bit secondary choice，并报告 per-chunk `sum depth/max depth/lex vector`。

Fidelity 失败在首个 revision claim-bearing observation 前只允许同一实现的机械修复，不消耗 revision，也不支持 PASS/STOP。

### 7.4 Full-cost 成功/失败判据

固定在两张现有图上各执行 11 个 matched build/validate pairs，奇偶 pair 交替 baseline/candidate 顺序；pair 0 只作 warmup，分析其余 10。reader 也固定为每个 output 11 repeats、repeat 0 排除、同一 fixed-seed 100k queries。p50 使用 lower median，p90 使用 nearest-rank。

`PASS_RECOMMENDED` 仅当以下条件同时成立：

1. 两图的初轮 exact primary bit totals 与严格持久化 size residual 均保持；
2. 在两图上，candidate/baseline 的 end-to-end elapsed、CPU、peak RSS、sequential p50/p90、random p50/p90 每一项都 `<=1.05x`；
3. 全部语义、writer/reader、checksum、no-fallback 审计通过；
4. claim ceiling 仍限于 `PRELIMINARY_SUPPORT`，并只能推荐 `PENDING_USER_STAGEB_REVIEW`。

在 valid、完整、可复现的 revision run 中，只要任一图丢失 size residual，或任一上述 full-cost ratio `>1.05x`，则 `STOP` 冻结 narrow mechanism：`FIXED_W4_D3_TWO_NATURAL_GRAPH_COMPLETE_ACTION_EXACT_OPTIMIZER_UNDER_NO_REGRESSION_FULL_COST_RULE`。不得外推为所有 WebGraph/reference forest 不可能。

若 scientific revision 已消耗后才发现构造/比较无效，不能伪造科学 STOP；按项目规则进入 `INCONCLUSIVE_POLICY_HOLD` 交用户裁决。

### 7.5 资源预算与消耗时点

- Network：`0 B`；只复用冻结输入与工具链。
- 新增磁盘：`<=2 GiB`。
- CPU：`<=2 CPU-hours`。
- GPU/exclusive device/system install/global mutation/external write：全部禁止。
- 首个 claim-bearing natural matched pair 启动前，必须原子记录 `scientific_revision_consumed=true`；在此之前仅 fidelity/mechanical repair 不消耗 scientific revision。

## 8. Claim ceiling 与适用边界

当前可声明：在 frozen WebGraph `0.6.2`, `W=4,D=3,chunk=128` object 上，complete legal-action exact DP 相对 final BvCompZ 在 531/2,048 structural cases 和两张冻结自然图上存在 native size residual；writer/readers 与 exact semantics 闭合。

当前不可声明：full-cost dominance、optimizer practicality、access nonregression、default/large `W,D` scalability、广泛 corpus generality、完整 novelty、论文主 claim、Q1 readiness 或 Stage B readiness。

Structural paper potential 与 evidence readiness 必须分开：前者仍为条件性 `TIER_B_Q2_VIABLE`，后者因冻结 full-cost gate 失败而只能 `REVISE_ONCE`。

## 9. 权限终态

本 gate 不授权 revision 执行，只冻结可供主线决定是否投递的唯一 revision contract；不授权 Stage B、projects 写入或主控状态修改。

Lane after delivery：`IDLE_REUSABLE_AWAITING_MAINLINE`。
