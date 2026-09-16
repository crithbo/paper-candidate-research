# WEBGRAPH-REFERENCE-FOREST — 独立 Stage A Revision 1 Closing Report

## 1. 最终裁决

- Assignment：`STAGEA-G1-20260810-WEBGRAPH-REFERENCE-FOREST-REVISION1-CLOSING-V8.7`
- Role：`INDEPENDENT_STAGEA_CLOSING_REVIEW`
- Gate decision：`STOP`
- Scientific disposition：`CONFIRM_STOP_NARROW_FROZEN_MECHANISM`
- Confidence：`0.99`
- Quality tier：`BELOW_Q2_STOP`
- Evidence ceiling：`VALID_TWO_NATURAL_GRAPH_FULL_COST_NEGATIVE__FIXED_W4_D3__NO_GENERAL_IMPOSSIBILITY_CLAIM`
- Scientific revision consumed：`true`
- Resource blocker：`null`
- `StageB=false`
- `pending_user_stageb_review=false`
- `stageb_user_approval_id=null`

独立复核确认：revision 1 在 claim-bearing matched pairs 之前冻结并忠实执行了 initial gate 唯一允许的 dense exact-DP 与静态 equal-primary tie-break；输入、writer/reader、primary bits、自然图语义、配对顺序、warmup 排除和统计规则均闭合。两张自然图仍保留正的 size residual，但冻结成功规则要求每张图的每个 full-cost 维度的 candidate/baseline p50、p90 ratio 均不超过 `1.05`。原始数据重算得到 10 个失败单元，且 elapsed/CPU 的失败幅度远超噪声区间。因此确认科学 `STOP`，但只停止预登记的窄机制，不形成一般 WebGraph、一般 reference forest 或其他 corpus/configuration 的不可能性结论。

## 2. 独立性、权限和冻结输入

本次只读取本题 initial owner、initial gate 与 revision 1 冻结包，并仅进行已有文件的哈希、表格、动作合法性、成本累计、统计量和源码差分的只读复算。没有运行新的科学实验，没有修改 owner 包、主控、规则、模板或项目目录，也没有启动 revision 2 或 Stage B。

### 2.1 Revision 1 包机械完整性

| 项目 | 独立复核结果 |
|---|---|
| `HASH_MANIFEST.sha256` self | `6387349EAE6F4C8052A98949506FD0BCF2F664B5407DCBC4904980E10E69CA31` |
| Manifest entries | `21,479/21,479 PASS`; missing `0`; mismatch `0` |
| Manifest covered bytes | `1,388,337,823` |
| `STAGEA_REPORT.md` | `CDA6FA8B4DF107FB95218425F21719318452746601A860EFBBA1A1C79CAC91B1` |
| `RESULTS.md` | `97678762C792BEE9A4A05F2F2CFA7C84AE28786449E08E9CF38E35754797DF1C` |
| `Q1_COMPARATOR_MATRIX.md` | `8AE9A80EC0680FA2CC4166565EFDD1F883F70479A9657A57EC86DE887F5E0B26` |
| `USER_REVIEW_PACKET.md` | `6EF69B6577CA04E9867EA13FFC9BD0E6DFADF34925E98D4C28EE75CDF4319A2C` |
| `handoff.yaml` | `E18DB5887F974EC7FC99C2286B0B73927E25F012CA767C8C7276EBFFD010AA91` |
| Revision contract | `D32F68A083A19317F90C96479EEF78A13CF54CE813ADB8A395D4F767FD94A5CB` |
| Scientific consumption record | `14547B407A5D6935DCF974A06F276E9C5D0C6329D4413C0A8F7DBDDC6641866B` |
| Candidate source | `FF863A114D3F1420B0863CF7A64117899E2327734E49EA7D3A4BFC85390B7A49` |
| Candidate executable | `F43436AB06E66630785F76765DEF59F13E85EF537284650D6F6619AC8CAC3E0D` |

