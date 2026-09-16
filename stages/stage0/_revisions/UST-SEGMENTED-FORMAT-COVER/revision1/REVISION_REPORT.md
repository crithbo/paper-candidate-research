# UST-SEGMENTED-FORMAT-COVER — Stage 0 Revision 1/1

- assignment: `STAGE0-P1-20260810-UST-SEGMENTED-FORMAT-COVER-REVISION1-V8.7`
- role: `STAGE0-BATCH-GATE / PRIMARY`
- atomic gate: `NONPRODUCT_UST_COVER_RESIDUAL_BEYOND_CONTIGUOUS_PARTITION_AND_HYBRID_SPMM`
- decision: `RECOMMEND_BELOW_Q2_STOP`
- quality tier: `BELOW_Q2_STOP`
- terminal sentinel: `BELOW_Q2_STOP__HYBRID_ROW_PARTITION_PLUS_UST_WRAPPER_ABSORPTION`
- revision budget: `1/1 CONSUMED`
- Stage A authorized: `false`
- Stage B authorized: `false`
- confidence: `0.93`

## 单一原子命题与反证条件

待关闭的唯一命题是：在固定 NVIDIA UST 同一 SpMM 对象上，把 `K`、固定 `B` 的复用次数、内存预算、普通有限状态转移以及全部可加 full-cost 都交给 strengthened comparator 后，仍存在一个合法、可命名、不能由连续行分段 hybrid SpMM 及现有强减项表达的非乘积 coupling；该 coupling 同时导出一个非平凡算法或形式保证，并有有限的 Stage A pre-claim 可证伪路线。

反证条件是：冻结候选的每个合法动作都可保真映射为有限状态、资源约束的连续行分段路径；或者残差只能通过增加格式、特征、权重、阈值、`K`、复用、普通资源/转移状态、wrapper/controller/emitter/postprocessor、局部 heuristic 或更换对象获得。

结果：反证条件成立。该 gate 没有留下合法 action divergence，因此唯一 revision 科学失败。

## 两轴结论

### Structural paper potential

`BELOW_Q2_STOP`。失败不是因为尚未实现、未跑自然 workload、缺少 GPU 或没有完整定理，而是因为按冻结动作边界，即使规划器成功，其 action space 与保证仍被一个公平、同信息、同保证的有限状态 cover comparator 完整表达。余下工作是 hybrid row partition 上的求解器、代价建模或 UST wrapper engineering，不能形成独立的 N1/N2/N3 论文核。

### Current evidence readiness

`SUFFICIENT_FOR_STRUCTURAL_STOP`。输入包、版本、current-source reality check 与竞争边界足以判断 action-space 吸收；不需要性能实验来证明这一结构性结论。网络或硬件均不是停止理由。

## 冻结 same-object contract

1. 稀疏矩阵 `A`、稠密矩阵 `B` 与输出 `C` 固定；计算仍是同一个 exact SpMM。
2. `A` 的行次序、非零值和坐标不变；不允许跨行重排、近似、改变数值语义或改用自定义 fused kernel。
3. `B` 的 shape/dtype/order 与重复复用次数 `R` 固定；`C` 的 shape/dtype/order 与组装语义固定。
4. 候选仅把行域切成至多 `K` 个不交叠连续区间，每段选择 UST 可合法构造、转换、计划和执行的动作。
5. UST pin 为 `NVIDIA/nvmath-python v1.0.0 @ bb27be436099b36559bae15a307c94d76b12e902`；其 native multi-tensor/multi-plan composition、格式 DSL、转换、library/codegen、plan/reset/reuse 均属于 comparator，而非候选贡献。
6. full-cost 包括：格式转换、目录/元数据、plan/compile/setup、workspace/peak memory、所有 launch、输出组装、冷/热执行、重复复用与失败回退。

## 完整有限 UST action catalog

对每个连续行段 `[i,j)`，一个动作标签是有限元组：

`a = (storage_format, format_parameters, conversion_path, dispatch_backend, algorithm_or_kernel_selector, plan_signature, output_mode)`。

其中每个维度仅取 pinned UST 与其合法后端在 frozen contract 下可调用的有限选项。候选不得新增 kernel、codec、格式语义或输出协议。状态 `q` 至少包含：上一动作标签、已物化格式/plan 的有限集合、plan-cache/compile 状态、workspace/peak-memory 占用、复用轮次以及普通冷/热转移状态。资源向量包含段数 `K` 与内存预算。边代价完整计入该动作及状态转移的所有 additive full-cost。

这不是“万能 union”：它只包含 frozen UST object 的合法动作和明示的普通有限状态效应，不并入其它论文的非同对象动作。

## 决定性结构反证

### Finite-State Cover Equivalence Lemma

