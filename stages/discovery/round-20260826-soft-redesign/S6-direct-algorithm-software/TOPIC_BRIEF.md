# ROCKSDB-MULTISST-DICT-TRACE-COVERAGE — Costed native dictionary portfolios for RocksDB multi-SST collections

## 中文摘要

- 研究机会：在保持精确 20 manifests、4096-byte blocks、数据成员、RocksDB reader 和 ZDICT/Zstd 语义不变时，把当前“每个 SST 独立训练一个字典”改写为“对一个原生 multi-SST collection 联合分配全局样本预算、构造有限字典组合并为每个 SST 选择字典”的算法问题。
- 为什么可能值得做：当前 per-file、one-global 和历史 shared-one 分别代表两个极端；异质 SST 集合可能存在中间 portfolio 的 full-cost Pareto 区域。重复字典 meta-block、训练/选择成本和 reader memory 使该问题不同于只看压缩率的普通聚类。
- 为什么保留：current main 的 bounded source audit 未发现完整 action；新 ID 与旧题五字段不同，且有合法小 witness、强基线与明确 falsifier。
- 为什么高风险：多 preset dictionary family/assignment 从 DCC’01 起已是已知 NP-hard compression-segmentation；WSDM’19 等也已有多字典与 selector。若 target-specific solver 不能超出 generic facility-location/k-medoids，必须在 Stage 0 淘汰。
- 下一步：独立 Stage 0 重做近期碰撞/Q2 校准，并首先攻击 generic-collapse、current custom CompressionManager expressivity 与 trace fidelity。

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`（条件性）；`TIER_A_Q1_POTENTIAL` 仅在算法深度和广泛自然证据加强后
- Opportunity origin: `O7`
- Domain tags: `DATABASE_STORAGE / LSM_TREE / LOSSLESS_COMPRESSION / ALGORITHM_DATA_STRUCTURE / SYSTEMS`
- Contribution route: `N2`
- Discovery date: `2026-08-26`
- Discovery method revision: `research-topic-discovery FC041AE3...21CD2`
- Discovery claim-pack mode: `OFF`
- Discovery RQ frontend: `PRODUCTION / RQ_REFINEMENT_STAGED_EVIDENCE_V1`
- Opportunity family ID: `OF-ROCKSDB-NATIVE-MULTISST-DICT-PORTFOLIO`
- Contribution type: `METHOD_ALGORITHM`
- Local coordinates: `A3_FALSIFIABLE_CLAIM / C2_MAJOR_SUBTRACTION / D1_READY_FOR_STAGE0 / E1_STATIC_PREFLIGHT`
- Seed / RQ / card: `DIVERGENCE_SEED_POOL.md / DISCOVERY_RQ_CANDIDATE.md / DISCOVERY_QUESTION_CARD.md`
- Carrier kind: `NATURAL + IMPLEMENTATION_CARRIER_ONLY preflight`

## Research question

Can a result-independent native multi-SST dictionary-portfolio algorithm, under one global sample budget and complete reader-local/full-cost accounting, outperform current per-SST training and equally budgeted global/simple/generic baselines on the exact 20-manifest collection while an exact selector→final-dictionary→compressed-block trace verifies the mechanism?

## Canonical research claim package

- Exact object: exact 20-manifest logical dataset as one legal native standard RocksDB multi-SST collection; every record appears exactly once; 4096-byte data blocks.
- Scenario: bottommost/compaction-style standard BlockBasedTable generation and reading, using current Zstd dictionary semantics.
- Opportunity anchor: current `BlockBasedTableBuilder` trains/finalizes one dictionary from this file and stores it in this SST.
- Atomic action: deterministic native collection construction; global retained-fragment budget; bounded portfolio training; per-SST no-dict/dictionary assignment; bounded objective-improving refinement; exact causal trace.
- Mechanism: subset-shared repetition regimes allow an intermediate portfolio to cover matches missed by one-global and avoid the training/storage waste of fully independent per-SST dictionaries.
- Information: builder-visible uncompressed blocks/sketches and fixed held-out probes only; no future queries, result-aware denominator changes or record rewriting.
- Comparator/fairness: B0 no dict; B1 current per-file; B2 one global; B3 historical shared-one; B4 equal-budget independent per-SST; B5 generic compression segmentation/k-medoids; B6 tiny offline oracle.
- Expected endpoint: non-dominated storage/build/read full-cost point plus trace-confirmed mechanism; no guaranteed positive result.
- Full cost: construction, sketches/samples, ZDICT training, portfolio iterations and probes, compaction CPU/wall/RSS/temp I/O, SST+dictionary bytes, cold/warm reader CPU/memory/cache and reproducibility.
- Failure/no-gain: homogeneous collection, large self-sufficient SSTs, small/unstable cohorts, dictionary bytes or reader memory dominate, generic B5 matches candidate, or trace cannot close.
- Minimum falsifier: tiny 4–8-SST native witness with two repetition regimes and exact oracle/strong baselines; stop on generic equivalence, full-cost domination or trace/legality failure.
- Dependencies/ceiling: public RocksDB/Zstd source and pinned 20 manifests; Discovery does not authorize implementation or claim runs. Claim ceiling remains conditional Q2 until independent Stage 0.

## Opportunity-family relations

| Related family | Relation | Evidence | Disposition |
|---|---|---|---|
| `ROCKSDB-DICT-COVER` | predecessor boundary / related only | r7 invalid construction + gate | no revival or positive inheritance |
| multiple preset dictionaries / compression segmentation | generic kernel / direct subtract | Mitzenmacher, DCC’01 | portfolio/assignment abstraction not novel |
| RocksDB historical subcompaction dictionary reuse | direct subtract | historical format wiki | one shared cross-SST dictionary not novel |
| current RocksDB per-file training | deployment baseline | current wiki/source | strongest native baseline |
| WSDM’19 DINT and earlier multi-dictionary selectors | methodological adjacent | primary paper | selector/suite mechanics not novel |
| cross-entity shared/delta dictionaries | methodological adjacent | primary paper | dictionary selection/deployment costs known |

## Paper genealogy and source boundary

- Current anchor: official RocksDB `v11.1.2` and current main `block_based_table_builder.cc` read 2026-08-26.
- Codec primitive: official Zstd `zdict.h`, CLI/manual and CDict APIs.
- Strong generic predecessor: Michael Mitzenmacher, “On the Hardness of Finding Optimal Multiple Preset Dictionaries,” DCC 2001.
- Selector/codec predecessor: Pibiri, Petri, Moffat, “Fast Dictionary-Based Compression for Inverted Indexes,” WSDM 2019, DOI `10.1145/3289600.3290962`.
- Adjacent contrary: cross-entity delta/shared-dictionary Web compression.
- Search boundary: 17/20 bounded attempts; official/primary only; no same-object direct fatal found; recent storage-specific collision remains Stage 0 debt.

## Importance and fit

RocksDB/LSM compression is a high-impact storage surface, and the artifact route is a reproducible CPU/single-machine software component with direct compiler/runtime/storage relevance. Strategic alignment is `TRANSFERABLE/ADJACENT`, not sufficient by itself for admission.

## Mechanism and alternatives

- Preferred mechanism: heterogeneous SST subsets share repetition patterns; joint sample allocation and a small portfolio use the fixed dictionary budget more effectively.
- Null: current per-file training already adapts optimally enough; no intermediate regime exists after full cost.
- Strong alternative: generic compression segmentation/k-medoids obtains the same solution, leaving no target-specific algorithmic contribution.
- Mechanism signature: candidate benefit grows with between-SST heterogeneity and within-cluster similarity; exact dictionary-match bytes explain residual; homogeneous or isolated SSTs show no gain.

## Seed-distance and admissibility

- Versus old topic: changes the exact object, action, endpoint and collection-level cost; same semantic guarantees intentionally remain.
- Versus current RocksDB: changes independent per-file training into joint constrained portfolio/assignment.
- Versus generic segmentation: adds global sample coreset, repeated reader-local dictionary cost, compaction/buffer constraints, native legality and exact causal trace; this distinction is the principal Stage 0 question.
- Method-name deletion test: PASS conditionally.
- Same-function contract: exact ordered KV contents, checksums, BlockBasedTable reader and codec semantics.
- Algorithmic delta: bounded baseline-initialized, objective-monotone coreset/portfolio/assignment solver.
- Why not routine tuning: decision variables include training-set allocation, portfolio construction and assignment, not only dictionary count/size; nevertheless it collapses if B5 expresses the same action.

## Current collision classification

- `DIRECT_FATAL`: none found within bounded current/scholarly search.
- `DIRECT_SUBTRACT`: historical shared-one mechanism; DCC compression-segmentation abstraction.
- `METHODOLOGICAL_ADJACENT`: WSDM multi-context selector, cross-entity dictionary selection.
- `DEPLOYMENT_BASELINE`: current RocksDB, custom CompressionManager, Zstd primitives.
- `SEARCH_BOUNDED_OPEN`: yes.
- Stage 0 debt: recent storage/LSM literature and PR/issue/source union; generic-collapse proof; exact main commit/source tag parity.

## Decisive falsifier and 72-hour first evidence

1. Independently review the atomic objective/solver against DCC compression segmentation and facility location.
2. Design a legal 4–8-SST witness and exact oracle before natural corpus use.
3. Freeze builder/Zstd trace schema for retained fragment, final serialized dictionary and dictionary-offset block matches.
4. Consume every strong baseline in the checker/full-cost ledger.
5. Stop if any semantic change, generic equivalence, invalid trace, or full-cost domination appears.

## Executable evidence path

### Current upstream reality

- Report: `CURRENT_UPSTREAM_REALITY_CHECK.md`
- Current stable tag: `v11.1.2`; main inspected 2026-08-26.
- Checked options: dictionary bytes/train bytes/buffer bytes/trainer/threads, bottommost options, cache charging, custom CompressionManager and block/table settings.
- Residual: no checked entry implements the full constrained collection action; historical cross-SST reuse is subtracted.

### Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`
- Complete action: solver skeleton in `DEEP_REVIEWS.md`.
- Real comparator/native semantics: current per-file builder and exact ZDICT/Zstd behavior; reader/format unchanged.
- Denominator/full cost: exact 20 manifests, every record once, 4096-byte blocks, all strong baselines and complete cost dimensions.
- Small witness: deterministic 4–8 native SSTs with oracle.
- Finite steps: static API design → trace source preflight → tiny witness/oracle/baselines → only then natural Stage A.
- Structural failure: requires format/reader change, cannot expose exact matches, or generic B5 absorbs the solver.

### Execution readiness

- E1: PASS for source/docs/interface and resource route.
- E2: `NOT_RUN_NOT_REQUIRED_FOR_STAGE0`.
- No candidate build/experiment/claim observation occurred.

## Q1/Q2 sufficiency hypothesis

- Q2: a new constrained solver, native implementation, strong baseline matrix, exact mechanism trace and natural full-cost evidence could form a complete paper.
- Q1: requires broader workloads/versions/platforms, stronger approximation/complexity result or more general mechanism, and substantial reproducible evidence.
- Stage B need: scale, ablations, workload breadth, robustness, full collision closure and independent reproduction.

## Non-relaxable quality audit

- Same-object: PASS for new ID; no old-topic revival.
- Latest collision: bounded open, high-risk subtractors named.
- Strong baselines: frozen B0–B6.
- Natural evidence: route exists; no positive result inherited.
- Full-cost: complete contract, no measurements yet.
- Reproducibility: public CPU/single-machine route with exact tag/source/manifests.
- Evidence honesty: PASS; current conclusion is a conditional research shape, not a result.

## Dual-axis scheduling score

- Academic value: `50/70`
- AI executability bonus: `24/30`
- Total: `74/100`
- Scores only prioritize work and do not compensate any hard gate.
