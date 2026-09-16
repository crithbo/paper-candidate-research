# GIN-POSTING-CUT-DP Stage 0 Revision 1

## 0. 裁决摘要

- assignment：`STAGE0-P1-20260810-GIN-POSTING-CUT-DP-REVISION1-V8.7`
- role：`STAGE0-BATCH-GATE / PRIMARY`
- atomic gate：`NATIVE_GIN_ADVANCEPAST_TRACE__HIERARCHICAL_PAGECUT_DP_CERTIFICATE`
- revision budget：`1/1 CONSUMED`
- scientific decision：`RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`
- quality tier if confirmed：`TIER_B_Q2_VIABLE`
- structural paper potential：`TIER_B_Q2_VIABLE__N2_EXACT_FINITE_NATIVE_HIERARCHY_CONSTRUCTOR`
- current evidence readiness：`STATIC_CERTIFICATE_CLOSED__IMPLEMENTATION_NATIVE_SERIALIZATION_AND_NATURAL_GAIN_UNTESTED`
- confidence：`0.84`
- latest collision：`SEARCH_BOUNDED_OPEN`
- source pin：PostgreSQL `REL_18_STABLE` at `a4c41bbcc7b0aed721950303338d75b09eddc295`
- Stage A/B：`UNAUTHORIZED_AND_NOT_STARTED`

本 revision 只回答一个不可拆分命题：在固定 PostgreSQL 18 GIN reader/format/query 语义下，能否把完整查询序列转换为与候选 layout 无关的逻辑 successor 事件，并用一个有限、可审计、对声明动作类 exact 的 open-frontier DP 联合构造 segment、leaf 与 internal grouping，使其动作严格超出 `LOCAL-PARTITION-DP + NATIVE-PARENTS`。答案是“可以静态定义”。这不声称实现存在、自然收益存在或论文主结论已经成立；这些都留给 closing review 后的 Stage A。

## 1. 单一命题、反证条件与结果

### 1.1 单一命题

对固定 table、operator class/key extraction、每个 key 的有序 TID 流、完整查询序列和固定 cost weights，存在一个统一 certificate：

1. 先由 unchanged GIN merge/consistent 语义产生 layout-independent `next_gt/advancePast` 事件；
2. 再由同一有限 open-frontier DP 枚举一个明确的 native-decodable 等深 posting-tree 类，联合选择压缩 segment、leaf cut、逐层 ordered child grouping、派生 right bound 与 height；
3. 每棵树由同一 deterministic native-reader automaton 计价；
4. unpruned shortest-path recurrence 对该有限动作类与冻结 proxy 返回全局最优；
5. 至少一个 native-legal 两树 witness 在 leaf/bytes/height 均相同时，仅因 internal grouping 改变 current `dataLocateItem` 的真实 right-bound comparison 数，严格选择非 native-full-pack 动作。

### 1.2 反证条件

任一项成立即关闭为 `BELOW_Q2_STOP`：逻辑事件引用某个物理 layout；动作只剩 scalar frequency 或局部分段；internal grouping 由 native full packing 固定；right bound 可自由伪造而非由 child 最大 TID 派生；reader cost 与源码动作不一致；状态空间无有限上界；witness 需要换格式、非候选边、外部索引或不同查询语义；公平同 trace comparator 已提供同一 complete action 与同等 guarantee。

### 1.3 本轮结果

上述结构性反证均未触发。certificate 在第 2–8 节使用同一符号系统闭合；第 7 节给出不依赖自然正结果的 native-legal action-divergence witness。当前 readiness 仍低，但存在有限、可证伪的 Stage A 路线，因此不能把未实现或未测量当作 STOP。

## 2. Frozen same-object contract 与共同符号

### 2.1 Exact object

