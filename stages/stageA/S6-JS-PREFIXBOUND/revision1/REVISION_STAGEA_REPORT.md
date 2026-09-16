# S6-JS-PREFIXBOUND Stage A Revision Report

- Lane id: `CANDIDATE-EXECUTION-LANE-1`
- Assignment id: `STAGEA-L1-20260809-S6-JS-PREFIXBOUND-R1`
- Initial handoff SHA-256: `7E5F1C6B76714F3817DD348B1C57A70D6EFFCF9E9EC795E5D6F242E3FE7404F8`
- Gate handoff SHA-256: `9C43D3BF0C652BAE44A1B1D7C0B8D1B4C37BC4D98E5F772E00C64496B2D6A654`
- Revision contract SHA-256: `3F0C3E5C169060E3B3CCD1281972141F93E6A78894E670CF0287B23741310EBD`
- Cross-assignment contamination: `false`
- Decision: `PASS_RECOMMENDED`（仅返回独立 Stage A gate 复审）
- Quality tier: `TIER_A_Q1_POTENTIAL`（高度条件性）
- Evidence ceiling: `FINITE_CONTRACT_FAITHFUL_COSTED_NONVACUITY_PRELIMINARY_SUPPORT`
- Novelty route: `N2`
- Stage semantics: 这是最高风险前提的有限、真实 revision；不等于论文主 claim 成立。

## Frozen contract

`REVISION_EXPERIMENT_CONTRACT.yaml` 在脚本执行前冻结。对象仍是 DPomega-level exact merge-join `join + sort`：相同关系图与属性等价类、connected bushy plan space、合法 merge-key permutations、partial-sort cost、最终 `Omega` 和 exact optimum。workload 未扩展，仍为 19,440 个三至四关系穷举实例与 pinned JOB 4a 自然 SQL 图结构。

本 revision 修复了初始脚本与合同的 NDV 偏差，严格实现：

- `card(S)=32+7*mask(S)+3*|S|`；
- `ndv(S,A)=min(card(S),2+mask(S)%5)`；
- `ndv(S,B)=min(card(S),3+(mask(S)*2)%7)`；
- JOB 的 `ECk` 仅用于结构检查，偶数类映射 A 公式、奇数类映射 B 公式。

## Predeclared non-vacuity gate

确定性 residual 在执行前定义为二选一：

1. `exact logical work - (quotient logical work + bound-oracle logical work) > 0`；或
2. `exact canonical retained payload bytes - candidate frozen retained payload bytes - bound retained bytes > 0`。

wall time 与 peak `tracemalloc` 只作描述，不能单独触发正判。Full-vector 若 work 与 retained residual 均不为正，则只允许一次相同等价关系的 compact pivot。Compact 在构造期用完整向量做精确 tuple equality、分配连续 class id，冻结后丢弃临时向量映射，并以 class-id-indexed array 保存 cost 与 representative order。

## Highest-risk probe result

- Full-vector optimum mismatches: `0`。
- Compact optimum mismatches: `0`。
- Compact/full-vector equivalence mismatches: `0`。
- Future-equivalence counterexamples: `0`。
- Bound overestimates: `0 / 404,479`。
- Primary/replay 所有非易变字段：精确一致。

Full-vector 被完整成本吸收：

- work residual: `-63,498,387` logical units；
- retained residual: `-32,749,534 B`；
- full-vector retained payload 是 exact 的 `2.5648x`。

因此按预登记触发且只执行一次 compact pivot。Compact 保持相同 optimum 与等价类，并留下：

- retained payload residual: `+601,569 B`，即 exact retained payload 的 `2.8743%`；
- work residual（计入 bound oracle）: `-64,616,558` logical units。

这关闭了“是否存在任何 bounded same-object residual”的原子门，但正 residual 只存在于冻结后的持久化 payload，不存在于 work 或时间。结论最高为 `PRELIMINARY_SUPPORT`。

## Exact, quotient and bound full-cost separation

在 primary 中：

| Phase | Wall time | CPU time | Peak incremental tracemalloc | Logical work |
|---|---:|---:|---:|---:|
| Exact control | 14.184 s | 13.828 s | 10,044 B | 5,482,863 |
| Full-vector quotient | 41.939 s | 41.125 s | 20,052 B | 10,788,389 |
| Compact quotient | 39.697 s | 39.344 s | 7,620 B | 11,906,560 |
| Future-equivalence audit | 33.068 s | 32.563 s | 13,508 B | 4,111,894 |
| Bound oracle audit | 206.289 s | 200.875 s | 33,828 B | 58,192,861 |

Replay 的对应 wall times 为 `11.087 / 32.909 / 25.744 / 26.194 / 161.138 s`，非易变计数完全相同。Compact 在两次执行中都慢于 exact；不得声称 optimizer 加速。Phase peak 是增量 `tracemalloc` 指标，确定性 gate 使用 canonical retained payload bytes。

Bound 账本单列：`404,479` evaluations、`808,958` completion-oracle calls、`10,291,832` oracle transitions。Bound 未用于 pruning；其 exact completion oracle 成本不能被描述为 cheap bound。

## Mechanism-specific result and causal chain

