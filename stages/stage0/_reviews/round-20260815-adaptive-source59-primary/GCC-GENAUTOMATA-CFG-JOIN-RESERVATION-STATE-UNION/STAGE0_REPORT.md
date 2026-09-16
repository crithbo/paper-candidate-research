# GCC-GENAUTOMATA-CFG-JOIN-RESERVATION-STATE-UNION Stage 0 PRIMARY Report

## 中文摘要

- 结论：`STOP`。
- 为什么：current GCC main 仍明确写明尚未生成 CFG joint-point union states，因此不是 current-native direct absorption；但冻结候选的精确状态集合、逐点 transition lifting、certified coarsening 和表生成，在删除 GCC/端口标签后原样成为 DFA powerset/collecting-semantics、抽象解释与普通表压缩。递推、复杂度和保证均没有 GCC-reservation-specific residual，直接触发冻结合同的 label-stripping scientific STOP 条款。
- 下一道门：无。不得用一次 revision 把 generic powerset/frontier 重新包装为 target-specific N2。
- 是否需要用户操作：否。

- Lane id: `019feaf7-dba0-7752-a840-db1fea688d69`
- Assignment id: `STAGE0-P1-20260815-GCC-GENAUTOMATA-CFG-JOIN-RESERVATION-STATE-UNION-PRIMARY-V8.7`
- Input freeze SHA-256: `42293F6499545ED2C35409DEAA3317BEB99DA2B99BE60B648E5182A9CEE3877F`
- Cross-assignment contamination declaration: 仅使用冻结 Discovery 最小包、冻结规则/模板，以及本 assignment 的 current-source E1 检查；未读取其他候选证据，未继承其科学结论。
- Decision: `STOP`
- Quality tier: `BELOW_Q2_STOP`
- Confidence: `0.94`
- Evidence ceiling: `E1_STATIC_STAGE0_ONLY__NO_IMPLEMENTATION_NO_RESULT_CLAIM`
- Novelty route: `N2`（经独立审查不成立）
- Candidate Q1 venue family: compiler backend / code generation / architecture-aware compilation（形状校准参考 CC/CGO/TACO；不主张 venue fit）
- Stage semantics: conditional paper-potential screen; this report does not establish any performance result.

## Structural paper potential vs current readiness

- Structural paper potential if successful: 若存在一个保留 GCC native future actions、hazard legality 与 full cost、又无法去标签化为 generic powerset/dataflow 的 target-specific exact/FPT 构造，理论上可形成编译器 N2 论文。
- Current evidence-acquisition readiness/risk: current source/flags/closest primary anchor可审；自然 two-predecessor in-tree carrier 和最新完整论文碰撞仍为 `SEARCH_BOUNDED_OPEN`。
- Why missing implementation/results/proof/hardware is or is not structurally fatal: 未实现、未运行、未见收益均未用于 STOP；STOP 来自冻结动作与保证本身的 generic reduction。

## Discovery provenance

- Opportunity origins: GCC source-level unimplemented action statement。
- Domain tags: GCC, genautomata, instruction scheduling, DFA hazard recognizer, CFG join, reservation automata。
- Paper genealogy: current `genautomata.cc` → GCC Internals pipeline semantics → 2003 GCC automaton scheduler paper → generic powerset/abstract-interpretation boundary。
- Discovery method revision: `RQ_REFINEMENT_STAGED_EVIDENCE_V1`
- Discovery claim-pack mode: `OFF`
- Opportunity family ID: `GCC-GENAUTOMATA-CFG-JOIN-RESERVATION-STATE-UNION`
- Contribution type and type-contract verdict: `COMPILER_TOOL / N2`; FAIL，因为算法实质不保留 GCC-specific 标签后仍完全成立。
- Independently audited A/C/D/E coordinates: A=固定 target `.md` semantics 与 stock recognizer；C=current main/action union；D=generic reduction；E=full-cost/E1 fidelity。
- Backtest reference and status: 不适用；Discovery 方法校准不作为候选证据。

