# GIN-POSTING-CUT-DP Stage 0 Independent Confirmation

## 1. 裁决

- assignment：`STAGE0-C2-20260810-GIN-POSTING-CUT-DP-CONFIRM-V8.7`
- protocol decision：`CONFIRM`
- scientific decision：`CONFIRM_REVISE_ONCE`
- quality tier if the atomic gate closes：`TIER_B_Q2_VIABLE`
- current quality status：`TIER_B_Q2_VIABLE_CONDITIONAL`
- confidence：`0.90`
- evidence ceiling：`CURRENT_PG18_SOURCE_CONFIG_AND_STATIC_ALGORITHM_AUDIT_ONLY__NO_IMPLEMENTATION_NATIVE_OUTPUT_OR_NATURAL_GAIN`
- novelty route：`N2`
- latest collision：`SEARCH_BOUNDED_OPEN`
- Stage A/B：`UNAUTHORIZED_AND_NOT_STARTED`

PRIMARY 的 `REVISE_ONCE` 结论成立。current PostgreSQL 18 GIN 已吸收 posting list/tree、compressed segments、bulk/parallel build、incremental split、fast-update pending list、VACUUM/cleanup 与有限配置调节，但冻结 current union 未表达“以完整逻辑 query-key trace 为输入、联合选择 native leaf cuts 与 internal child groupings、并对完整合法树类给出 exact/bounded guarantee”的动作。

候选不能直接 PASS，因为 Discovery 的 `D[i,h]` 只对 TID 后缀和高度计价，没有定义 internal child grouping、right-bound/open-frontier 状态，也没有把 layout-independent logical successor requests 与 layout-dependent native reader cost 分离。候选也不能 STOP，因为这些缺口可由一个有限静态 certificate 闭合，不要求代码、native output、自然收益或主结论正结果，且未发现 same-object direct fatal。

唯一允许的 revision 必须是第 7 节冻结的不可拆分命题。它不是六个可任选的 readiness 清单，而是一个 complete-action algorithm certificate；其中任一核心接口缺失，都无法排除 local byte partition、native full-packing 或 offline controller/wrapper。

## 2. 冻结输入与机械完整性

### 2.1 PRIMARY

- 目录：`<LEGACY_LOCAL_PROJECT_ROOT>\stages\stage0\_reviews\round-20260810-v8.7-wave46-primary\GIN-POSTING-CUT-DP`
- `STAGE0_REPORT.md`：`23BD55D4C1ED8E767559F8D3E8B5805FFC60D83F21930259B0E6617277255F6E`
- `Q1_COMPARATOR_MATRIX.md`：`EFC26297B5C889958D13879DA5D15ABC69AD9CFF4EC604D77A68171AE9D78AE5`
- `SOURCE_AUDIT.md`：`4A2EF1E5854A369C1FBA59CBDAF5DAF8C8DFCA0786258D2734D2615E6AE3A5E2`
- `handoff.yaml`：`DB3A42F6D270DA34B0D7B1CD9B554CE44EB212F534B7AEACB27A5CA07E490F8F`
- manifest self：`6C05232FE21B5B13460008AA616BBC84D81047D446E1CCF5F621DECCA3FC4E13`
- manifest verification：`4/4 PASS`

### 2.2 Discovery source package

- 目录：`<LEGACY_LOCAL_PROJECT_ROOT>\stages\discovery\round-20260810-v8.7-wave46\S3-natural-structure`
- topic brief：`9715270E28906B28E976A74C990D127A10AA787133697960E9C5BFD94C2D83E6`
- source handoff：`A1BBFE63F661DA9ED45F468B05EC853AE1F5E8CC55DDD2395A7EAE95EE726B33`
- manifest self：`7CF1DF10736DCF06D63E6CD0FDEE37666452ADC56969F3E77CC01EED1A9FA698`
- manifest verification：`4/4 PASS`

没有继承前一 assignment 的未登记事实或评分。所有新文件只写入本 assignment 唯一目录。

## 3. Independent current-upstream reality check

### 3.1 Current pin correction

PRIMARY 记录的 `REL_18_STABLE` 观察提交为 `545e2a9d74c3ccca3189e56a515a5793b782eb9b`（2026-07-20）。本 confirmation 于 2026-08-10 对 PostgreSQL 官方仓库执行只读 `refs/heads/REL_18_STABLE` 复核，当前头为：

`a4c41bbcc7b0aed721950303338d75b09eddc295`。

因此 revision 与后续 Stage A 必须更新 source pin，不能把旧观察点称为 current head。该 provenance 修正不形成 fatal：两个提交间下列关键文件逐字相同：

- `src/backend/access/gin/README`
- `gindatapage.c`
- `ginget.c`
- `ginfast.c`
- `ginutil.c`
- `src/include/access/gin_private.h`

