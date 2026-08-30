# Stage 0 Revision-Final Closing — HNSW-LAYER-BMATCH

## 1. 裁决

- assignment：`STAGE0-C2-20260810-HNSW-LAYER-BMATCH-REVISION1-CLOSING-V8.7`
- protocol decision：`CONFIRM`
- scientific decision：`CONFIRM_BELOW_Q2_STOP`
- terminal sentinel：`BELOW_Q2_STOP__FASTHNSW_GLOBAL_CONSTRUCTION_PLUS_GENERIC_BMATCHING_REPAIR_ABSORPTION`
- evidence ceiling：`STATIC_FORMAL_COUNTERCHECK_ONLY__NO_NATIVE_OR_NATURAL_GAIN_INFERENCE`
- latest-collision status：`SEARCH_BOUNDED_OPEN`
- revision policy：冻结的唯一 revision 已审完；不得自动创造第二次 revision。

本 closing 不因缺少 native adapter、native output、自然语料收益或完整实验而停止。停止依据是可在冻结六向量对象上机械复核的 comparator absorption：revision1 所称“必须使用 3-add/2-delete、ordinary bridge+1/2 repair 不能到达”的分离不成立。以 revision1 自己要求共享给 adapted comparators 的词典序目标 `Q=(G,D,-L,lex)` 计，ordinary two-swap 加普通 refill 可从其 repair 输出合法、单调地到达完全相同的 `E*`，且 `G` 为 `3 -> 5 -> 6`。

因此，冻结 revision1 没有闭合其唯一原子边界：它没有证明 PAX-HNSW 在 same-information candidate graph 上超出 FastHNSW 已吸收的 broad construction 与 generic degree-bounded selector + ordinary bridge/1–2 repair。该结论属于真实静态动作吸收与 witness formal failure，不是 readiness 缺口，也不存在需要 `INCONCLUSIVE_POLICY_HOLD` 才能处理的规则冲突。

## 2. 冻结输入与完整性

本次只读取项目 D-root 下的冻结材料，未启动新的 retrieval、实现、实验、benchmark、Stage A 或 Stage B。

### 2.1 Revision1

- 目录：`D:\project\writing\reserch\stages\stage0\_revisions\HNSW-LAYER-BMATCH\revision1`
- `handoff.yaml` SHA256：`E8E05FC2102C7E6E0F5B7F5622352D0CE200B80F77D8BD75D693F908FCF386D0`
- manifest self SHA256：`63D9CEF9677FC5C513FCBCC95CA9EECE6501B0D25926E79E4E151241FE79F4D6`
- manifest verification：`5/5 PASS`

### 2.2 PRIMARY

- 目录：`D:\project\writing\reserch\stages\stage0\_reviews\round-20260810-v8.7-wave41-primary\HNSW-LAYER-BMATCH`
- `handoff.yaml` SHA256：`C2FCA75304EDD864C2C0EEBDC3E93A28E7AD0B29B365BBABB95F36782BAC3DDF`
- manifest self SHA256：`C2862210C86F3A56A0C8FEF8D76814F44FCA6E0455A4B27E83DA02AA48EA851A`
- manifest verification：`4/4 PASS`

### 2.3 初次 confirmation

- 目录：`D:\project\writing\reserch\stages\stage0\_reviews\round-20260810-v8.7-wave41-confirmation-reroute1\HNSW-LAYER-BMATCH`
- `CONFIRMATION_REVIEW.md` SHA256：`F7EF1BA8576C7A091007BB2970AB72EC5681178DAE01AA0F45215C89B25B7143`
- `handoff.yaml` SHA256：`7914714D8D0C826C14BAC97024E22A7261ACBC7D87D747149711A9F819B17462`
- manifest self SHA256：`E4D042551026B5714FF1532DAE06E782EBD929207A2FF344F53F824D6B1AE60A`
- manifest verification：`2/2 PASS`

冻结来源审计支持 FastHNSW/FastKCNA 对 broad global/layerwise construction 的直接减法；本 closing 未把尚未闭合的最新检索或任何传输状态解释为文献不存在。

## 3. 独立审查矩阵