## Frozen object and claim

- Object: `FIXED_GCC_TARGET_MD_RESERVATION_SEMANTICS__FIXED_CFG_JOIN__STOCK_GENERATED_DFA_HAZARD_RECOGNIZER`。
- Action: `JOIN_RESERVATION_STATE_SET_CREATION__POINTWISE_STOCK_TRANSITION_LIFTING__CERTIFIED_REDUCTION_OR_COARSENING__GENERATED_TABLE_EMISSION`。
- Comparator: deterministic/NDFA、minimization/no-minimization、NDFA/collapse-NDFA、comb/no-comb 及 stock recognizer/scheduler consumer 的 current union。
- Endpoint: unchanged target `.md`, CFG, interlock and recognizer semantics；exact 或 certified precision-space frontier；完整 generator/recognizer/code-quality cost。

## Claim-package completeness audit

- Atomic action and mechanism: 对 CFG join 的 predecessor recognizer states 建集合，逐点提升 stock transition，再 exact 保留或认证 coarsen，最后生成表。
- Information/assumption contract: fixed target `.md`, fixed program CFG, same predecessor state information, stock generated DFA/NDFA semantics。
- Effect target/output/guarantee: 更精确 join hazard state 与 precision/space frontier。
- Boundary/failure region/competing explanation: state-set explosion、ordinary powerset/abstract domain、generic dataflow join/table compression。
- Minimum falsifier: 删除 target/unit/reservation 标签后，状态为任意 DFA state，动作与保证不变。
- Dependencies and evidence ceiling: current GCC source/docs/primary paper；E1 only。
- Opportunity-family relation audit: 没有换 object；但 proposed N2 被 generic machinery 吸收。
- Independent search identity/scope: GCC main pin、`genautomata.cc`、GCC Internals flags、2003 primary subtractor；latest collision `SEARCH_BOUNDED_OPEN`，未作 absence 推论。
- Evidence-ledger integrity and contradiction disclosure: 顶层注释说 CFG union 未生成；同文件的 `states_union` 是 NDFA/alternative reservation-state 构造，不等于程序 CFG join relation。二者必须同时披露。

## Positive opportunity map

- Natural workloads: 有多个 lawful predecessors 且 pipeline reservations 不同的 scheduled CFG joins。
- Observed or expected cost/headroom: 未运行；只存在源码声明的 precision motivation。
- Mechanism-specific prediction: exact set propagation可比单一 merge state保留更多路径信息，但该预测也是 generic collecting semantics 的直接结果。

## Named baselines and fairness contract

1. current deterministic DFA + minimization + comb-vector 默认路径；
2. `ndfa`、`collapse-ndfa`、`no-minimization`、`no-comb-vect` 的完整 non-default union；
3. stock generated `state_transition` relation与 scheduler consumer；
4. strongest generic exact powerset/collecting semantics；
5. certified abstract-domain/coarsening 与 ordinary table compression。

所有比较必须固定 target `.md`、CFG、hazard/interlock semantics、recognizer interface 与信息条件，并计入 generator CPU/RSS/temp、generated bytes、compiler scheduling time、recognizer runtime、precision/code-quality consequence。

## Collision analysis

### Eight-predicate direct-coverage audit

| Predicate | Independent evidence/locator | PASS / FAIL / UNKNOWN |
|---|---|---|
| Same object/function/protocol | GCC main `genautomata.cc` + GCC Internals | PASS |
| Same scenario/workload | 2003 paper明确讨论 union states/join motivation | PASS |
| Same or weaker information | predecessor DFA states are the same information | PASS |
| Atomic action covered | exact current generated CFG join union未见；generic powerset完整覆盖 | PASS_GENERIC / CURRENT_NATIVE_FAIL |
| Same/stronger legality, quality and guarantee | pointwise powerset is exact collecting semantics | PASS_GENERIC |
| Same non-worse full-cost boundary | 未有 target-specific compressed bound；state explosion为明确风险 | UNKNOWN |
| Comparable scale/platform/version/config | current commit已 pin；自然 in-tree two-predecessor carrier未闭合 | UNKNOWN |
| Sufficient full-text/implementation/reproduction depth | current source与官方 docs足以完成 generic-reduction attack | PASS_FOR_STOP_GATE |

