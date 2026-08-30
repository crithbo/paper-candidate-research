# ROCKSDB-MULTISST-DICT-TRACE-COVERAGE Stage 0 Report

## 中文摘要

- 结论：`STOP`
- 为什么：没有发现满足八个 direct-coverage 谓词的同对象直接碰撞，因此不是 `DIRECT_FATAL`；但候选 solver 在扣除 DCC 多字典 compression segmentation、facility location/k-medoids 与 current RocksDB union 后，只剩目标特定成本项、集成与 trace，没有新的算法结构、数据结构、近似/复杂度增量，`METHOD_ALGORITHM / N2` 合同不成立。
- 下一道门：MAINLINE 机械验收并决定终态登记；本 PRIMARY 不创建 StageA。若未来改变为真正新的算法或 measurement RQ，必须使用新 ID 重新 Discovery/Stage0。
- 是否需要用户操作：否。

- Lane id: `STAGE0_PRIMARY`
- Assignment id: `STAGE0-P1-20260826-ROCKSDB-MULTISST-DICT-TRACE-COVERAGE-PRIMARY`
- Input freeze SHA-256: `5B276082D27BB7C8E9CB6CF58331EF3E771968DED38F8D26F03CD066DB3CD86D`
- Cross-assignment contamination declaration: only hash-pinned Discovery inputs were read; predecessor results were not used as positive evidence.
- Decision: `STOP`
- Quality tier: `BELOW_Q2_STOP`
- Confidence: `0.88`
- Evidence ceiling: `STATIC_STAGE0_CONDITIONAL_PAPER_SHAPE_ONLY__NO_IMPLEMENTATION_OR_MAIN_RESULT`
- Novelty route: `N2` proposed, independently rejected after generic subtraction
- Candidate Q1 venue family: `ACM TOS / VLDB Journal / FAST- or SIGMOD-adjacent`
- Stage semantics: conditional paper-potential screen; no claim-bearing result was produced.

## Atomic repair trace P0 shadow

- Mode: `SHADOW`
- P0 effect on decision: `NONE`
- Disposition: `NOT_APPLICABLE__NO_REVISE_ONCE_RECOMMENDED`
- Reason: the gap is the contribution contract itself, not one bounded evidence defect.

## Structural paper potential vs current readiness

- Structural paper potential if successful: a rigorously costed native multi-SST portfolio with causal tracing would be useful, but usefulness and evidence rigor do not establish a new algorithm.
- Current evidence-acquisition readiness/risk: CPU/single-machine route and tiny witness are finite; exact trace remains nontrivial.
- Why missing implementation/results/proof/hardware is not the fatal issue: Stage0 does not require them. The fatal issue is absence of a non-generic N2 residual.

## Discovery provenance

- Opportunity origins: targeted `NEW_ID_REDESIGN_ROUTE` from a predecessor boundary.
- Domain tags: `DATABASE_STORAGE / LSM_TREE / LOSSLESS_COMPRESSION / ALGORITHM_DATA_STRUCTURE / SYSTEMS`
- Paper genealogy: current RocksDB per-file builder; historical one-shared dictionary; DCC compression segmentation; WSDM multi-dictionary selector; RocksDB space-amplification/system compression literature.
- Discovery method revision: `research-topic-discovery FC041AE3...21CD2`
- Discovery claim-pack mode: `OFF`
- Opportunity family ID: `OF-ROCKSDB-NATIVE-MULTISST-DICT-PORTFOLIO`
- Contribution type and verdict: `METHOD_ALGORITHM / FAIL_AFTER_GENERIC_SUBTRACTION`
- Independently audited coordinates: `A3 / C2_MAJOR_SUBTRACTION / BELOW_Q2_STOP / E1_STATIC_PREFLIGHT`
- Backtest: none; not candidate evidence.

## Frozen object and claim

Exact 20-manifest logical dataset, every record once, deterministic native multi-SST construction, 4096-byte blocks, unchanged BlockBasedTable reader/checksum/ZDICT/Zstd semantics; jointly allocate a global retained-sample budget, choose a bounded dictionary portfolio, assign one dictionary or no dictionary per SST, and emit an exact retained-fragment → final-dictionary → compressed-block match trace. Endpoint: a full-cost Pareto residual with trace-confirmed mechanism.