- Algorithm/data-structure change: order-keyed exact table → future-demand full-vector equivalence → compact interned class array。
- Mechanism metric: exact `404,479` states / `877,024` transitions；compact `389,774` states / `873,661` transitions（包含 JOB 4a）。
- Directional result: state reduction `3.6355%`、transition reduction `0.3835%`、persistent payload reduction `2.8743%`。
- End-to-end result: 未得到 optimizer wall-time 或 work-unit 改善；候选搜索阶段本身更慢，bound audit 更昂贵。
- Generality/no-gain boundary: revision 保留初始穷举范围；小 transition residual 表明许多实例没有经济收益，规模与拓扑规律仍未建立。

这不是普通调参：compact pivot 只改变同一安全等价关系的物理表示，未改变对象、目标、输入、信息或 optimum。

## Natural workload and JOB 4a limit

JOB 4a 仍只作自然图与属性等价类结构检查：

- exact states/transitions: `29 / 44`；
- full-vector 与 compact states/transitions: `24 / 41`；
- exact/full/compact optimum: `4304.112939279771`；
- state reduction: `17.2414%`。

cardinality/NDV 仍是冻结 proxy；这不是自然 cost、DBMS、query-runtime 或 optimizer-performance 证据。

## Reproducibility

Primary 总 wall time `393.632 s`，replay `300.872 s`；两次 overall peak `tracemalloc` 均为 `27,120,334 B`。`validate_replay.py` 只移除合同列出的 wall/CPU/peak 字段；所有 states、transitions、work、signature/vector/hash/compare/lookup、retained bytes、bound cost、trigger path、verdict、GPU/network 与 Stage B authority 字段逐项一致。

## AI execution ledger

- AI executability class: `AI_CORE_EXECUTABLE`。
- Measured ai_core_fraction: `0.82`（沿用初始 Stage A 对核心执行单元的测量；本 revision 的合同修正、计价、compact 实现、primary/replay 与验证均由本 lane 完成）。
- Reproducible files: frozen contract、`run_revision.py`、`validate_replay.py`、primary/replay/validation JSON、报告与 manifest。
- Human/independent items: 独立 gate 的机制与统计解释复核；后续无界证明与 DPomega fidelity 审核。

## Literature collision and Q1/Q2 calibration

本 revision 未扩展碰撞搜索，沿用独立 gate 在 2026-08-09 对 DPomega、Haffner–Dittrich、DPconv、Luo et al. 与 Simmen–Shekita–Malkemus 的来源核验。状态仍为 `SEARCH_BOUNDED_OPEN_WITH_DIRECT_SUBTRACT`。Generic order-property optimization 已是明确 prior art；候选残差必须是 DPomega JS 对象上的安全 future-demand quotient、compact 表示与可用 bound，不能把一般 physical-order equivalence 当创新。

Calibration 保持 `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`。本 revision 只关闭有限 cost-profile fidelity 与 bounded non-vacuity；Q1/Q2 论文级核心缺口仍包括无界定理、DPomega executable fidelity、cheap/useful bound、自然统计与多 workload full-cost 证据。

## Non-relaxable quality audit

- Same-object: `PASS_FOR_FROZEN_FINITE_RESTRICTION`；对象与 workload 未变。
- Latest collision: `SEARCH_BOUNDED_OPEN_WITH_DIRECT_SUBTRACT`；Stage B 前必须关闭主要 claim 的未知项。
- Strong fair baseline: exact order-state DP 同信息执行；DPomega 仅 authoritative definition，未伪称 executable reproduction。
- Natural input/evidence: JOB 4a 仅自然结构正证据，claim ceiling 明确。
- Full-cost: exact/full/compact/signature/bound 分相；所有 invocation、vector element、normalization、hash、compare、lookup、write、retained bytes 与 oracle transitions 入账。
- Reproducibility: primary/replay 全部非易变字段一致。
- Evidence/claim honesty: 只支持有限 persistent-memory residual，不支持 speedup、cheap bound、DBMS 或无界主 claim。

## Supported and unsupported claims

Supported：冻结 NDV family 上 full-vector 与 compact 保持 finite exact optimum；compact 精确复现 full-vector 等价类；bound 未发现 overestimate；compact 相比 exact 留下小幅 canonical retained payload residual；JOB 4a 结构上存在相同方向的 state residual。

Unsupported：optimizer speedup、work reduction、query-runtime 改善、实际 process-RAM 节省、signature/bound 的渐近优势、cheap/useful pruning bound、DPomega code fidelity、自然 cardinality/cost、DBMS 集成、无界 theorem 与 global novelty。

## Recommendation and mandatory next gate

建议 `PASS_RECOMMENDED` 回到独立 Stage A gate，只因预登记允许的 persistent retained-payload residual 非空，且所有 correctness/replay 门关闭。独立 gate 可以拒绝其论文意义，但 owner 不应把 full-vector 吸收或负 work 隐藏成性能成功。

- `PENDING_USER_STAGEB_REVIEW`: `false`
- `stageb_user_approval_id`: `null`
- Stage B authorized: `false`
- Required next action: 主线机械验收后投递独立 Stage A gate re-review。

