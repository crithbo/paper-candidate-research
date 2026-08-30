# ROCKSDB-DICT-COVER Stage 0 PRIMARY Report

- Lane id: `STAGE0-BATCH-GATE/PRIMARY`
- Assignment id: `STAGE0-P1-20260809-ROCKSDB-DICT-COVER-PRIMARY-V8.4`
- Input freeze SHA-256: brief `AB142932C96A51EE5D1DCA1CF5A9C24DBBB6CD73AD6AB487BAAFAFB055A10247`; collision matrix `5316BA3A887D0FB8A1621D23526F2815679AC3502524FC558CEC024DC47461A4`; discovery log `A2C08B94CF25DE279151BEACB2F49CAA8B368B30104E9EEF541A2D0A80643E2A`; handoff `D10B56200F32D73FCEEF03CB07BAAADA3F5860C61581D2A796827DC5DCB2B9D5`; manifest `5D94A0BEF7C4C995ED9455C01812E1E46874F3313FB29FADFB9E087B22317AEF`
- Cross-assignment contamination declaration: this judgment was rebuilt from the named Wave 7 freeze and current primary sources. No previous candidate score, recommendation, result, or unstated fact was inherited.
- Decision: `PASS_RECOMMENDED`
- Confirmation status: `PENDING_CONFIRMATION`
- Quality tier: `TIER_B_Q2_VIABLE`
- Confidence: `0.71`
- Evidence ceiling: `DESIGN_AND_PRIMARY_SOURCE_AUDIT_ONLY__NO_CLAIM_BEARING_RESULT`
- Novelty route: `N2`
- Candidate venue family: storage/database systems, with credible Q2-equivalent shape and a bounded path toward FAST/SIGMOD/VLDB-style evaluation; Q1 parity is not yet established.
- Stage semantics: conditional paper-potential screen; this report does not establish the main claim.
- Search boundary: primary paper originals and RocksDB/Zstd official or upstream sources checked through `2026-08-09`; `SEARCH_BOUNDED_OPEN`.
- Stage A authorized: `false`
- Stage B authorized: `false`

## Canonical judgment

If successful, the frozen mechanism has a credible Tier-B paper shape: an online, byte-budgeted retained-fragment coreset inside the existing per-SST RocksDB dictionary path, followed by the unchanged Zstd trainer, can be a non-trivial storage-algorithm contribution if it creates a full-cost Pareto point that the complete finite current union cannot reproduce. Current evidence readiness is only moderate because no candidate implementation or natural-corpus result exists. That absence is not a scientific stop condition at Stage 0.

The main correction to Discovery is decisive but not fatal. Current RocksDB `main` does not use the older wiki's uniform random 64-byte sampling description. Its current builder buffers data blocks and traverses them in a deterministic prime-stride permutation, copying whole blocks up to `max_sample_bytes`. Moreover, Zstd FastCover already scores dictionary segments by d-mer frequency and zeroes covered d-mers. The WWW 2016 paper behind Cover explicitly formulates dictionary construction as a k-mer covering problem. Consequently, neither “coverage” nor “representative sampling” alone is novel. The only admissible residual is the bounded online construction of the *trainer input set* under the exact RocksDB SST streaming/buffering contract. That residual remains structurally definable and finitely falsifiable; no primary source found directly covers all of its object, action, guarantee, cost, and main claim.

## Structural paper potential vs current readiness

- Structural paper potential if successful: `TIER_B_Q2_VIABLE`. A same-object algorithm that selects a bounded streaming coreset, survives current prime-stride and seeded reservoir controls, and improves the end-to-end SST Pareto frontier would be more than parameter tuning or a controller.
- Current evidence-acquisition readiness/risk: `MODERATE_FINITE_CPU_ROUTE`. RocksDB, Zstd, the SST reader/writer, strict checks, and natural public data are open and CPU-executable. The dominant risk is mechanism collapse into upstream FastCover plus a different input order, not resource access.
- Why missing implementation/results/proof/hardware is not structurally fatal: the proposed claim has a finite public implementation route, explicit equality checks, a bounded baseline union, and a preregistered stop rule. Stage 0 judges the paper kernel if successful, not whether Stage A evidence already exists.

## Discovery provenance