Revision consumption record 中的 contract、source、executable hashes 与最终冻结文件逐项相同。`cross_assignment_contamination=false`。

### 2.2 Initial gate 绑定

Revision 绑定的 initial gate 输入未漂移：initial gate report、handoff、manifest 分别为：

- `3094E0CDA179A41B34C57D110328AC3D54D2AAAB2ECBF2E991CF1FA25E7F7DE1`
- `886AF27358ABE5206D8EE1024906E98F9DE0FA19C7F5943D65E575B623A63306`
- `ED8A7553100099C1E0A1AD076F0BB5DD2B2F3E1A14895B24AAF461CF4DD01FBB`

Initial owner manifest/handoff 为 `4B9AD7373D306847726B9BDD00820AA29FBCC89528FC46E1CF72A9885150A818` / `2C5BB293F32E3DA2C02EC0A362238B4552BC87EF23235900ECAF69C6CE74113B`。Revision 没有另换 corpus、codec、reader、`W`、`D`、chunking、primary bits objective 或 baseline。

## 3. Contract freeze 与 scientific-revision 消耗

`REVISION_CONTRACT.yaml` 在 `2026-08-10T19:23:46+08:00` 冻结，早于候选实现完成和任何 claim-bearing matched pair。它逐项继承 initial gate 的唯一原子修订：

1. 用 base-`D+1` dense state IDs、rolling arrays 和 compact backpointers 替代不可扩展的完整向量 frontier；
2. primary objective 仍严格最小化 native graph-stream bits；
3. 仅在 primary bits 完全相等时，按固定 tuple `(sum reference-chain depth, max reference-chain depth, lexicographic delta vector)` 决胜；
4. 禁止 reader timing oracle、query trace、corpus identity、post-hoc performance、fallback、配置搜索和新增 corpus。

`SCIENTIFIC_REVISION_CONSUMPTION.yaml` 在 `2026-08-10T19:42:31.8755069+08:00`、首个 LAW `cnr-2000` matched pair 0 之前原子记录 `scientific_revision_consumed=true`。记录时的 contract/source/executable hash 与最终包一致，且 `mechanism_or_config_changed_after_preclaim=false`。

Preclaim natural validator 的首个机械版本错误地要求 revision 输出保留 parent 的精确 payload residual；该要求并不在 initial gate 冻结合同中，而且合法 equal-primary tie-break 明确允许 candidate hash 与 payload byte residual 改变。Owner 在 scientific consumption 和 claim-bearing matched pairs 之前将 checker 修正为合同真实要求的“primary totals 不变、strict persistence residual 为正、语义与 reader 校验通过”，没有改变算法、输入或配置，也没有基于 timing 结果选择动作。因此这是 preclaim checker closure，不构成合同漂移或未登记第二次科学修订。

## 4. 算法与 exactness 反攻

### 4.1 源码边界

对 initial 与 revision 的整个 WebGraph `src` 树逐文件哈希比较，只发现 `graphs/bvgraph/comp/bvcompz.rs` 发生变化。该差分实现 dense exact frontier、compact backpointers 和固定 secondary tuple；未发现按 corpus 名称、reader timing、query trace 或 matched-pair 结果分支，也未发现 selective fallback。

源码中的 state 是最近 `W=4` 个 reference-chain depth 的 base-`D+1` 编码；冻结 `D=3` 时 dense state count 为 `4^4=256`。Transition 只读取同一 native action-cost table，候选 key 为 `(primary cost, sum depth, max depth, predecessor lex-rank, delta)`，层完成后重新赋予完整 prefix 的 lexicographic rank。这与预登记 tuple 一致，且 state 包含影响未来合法性的全部 depth 信息。

### 4.2 Tiny secondary exactness

冻结 tiny witness 继续完整枚举 `38,372` 个合法 forests，primary optimum 为 `148` bits。Revision 选择：