- 固定 PostgreSQL 18 GIN index、table snapshot、operator class、key extraction 与 SQL query semantics。
- 对 key `k`，冻结严格递增 TID 流 `S_k=(t_{k,1},...,t_{k,n_k})`；lossy page item、recheck bit 与 `consistent/triConsistent` 返回也冻结。
- 冻结完整查询序列 `Q=(q_1,...,q_M)`，包括 query-key combination、scan order、重复次数、cold/warm reset boundary 与更新/维护窗口。
- 输出仍是标准 GIN data pages：相同 TID、相同顺序、相同 answer set、相同 lossy/recheck、WAL/crash/locking/VACUUM/pending-list contract；无 external side index、TID reorder、runtime controller 或 reader patch。

候选优化对象是“同一 key-to-sorted-TID relation 的标准 posting tree 布局”，不是 query plan、heap layout、operator semantics 或新的 codec。

### 2.2 记号

| 符号 | 含义 |
|---|---|
| `n` | 当前 key 的 TID 数；全索引按 key 独立求解后求和 |
| `m` | 当前 key 的 logical successor events 数 |
| `H` | 声明允许的最大 posting-tree 高度 |
| `C_0` | native leaf payload byte capacity |
| `K_l` | level `l>=1` internal page 可容纳的 `PostingItem` 数 |
| `A` | 所有 native-compressible segment arcs `(i,j,size,bytes)` 的有限集合 |
| `phi` | 任一 TID cut 上尚未完成的 reader-event interval 最大数 |
| `F` | 所有可达 open-frontier + reader-signature 状态数 |
| `B_c` | 若 proxy 启用跨 query warm cache，冻结的有限 buffer capacity；cold proxy 取 0 |
| `rb(v)` | node `v` 覆盖区间最后一个 TID；right bound 由内容唯一派生 |

## 3. Layout-independent logical event certificate

### 3.1 事件生成

对固定流 `S_k` 定义：

`next_gt(S_k,a) = min { x in S_k | x > a }`，若不存在则为 `END`。

在没有 page、segment、block number 或 right link 的抽象流上运行 unchanged GIN `scanGetItem/keyGetItem` merge 与 `consistent/triConsistent` 决策。每次某 entry 请求 successor 时记录：

`e=(qid,step,k,a,x,prev,exact_lossy,recheck,cache_epoch)`，

其中 `x=next_gt(S_k,a)`，`prev` 是该 entry 前次逻辑返回的 TID。`jump(e)` 由 `a != prev` 判定；query/entry 初始化、终止和 cache reset 都由 `Q` 唯一决定。

### 3.2 Layout-independence lemma

给定固定 `Q`、`S_k` 与 unchanged consistency functions，事件序列 `E` 唯一，且不含 page id、segment id、right link 或 root-to-leaf path。证明按 merge step 归纳：初态只依赖 query keys 与每流首个逻辑 item；若此前逻辑 items 相同，则下一 threshold `a` 与 consistency decision 相同，`next_gt` 在固定集合上也相同。因此下一事件相同。候选 layout 只能改变“如何服务该请求”，不能改变逻辑 successor。

物理 `entryLoadMoreItems` call/buffer trace 不作为公共输入；它由第 5 节 reader automaton 针对每棵候选树重新生成。这排除了从 reference layout 录制 page trace 再优化同一 trace 的循环目标。

## 4. Native-legal posting-tree catalog

本 revision 声明的有限动作类为 `T(H)`，即 pinned reader 可解码、canonical rebuild 可写出的等深 ordered posting trees；它不宣称覆盖任意并发历史产生的每个瞬时页状态。

### 4.1 Segment 与 leaf

1. 一个 segment arc `a=(i,j,b,payload)` 精确覆盖连续 TIDs `t_i..t_j`，使用 pinned `ginCompressPostingList` 语义，首 TID 与 delta payload 均不改变；`b` 为真实编码 bytes，且满足 current compressed-segment legality（包括 384-byte hard maximum；128/256 是 current merge/target policy而非伪造的新格式）。
2. 一个 leaf 是若干首尾相接 segment arcs 的 ordered list，非空，总 bytes `<=C_0`，覆盖一个连续 TID interval。
3. leaf right bound 等于 interval 最后一个 TID；leaf sibling right links 按 TID 顺序连接。

### 4.2 Internal pages 与 height