- Opportunity origin: `O7`, direct algorithm/software improvement.
- Domain tags: `DATABASE`, `STORAGE_ENGINE`, `LOSSLESS_COMPRESSION`, `CPU_REPRODUCIBLE`.
- Paper genealogy: current RocksDB per-SST preset-dictionary implementation -> Zstd `ZDICT_trainFromBuffer` -> FastCover/Cover -> Liao et al.'s WWW 2016 local maximum-cover dictionary construction. Storage-paper shape is calibrated against production LSM integrations rather than claimed as novelty evidence.
- Discovery method revision: accepted/calibrated `DISCOVERY_METHOD_V2_V8_1` only.
- Backtest reference/status: `stages/discovery/_method-backtests/O7_DIRECT_ALGORITHM_SOFTWARE/v2/handoff.yaml`, `CALIBRATED`; calibration is not candidate evidence.
- Provenance correction: the old BlockBasedTable wiki's random 64-byte/subcompaction description is version-skewed. Current implementation authority is the pinned current source, which uses a deterministic prime-stride block traversal, and the official 2021 design post, which documents per-SST scope.

## Frozen exact object, function, information, cost, and claim

### Object

One production-equivalent, bottommost-compaction `BlockBasedTable` SST produced from one fixed, sorted key-value manifest. Freeze the RocksDB and bundled/system Zstd commits, build flags, comparator, internal-key/sequence-number treatment, table format version, checksum, index/filter options, target block size, compression type/level, dictionary scope, `max_dict_bytes`, `zstd_max_train_bytes`, `max_dict_buffer_bytes`, target file size, cache configuration, and `TableFileCreationReason`/bottommost context.

`SstFileWriter` is acceptable only as a fixture after demonstrating that it exercises the same dictionary guidance and sample/trainer path as the production bottommost-compaction object. Current source distinguishes `kMisc` external SST creation from in-LSM creation context, so an unqualified `SstFileWriter` result cannot silently stand in for the frozen deployment object.

### Function and equality

- Input: the exact byte-identical sorted KV manifest, with a documented deterministic conversion from a licensed natural source.
- Output: one standard self-contained SST; no thin/external dictionary, cross-SST manager, record reorder, custom codec, decoder, or changed block/table format.
- Equality: current RocksDB reader opens the SST; footer, checksum and table properties validate; a full iterator scan returns the same ordered key/value bytes and count; point/range queries agree with the canonical manifest.
- No quality drift: block size, Zstd level, dictionary/train/buffer byte budgets, cache policy, filter/index format and dictionary scope are fixed within each comparison cell.

### Information and cost

The candidate may observe only the same ordered uncompressed data blocks available to the current per-SST builder before training, plus bounded sketches derived online. It may not pre-scan the source corpus for free or use future blocks beyond the frozen buffer/lifecycle contract. Charge manifest conversion, block buffering, sketches, heap/replacement work, selected sample bytes, trainer time/RSS, compression CPU, full SST bytes including dictionary/index/filter/meta blocks, write/compaction time, dictionary cache/CDict/DDict cost, point/range read latency, I/O, verification and fallback.

### Conditional claim

For a preregistered subset of natural structured-record SSTs with at least 16 data blocks, the candidate's byte-bounded online retained-fragment construction, followed by the unchanged Zstd trainer, preserves the exact SST contract and yields a non-dominated total-space/write-CPU-RSS/read point against the entire frozen finite union at both p50 and p90. No universal compression, generic Zstd-training, or cross-SST claim is admissible.

## Positive opportunity map

- Natural workloads: at least 20 public, redistributable structured-record manifests from at least two source families. Record-to-KV conversion, key formation, sort, license, source URL, byte hash, count and resulting block count must be frozen before outcomes; each SST must have at least 16 data blocks.
- Expected headroom: sorted SSTs can contain multiple locally correlated record regimes. Under a training-input cap, the current deterministic traversal or a reservoir can spend bytes on redundant regimes before FastCover sees the omitted blocks. This is a hypothesis, not an observation.
- Mechanism-specific prediction: a bounded frequency sketch and marginal-coverage replacement structure retains fragments that expose useful d-mers absent from the current/seeded controls; those fragments must influence the trained dictionary, not merely differ byte-for-byte.
- Natural no-gain boundary: homogeneous or incompressible blocks, large blocks, uncapped training, trainer saturation, or tight memory/CPU budgets where sketch overhead dominates.

