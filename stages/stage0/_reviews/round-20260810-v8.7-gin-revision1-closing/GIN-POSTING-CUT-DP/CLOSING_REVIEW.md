# GIN-POSTING-CUT-DP Stage 0 Revision 1 Closing Review

## 1. Closing 裁决

- assignment：`STAGE0-C2-20260810-GIN-POSTING-CUT-DP-REVISION1-CLOSING-V8.7`
- role：`STAGE0 CLOSING CONFIRMATION / long-lived D-root sentry`
- topic：`GIN-POSTING-CUT-DP`
- decision：`INCONCLUSIVE_POLICY_HOLD`
- `CONFIRM_STAGE0_PASS`：`NO`
- `BELOW_Q2_STOP`：`NO__NO_DIRECT_ABSORPTION_SAME_OBJECT_IMPOSSIBILITY_OR_FORMAL_NONEXISTENCE`
- revision budget：`1/1 CONSUMED__NO_SECOND_REVISION_AUTHORIZED_OR_PROPOSED`
- structural paper potential：`TIER_B_Q2_VIABLE_CONDITIONAL__NOT_REGISTERABLE_AS_PASS_FROM_THIS_PACKAGE`
- evidence readiness：`STATIC_CERTIFICATE_FAILED_AT_READER_STATE_AND_WITNESS__FINITE_SAME_OBJECT_ROUTE_STILL_VISIBLE`
- novelty route：`N2`
- latest collision：`SEARCH_BOUNDED_OPEN`
- confidence：`0.94`
- evidence ceiling：`PINNED_PG18_SOURCE_AND_STATIC_CERTIFICATE_REVIEW_ONLY__NO_IMPLEMENTATION_NATIVE_OUTPUT_NATURAL_GAIN_OR_MAIN_RESULT`
- Stage A/B：`FALSE / FALSE`

Revision1 不能通过 closing。冻结 witness 把 `advancePast` 当成 posting-tree root descent 的 search item；pinned `entryLoadMoreItems` 对 exact TID 实际使用同一 block 的 `OffsetNumberNext(advancePast.offset)`。因此当 `a=r_{K+1}` 且 successor `y` 位于 `L_{K+2}` 时，静态树从 root 直接定位 `L_{K+2}`，不会先定位 `L_{K+1}` 再走一次 right link。witness 中的局部 child positions、comparison count 与 strict saving 公式均不成立。

同时，`rho` 没有给出足以恢复 current entry buffer/list 状态和 closed source leaf descriptor 的完整 Markov signature；跨 key warm cache 也与“每 key 独立求解后求和”不相容。故 path—tree 的结构映射即使大体可行，path cost 等于 deterministic native replay、进而 Bellman exactness 的前提没有静态闭合。

但 current PG18 builder 仍只给出 build-rightmost full split 或 ordinary half split等固定路径，没有 complete-trace arbitrary internal regroup action，更没有候选同等级 frozen-proxy exact guarantee。上述失败可以在同对象内通过更正 physical search target、重新构造 witness、扩充 reader signature或收缩到 cold proxy来有限处理；它们没有证明该 N2 residual 不存在。依项目规则，revision 已消耗后，既不能可信 PASS、又没有真实科学 STOP 证据时，必须进入 `INCONCLUSIVE_POLICY_HOLD`，不得伪造第二次 revision或自动 STOP。

## 2. 冻结输入与机械完整性

### 2.1 Discovery

- directory：`D:\project\writing\reserch\stages\discovery\round-20260810-v8.7-wave46\S3-natural-structure`
- topic brief：`9715270E28906B28E976A74C990D127A10AA787133697960E9C5BFD94C2D83E6`
- source handoff：`A1BBFE63F661DA9ED45F468B05EC853AE1F5E8CC55DDD2395A7EAE95EE726B33`
- manifest self：`7CF1DF10736DCF06D63E6CD0FDEE37666452ADC56969F3E77CC01EED1A9FA698`
- manifest verification：`4/4 PASS`

### 2.2 PRIMARY