`gininsert.c` 只有并行 worker tuple-count 初始化位置/注释变化；没有新增 trace input、page-cut objective、internal grouping optimizer 或 reader action。因此 PRIMARY 的 GIN 动作面结论在当前头上仍成立。

Authoritative surfaces：

- [PostgreSQL 18 GIN documentation](https://www.postgresql.org/docs/current/gin.html)
- [PostgreSQL 18 CREATE INDEX](https://www.postgresql.org/docs/current/sql-createindex.html)
- [PostgreSQL official REL_18_STABLE GIN source](https://github.com/postgres/postgres/tree/REL_18_STABLE/src/backend/access/gin)

### 3.2 Current native source/config union

冻结强 union 必须至少包含：

1. `PG18-BULK`：standard/concurrent `CREATE INDEX`、`REINDEX`、serial/parallel build、`maintenance_work_mem`、`max_parallel_maintenance_workers`、table `parallel_workers`；
2. `PG18-DYNAMIC`：normal insertion、`fastupdate={on,off}`、per-index/global `gin_pending_list_limit`、foreground/background pending cleanup、VACUUM 与 REINDEX；
3. `PG18-NATIVE-LAYOUT`：inline posting list 与 posting tree conversion、compressed posting-list segments、build-mode full packing、non-build balanced split 与 append-oriented 75% heuristic、internal `PostingItem` downlinks/right bounds、sibling right links；
4. `PG18-TRACE-TUNED-UNION`：使用与候选相同 frozen training trace，在上述有限路径/配置中选择 full-cost 最优者；
5. `LOCAL-PARTITION-DP+NATIVE-PARENTS`：在同一 native page/segment legality 下优化 leaf intervals/local bytes or local page cost，再交给 current native parent/full-packing path；
6. `EXACT-SMALL-ORACLE`：只作 ceiling，不作为可部署 baseline。

`gin_fuzzy_search_limit>0` 返回随机子集，改变 answer-set guarantee，只能作 weaker-quality negative control，不能进入相同语义 union。

Current source 明确支持 page/segment skip、right-bound descent 和完整维护路径，但没有在已核验源码、文档、reloptions 或资源配置中暴露 trace-aware complete hierarchical constructor。结论只能记为 `NOT_FOUND__SEARCH_BOUNDED_OPEN`，不能由搜索或 transport 状态推断不存在。

## 4. Single-key full-scan 与 scalar frequency

设合法 layout 为 `T`，一个 key 的完整顺序扫描成本为 `S_k(T)`，训练频率为 `f_k`。仅重复相同 single-key full scan 时，query term 是：

`f_k * S_k(T)`。

因此 `f_k` 只是整个 full-scan cost function 的公共标量：

- 若目标只有该 query term，`f_k>0` 不改变 layout 的相对顺序或 argmin；
- 它不提供“哪些 TID 区间会被 `advancePast` 跳过”的位置信息；
- 若目标还含未乘 `f_k` 的 bytes/build/WAL/maintenance 项，`f_k` 可以改变 query-vs-build 的全局权重，但这仍只是 generic workload-weighted packing trade-off，不能建立 trace-specific hierarchy N2；
- 单 key full scan 与 inline posting list 必须冻结为 no-gain / generic-control strata。

所以 PRIMARY 的“scalar frequency 只乘常数”在“不能产生区间级 skip information”这一精确含义下成立；不能把它误读为“full-cost objective 中任何频率都绝不影响取舍”。revision 必须使用 complete multi-key/partial-scan logical event sequences，不能退回 per-key scalar weights。

## 5. `advancePast` 的 layout-independent 有限定义

Current `ginget.c` 的逻辑层与物理层可以有限分离：

- `scanGetItem` 与 `keyGetItem` 在有序 entry streams 上反复请求“严格大于 `advancePast` 的下一 ItemPointer”；threshold 由 fixed query-key combination、fixed sorted TID streams、lossy/exact marker 与 unchanged consistent/triConsistent semantics 决定；
- `entryLoadMoreItems` 才根据 candidate tree 决定从 current leaf 向右走，还是从 root 按 `advancePast` 重新下降；随后依据 page right bound 跳页并在 leaf segment 中寻找 successor。

因此 revision 可以冻结 logical event schema：

`e=(query_id, scan_step, entry_id, advancePast, successor, exact_or_lossy, recheck_state)`。

生成规则是：把每个 posting stream 抽象为固定集合上的 `next_gt(S_k, advancePast)`，运行 unchanged native merge/consistent logic，记录每次 logical successor request。该序列不引用候选 page number、segment id、right link 或 root-to-leaf path，所以独立于 layout。

对任意候选 legal tree `T`，再用一个 deterministic native-reader simulator 把相同 logical events 映射为：

- root/internal page descent；
- sibling right-link traversal；
- right-bound comparisons；
- leaf-page visits；
- segment decode；
- cold/warm buffer accounting under a predeclared cache model。

物理 call/buffer trace 必然依赖 layout，不能直接从某个 reference layout 录制后当公共 input；公共 input 只能是上述 logical requests。这个分离是静态、有限、same-information 且可在 Stage A 前通过 tiny semantic oracle 核验。因此 `advancePast` 不是不可定义的 fatal，也不要求 Stage 0 已有 extractor 或 native output。

## 6. 为什么 hierarchical open-frontier revision 必要

Discovery 的 `D[i,h]` 只知道 TID suffix 和 remaining height。它没有闭合完整动作，因为 current PG18 posting tree 还包含：

- ordered children 到 internal pages 的 contiguous grouping；
- 每个 child `PostingItem` 的 right bound；
- internal page capacity/fanout 与 page right bound；
- sibling right links；
- 所有 leaf 等深、root termination 与逐层 split/close legality；
- 一个 leaf close 后向上递归产生 downlink 时，各层 rightmost open page 的 occupancy/slack。

只外枚举 root fanout/height 不能决定这些量。反过来，若 revision 规定 internal grouping 完全由 native full packing 唯一决定，那么候选的独立动作就只剩 leaf partition，必须由 `LOCAL-PARTITION-DP+NATIVE-PARENTS` 吸收。

所以唯一 revision 必须使用 bottom-up ordered open frontier 或一个证明等价的完整表示。最小 state contract 为：

- 已处理 TID prefix endpoint；
- fixed height/depth；
- 每个 active level 的 rightmost open page occupancy/child count；
- 该 open page 的 last/right bound，或可从 state 唯一重建的等价量；
- 尚未闭合的 ordered child group；
- 为 logical event cost 所需的有限 reader/cost accumulator state。

转移必须能：选择 native-legal leaf interval；关闭或延续当前 leaf；把 child right bound 作为 `PostingItem` 向上一层传播；在各层选择 close/open grouping；最终只接受一个 legal root。若使用另一 recurrence，只要能证明与该完整 legal-action catalog 一一对应即可。

该状态可能是 pseudopolynomial 或对 page capacity/height 指数依赖；Stage 0 不要求它已经高效实现，但 revision 必须给出有限复杂度上界和 exactness/approximation ceiling。

## 7. 冻结唯一 atomic revision proposition

### Gate id

`NATIVE_GIN_ADVANCEPAST_TRACE__HIERARCHICAL_PAGECUT_DP_CERTIFICATE`

### Single indivisible proposition

在 pinned PostgreSQL 18 `REL_18_STABLE` GIN reader/format/maintenance contract 下，给定固定 table、operator class/key extraction、每 key sorted TID sequence 与 frozen complete query sequence：

1. query sequence 可按第 5 节确定性转化为不引用任何候选物理页的 logical `next_gt/advancePast` events；
2. 一个有限 open-frontier DP 枚举 all and only 一个明确声明的 native-legal posting-tree 类，联合选择 leaf/segment cuts、ordered internal child groupings、right bounds 与 height；
3. 同一 DP 对所有候选树使用同一 deterministic reader-event evaluator，优化预声明的 query page/segment/decode proxy 加 bytes/build/WAL/fixed-maintenance proxy；
4. unpruned 版本对声明的有限 action/model 给出 exact optimality；若 revision 选择 pruning，则必须冻结唯一 approximation guarantee，不能在 exact 与无界 heuristic 间游移；
5. 给出 `n`（TIDs）、`m`（logical events）、height 和每层 capacity/frontier domain 的显式有限复杂度上界；
6. 给出一个 hand-checkable、native-legal、至少含 two-key skip event 的两树 witness：两树在 local byte partition/full-packing 目标上相同或 local control 选择相反动作，但 complete logical-event hierarchy objective 严格选择候选动作；
7. 对第 3.2 节每个 comparator 指出它能否生成相同完整 tree action、使用什么信息、具有什么 guarantee；同 trace 必须提供给所有 adapted baselines。

### Fixed same-object limits

- 标准 PostgreSQL GIN on-disk pages 与 unchanged native reader；
- unchanged SQL answers、lossy/recheck、TID order、WAL/crash、locking、VACUUM/pending-list semantics；
- 无 TID/heap reordering、无 external side index、无 runtime query controller、无 future test trace；
- synthetic witness 只证明 legality/action non-vacuity，不得冒充 natural positive evidence；
- current source pin 必须更新到 revision 冻结时实际 `REL_18_STABLE` commit，当前 confirmation 观察点为 `a4c41bbcc7b0aed721950303338d75b09eddc295`。

### Mechanical pass condition

上述七项形成同一 certificate 且相互引用一致；尤其 logical events、legal-tree catalog、DP transitions、cost evaluator、guarantee 和 witness 必须使用同一对象/符号。允许没有代码、serialization、native output、自然 gain 或已完成 theorem proof。

### Mechanical failure condition

任一情况使 revision 失败并回到 `BELOW_Q2_STOP` 建议：

- input 只剩 scalar per-key frequency；
- event trace 从某个 candidate/reference physical layout 的 pages/calls 录制，形成 circular objective；
- internal grouping/right bounds/open frontier 未表示，或由 native full packing 固定后仍声称选择 height/hierarchy；
- action 退化为 local byte/page partition、fill threshold、配置网格或 controller/wrapper；
- candidate format/reader/query/maintenance semantics 改变；
- fair PG18 union 或 local partition + native parents 能生成同一完整动作并达到同 guarantee；
- 没有有限复杂度或可审计 guarantee target。

### Why this is one revision, not an over-frontloaded Stage A

这组字段共同定义一个算法命题，缺一项就不知道候选究竟优化什么动作；因此它是唯一 static scientific revision，而非把实验 readiness 拆成多个门。它只要求 proposition、recurrence、复杂度、guarantee target 和 symbolic witness，不要求：

- PostgreSQL patch；
- serialized native index；
- measured page trace；
- natural corpus gain；
- benchmark/full experiment；
- claim-bearing Stage A observation。

Native fidelity、tiny implementation equivalence、自然 workload headroom 和 full-cost measurement 仍属于 closing PASS 后的 `PRE_CLAIM_CONTRACT_FIDELITY_GATE` 与 Stage A killer。

## 8. Comparator/novelty disposition

| Subtractor | Independent disposition |
|---|---|
| Current PG18 local compressed segments | `DIRECT_SUBTRACT`：已吸收 searchable/local-update segment novelty。 |
| Current build/non-build page split | `DEPLOYMENT_BASELINE + DIRECT_SUBTRACT`：吸收 heuristic page construction，不吸收 trace-aware exact hierarchy。 |
| `fastupdate`/pending/config/resource grid | `FINITE_DEPLOYMENT_UNION`：必须同 trace 选择并完整计价；不表达 per-key hierarchy action。 |
| Generic sorted posting partition/PEF | `METHODOLOGICAL_SUBTRACT`：吸收 leaf interval/byte shortest path。 |
| Local partition DP + native parents | `STRONGEST_ACTION_SUBTRACTOR`：revision 必须用 coupled internal grouping/right-bound witness 超出它。 |
| Offline trace controller/wrapper | `INADMISSIBLE_AS_CANDIDATE_ACTION`：只能选 native layouts，不能在 runtime 改 reader/query。 |
| Complete open-frontier DP certificate | `POTENTIAL_N2_RESIDUAL`，仅在第 7 节全部闭合后成立。 |

不存在 `DIRECT_FATAL`，但 current residual 尚未静态闭合。因此：

- `DISAGREE_PASS` 不成立：直接 PASS 会把 incomplete recurrence 当作完成算法，并无法排除 local packing；
- `CONFIRM_STOP` 不成立：source/config union 没有覆盖 complete action，且 logical-event/frontier certificate 存在有限闭合路线；
- `CONFIRM_REVISE_ONCE` 是唯一符合证据与 Stage 0 policy 的裁决。

## 9. Q1/Q2 与执行边界

- 若 gate 闭合：`TIER_B_Q2_VIABLE / PARITY_CONDITIONAL`；焦点是 native same-format algorithm + exact finite-model guarantee，而不是配置调参。
- 当前不具 `TIER_A_Q1_POTENTIAL`：需要更广 workload、robust trace drift、scalability/approximation、artifact 与系统证据。
- AI route：`AI_CORE_CONDITIONAL`，延续 PRIMARY 的 `ai_core_fraction ~= 0.68`；低 readiness 不构成 STOP。
- natural carriers、20–50 slices、held-out chronology、cold/warm/update/maintenance full-cost 都是有限路线；Stage 0 不要求当前结果。
- Stage A 首个 claim-bearing run 前必须 pin/hash exact current source、核验 logical-event extractor、native legal tree/witness、reader/maintenance equivalence、完整 comparator union 与 full-cost denominator。

## 10. 主线交接

建议主线登记：

- decision：`CONFIRM_REVISE_ONCE`；
- atomic gate：`NATIVE_GIN_ADVANCEPAST_TRACE__HIERARCHICAL_PAGECUT_DP_CERTIFICATE`；
- revision budget：`1 available, not yet consumed`；
- latest collision：`SEARCH_BOUNDED_OPEN`；
- Stage A/B：保持未授权；
- 禁止把 revision 拆成第二轮独立机制 pivot；
- 本 lane 交付后：`IDLE_REUSABLE_AWAITING_MAINLINE`。