## Named finite baselines and fairness contract

The strongest union is finite and preregistered, not an unbounded post-hoc union:

1. `B0 NO_DICT`: identical builder and settings with no preset dictionary.
2. `B1 CURRENT_ROCKSDB`: current built-in per-SST raw-dictionary and Zstd-trained modes. The trained mode uses the current deterministic midpoint/prime-stride whole-block sample traversal up to the same sample-byte cap and the same built-in trainer.
3. `B2 SIMPLE_SELECTION`: first-prefix, seeded uniform byte/block reservoir, and deterministic key-range-stratified reservoir, all under identical retained/training bytes and feeding the identical trainer.
4. `B3 FINITE_LEGAL_GRID`: a preregistered small grid over dictionary bytes, train bytes, buffer bytes, compression level, target block size and cache mode applied consistently to B0/B1 and, where semantically valid, B2/candidate. It may not be enlarged after results.

Zstd Cover/FastCover is a direct subtractor and the frozen downstream trainer, not an omitted cost or a weaker comparator. A tiny-instance exact maximum-coverage selector may be used only as an offline ceiling, with all of its compute recorded and never counted as a deployable baseline.

Fairness requires identical manifest, order, SST format, dictionary scope, trainer version/mode, budget cell, deterministic seed, thread count, warm/cold protocol and machine state. The candidate cannot win by changing trainer parameters, block size, compression level, cache policy or dictionary size.

## Collision analysis

### Current-source and paper corrections

- RocksDB's official design establishes per-SST scope, buffered sample gathering, persistence, cache/CDict/DDict implications, recompression measurement, and the three central byte caps. These are all absorbed deployment capabilities.
- Current `block_based_table_builder.cc` obtains `DictSampling`, buffers blocks, then selects blocks by a deterministic prime-stride permutation starting at the midpoint until `max_sample_bytes` is filled. This is the closest same-object implementation baseline and replaces the old “random/uniform 64-byte” current-baseline description.
- Zstd's `ZDICT_trainFromBuffer` routes to FastCover in current upstream API documentation; FastCover scores segments by d-mer frequency and removes already-covered d-mers. The candidate cannot claim the dictionary coverage objective or trainer algorithm.
- Liao et al., WWW 2016, explicitly proposes reservoir-estimated frequent k-mers and local maximum-cover segment selection for RLZ dictionary construction. It is a major methodological/direct-subtractor collision, but not `DIRECT_FATAL`: its exact object is an RLZ dictionary over a collection, not a one-SST online retained training subset followed by unchanged Zstd/FastCover under RocksDB buffering, reader and full-cost semantics.
- Generic coreset/submodular/representative-sampling work is methodological adjacency unless it supplies the same byte-stream information, downstream trainer, per-SST contract, guarantees, and full-cost result. No such exact direct paper was located in the bounded search.

### Nearest-prior facet matrix

| Prior/current source | Exact object | Action | Guarantee/result | Cost scope | Classification and residual |
|---|---|---|---|---|---|
| Current RocksDB per-SST dictionary path | Same standard SST and buffered blocks | Deterministic prime-stride sample gathering; raw or trained dictionary; current cache/persistence paths | Reader-compatible per-file dictionary | Builder/trainer/cache/read integration | `DEPLOYMENT_BASELINE`; candidate must beat it under identical settings |
| Zstd FastCover/Cover | Supplied sample corpus -> dictionary bytes | d-mer-frequency segment selection, parameter search/finalization | Valid Zstd dictionary and training objective | Trainer CPU/memory, not RocksDB streaming selection | `DIRECT_SUBTRACT`; absorbs coverage-at-training, leaves only bounded pre-trainer coreset |
| Liao et al., WWW 2016 | RLZ collection -> fixed dictionary | Reservoir frequent k-mers plus epoch-local maximum coverage | Better RLZ compression on large text collections | Paper omits construction/encoding in reported ratios; different decoder/object | `METHODOLOGICAL_DIRECT_SUBTRACT`, not exact-object fatal |
| RocksDB options/recompression/cache controls | Same deployment | Budget, level, block, cache and measurement choices | Existing configurable tradeoffs | Production system costs | `ROUTINE_TUNING_SUBTRACT`; all enter finite union |
| Generic representative sampling/coresets | Generic sample-selection objectives | Reservoir, facility-location/submodular selection | Objective-specific approximation/representativity | Usually not SST/Zstd full cost | `METHODOLOGICAL_ADJACENT`; implementable same-information variant may be a control |