- sum reference-chain depth：`3`
- max reference-chain depth：`1`
- lexicographic delta vector：`[0,0,0,0,1,2,0,4,0]`

它在 equal-primary optima 中满足冻结 secondary tuple；baseline vector `[0,0,0,0,1,1,0,4,0]` 同为 148 bits，但 secondary tuple 更差。Tiny writer/reader 和语义校验通过。

### 4.3 2,048 structural domain

从 revision 的 2,048 行完整 action/cost audit 独立解析并逐 action 重算：

| 检查 | 结果 |
|---|---:|
| Records | `2,048` |
| Primary totals 与 initial exact audit 不一致 | `0` |
| Exact worse than current baseline | `0` |
| Strict non-tie divergence | `531` |
| Equal-primary records | `1,517` |
| Reference vector changed by frozen secondary rule | `363` |
| Illegal delta / unavailable action / depth violation | `0` |
| Recomputed exact/baseline cost mismatch | `0` |
| Secondary sum/max mismatch | `0` |
| Dense state count mismatch | `0` |
| Sum of exact primary costs | `1,205,227` bits |

`case-0043` 仍为 `561 -> 560` bits。由此排除 revision 借 secondary objective 改写 primary optimum、裁剪合法 action 或换代理 cost 的可能。

### 4.4 两张自然图的 bits、payload 与语义

逐 chunk action/cost audit 的独立合法性与成本重算结果：

| Corpus | Chunks | Audit errors | Strict chunks | Baseline bits | Candidate bits | Native payload residual |
|---|---:|---:|---:|---:|---:|---:|
| LAW `cnr-2000` | `2,544` | `0` | `2,053` | `9,319,309` | `8,763,554` | `+72,761 B` |
| SNAP `Wiki-Vote` | `56` | `0` | `54` | `876,503` | `875,555` | `+127 B` |

两图 candidate 都保留正 size residual。所有 44 个 variant runs 的 writer/harness/reader exit code 为 0；每个 corpus 内 nodes/arcs 固定；baseline 与 candidate 的 sequential、random 和 harness checksums 相等；每个 corpus/variant 的 `.graph/.offsets/.properties/.ef` hashes 在 11 个 pairs 中稳定。结果仍是同一 fixed-order successor-list object 的 native writer/reader 语义，不是 size 方向、padding 分母或代理 codec 的误读。

## 5. Matched-pair 与 frozen statistics 独立重算

原始 TSV 有 `44` 行：两张图 × `11` pairs × 两个 variants。每张图的 pair indices 精确为 `0..10`；偶数 pair 顺序为 baseline→candidate，奇数 pair 为 candidate→baseline。Pair 0 仅 warmup 并被排除；每个 variant/corpus 的分析样本数为 10。独立排序后按第 5 个值取 lower-median p50、按第 9 个值取 nearest-rank p90，得到：

| Corpus | Dimension | p50 ratio | p90 ratio | Frozen `<=1.05` |
|---|---|---:|---:|---|
| cnr-2000 | End-to-end elapsed | `7.632449` | `7.824690` | FAIL / FAIL |
| cnr-2000 | CPU | `8.241379` | `8.333333` | FAIL / FAIL |
| cnr-2000 | Peak RSS | `1.000743` | `1.000865` | PASS / PASS |
| cnr-2000 | Sequential full decode | `0.996427` | `1.010905` | PASS / PASS |
| cnr-2000 | Random 100k | `1.071517` | `1.144034` | FAIL / FAIL |
| Wiki-Vote | End-to-end elapsed | `1.842732` | `1.851788` | FAIL / FAIL |
| Wiki-Vote | CPU | `3.333333` | `1.833333` | FAIL / FAIL |
| Wiki-Vote | Peak RSS | `1.011649` | `1.003925` | PASS / PASS |
| Wiki-Vote | Sequential full decode | `0.989167` | `0.920867` | PASS / PASS |
| Wiki-Vote | Random 100k | `1.001890` | `0.992314` | PASS / PASS |