- directory：`D:\project\writing\reserch\stages\stage0\_reviews\round-20260810-v8.7-wave46-primary\GIN-POSTING-CUT-DP`
- `STAGE0_REPORT.md`：`23BD55D4C1ED8E767559F8D3E8B5805FFC60D83F21930259B0E6617277255F6E`
- `Q1_COMPARATOR_MATRIX.md`：`EFC26297B5C889958D13879DA5D15ABC69AD9CFF4EC604D77A68171AE9D78AE5`
- `SOURCE_AUDIT.md`：`4A2EF1E5854A369C1FBA59CBDAF5DAF8C8DFCA0786258D2734D2615E6AE3A5E2`
- handoff：`DB3A42F6D270DA34B0D7B1CD9B554CE44EB212F534B7AEACB27A5CA07E490F8F`
- manifest self：`6C05232FE21B5B13460008AA616BBC84D81047D446E1CCF5F621DECCA3FC4E13`
- manifest verification：`4/4 PASS`

### 2.3 First confirmation

- directory：`D:\project\writing\reserch\stages\stage0\_reviews\round-20260810-v8.7-wave46-confirmation\GIN-POSTING-CUT-DP`
- confirmation review：`9F9221F11F4F60FDC24A4AE359627A095014CA3FBA4B706BA22901F79BC7223F`
- handoff：`D9AAB893C6CE0F50BF1326EF5731189E8F32A87152FD633895EC0E5830175789`
- manifest self：`B77FF85C66E97B5C9A791E8668856EF5CD066ACF4F4E7B339C4A9FAA86F1230C`
- manifest verification：`2/2 PASS`

### 2.4 Revision1

- directory：`D:\project\writing\reserch\stages\stage0\_revisions\GIN-POSTING-CUT-DP\revision1`
- `REVISION_REPORT.md`：`B65680E1FB9E91663750656A270CF76B418361FF386DFF4D37D99A2FF22131CA`
- `REVISION_AUDIT.md`：`80A2552BD03BC89A96ABBABDEC78BFD4B205C33C7C26BCCD18186B00CD18281D`
- `CLAIM_MATRIX.md`：`204E9A31B4BB93903BCF7AEEF5F94AE14E7CE8319ADD0823ACE3F438B3C66DBE`
- handoff：`D2C0C572E91E9482318DA6BF82C5B42F062B70567065ABB1E3B90B125DF7DFAD`
- manifest self：`4A2BE5D428AC1D3772153C140F26BBA41667248B1F342D892C79AEF54A14AF65`
- manifest verification：`4/4 PASS`

所有冻结哈希均独立复算一致。仅检查该题最小证据链；没有读取下一 assignment 或启动其他题。

## 3. Closing traceability matrix

| Atomic item | Revision1 claim | Independent verification | Status |
|---|---|---|---|
| Current source pin | `REL_18_STABLE@a4c41...` | hash/provenance chain一致；定点核对 pinned source | `FULLY_ADDRESSED` |
| Layout-independent logical events | fixed streams + unchanged merge determine `next_gt/advancePast` | logical layer可有限定义；physical root search必须使用 strict successor position | `PARTIALLY_ADDRESSED` |
| Native tree catalog | segments/leaves/contiguous internal groups/derived bounds/equal depth | 对声明 rebuild subset 的结构合法性大体闭合；不等同所有并发历史瞬时状态，但 Stage0 可声明子类 | `FULLY_ADDRESSED_WITH_SCOPE_CEILING` |
| `rho` / reader state | crossing-event signature suffices | 未保存足以恢复 closed source leaf、current decoded-list end/offset、buffer validity及跨 entry时序的明确等价状态 | `NOT_ADDRESSED` |
| Path—tree bijection | canonical accepting path iff one `T(H)` tree | structural mapping plausible；cost-preserving bijection依赖未闭合 `rho`，因此 exact recurrence premise未成立 | `PARTIALLY_ADDRESSED` |
| Finite complexity | explicit `F` bound | 形式有限，但 `R` 的定义以未闭合 reader signature为前提 | `PARTIALLY_ADDRESSED` |
| Exact guarantee | Bellman exact over frozen proxy | Markov sufficiency与cost-once settlement未证，不能确认 | `NOT_ADDRESSED` |
| Two-key two-tree witness | root descends to `L_{K+1}` then right-links to `L_{K+2}` | 与 pinned `entryLoadMoreItems` search-key转换直接冲突 | `MADE_WORSE__FORMAL_COUNTERCHECK_FAIL` |
| Strong comparator separation | native/local comparator不能任意 regroup并给同 guarantee | current source仍是固定 split/build路径；未发现同等级 complete action | `FULLY_ADDRESSED__SEARCH_BOUNDED_OPEN` |
| Full-cost/same-trace | vector + scalar + same frozen trace | fairness设计成立；maintenance/warm-cache additive model尚未闭合 | `PARTIALLY_ADDRESSED` |