### Direct-fatal test

No located source covers the same one-SST object, sorted-KV and reader contract, bounded single-pass retained-fragment coreset, unchanged FastCover trainer, current RocksDB prime-stride comparator, end-to-end cost ledger, and claimed p50/p90 Pareto result. Therefore `DIRECT_FATAL=false` and novelty remains `SEARCH_BOUNDED_OPEN`. This is not a priority claim.

### Seed-distance and method-name deletion test

- Relative to current RocksDB, the proposed action changes the data structure that retains trainer-input fragments under the same sample bytes; it is not a new option value.
- Relative to FastCover/LMC, it does not select final dictionary segments. It chooses an online bounded coreset before an unchanged trainer, under a per-SST lifecycle and memory contract.
- Method-name deleted statement: “Maintain, in one pass and bounded memory, a byte-budgeted subset of a fixed SST's observed blocks whose downstream fixed trainer output preserves otherwise omitted reusable patterns.” This remains a definable N2 problem.
- Collapse boundary: if the candidate is expressible as a seed/order/prefix/stratum choice, or its different retained fragments do not cause dictionary actions outside FastCover/current sampling, it is a wrapper and the paper stops.

## Competing mechanism decision

- Selected mechanism A: deterministic bounded d-mer/minimizer sketch plus marginal-coverage-per-byte replacement heap.
- Mandatory competing mechanism B: deterministic key-range-stratified reservoir with identical bytes and trainer. It tests whether key locality, rather than content-aware coverage, explains any gain.
- Current mechanism C: RocksDB midpoint/prime-stride block sampling and the simple selection union.
- Pivot boundary: no mechanism pivot is authorized. A may simplify its data structure while preserving the frozen online coverage invariant, information and object; changing trainer, dictionary scope, object order, codec or objective is a new topic.

## Residual paper kernel and N2 sufficiency

The residual paper kernel is not “better Zstd dictionaries.” It is a bounded online sample-coreset constructor specialized to the RocksDB per-file lifecycle, with an explicit retained-set invariant and a full-cost database evaluation. A Tier-B N2 exists only if all three hold:

1. the constructor has algorithmic substance beyond reservoir/stratification or a finite parameter grid;
2. at least 10% of useful retained actions lie outside the fair union and measurably survive into the trained dictionary or its matches; and
3. the resulting point is non-dominated once every construction, training, memory, SST-byte and read/write cost is charged.

This is narrower than Discovery's wording and sets the claim ceiling. It is nevertheless a coherent algorithm/system paper if successful.

## Evidence route

- Route: `PERFORMANCE` with exact reader/format preservation and mechanism/action tracing.
- Positive result ceiling at Stage A: preliminary support/non-falsification only; not proof of the main claim.

## Q1/Q2 paper shape

- Problem: a current production SST writer must select a limited training corpus before a powerful dictionary trainer, and its fixed traversal can miss heterogeneous repeated structure.
- Contribution: a bounded online retained-fragment data structure, same-object integration, residual-action analysis against FastCover/current sampling, and a precise no-gain boundary.
- Evidence plan: 20+ licensed natural manifests, exact SST equality, finite union, tiny oracle, mechanism attribution, p50/p90 full-cost Pareto, and failure/fallback characterization.
- Expected narrative: current sample-path characterization -> constrained coreset formulation -> algorithm/invariant -> RocksDB integration -> natural full-cost results -> mechanism and limits.

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Contribution-shape gap: the current proposal is narrower and more collision-exposed than top systems anchors; a clearly specified retained-set invariant and generalization across record families are required.
- Evidence-shape gap: no implementation, action trace, natural result, or full-cost ledger currently exists.
- Stage A closure plan: one CPU-only, fixed-commit harness should first test residual action coverage, equality, and full-cost non-dominance. It must not attempt a publication-scale result.

## Non-relaxable quality audit