## Claim-package completeness audit

- Atomic action and mechanism: defined and falsifiable.
- Information contract: builder-visible uncompressed blocks/sketches and fixed held-out probes; no future queries or result-aware denominator changes.
- Effect target: storage/build/read full-cost Pareto residual.
- Boundary/failure region: homogeneous collections, self-sufficient SSTs, dictionary/reader cost domination, generic solver equality, trace failure.
- Minimum falsifier: legal 4–8-SST witness, B0–B7 and tiny oracle.
- Dependencies/evidence ceiling: public RocksDB/Zstd and pinned manifests; static Stage0 only.
- Opportunity-family relation: new ID is distinct; predecessor remains unchanged.
- Evidence-ledger integrity: PASS with `30/30` bounded network attempts and explicit failed routes.

## Positive opportunity map

- Natural workloads: the exact 20-manifest collection is a legal carrier, not positive evidence.
- Expected headroom: intermediate portfolios are plausible under cross-SST heterogeneity and subset-shared repetition.
- Mechanism prediction: benefits should track between-SST heterogeneity, within-cluster repetition, and dictionary-match bytes.
- Status: `PLAUSIBLE_AND_FALSIFIABLE__NOT_OBSERVED_ON_EXACT_OBJECT`.

## Named baselines and fairness contract

`B0` no dictionary; `B1` current per-file; `B2` one global; `B3` historical shared-one; `B4` equal-budget independent per-SST; `B5` generic compression segmentation/facility-location/k-medoids; `B6` tiny offline oracle; `B7` current AutoSkip/CompressionManager combined with legal dictionary settings. All retain identical records, blocks, codec, reader, checksums, information and full-cost dimensions.

## Collision analysis

### Eight-predicate direct-coverage audit

| Predicate | Independent evidence | Verdict |
|---|---|---|
| Same object/function/protocol | current RocksDB is exact object but lacks portfolio; DCC/WSDM use other objects | `FAIL` |
| Same scenario/workload | no prior exact 20-manifest native collection | `FAIL` |
| Same or weaker information | generic offline matrices overlap; frozen online/result-independent contract not closed | `PARTIAL` |
| Atomic action covered | portfolio/assignment generic core covered; coreset/trace only partial | `PARTIAL` |
| Same/stronger legality, quality and guarantee | generic papers lack RocksDB reader/checksum/format contract | `FAIL` |
| Same non-worse full-cost boundary | some storage/test/cache costs, not full compaction/build/reader/reproduction | `PARTIAL/FAIL` |
| Comparable scale/platform/version/config | different platform/object; current implementation lacks action | `FAIL` |
| Sufficient depth | DCC/WSDM relevant full sections and current source/docs | `PASS` |

Strict `DIRECT_FATAL`: `NO`.

### Nearest-prior facet matrix

- DCC 2001: covers the central `k`-dictionary/assignment optimization and hardness.
- WSDM 2019: covers dictionary suites, selectors, exhaustive selection, memory/cache trade-offs.
- Current RocksDB: covers exact object/semantics, per-file dictionary, AutoSkip and custom compression extension.
- Candidate-only facets: cost coefficients, integration constraints, and trace; none is a new algorithmic action.

### Seed-distance and method-name deletion test

Deleting RocksDB names yields “open bounded facilities under a global capacity, assign clients, charge facility/assignment costs, and locally improve.” The method remains generic facility location/compression segmentation. Test result: `FAIL_FOR_N2_DISTINCTNESS`.

## Competing mechanism decision

- Selected explanation: generic segmentation/facility-location with target-specific cost accounting.
- Registered backup: a measurement/characterization paper about cross-SST repetition regimes and dictionary duplication.
- Pivot boundary: the backup changes contribution type/RQ/endpoint and requires a new ID; it is not a Stage0 mechanism pivot.

## Residual paper kernel