### Nearest-prior facet matrix

| Source/mechanism | Same-object overlap | Residual after subtraction |
|---|---|---|
| Current GCC generated automata | fixed target reservation DFA/NDFA, flags, transition/table emission | 程序 CFG join-set consumption未 current-native 生成 |
| GCC Summit 2003 automaton scheduler | union states + state-explosion obstacle | 没有提供可保留的 novel target-specific recurrence |
| Generic powerset/collecting semantics | exact set state、pointwise transitions、join | 无算法残差 |
| Abstract interpretation / certified coarsening | precision-space frontier与 sound merge | 无保证残差 |
| Generic table synthesis/compression | generated relation representation | 无 emitter residual |

### Seed-distance and method-name deletion test

令 stock automaton 为 `(Q, A, δ)`，join state 为 `S ⊆ Q`。候选 exact transition 为 `δ̂(S,a)={δ(q,a):q∈S}`，并按 all-path legality 删除/拒绝不安全动作；certified coarsening 用 `α(S)` 取 sound over-approximation。把 `reservation`, `insn`, `genautomata`, `target.md` 替换成 `state`, `symbol`, `DFA`, `transition table` 后，状态、递推、正确性、复杂度与 frontier 全部不变。这是标准 powerset/collecting-semantics + abstract-domain design；FAIL。

## Competing mechanism decision

- Selected mechanism: exact powerset state propagation / certified abstract coarsening。
- Registered backup: generic set compression or table synthesis。
- Pivot boundary: 任一能通过 label-stripping 的方案都改变冻结贡献实质；不能以 Stage0 revision 修补。

## Residual paper kernel

没有达到 `TIER_B_Q2_VIABLE` 的 residual。当前 source gap 是真实工程/研究入口，但冻结 N2 的算法与保证没有 GCC-specific non-generic substance。

## Evidence route

- `COMPLEXITY_THEORY / PERFORMANCE`（结构门失败；未进入 Stage A）。

## Performance-optimization admissibility

- Same-function contract: 可保持。
- Algorithmic delta: FAIL；delta 是 generic powerset/abstract domain。
- Full-cost ledger: 已冻结，但未运行。
- Strong-implementation fairness: 必须含 current union 与 strongest generic exact/coarsened baselines。
- Generality and failure boundary: state explosion与join-width growth。
- Why not routine tuning: 不是调参，但仍是 generic algorithm instantiation，未达到 target-specific compiler-paper N2。

## Q1/Q2 paper shape

- Problem: CFG join 的 pipeline reservation state精度。
- Contribution: 冻结方案声称 exact/FPT or certified frontier。
- Evidence plan: current source/native oracle/natural carrier/full cost。
- Expected paper narrative: 因 label-stripping 后无 GCC-specific theorem/mechanism，叙事不足二区形状。

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Reference set: current GCC source/docs、GCC Summit 2003、generic DFA/abstract-interpretation boundaries。
- Status: `PARITY_NOT_PLAUSIBLE`
- Contribution-shape gap: 无 target-specific N2 residual。
- Evidence-shape gap: natural public join carrier与full-cost结果尚未运行，但不是决定性 STOP 理由。
- Stage A closure plan: 不创建；结构门已失败。

## Non-relaxable quality audit

- Same-object: 定义可保持；selected natural carrier未闭合。
- Latest collision: `SEARCH_BOUNDED_OPEN`；未从 429/404 或检索失败推断 absence。
- Strong fair baselines: 已包含 current full union 与 generic exact/coarsened mechanisms。
- Natural input/evidence: AArch64 `dispatch_sched_1.c` 是公开 scheduler test，但不满足 two-predecessor join predicate，故不能充当 witness。
- Full-cost: dimensions完整冻结；无结果主张。
- Reproducibility: commit与 locators已冻结；未下载/构建。
- Evidence/claim honesty: `states_union` 不被误报为 CFG join；源码注释也不被误用为新颖性证明。