- Same-object: `PASS_DESIGN`, conditional on freezing production-equivalent bottommost creation context and proving any fixture follows the same path.
- Latest collision: `SEARCH_BOUNDED_OPEN`; current RocksDB source, official design, Zstd FastCover/Cover source/API and its WWW 2016 genealogy were checked. No direct fatal was found.
- Strong fair baselines: `PASS_DESIGN_WITH_CORRECTION`; current prime-stride sampler is mandatory, replacing the stale random-only description.
- Natural input/evidence: `PASS_ROUTE_ONLY`; the 20-manifest licensed/hash plan is finite, but no natural result exists.
- Full-cost: `PASS_DESIGN`; ledger includes all candidate, trainer, SST, write/read/cache and fallback costs.
- Reproducibility: `PASS_ROUTE_ONLY`; public CPU sources and deterministic manifests/seeds make the route credible, but commits, commands and artifacts remain Stage A work.
- Evidence/claim honesty: `PASS`; all gains are conditional hypotheses and the evidence ceiling forbids a result claim.

## Evidence path and AI completion

- AI executability class: `AI_CORE_EXECUTABLE`.
- Estimated `ai_core_fraction`: `0.76`.
- 72-hour first evidence: pin current RocksDB/Zstd commits and production-equivalent SST creation path; freeze 20 manifests and the finite grid; expose B1's selected blocks and the trainer output; implement only A's retained-set constructor; measure residual actions, strict equality and a compact full-cost ledger; stop on the registered killer.
- Human-only items: a storage/database reviewer should audit deployment equivalence, corpus-to-KV mapping neutrality and whether the N2 is sufficiently general. These are review safeguards, not execution blockers.
- Resource blocker: none currently. No GPU or proprietary stack is required.

## Stage A highest-risk probe plan

- Risk-bearing premise: under an identical trainer-input byte cap, natural structured SSTs contain useful fragments omitted by current prime-stride and simple reservoir/stratified controls, and an online coverage structure can retain them cheaply enough to affect the final dictionary and full-cost SST frontier.
- Atomic probe: on the frozen 20-manifest corpus, compare selected-fragment identities and downstream dictionary attribution under A and B0-B3, then apply equality and full-cost checks. This is one coreset-residual certificate, not several independent gates.
- Kill immediately if:
  - useful retained-action coverage outside the complete seeded union is below `10%`;
  - any reader/open/checksum/full-scan/point/range equality check fails;
  - A has no non-dominated p50 and p90 point versus every union member on total SST bytes, end-to-end write/compaction CPU and peak RSS, with the preregistered cold/warm point and range read costs;
  - sketch, replacement or trainer overhead consumes the apparent storage/read benefit; or
  - the result requires changing block size, compression level, trainer, dictionary/train/buffer budget, cache policy or object after observing outcomes.
- Positive-result ceiling: `PRELIMINARY_SUPPORT_ONLY`.

## Stop conditions

- A current primary source is found that covers the exact one-SST object, action, guarantee, full-cost result and main claim.
- The candidate is reducible to a finite settings grid, seed/order choice, reservoir/stratification, current prime-stride sampling, or FastCover itself.
- Natural residual-action coverage is below 10%, or distinct sample bytes do not affect downstream dictionary/matches.
- Any semantic/format equality check fails.
- No p50 and p90 full-cost Pareto point survives the complete frozen union.
- Benefit exists only for synthetic/manually arranged records, a free prepass, changed record order, cross-SST scope or omitted cost.

## Dual-axis score

- Academic value: `49/70`
  - importance `9/12`
  - novelty after current collision subtraction `8/14`
  - mechanism/theory substance `9/14`
  - evaluation and natural-evidence route `11/14`
  - reproducibility/fairness `8/10`
  - venue/paper narrative `4/6`
- AI executability bonus: `23/30`
- Total: `72/100`

The score is independently assigned for ranking and does not relax any scientific gate. Tier B rests on the structural conditional claim, not the score.

## Human reserve and user blocker

- `HUMAN_RESEARCH_RESERVE`: not recommended; the core route is public and CPU-executable.
- `BLOCKED_USER_ACTION_REQUIRED`: not triggered; no mandatory external input is currently missing for Stage A design.

## Primary disposition

`PASS_RECOMMENDED / PENDING_CONFIRMATION`, `TIER_B_Q2_VIABLE`, confidence `0.71`. The confirmation reviewer should specifically challenge the present-current-source correction, the Liao/FastCover method absorption, the bottommost-versus-`SstFileWriter` object boundary, and whether the retained-set residual is sufficiently non-product. No Stage A or Stage B is created or authorized by this report.