总计 `10/20` ratio cells 失败。结果不是由单一 outlier 或运行顺序造成：p50 与 p90 同时失败，顺序已交替，而最关键的 elapsed/CPU 比率远高于 1.05。即使忽略 cnr-2000 的 random-access 失败，两个 corpus 的 construction full cost 也都决定性失败。

Secondary tie-break 确实改善静态 chain-depth 指标，但不足以救回 frozen full-cost rule：cnr-2000 sum depth 从 initial candidate 的 `360,649` 降至 `350,937`，仍高于 baseline `298,743`；Wiki-Vote 从 `6,429` 降至 `6,311`，仍高于 baseline `6,023`。这与实际 cnr-2000 random-access ratio 仍失败一致，但 closing decision 不依赖该相关性推断，而直接依赖预登记的 measured ratios。

## 6. 为什么是科学 STOP，而不是 PASS 或 policy hold

### 6.1 PASS 被冻结 hard gate 排除

正的 bits/payload residual 只说明 complete-action exact optimizer 的 size premise 在两张图上仍成立；它不能覆盖 frozen full-cost rule。Gate 明确要求两图所有 elapsed、CPU、RSS、sequential 和 random p50/p90 单元均 `<=1.05`。已有 10 个单元失败，故不存在 Stage A `PRELIMINARY_SUPPORT` 意义下的 full-cost PASS，也不得推荐 `PENDING_USER_STAGEB_REVIEW`。

### 6.2 不进入 `INCONCLUSIVE_POLICY_HOLD`

Policy hold 只适用于唯一 revision 已消耗、随后发现构造或比较无效，导致既不能可信 PASS、也不能形成科学 STOP。这里：

- contract 与消费时序闭合；
- same-object、native writer/reader、primary bits 和 secondary boundary 闭合；
- 2,048 structural exactness 与两图自然语义闭合；
- matched pairs、交替顺序、warmup 排除、统计规则和 full-cost ledger 闭合；
- output hashes/checksums 稳定；
- 决定性失败幅度不依赖边界噪声。

因此不存在需要第二 revision 才能修复的构造缺陷。按 initial gate 的预登记失败转换，应确认 narrow scientific STOP。

### 6.3 精确停止边界

本裁决只支持：

`FIXED_W4_D3_TWO_NATURAL_GRAPH_COMPLETE_ACTION_EXACT_OPTIMIZER_UNDER_NO_REGRESSION_FULL_COST_RULE`

更直白地说，只停止“在冻结 WebGraph 0.6.2 native object、`W=4`、`D=3`、chunk 128、LAW cnr-2000 与 SNAP Wiki-Vote 上，使用本次 complete-action exact optimizer 加预登记 equal-primary tie-break，并要求所有 full-cost p50/p90 不回退超过 5%”这一机制。

不得外推为：

- reference forest 一般不可能；
- WebGraph 的其他算法、实现、`W/D`、chunk 或 corpus 不可能；
- size-only 研究问题没有价值；
- 任意更高效但实质不同的算法都已被反证。

这些都超出当前证据。当前 `BELOW_Q2_STOP` 是本冻结论文机制在唯一允许的 revision 后未达到最低 full-cost 论文形状，不是一般领域结论。

## 7. 权限结论与交接

- `scientific_revision_consumed=true`，不得自动给予第二次 revision。
- `StageB=false`；本报告不授权或建议启动 Stage B。
- `pending_user_stageb_review=false`；`stageb_user_approval_id=null`。
- 不得写入 `projects`。
- 主线可在机械验收本 closing 包后登记窄 `STOP / BELOW_Q2_STOP`；正式状态仍只由主线变更。
- Closing assignment 完成后，本 lane 状态为 `IDLE_REUSABLE_AWAITING_MAINLINE`。