## Evidence path and AI completion

- E1/E2 execution-readiness audit: 仅静态 source/docs/contract review；没有 candidate implementation、native replay或 claim-bearing observation。
- AI executability class: 不适用（scientific STOP）。
- Estimated ai_core_fraction: 不估算。
- 72-hour first evidence: 不建议，因结构门失败。
- Human-only items and why they are non-decisive: 完整最新碰撞检索可能由人工继续，但不能消除已成立的 generic reduction。

## Fidelity closure plan audit

- Discovery status: `STRUCTURALLY_UNCLOSABLE`
- Complete action and native semantics are finite and same-object: 动作可定义，但贡献不具 target-specific residual。
- Comparator, denominator, full-cost and small-witness plan: comparator/full cost可冻结；自然 two-predecessor witness未闭合。
- Why an unimplemented interface/format/checker is or is not structurally fatal: 不致命；致命的是机制/保证的形式吸收。

## Independent current upstream reality check

- Frozen upstream commit/tag and check date: GCC main `af0cf36fb47a704a02dd2ead5f8db5d140e45351`, 2026-08-15；official GCC git 与 gcc-mirror HEAD一致。
- Current official documentation checked: GCC Internals, Processor pipeline description。
- Actual source paths/symbols checked: `gcc/genautomata.cc`; union-state top comment; `states_union`; `state_transition`; NDFA/determinization/minimization/table emission controls。
- Default/non-default flags, thresholds and configurations checked: deterministic default plus `ndfa`, `collapse-ndfa`, `no-minimization`, `no-comb-vect`，以及 timing/stats/progress controls（非科学动作）。
- Discovery absence claim confirmed, narrowed or contradicted: narrowed。CFG joint-point union仍声明未生成，但 union helper 已用于另一内部语境。
- If contradicted, current native mechanism and finite configuration-grid baseline: `states_union` 仅吸收 NDFA/alternative reservation union，不吸收 program CFG join relation。
- Any non-tuning residual that remains: 仅 generic powerset/dataflow instantiation；不满足冻结 Tier-B 门。

## Stage A highest-risk probe plan

不建立 Stage A。反事实 killer 本可为：固定 target/test，对 tiny reachable DFA exact powerset oracle 与 native generator/recognizer parity，随后测 generator+generated bytes+scheduling+runtime+code-quality full cost；但 label-stripping 已先行杀死论文结构。

## Stop conditions

- 触发：`after label stripping the construction and guarantee reduce to generic DFA, powerset, abstract-interpretation, dataflow or table-synthesis machinery`。
- 未触发但记录：current GCC未被证明直接生成 exact CFG join relation；最新 paper collision与自然 carrier仍 `SEARCH_BOUNDED_OPEN`。
- Revision policy: `REVISE_ONCE` 不适用；修补必须引入新的 target-specific atomic mechanism/claim，超出冻结门而非一次静态 closure。

## Discovery repair vector

- Codes: `R_GENERIC_REDUCTION_NOT_CLOSED`, `R_NATURAL_JOIN_WITNESS_NOT_MATERIALIZED`, `R_CURRENT_INTERNAL_UNION_HELPER_UNDISCLOSED_AT_DISCOVERY`。
- Materiality: 第一项决定 STOP；后二项提高审计质量但不独立形成 STOP。
- Was the missing information available before the frozen cutoff?: 是，current source与 2003 paper均公开。
- Does this feedback alter the independent scientific decision?: `NO`

## Dual-axis score

- Academic value: `22/70`
- AI executability bonus: `18/30`
- Total: `40/100`

## Human research reserve

不适用。这里是机制结构的科学 STOP，不是 AI 能力或资源 blocker。

## User-action blocker

不适用；没有资源失败导致的阶段阻塞。