| 审查门 | 结果 | 独立理由 |
|---|---|---|
| same-object / same-information | `PASS_WITH_CLAIM_CEILING` | 固定向量、距离、层成员、入口、度上限和 per-layer candidate graph；PAX 只选候选边。common-C 静态轨与 native end-to-end 轨分离清楚。它只能支持 selector 命题，不能外推 native 构造收益。 |
| 完整联合动作 | `PARTIAL` | PAX 同时处理 entry-connectivity、degree cap 与 path-dependent `G`，不是纯 additive b-matching；但冻结 witness 上的候选输出可被 ordinary repair 的合法小步序列完全复现。 |
| 六向量几何与 greedy trace | `PASS` | revision1 的距离、`E_R` 的 `G=3` 与 `E*` 的 `G=6` 可机械复核。 |
| 六向量动作分离 | `FAIL_FORMAL` | 存在合法 `2-add/2-delete` 改进，再加一条 ordinary refill，得到同一 `E*`；见第 5 节。 |
| `PE(L,b)` 非空 | `PASS` | 六向量的两条 entry-rooted ears 给出 `PE(3,2)` 的显式实例。 |
| `PE(L,b)` completeness | `NOT_CLOSED` | “枚举当前所有合法 ears 后贪心选最大 `Q`”不等于枚举所有 ear-certificate 序列；缺少 backtracking 或 extension-safe 类定义。 |
| 3-exchange local optimality | `CONDITIONAL_PASS` | 若确实穷举所有合法至多 3-add/3-delete 邻域直到无改进，该局部最优结论成立且 exact optimum 给出非空实例；但它是通用邻域搜索保证，冻结 witness 不需要半径 3。 |
| 超出 FastHNSW | `FAIL_FOR_BROAD_CLAIM` | broad construction 已被 FastHNSW/FastKCNA 吸收；revision 只能依靠窄 selector residual。 |
| 超出 additive b-matching | `PARTIAL` | `G` 非加性，故目标本身不是 additive b-matching；但这不足以排除 b-matching seed 后的公平 repair/refinement。 |
| 超出 ordinary bridge+1/2 repair | `FAIL_DIRECT_ABSORPTION` | 公平共享 `Q` 后，冻结 repair seed 经 two-swap + refill 到达完全相同动作。 |
| native serialization/search 与自然语料路线 | `FINITE_BUT_UNRUN` | fidelity 路线是有限的；Stage 0 不要求已运行，因此不作为负证据。 |
| full-cost 路线 | `FINITE_BUT_UNRUN` | revision 已列 selector、adapter、build、serialization、search 与 memory 维度；同样不作为 STOP 原因。 |

## 4. Same-object 与 PAX-HNSW 的静态边界

Revision1 冻结的静态问题在对象层面是可定义的：给定同一组向量、确定性距离/ID tie、层成员、入口、度上限和候选图 `C_l`，选择对称无向子图，并要求入口连通与度合法。PAX 的 `G(E)` 用标准单层 `ef=1` strict-improvement greedy search 在同一批 build vectors 上计数；只要该目标及其计算对所有 adapted comparator 同样开放，就没有换对象或私有信息问题。

它也确实比 additive b-matching 多了一个非加性、路径依赖目标，并把连通与容量放进同一合法状态空间。因此本审查不把 PAX 误判为“无法定义”，也不以 native adapter 尚未实现为由拒绝。

问题发生在相对贡献而非对象定义：revision1 一方面规定 `G` 向所有 adapted comparator 开放，另一方面又用“不优化 path-dependent G”的 B6 作为 ordinary repair 对照，并据此宣称动作分离。这两个条件不能同时用于公平 novelty gate。若 B6 不准使用共享目标，它不是强公平 comparator；若允许它使用共享目标，下面的两步路径直接复现 PAX 输出。

## 5. 六向量 witness 的机械反例

记边 `ij={v_i,v_j}`。冻结候选边为：

`C={01,02,12,13,25,34,35,45}`，所有顶点 cap 均为 2。

Revision1 的 ordinary one-portal repair 输出为：

`E_R={02,12,13,35,45}`。

该图是一条 `0-2-1-3-5-4` 路径，度合法、连通，且 revision1 的 strict-improvement greedy 规则给出 `G(E_R)=3`。现在执行一个 ordinary two-swap：

- 删除：`{12,35}`；
- 加入：`{01,34}`；
- 得到：`E_1={01,02,13,34,45}`。

`E_1` 是路径 `2-0-1-3-4-5`。它满足：

- `E_1 subseteq C`；
- 度向量为 `(2,2,1,2,2,1)`，不超过 cap 2；
- 全图连通；
- 该 bundle 每侧至多 2 条边，属于 revision 自己用于区分 ordinary 1/2 repair 的自然 two-swap 半径。

在 `E_1` 上，greedy 成功目标为 `v0,v1,v2,v3,v4`：

- `v1`：`0 -> 1`；
- `v2`：`0 -> 2`；
- `v3`：`0 -> 1 -> 3`；
- `v4`：入口处对 `v1/v2` 的距离并列按 ID 取 `v1`，随后 `1 -> 3 -> 4`；
- `v5`：`0 -> 2` 后无严格改进，失败；
- `v0`：入口即成功。

故 `G(E_1)=5`。因为 `Q` 首关键字就是 `G`，该步严格满足 `Q(E_1)>Q(E_R)`，无需依赖未给出的 diversity 次级分数。

接着做 ordinary maximal refill：

- 加入仍在 `C` 中的 `25`；
- 得到 `E_2={01,02,13,25,34,45}`。

`E_2` 正是 revision1 的 PAX 输出 `E*`。加入 `25` 只把 `v2,v5` 的度从 1 提到 2，连通性保持，且 `G(E_2)=6>5`。

因此存在完整合法且逐步严格改进的路径：