1. level `l>=1` node 是上一层连续 child nodes 的 ordered group；每个 child 产生一个 unchanged `PostingItem(child_block,rb(child))`。
2. non-root node 的 child count 在声明 class 中为 `2..K_l`；root 在 height>0 时为 `2..K_h`，height 0 时由单 leaf 充当 root。该声明避免无贡献 unary-chain，同时保持 standard reader 可解码。
3. node right bound 是最后 child 的 right bound；同层 nodes 依序连接 sibling right links。
4. 所有 leaves 深度相同，最终恰有一个 root，height `h<=H`。
5. block numbers 在完成树后按 level、left-to-right canonical 分配；它们不进入目标或逻辑事件。

因此 segment cut、leaf cut、ordered child grouping 与 height 是动作；right bound 不是独立自由变量，而是每次 close transition 的派生 certificate。

## 5. Deterministic native-reader evaluator 与 full-cost proxy

### 5.1 Reader automaton

对每个 query/entry 保留有限状态：当前逻辑 cursor、已解码 leaf/segment suffix、当前 leaf right bound、buffer-cache state 与 finished bit。对事件 `e`：

- 若 successor 已在当前 decoded suffix，执行内存内推进；
- 否则若 `a==prev`，按 current right-link path 前进；
- 否则从 root 以 `a` 为 search item，逐层执行 current `dataLocateItem` right-bound binary search；
- 在 leaf 上按 current `GinDataLeafPageGetItems(page,advancePast)` 规则跳过 `next.first<=advancePast` 的整段，再解码选中 segment 到页尾；
- 若该页没有 `>a` item，则沿 right link 继续，直到返回 `x` 或 `END`。

该 automaton 对固定 `T`、`E` 和 cache policy 唯一；它记录 page visit、internal buffer read、`ginCompareItemPointers` 次数、right-link step、decoded bytes/items 与 cache hit/miss。

### 5.2 Frozen cost vector 与 scalar proxy

每棵树先产生不丢维度的向量：

`V(T)=(P_leaf,P_internal,C_rb,R_link,D_bytes,D_items,S_bytes,B_ops,W_bytes,M_ops,Plan_time,Plan_peak)`。

其中 query 项来自上述 automaton；`S/B/W/M` 分别为 index bytes、deterministic build operations、WAL proxy 与由冻结 update interval counts、page slack 和 native split threshold 定义的 additive fixed-maintenance proxy。实际并发维护 replay 只在 Stage A 单列测量，不冒充 recurrence 已精确模拟。规划 time/peak 是算法自身成本。用于 exact recurrence 的预登记标量为：

`J(T)=sum_d lambda_d * V_d(T)`，所有 `lambda_d>=0`，且 `lambda_rb>0`。

`Plan_time/Plan_peak` 对同一次 DP 内的候选树是常数，可在 recurrence 外加而不改变 argmin；对 native baseline 的 full-cost 比较则必须计入。报告必须同时保留向量与 scalar，禁止只展示有利加权和。不同冷/热 cache policy 是分别冻结的 run，不在结果后调权。

## 6. Open-frontier DP certificate

### 6.1 状态

固定候选 height `h<=H`。按 TID 顺序扫描，状态为：

`X=(p,h,O_0,...,O_h,rho,g)`。

- `p`：已覆盖的最后 TID rank；
- `O_0=(start,bytes,segments,rb)`：唯一可继续追加的 rightmost open leaf，或 `EMPTY`；
- `O_l=(start,count,children_rb,rb)`，`1<=l<=h`：该层唯一可继续追加的 rightmost open internal page，或 `EMPTY`；
- `rho`：所有跨越当前 cut 的未结算 logical events 的有限 reader signature。对每个 event 精确保存 `(source_rank,target_rank,advancePast,jump_or_step,source_leaf_ordinal,decoded_suffix_start,cache_epoch,root_descent_pending)`；若启用跨 query warm cache，再保存至多 `B_c` 个 canonical closed-page ordinals 及确定性 replacement order。cold-per-query proxy 令 `B_c=0`；
- `g`：已经关闭并传播到最高 open level 的 child 数/合法 root-termination flag。