给定有限动作目录、有限 `K/R`、有界内存和有限历史状态；若每个合法计划是若干不交叠连续行段动作的序列，且跨段历史只通过该有限状态影响合法性或代价，则候选计划与 layered resource-constrained DAG 中从 source 到 sink 的路径之间存在保持合法性与 full-cost 的双射。

构造很直接：状态节点为 `(next_row, segments_used, resource_state, q)`；选择 `[i,j)` 上的动作 `a` 就添加一条到更新状态的边，边代价是转换、plan、launch、组装、复用和状态转移的完整增量。每个候选 cover 逐段生成唯一合法路径；反向读取路径得到相同 cover。由此 exact label-setting / resource-constrained shortest path comparator 能复现候选的每个合法构造、目标值和可行性。

因此以下表面 coupling 都没有越出 comparator：

- plan/JIT 一次性固定费用：将已启用 signature 集合纳入有限状态；
- `B` 复用与冷/热缓存：将复用轮次和 cache/plan 状态纳入有限状态；
- 格式切换、相邻段 transition：纳入上一标签与转移代价；
- workspace/peak-memory：纳入资源状态；
- 冷/热多目标：使用向量标签或 Pareto frontier；
- 增加格式、特征、阈值、权重或 `K`：只扩大已有有限目录或代价函数。

这给出的是 action-space 吸收，而不是以离线最优值自动判死。若候选本来有新的合法动作或不可有限状态化的同对象保证，仍可能构成 residual；本 revision 未能命名这样的动作或保证。

## 与强减项的边界

- `1D-VBR` 已占据连续一维分块及其动态规划/成本优化形状。
- Yang et al. 2018 已覆盖 hybrid sparse format selection 的系统构造空间。
- `HR-SpMM`、`GeneralSparse` 与 `RSH-SpMM` 分别进一步压缩分区、表示/执行适配和行结构利用空间。
- UST current action family允许格式、转换、后端/算法选择、plan 与复用的组合。

上述工作不必被声称为一篇 exact-identical paper；决定性问题是：在把这些减项和 pinned UST 的合法动作公平交给 comparator 后，候选没有留下单一不可表达 coupling。

## 被攻击但不合法的 residual

1. 并发 multi-plan overlap 或 interference-aware co-scheduling：会把核心对象变为通用调度/controller，超出冻结 row-cover 构造。
2. 为不同 query/reuse phase 保存多个 cover：把一个固定 cover 改为 materialized-view / online policy 问题。
3. 跨段 fused conversion 或专用 output assembly：属于 custom converter/emitter/postprocessor，并改变 native UST 路径。
4. 误差预算或近似格式：改变 exact numerical contract。
5. 行重排、自定义 kernel 或跨行结构变换：改变冻结对象，且落入现有结构化 SpMM 竞争空间。

## 最小 same-object action-divergence 检查

取

```text
A = [[1,0,0],
     [0,1,1],
     [0,0,1]],  B in R^(3x1),  C = A*B,
K = 2, catalog = {CSR-action, DIA-action}.
```

候选仅能选择 `[0,1)|[1,3)`、`[0,2)|[2,3)` 或一个整段，并为每段赋一个目录标签。任意 conversion/plan/launch 成本、label-transition、复用次数、有限 cache 状态与内存状态都逐边原样放入 comparator；每个候选动作序列恰有一条同成本路径，反之亦然。该 witness 不是性能实验，而是对 action-divergence 要求的最小符号检查：不存在 candidate-only legal action。

## N1/N2/N3 与 claim ceiling

- `N1`: FAIL。没有新动作、表示或对象。
- `N2`: FAIL。可实现的优化是已知连续分段/有限状态最短路上的实例化、启发式或工程求解；没有额外复杂度、近似或形式保证的合法载体。
- `N3`: NOT AVAILABLE。即使未来观测到 SuiteSparse 行异质性，规律也只支持现有 hybrid cover 动作，不修复 action-space 吸收。
- claim ceiling: `UST-compatible hybrid row-partition planner/wrapper engineering`; 低于可信二区独立论文核。

## Stage A 路线判定

不存在诚实的 Stage A pre-claim route 可在不换对象的前提下验证所需 residual。任何有限实验都只能比较同一 action space 内的求解质量/时间或调参结果，不能产生要求的 candidate-only action divergence。故不应创建或授权 Stage A。

## 最终裁决

`RECOMMEND_BELOW_Q2_STOP`，revision `1/1` 已消耗。终态 sentinel 为 `BELOW_Q2_STOP__HYBRID_ROW_PARTITION_PLUS_UST_WRAPPER_ABSORPTION`。如未来研究新的调度对象、自定义 kernel、非连续结构变换或多 workload materialization，应使用新 ID；不得以本题同 ID 继续 revision 或改名重包装。