`E_R --(2-add/2-delete)--> E_1 --(1-edge refill)--> E*`

`G: 3 -> 5 -> 6`。

Revision1 只证明了 `E_R` 与 `E*` 的直接对称差包含 3 条 additions / 2 条 deletions；它没有证明不可通过多个合法 committed states 到达。其“ordinary one/two-edge repair 无法到达”及“3-exchange 是该 witness 的必要动作”均被上述路径反驳。由于最终动作完全相同，这不是仅有数值接近，而是 same-object action absorption。

## 6. `PE(L,b)` 与 3-exchange 保证

### 6.1 非空性

六向量图的两条 ears：

- `P1=(0,1,3,4)`；
- `P2=(0,2,5,4)`；

长度均为 3，合并后的 incidence 不超过 2，故足以表明 `PE(3,2)` 不是空类。

### 6.2 Completeness 未由冻结算法推出

`PE(L,b)` 被定义为“存在” entry-rooted bounded-ear certificate 的 candidate graphs；PAX growth 则在每一步枚举当前合法 ears/bundles，按 `Q` 选择一个并提交。存在某个完整 certificate，不保证任意局部最大 `Q` 前缀都能延伸为完整 certificate。要得到所宣称的 completeness，至少还需下列其一：

1. 对 ear 序列做全局 backtracking / dynamic search；或
2. 把类收紧为每个被选择前缀均有 extension guarantee 的 `PE_greedy(L,b,Q)`；或
3. 给出交换恢复定理，证明任意合法贪心前缀都能在冻结 `k` 内回到某个完整 certificate。

冻结 revision1 没有完成其中任何一个。因此“complete legal-ear catalog”只闭合单步动作目录，不闭合 existential certificate class 上的算法 completeness。Stage 0 本来可以把它降为待 Stage A 前形式核验的 claim target；但在唯一 witness 的 comparator 分离也已失败后，它不能独立支撑 Q2 novelty。

### 6.3 3-exchange local optimality 的 ceiling

若 refinement 真正穷举所有合法 `<=3-add, <=3-delete` 邻域并只接受严格 `Q` 改进，终止态没有该邻域内更优解是正确的条件性保证；exact `Q` optimum 也说明满足该性质的状态非空。

但该保证来自通用有限邻域穷举。HNSW 专属性只在目标 `G`，不在 3-exchange 求解结构本身。更关键的是，冻结 witness 上 `E*` 已由 two-swap + refill 到达，所以该 witness 不能证明半径 3 超出 strongest ordinary 1/2 repair。把 `k=2` 改成 `k=3` 而没有不可由小步序列复现的结构分离，不构成足以越过 Q2 门槛的 N2 增量。

## 7. FastHNSW / FastKCNA 与 residual 裁决

PRIMARY 和 confirmation 已确定：FastHNSW/FastKCNA 覆盖 broad global/layerwise HNSW construction；hnswlib/Faiss 覆盖 native local pruning/reciprocal semantics；generic b-matching 覆盖 additive degree-capped selection；ordinary bridge/repair 是连通修复的强减法项。

Revision1 唯一可能保留的 residual 是：在同一 candidate graph 上，用 HNSW greedy reachability 驱动一个 ordinary repair 无法复现的 connected degree-bounded joint selector，并给出非平凡算法或保证。冻结六向量 witness 是该 residual 的唯一机械 action-divergence 证据。第 5 节已表明公平 ordinary two-swap + refill 复现同一动作；第 6 节又表明剩余 completeness 尚未形式闭合，而 3-exchange 局部最优不足以单独形成非平凡 HNSW-specific N2。

因此，候选在冻结 revision1 下回落为：FastHNSW 吸收 broad construction，generic b-matching/connected repair 吸收静态 selector 动作，`G` 只是共享评价函数，固定 `k=3` 是普通邻域半径扩展。没有剩余的 Q2 论文形状。

## 8. 政策与证据边界

- 未以“没有 native output/正结果”为负证据。
- 未要求 Stage 0 运行 GIST 或另一自然 corpus。
- 未以 transport 或检索失败推断 absence；latest collision 保持 `SEARCH_BOUNDED_OPEN`。
- 未启动实现、实验、benchmark、Stage A 或 Stage B。
- STOP 只依赖冻结对象上的直接 comparator absorption 与错误的 witness 必要性命题，符合科学 STOP 条件。
- 因此不登记 `INCONCLUSIVE_POLICY_HOLD`，也不要求第二次 revision 或 DECISIVE 来弥补本次可机械裁决的失败。

## 9. 主线交接

建议主线机械登记：

- Stage 0：`BELOW_Q2_STOP`；
- 理由：`FORMAL_SIX_VECTOR_WITNESS_COLLAPSE_UNDER_FAIR_TWO_SWAP_PLUS_REFILL`；
- 不进入 Stage A/B；
- 不创建第二次 revision；
- closing lane：`IDLE_REUSABLE_AWAITING_MAINLINE`。