所有已关闭且不与任何 event interval 相交的左侧 subtree 只保留累计 cost；其结构无需保存。`rho` 同时保留至多 `phi` 个跨 frontier 事件，所以状态是有限的。

### 6.2 转移

1. `APPEND_SEG(i,j)`：要求 `i=p+1`，选择 `A` 中 native arc；若 `O_0.bytes+b<=C_0`，追加并令 `p=j, rb=t_j`。
2. `CLOSE_0`：要求 leaf 非空且合法；结算已完全落入该 leaf 的 segment/decode/page事件，产生 descriptor `(level=0,interval,rb,bytes)` 并执行 `PUSH_1`。
3. `PUSH_l(v)`：把 child descriptor 作为 unchanged `PostingItem(block(v),rb(v))` 追加到 `O_l`；要求 `count<K_l`。更新 right bound。
4. `CLOSE_l`：要求 non-root child count `2..K_l`；根据 `children_rb` 与落入该 node 的 root-descent events，精确结算 current `dataLocateItem` comparison count和内部页成本，然后产生 descriptor 并递归 `PUSH_{l+1}`。
5. `CASCADE_CLOSE`：在 append 前可自愿关闭任一合法 open page，或容量满时强制关闭；这使 internal grouping 是动作而非 full-pack 后处理。
6. `ACCEPT_h`：`p=n`，所有 open pages合法关闭，所有 `rho` 事件已结算，且最高层恰有一个合法 root；否则拒绝。

每次 close 将最后 child/TID 的值写为 right bound，故 transition 不可能产生伪造 bound。ordered grouping 由单调 sweep 保证；同层 sibling links 由 close 顺序唯一决定。

### 6.3 Recurrence 与 exact guarantee

令 `c(X,a)` 为一次 action 新结算的 proxy cost。按 `(p,number_of_closed_nodes,open-capacity-vector)` 的有限字典序构造无环 state graph：

`D(X)=min_{a in Legal(X)} [ c(X,a)+D(next(X,a)) ]`，

终态 `D(ACCEPT)=0`，无合法后继为 `+infinity`。

**Exactness proposition.** 每棵 `T in T(h)` 有且仅有一个 canonical action sequence：按 TID 顺序输出它的 segments，在真实边界 close leaf，并在其最后 child 到达时自底向上 close 对应 internal nodes。反向地，每个 accepting sequence 只生成连续、容量合法、等深、right-bound 正确的一棵树。reader cost 只在其全部决定量已知时结算一次，累计值等于 deterministic replay。由路径—树双射和 Bellman 最优性，unpruned DP 返回 `argmin_{T in T(h)} J(T)`；外枚举 `h=0..H` 返回 `T(H)` 上全局最优。

该保证只覆盖冻结 proxy 与声明 catalog，不外推到 wall-clock 或未声明 maintenance history。没有 pruning；因此本轮不主张 approximation ratio。

### 6.4 有限复杂度

令 `R` 为单个 crossing-event reader signature 的有限取值数；`G_0` 为容量 `C_0` 内所有 open-leaf segment-list signatures 数；`G_l=sum_{c=0..K_l}(n+1)^c` 为 level `l` 的 ordered child-right-bound list 粗上界；`C_cache<=(N_pages+1)^{B_c}*B_c!` 为冻结 cache signatures 上界。实际可达 state 数 `F` 的一个保守上界是：

`F <= (n+1) * G_0 * product_{l=1..h} G_l * R^phi * C_cache`。

`G_0` 可由 native byte capacity、segment hard maximum 与有限 arc table直接枚举；它可能很大但不是未界定量。segment arcs 至多覆盖 `O(n^2)` 个 interval，故 `|A|<=n(n+1)/2`。逻辑事件生成与 rank mapping 为 `O(m log n)`；固定 `h` 的 unpruned DP 时间为 `O(m log n + |A|*F*h*K_max)`，空间为 `O(F)`；外枚举 height 再乘 `H`。这是显式 capacity/frontier-parameterized ceiling，不声称 polynomial 或已经可扩展到自然大 key。Stage A 的首要 killer 正是 frontier explosion。

