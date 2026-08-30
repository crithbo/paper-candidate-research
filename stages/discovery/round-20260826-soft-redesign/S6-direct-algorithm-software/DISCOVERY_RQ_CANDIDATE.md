# S6-RD-RQ01 — RocksDB native multi-SST dictionary portfolio

## Identity

- RQ candidate ID: `S6-RD-RQ01`
- Discovery lane / assignment: `DISCOVERY_S6 / DISCOVERY-S6-20260826-ROCKSDB-MULTISST-DICT-TRACE-REDESIGN`
- Divergence seed path: `DIVERGENCE_SEED_POOL.md` (`S6-RD-S01 + S6-RD-S06`, with S04/S05 as validity components)
- Tentative public object: current upstream RocksDB standard BlockBasedTable SST construction and Zstd dictionary-compression path.
- Exact public anchor candidate: current official RocksDB source at the main-branch commit frozen during source closure.
- Stable object and immutable guarantee envelope: the exact 20-manifest logical dataset encoded without record duplication, padding, synthesis, exclusion, or result-aware backfill as one legal native standard RocksDB multi-SST collection with 4096-byte data blocks; unchanged ordered KV contents, checksums, reader semantics, ZDICT trainer and Zstd codec semantics.
- Decision-relevant consequence: whether a compaction/table-building implementation should use current independent per-SST dictionary training or a bounded collection-level dictionary portfolio and per-SST assignment.
- Contribution type hypothesis: `METHOD_ALGORITHM / N2`.

## Primary research question

Can a result-independent, native multi-SST dictionary-portfolio algorithm—using a collection-wide retained-fragment budget, bounded dictionary construction, and per-SST assignment—produce a full-cost Pareto residual over current RocksDB per-SST training and equally budgeted global/simple/generic baselines on the exact 20-manifest, 4096-byte-block denominator, while a content-addressed selector-to-final-dictionary-to-compressed-block trace verifies the claimed coverage mechanism?

No alternative RQ is frozen. Temporal dictionary lineage, online reuse, changed block sizes, changed manifest membership, and reader/format changes are out of scope.

## Scope and answerability

- Exact phenomenon: cross-SST heterogeneity may make one-global and independent-per-SST dictionaries suboptimal after dictionary bytes, training/selection, compaction, and reader costs are included.
- Decision variables: fragment retention across SSTs, number of dictionaries within a frozen bound, dictionary construction/assignment, and per-SST chosen dictionary.
- In scope: result-independent native shard/compaction construction; static collection-level portfolio; same format/reader semantics; causal mechanism trace; full-cost evaluation.
- Out of scope: record transformation, duplication, padding, manifest exclusion/backfill, block-size changes, custom SST format or reader, candidate implementation/experiment during Discovery, standalone sharding or telemetry.
- Minimum public carrier/oracle route: current official RocksDB source/docs plus a finite Stage A small multi-SST witness using native BlockBasedTable generation/reader and an assignment-local exact trace.
- Earliest falsifiers:
  1. current upstream already exposes the same collection-level portfolio/action and trace endpoint;
  2. a legal native multi-SST construction cannot preserve the frozen dataset/semantics without forbidden transformations;
  3. dictionary-to-block mechanism trace requires public format/reader changes rather than assignment-local builder instrumentation;
  4. after a fair finite configuration grid, the residual reduces to generic clustering/sampling or a wrapper;
  5. no 72-hour small-witness route can distinguish portfolio assignment from current/simple baselines.

## FINER-lite scheduling assessment

- Feasible: `CONDITIONAL` — source/API legality and trace loci must first close; no candidate run is required for Discovery.
- Interesting: `CLEAR` — the answer changes dictionary policy at compaction/table-build time and can reduce storage/CPU costs for heterogeneous SST cohorts.
- Novelty threat: `HIGH` — generic dictionary selection, clustering/facility-location, Zstd dictionary training, and possible hidden RocksDB reuse/configuration paths are strong subtractors.
- Ethical/scope fit: `PASS`.
- Relevant: `CONDITIONAL` — publishability requires a target-specific portfolio algorithm and broad/full-cost evidence, not just a RocksDB patch.

## Pre-evidence selection

- Selected for evidence lookup: `YES`
- Selection reason: only this RQ jointly preserves the new five-field identity, old-failure boundary, target-native action, full-cost endpoint, and a mechanism-specific falsifier.
- Alternative/null: current independent per-SST training, one global dictionary, or generic equally budgeted clustering already spans the useful action space.
- Precommitted primary evidence route: official current RocksDB main source/docs/options/tests/issues; official Zstd dictionary API semantics; primary papers/artifacts on multi-dictionary selection, LSM/SST compression, and full-cost storage compression.
- Transport-only fallback: the accepted pinned RocksDB/Zstd source from resume6 may establish a dated implementation locus but may not prove current absence; official HTML/raw mirrors are acceptable only for the same current identity.
- Forbidden outcome-aware reformulation: no changing 20 manifests, 4096-byte blocks, data membership, codec/reader semantics, denominator, baselines, or endpoint after evidence is seen.

## Pre-RQ closure nomination

- Nomination: `ORDINARY_CLOSURE`
- Exact anchor and stable object/guarantee frozen: `YES`
- Co-defined bundle: current builder/trainer/trace loci and whether the target action is absent, directly covered, or only implementable through a finite new algorithm.
- Known direct fatal before lookup: `NO_KNOWN_FATAL`
- Finite stop condition: one current official source snapshot plus bounded ANCHOR/CURRENT/CONTRARY/ESCAPE searches; stop on direct fatal, generic-only residual, or closed finite fidelity route.
- Requested model route: `TERRA_HIGH_ORDINARY`; strong-model packets `0` by assignment.

## Disposition

`RQ_READY_FOR_ORDINARY_CLOSURE`

This card authorizes only bounded source closure after MAINLINE START. It is not raw admission, novelty evidence, a brief, or a Stage 0 action.
