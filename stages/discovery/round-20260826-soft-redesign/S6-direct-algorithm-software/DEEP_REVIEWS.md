# Candidate-grade deep review — one opportunity family

## Opportunity family

- Family ID: `OF-ROCKSDB-NATIVE-MULTISST-DICT-PORTFOLIO`
- Contribution contract: `METHOD_ALGORITHM / N2`
- Candidate working description: a costed native portfolio-coreset solver for RocksDB multi-SST dictionary compression.
- Evidence state: `EVIDENCE_QUALIFIED_RAW → C0/D1 deep review`

## Atomic algorithm skeleton

The proposed action is not “enable multiple dictionaries.” It is a bounded solver over a precommitted legal collection:

1. Before compression results, construct native SST boundaries from the exact 20-manifest dataset using fixed key-order/size rules; preserve every record exactly once.
2. Stream each SST’s uncompressed 4096-byte data blocks through deterministic sketches and a content-addressed fragment reservoir under one global sample-byte budget.
3. Initialize baseline solutions explicitly: no dictionary, one collection-global dictionary, current independent per-SST dictionaries, and a fixed historical-style shared-one dictionary.
4. Create at most `K` portfolio dictionaries by repeatedly choosing the currently worst-covered SST group, training with unchanged ZDICT on its budgeted coreset, and retaining only an objective-improving facility.
5. Assign each SST to no dictionary or one portfolio dictionary using held-out block probes. The objective includes compressed bytes, the dictionary meta-block duplicated in every assigned SST, training/selection CPU and memory, temporary I/O, and reader costs.
6. Alternate bounded assignment/coreset replacement only when the complete empirical objective monotonically decreases; retain the best initialized baseline so the solver cannot report a worse empirical solution as a win.
7. Emit a content-addressed audit trace: retained fragment IDs and SST provenance, exact final serialized dictionary bytes/ID, dictionary-offset matches used by each compressed block, and final per-SST assignment.

This skeleton is a falsifiable proposal, not an implemented or proven result. Stage 0 must decide whether the objective/solver is a real target-specific increment beyond generic compression segmentation.

## Strong comparison set

1. `B0`: current Zstd without dictionary.
2. `B1`: current RocksDB per-file ZDICT training with exact current sampling/truncation semantics.
3. `B2`: one global dictionary trained from the collection and embedded in every SST.
4. `B3`: historical-style one dictionary derived from a precommitted first/native cohort and reused across later SSTs.
5. `B4`: equal global training-byte budget divided across independent per-SST dictionaries.
6. `B5`: generic k-medoids/facility-location or DCC-style compression segmentation using the same candidate dictionaries and held-out compression matrix.
7. `B6`: tiny offline exhaustive oracle over candidate dictionaries/assignments for the small witness.

All baselines use identical records, 4096-byte blocks, codec level, reader, checksums and full-cost measurement. A candidate that does not beat `B5` in algorithmic structure or a relevant cost/quality dimension collapses.

## Collision matrix

| Prior/current union | Same object | Atomic action | Guarantee/cost | Classification |
|---|---|---|---|---|
| Current RocksDB per-file builder | partial | no portfolio/assignment | same format/reader; narrower cost | `DEPLOYMENT_BASELINE` |
| Historical RocksDB subcompaction reuse | partial multi-output | one shared dictionary only | same file-local dictionary storage | `DIRECT_SUBTRACT` |
| Zstd ZDICT/CDict/cover/fastCover | codec primitive | training/reuse, no target assignment solver | codec semantics only | `DEPLOYMENT_BASELINE` |
| Mitzenmacher DCC’01 | abstractly yes | k dictionaries + assignment; NP-hard | no RocksDB/native/full-cost/trace constraints | `DIRECT_SUBTRACT / GENERIC_KERNEL` |
| Pibiri–Petri–Moffat WSDM’19 | different integer-index object | dictionary suites + per-block selector | different codec/guarantee | `METHODOLOGICAL_ADJACENT` |
| Cross-entity delta/shared dictionary | different web object | dictionary candidate selection and deployment cost | client-cache/deployment constraints | `METHODOLOGICAL_ADJACENT` |

No checked source covers all candidate predicates. The generic core is heavily subtracted; novelty can rest only on the constrained solver and its evidence contract.

## Anti-collapse tests

- Method-name deletion: PASS — the problem remains “jointly allocate a global training budget, choose a bounded model family, assign one model per immutable storage object, charge replicated model bytes and construction/reader costs, and expose causal use.”
- Generic-wrapper test: CONDITIONAL PASS — fails unless the solver consumes RocksDB-specific duplicated meta-block, compaction-order/buffer, reader/cache and exact trace constraints, and beats/extends `B5`.
- Same-object test: PASS for the new ID; the old one-SST-per-manifest object is not reused.
- Natural/canonical carrier: PASS AS ROUTE — exact 20 public manifests exist; no result is inherited.
- Current-upstream reality: PASS bounded — per-file path and options checked; no full action found.
- Full-cost: PASS AS CONTRACT, no measurements yet.
- Fidelity: finite but nontrivial; trace requires assignment-local Zstd/RocksDB instrumentation without public format/reader change.

## Mechanism predictions and no-gain region

- Prediction P1: an intermediate portfolio helps only when SST-level repetition regimes are heterogeneous but shared across subsets.
- Prediction P2: global sample-budget allocation should move bytes toward SST groups whose marginal dictionary-match coverage is highest, not simply the largest SSTs.
- Prediction P3: trace-confirmed dictionary-match bytes, not selector counters alone, should explain compression residual.
- No-gain: homogeneous collections favor one global dictionary; large self-sufficient SSTs favor current per-file training; tiny/unstable cohorts lose to dictionary bytes/training/selection; reader-memory pressure can eliminate storage gains.

## 72-hour Stage A falsifier plan

1. Static source/API design and exact trace schema; fail if current interfaces cannot keep format/reader semantics.
2. Implement only a tiny 4–8-SST witness, generic `B5`, and offline `B6`; no natural corpus until preclaim passes.
3. Verify every record exactly once, 4096-byte blocks, full scan/point/range/checksum equality.
4. Require exact final dictionary bytes/IDs and dictionary-offset match trace per compressed block.
5. Stop if candidate equals generic `B5`, oracle gap is unbounded on tiny cases, or any strong baseline dominates full cost.

## Quality hypothesis

- Q2 shape: plausible if the target-specific solver, monotone/baseline-safe property, native implementation and natural full-cost evaluation all survive.
- Q1 potential: conditional on broader workloads/versions, a clearer approximation/complexity result or strong general systems mechanism, and substantial reproducible evidence.
- Principal fatal risk: after subtraction, the solver may be ordinary compression segmentation/facility location with RocksDB-specific bookkeeping.

## Deep disposition

`READY_FOR_CANONICAL_BRIEF__HIGH_COLLISION_RISK__INDEPENDENT_STAGE0_REQUIRED`