## 7. Native-legal two-tree action-divergence witness

### 7.1 固定页面与容量

令 pinned native internal capacity 为 `K>=4`，已有 `N=2K+2` 个完全相同的合法 leaf pages `L_1..L_N`，right bounds `r_1<...<r_N`。所有 leaf segments、leaf cuts、page bytes、sibling links 与 height 均冻结不变。令：

`s=ceil(K/2)`，`u=1+floor(K/2)`。

构造两棵 height-2 标准树；root 都有 3 个 internal children：

- `T_full`：internal group sizes `[K,K,2]`，即 native left-to-right full packing；
- `T_trace`：internal group sizes `[s,K,K+2-s]`。

所有 group 连续且 child count 在 `2..K`；right bound 均由最后 child 派生；root fanout 3；两树均有相同 leaf/internal/root 页数、相同 `PostingItem` 总数、相同 index bytes、相同高度和同一 reader/format。`K+2-s` 在 `2..K` 内，所以两树 native-decodable。

### 7.2 Two-key skip event

取 key `A` 的 posting tree 为上述 leaves。选 `a=r_{K+1}`，并让 `y` 是 `L_{K+2}` 的第一个 TID且是 `a` 的直接后继。第二个 scan key `B` 的冻结流含 singleton `y`，并在 frozen scan-key order 中先被检查。Current `scanGetItem` 把第一个 matching key 的 exact TID `y` 记为候选，并把 `advancePast` 设置为 `y` 的前一 offset 后检查后续 key；因此 `A` 从早先位于 `L_1` 的 cursor 收到：

`e=(q,step,A,advancePast=a,successor=y,prev in L_1,exact,no_recheck,epoch0)`。

因此 `jump(e)=true`；native reader 从 root 以 `a` 下降到包含 `a` 的 `L_{K+1}`，该页无 `>a` item，再沿 right link 到 `L_{K+2}` 返回 `y`。这是真实两 key skip 形状；没有从任一物理 layout 录制事件。

### 7.3 手算 divergence

在两树中 `L_{K+1}` 都位于 root 的第 2 个 child subtree，所以 root 的 page visits 与 binary-search branch sequence相同；随后读一个 level-1 page、`L_{K+1}`、right-link `L_{K+2}`，leaf/segment cost也相同。

差异只在 level-1 `dataLocateItem`：

- `T_full` 的第 2 个 internal page 覆盖 `L_{K+1}..L_{2K}`；目标 right bound `a=r_{K+1}` 位于 child position 1。current binary search 从 `high=K+1,low=1` 开始，需要 `ceil(log2(K+1))` 次 right-bound comparisons 才命中 position 1。
- `T_trace` 的第 2 个 internal page 覆盖 `L_{s+1}..L_{s+K}`；`L_{K+1}` 的局部位置是 `K+1-s=1+floor(K/2)=u`，恰为 current loop 第一个 `mid`，一次 comparison 命中。

所以对 `lambda_rb>0`：

`J(T_trace)=J(T_full)-lambda_rb*(ceil(log2(K+1))-1) < J(T_full)`。

若将 candidate planning overhead 与 native baseline 一并计价，重复该固定 query `W` 次并预登记 `W*lambda_rb*(ceil(log2(K+1))-1) > Plan_candidate-Plan_native` 即得到有限 full-cost divergence。重复只放大同一自然可生成 logical event，不改变对象或未来信息。

### 7.4 为什么不是 local partition/full packing

两树的 segments、leaf boundaries、leaf bytes、leaf page count 与 height完全相同。`LOCAL-PARTITION-DP + NATIVE-PARENTS` 无 internal regroup action，只能得到 left-full `[K,K,2]`；candidate 的 `[s,K,K+2-s]` 是同一 child stream 上的合法不同 parent action，并由真实 `dataLocateItem` comparison cost选择。该 witness 只证明动作非空与 cost evaluator 有区分力，不冒充自然收益。

## 8. Same-trace complete comparator map