No nontrivial `METHOD_ALGORITHM / N2` kernel remains. Native integration and exact trace can support a paper only when attached to a distinct algorithmic contribution or a separately admitted measurement claim.

## Evidence route

`PERFORMANCE` with mechanism trace; route is executable but not admissible without a contribution.

## Performance-optimization admissibility

- Same-function: PASS.
- Algorithmic delta: FAIL after generic subtraction.
- Full-cost: PASS as contract.
- Strong-implementation fairness: B7 omission repaired in this audit.
- Generality/failure boundary: defined.
- Why not routine tuning: the decision variables are broader than tuning, but the solver is a routine generic optimization wrapper.

## Q1/Q2 paper shape

- Problem: important and natural.
- Contribution: insufficient; no new abstraction/algorithm/guarantee after subtraction.
- Evidence plan: strong but cannot compensate for contribution failure.
- Expected narrative: engineering instantiation and validation of known multi-dictionary segmentation, below Q2 under project rules.

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Status: `PARITY_NOT_PLAUSIBLE`
- Contribution-shape gap: decisive.
- Evidence-shape gap: single collection and unresolved trace, secondary.
- Stage A closure plan: not routed.

## Non-relaxable quality audit

- Same-object: PASS for new ID.
- Latest collision: `SEARCH_BOUNDED_OPEN`; current identity drift and B7 recorded.
- Strong fair baselines: complete after adding B7.
- Natural input/evidence: carrier/falsifier route exists; no positive exact-object evidence.
- Full-cost: complete plan.
- Reproducibility: public CPU/single-machine route.
- Evidence/claim honesty: PASS.
- Contribution minimum: FAIL.

## Evidence path and AI completion

- E1 execution readiness: PASS.
- E2: not run and not required.
- AI executability class: `AI_CORE_EXECUTABLE`
- Estimated `ai_core_fraction`: `0.80`
- Human-only items: none decisive before StageB.
- Reminder: high executability cannot compensate for a missing contribution.

## Fidelity closure plan audit

- Discovery status: `FINITE_FIDELITY_GAP`
- Complete action/native semantics: finite and same-object.
- Comparator/denominator/full-cost/small witness: auditable.
- Exact trace: plausible through assignment-local instrumentation, but not currently closed.
- Structural effect: trace gap is not the STOP basis.

## Independent current upstream reality check

- Current main head link: `e6a2ee0bd211489e64a45a6a0f6ce1dc67e195d7` (visible 2026-08-22).
- Discovery tag `v11.1.2`: retained but stale/insufficient as sole current identity.
- Official docs/source: per-file dictionary path confirmed.
- Current flags/features: dictionary controls, bottommost options, 4096-byte block, CompressionManager, AutoSkip inter-file carryover.
- Discovery absence claim: narrowed; full portfolio still absent within bound, but current baseline union was incomplete.
- Non-tuning residual: none at algorithm level after generic mapping.

## Stage A highest-risk probe plan

No StageA route is recommended. If MAINLINE overrides the contribution judgment, the first gate must be a paper-and-pencil equivalence test against B5 before any implementation or natural run; equality kills immediately. Positive tiny-witness results would support only preliminary feasibility, not novelty.

## Stop conditions

Triggered: no N1/N2/N3 contribution remains after fair current/generic subtraction. Not triggered: direct-fatal prior, natural negative result, implementation failure, or resource failure.

## Discovery repair vector

See `STAGE0_REPAIR_VECTOR.yaml`. Material codes include omitted current AutoSkip/CompressionManager, generic-kernel under-subtraction, contribution-contract mismatch, version-locator gap, and Q2-shape gap. The vector does not alter the independent decision.

## Dual-axis score

- Academic value: `33/70`
- AI executability bonus: `24/30`
- Total: `57/100`

Scores are scheduling aids only; the contribution hard gate controls the decision.

## Human research reserve

Not applicable. This is not a high-academic-potential human-core topic; the paper kernel itself is insufficient.

## User-action blocker

None. No resource failure or user input is needed to form the Stage0 recommendation.