## 4. Pinned reader semantics and the witness countercheck

Source pin：PostgreSQL `REL_18_STABLE` commit `a4c41bbcc7b0aed721950303338d75b09eddc295`。

Authoritative exact-commit surfaces：

- [`ginget.c`](https://github.com/postgres/postgres/blob/a4c41bbcc7b0aed721950303338d75b09eddc295/src/backend/access/gin/ginget.c)
- [`gindatapage.c`](https://github.com/postgres/postgres/blob/a4c41bbcc7b0aed721950303338d75b09eddc295/src/backend/access/gin/gindatapage.c)
- [`ginblock.h`](https://github.com/postgres/postgres/blob/a4c41bbcc7b0aed721950303338d75b09eddc295/src/include/access/ginblock.h)

### 4.1 What `entryLoadMoreItems` actually searches

当 `advancePast != entry->curItem` 时，current source 不把 `advancePast` 原样交给 posting B-tree：

- exact TID：search item 为 `(advancePast.block, OffsetNumberNext(advancePast.offset))`；
- lossy page：search item 为下一 heap block 的 first offset。

随后 `ginFindLeafPage` 对该 strict-successor position下降。对于 revision witness：

- `a=r_{K+1}` 是 `L_{K+1}` 的 right bound；
- `y` 是 `S_A` 中严格大于 `a` 的下一项并位于 `L_{K+2}`；
- search item 严格大于 `a`，所以 `L_{K+1}` 的 right bound不能接纳该 search item；
- 在静态合法树中，root descent直接选择包含 `y` 的 `L_{K+2}` 路径。

`entryLoadMoreItems` 的 right-link loop用于 step-right、split/move-right或下降后页界仍不覆盖 threshold 的情形；它不能把这个 frozen jump witness变成“先落到 `L_{K+1}` 再走到 `L_{K+2}`”。

### 4.2 Correct positions under the frozen grouping

令 `s=ceil(K/2)`、`u=1+floor(K/2)`。两组大小的纯算术成立：

- `[K,K,2]` 总和为 `2K+2`；
- `[s,K,K+2-s]` 总和为 `2K+2`；
- 对 `K>=4`，所有 group size 在 `[2,K]` 内。

但 physical target 是 `L_{K+2}`，不是 `L_{K+1}`。因此它在第二个 internal page中的局部位置是：

- `T_full`：position `2`，不是 position `1`；
- `T_trace`：position `K+2-s = 2+floor(K/2) = u+1`，不是初始 midpoint `u`。

current `dataLocateItem` 从 `low=1, high=K+1` 开始，初始 `mid=u`。所以 revision 的“一次 comparison命中”不发生；`ceil(log2(K+1))-1` 也不再是两树的差。视具体 `K`，新 comparison count可以相同或 candidate更差，revision没有给出对 pinned `K` 的严格正 saving。

这不是“尚未运行 native output”的缺口，而是静态源码语义与 hand calculation 的直接冲突。故 C8/C9/C10 不能作为 action-divergence certificate被接受。

## 5. `rho` / frontier sufficiency

### 5.1 What is sound

- fixed query/key streams可以生成不含 page id 的 logical successor requests；
- jump/step、source rank、target rank与 event order都是有限量；
- open pages逐层携带 child bounds足以描述尚未关闭的结构动作；
- cold、无共享 cache 的 tree-local reader cost原则上可用有限 automaton定价。

### 5.2 Missing state equivalence

Revision state

`rho=(source_rank,target_rank,advancePast,jump_or_step,source_leaf_ordinal,decoded_suffix_start,cache_epoch,root_descent_pending)`

没有证明它对 current `GinScanEntry` 的下列状态构成等价类：

1. `buffer` 是否有效、当前 pinned leaf是哪一页；
2. `list/offset/nlist` 的有效 suffix结束位置，而不只是 `decoded_suffix_start`；
3. source leaf的 right bound、segment/page descriptor，以及在该 leaf关闭并被更高层聚合后如何恢复；
4. 多个 logical events共享同一 entry时的时间顺序与上一个 physical load状态；
5. exact、lossy与 `END` transition后 `isFinished`/rightmost-page的状态；
6. 若启用 warm cache，其他 key pages对同一 global replacement state的占用。

Revision一方面说“不与 event interval 相交的 closed-left subtree可丢弃”，另一方面没有明确给出与 crossing event相交的 closed source-page descriptor保留或 partial-cost settlement规则。`source_leaf_ordinal` 本身不能在结构已丢弃后恢复 page end、segment list和 buffer semantics。

因此可能存在两个具有同一列出 `rho` 字段、但 future physical reader cost不同的prefix。未证明状态是 Markov-sufficient，`c(X,a)` 也没有证明只依赖 `X,a`。

### 5.3 Warm-cache separability conflict

报告先按 key独立求解再求和，却允许 `B_c>0` 的跨 query warm buffer。真实 shared buffer replacement会把多个 posting trees的页面交错；一个 key的 layout可改变另一个 key的 eviction/hit。除非：

- exact proxy冻结为 `B_c=0` / per-query isolated cache；或
- 把所有相关 keys与global cache state联合求解；

否则 per-key Bellman recurrence不能给出所声明 warm proxy的全局 exact optimum。Revision没有机械选择其中一条。

## 6. Path—tree bijection

### 6.1 Structural part

对明确声明的 `T(H)` rebuild class，下列结构映射是可信的 Stage0 proof sketch：

- segments按 TID顺序 append；
- leaf boundary由 `CLOSE_0` 唯一标识；
- contiguous child groups由每层 close boundary标识；
- right bound由最后 child派生；
- fixed height + one-root acceptance排除不等深或多 root输出。

该结论只覆盖声明的 native-decodable equal-depth rebuild subset，不覆盖 split-in-progress、deleted或并发历史瞬时页面；这种作用域收缩本身不构成 Stage0 fatal。

### 6.2 Cost-preserving part

Revision 的 exactness需要更强命题：每个 structural path不仅对应一棵树，而且每个 reader cost在决定量已知时恰好结算一次，并且两个合并到同一 state的prefix具有同一 continuation cost。第 5 节的 `rho` 缺口与第 4 节 witness evaluator错误否定了当前 proof sketch的这一部分。

故 closing disposition为：

- `STRUCTURAL_PATH_TREE_MAPPING = PLAUSIBLE_FOR_DECLARED_SUBSET`；
- `PATH_COST_NATIVE_REPLAY_EQUIVALENCE = NOT_CLOSED`；
- `BELLMAN_EXACTNESS = NOT_ESTABLISHED`。

## 7. Strongest comparator and collision boundary

Pinned `gindatapage.c` 显示：

- rightmost internal page在 build split时把尽可能多的 `PostingItem` 放到 left page；
- ordinary non-build internal split使用约半分；
- downlink key由 child page right bound派生；
- current reader对 internal `PostingItem.key` 做 lower-bound式 binary search。

这些是强 deployment paths，但不是 arbitrary ordered regroup optimizer。Revision 中的公平 union可以通过相同 frozen trace在 current finite build/dynamic outcomes中选择最优；它仍不能保证生成任一 `T(H)` grouping，也没有 complete-action exact guarantee。

`LOCAL-PARTITION-DP + NATIVE-PARENTS` 固定 parent path，当然不能吸收 parent regroup。若把 comparator扩展为“枚举全部 `T(H)` 并按同一 reader objective exact求解”，它就是 tiny exhaustive ceiling或候选问题本身，而不是 current deployable comparator；仅凭 generic oracle表达能力不能判死。

因此：

- `CURRENT_STRONGEST_COMPARATOR_ARBITRARY_REGROUP = NO_VERIFIED_SURFACE`；
- `SAME_GUARANTEE_DIRECT_ABSORPTION = NOT_FOUND__SEARCH_BOUNDED_OPEN`；
- `DIRECT_FATAL = NONE`。

Transport未命中或 bounded search均不用于 absence推论。

## 8. Full-cost proxy and same-trace fairness

### 8.1 Closed design elements

- vector保留 leaf/internal visits、right-bound comparisons、right links、decode、bytes、build/WAL/maintenance、planner time/peak；
- scalar weights冻结且非负；
- adapted baselines获得同一 training trace；
- held-out queries仅评估；
- native planning cost与candidate planning cost都进入 full-cost ledger；
- synthetic witness只用于 legality/action non-vacuity，不冒充 natural gain。

### 8.2 Static gaps

1. `M_ops/W_bytes` 只以“由 update counts、slack与split threshold定义的 additive proxy”描述，没有给出可由 close transition唯一结算的公式；
2. warm shared cache不与 per-key求和可分；
3. `Plan_time/Plan_peak` 虽是同一次 candidate DP中的 tree-independent常数，但与 native baseline比较时不是可忽略项；
4. witness以重复 `W` 次放大 query delta只有在 query delta本身严格为正时才成立；第 4 节已否定当前 delta推导。

这些问题不要求 Stage0已有 wall-clock或自然结果；它们要求静态 claim ceiling诚实。当前只能支持“一个可能的 cold/tree-local proxy设计”，不能支持 revision声称的完整 exact full-cost certificate。

## 9. Why HOLD, not PASS or STOP

### 9.1 PASS is mechanically unavailable

唯一 revision gate明确要求：logical events、reader evaluator、frontier state、exact guarantee与 native-legal two-tree witness在同一符号系统中互相一致。当前至少有两个 P1 failure：

1. witness违反 pinned `entryLoadMoreItems` search semantics；
2. `rho` 未证明 cost-preserving Markov sufficiency。

因此 `CONFIRM_STAGE0_PASS` 会把未闭合证书当成已闭合，违反 closing合同。

### 9.2 Scientific STOP is not supported

本 closing 没有得到以下任一真实负证据：

- current source/论文在同对象上直接实现 arbitrary trace-aware complete regroup并给同 guarantee；
- standard GIN format/reader不能表达不同 parent grouping；
- 所有合法 grouping的 reader cost必然相同；
- 任意 finite reader automaton/frontier state都不可能存在；
- full-cost 下对所有自然 strata形式上无 residual。

相反，源码确认 parent grouping会改变 child在 internal page中的位置，而 `dataLocateItem` 的 comparison path取决于该位置。当前 witness选错 physical target不等于所有 corrected witness不存在。扩大 finite state或冻结 cold proxy也不必换对象或降为 controller。

所以 `BELOW_Q2_STOP` 会把“revision1写错了”错误提升为“研究命题被科学反证”。项目规则不允许这种推断。

### 9.3 Policy resolution after 1/1 revision

Revision 已 `1/1 CONSUMED`。本 lane：

- 不创建、建议或暗示自动第二次 revision；
- 不把 HOLD伪装成 PASS；
- 不把缺实现、native output或自然收益当成失败原因；
- 不自行 reserve/archive/withdraw topic；
- 把现有材料机械交回主线登记 `INCONCLUSIVE_POLICY_HOLD`。

HOLD 的客观缺口是：缺少与 pinned strict-successor search一致的 action-divergence certificate，以及一个明确 cost-preserving的 finite reader equivalence state。如何处置该非终态由用户/主线权限决定，不由本 lane扩展 assignment。

## 10. Evidence ceiling and future authority boundary

- 允许保留的结论：same-object arbitrary internal regroup residual尚未被 current union直接吸收；逻辑 event layer与 native rebuild action存在有限研究路线。
- 不允许保留的结论：revision1 已证明 exact DP；冻结 witness 已证明 comparison saving；candidate已具 full-cost优势；native serialization或自然收益存在。
- Stage A first preclaim fidelity gate：`NOT_OPENED__STAGE0_NOT_PASSED`。
- Stage A/B authorization：`false / false`。
- implementation/experiment/benchmark：`NONE`。
- control files modified：`false`。
- lane after delivery：`IDLE_REUSABLE_AWAITING_MAINLINE`。