| Comparator | 同一信息 | 可生成的动作 | Guarantee | 对本 witness |
|---|---|---|---|---|
| `PG18-BULK` serial/parallel build | 相同 TIDs；不消费 query trace | current segment/repack、left-to-right build/full parent layout | 无 trace-objective optimality | 产生或偏向 `T_full`；是 deployment baseline |
| `PG18-DYNAMIC` insertion/fastupdate/pending/VACUUM/REINDEX finite union | 相同 relation、冻结合法 config/path；同 trace只用于事后选择 | current split/balance/75%/cleanup 可产生的有限 outcomes | 无 complete-action exact guarantee | 必须实测；若偶然生成 `T_trace` 可 tie，但不吸收 exact constructor |
| `PG18-TRACE-TUNED-UNION` | 与候选相同 training trace | 在上述当前 finite outcomes 中选 full-cost 最优 | 对有限枚举 exact，动作受 current path限制 | 强部署 baseline；不能任意 regroup child stream |
| `LOCAL-PARTITION-DP + NATIVE-PARENTS` | 相同完整 trace | exact segment/leaf local cuts；parent由 native full packing | 仅 local model exact | leaf相同后固定 `T_full`，不能生成 `T_trace` |
| Generic PEF/sorted posting partition | 相同整数流，通常不同 codec/reader | interval/byte partition | 各自模型保证 | methodological subtractor；不作为同格式 equal-guarantee baseline |
| Exact complete-tree exhaustive oracle | 相同 trace与 catalog | 与 candidate 相同 complete action | exact ceiling | 只用于 tiny oracle，不是部署 baseline |
| Candidate open-frontier DP | 相同 trace | segment、leaf、每层 grouping、派生 bounds、height | unpruned exact over `T(H)` | 可生成并选择 `T_trace` |

公平性规则：所有 adapted baselines得到相同 frozen training events；held-out queries 只用于评估。oracle 不计作部署 union；但 candidate 必须在 tiny cases 与它逐项一致。若 current finite deployment union 在 full cost 上覆盖 candidate，Stage A scientific STOP，即使 static N2 仍可定义。

## 9. Stage A 有限 preclaim route 与 killer

本 revision 不授权 Stage A，只冻结 closing PASS 后的有限路线：

1. pin/hash `a4c41...` 和 exact build flags；实现只读 logical-event extractor，并在 tiny two-key streams 与 reference set simulator 对齐；
2. 用 native encoder 生成 segment arc table；对 6–20 leaves 的 tiny cases 穷举完整 legal trees，检查 DP legality、right bounds、reader events 与 exact objective；
3. 写入前先通过 `PRE_CLAIM_CONTRACT_FIDELITY_GATE`：native page serialization、`index_check/fsck` 等价、query answers、lossy/recheck、WAL/maintenance semantics；失败结果不能支持论文 claim；
4. 冻结至少两类自然 corpus/query carrier、20–50 slices 与 chronological holdout；比较第 8 节 union，报告向量 full-cost、planning time/RSS 与 fallback；
5. killer：任一 semantic/reader mismatch；完整动作 coverage `<10%`；`phi/F` 使 bounded solver不可运行；至少 90% strata local DP/native union已同动作；或 p50/p90 无 full-cost Pareto residual，则停止。

这条路线只需 CPU、PostgreSQL source/build 与公开数据，有限且可复现；当前没有资源 blocker。自然收益、scalability 与 native output均为 `NOT_RUN`，不得在 closing review 中当作既成证据。

## 10. Claim ceiling 与最终建议

允许的 Stage 0 claim：已经定义一个 same-object、native-reader-aware、complete finite-action N2 命题；它在 declared catalog 上有 exact unpruned guarantee，并有超出 local partition + native full parents 的手算 action-divergence witness。

禁止的 claim：未证明 PostgreSQL patch可维护；未证明自然 workload 有收益；未证明 wall-clock、I/O 或 index bytes改善；未证明全体 native瞬时树状态最优；未完成穷尽 collision search；未达到 Q1。

因此建议 closing sentry 复核后登记 `STAGE0 PASS / TIER_B_Q2_VIABLE`，仅打开后续 Stage A 候选资格；本会话不创建、不授权也不启动 Stage A/B。
