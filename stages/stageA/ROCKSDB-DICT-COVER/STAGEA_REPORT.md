# ROCKSDB-DICT-COVER Stage A Report

- Lane id: `CANDIDATE-EXECUTION-LANE-1`
- Assignment id: `STAGEA-L1-20260809-ROCKSDB-DICT-COVER-INITIAL`
- Input freeze SHA-256: Discovery brief `AB142932C96A51EE5D1DCA1CF5A9C24DBBB6CD73AD6AB487BAAFAFB055A10247`; PRIMARY report `1F736E8D8300D46AD23A5493491CAA044FE33F3887059CD3BD9FD590C0655C64`; confirmation report `37FB719AF48BCCC46BAB1E5DA2F7E49D6CFB8CD10107783FE24B788CC4EE3015`; confirmation handoff `91EB4863468AEB44ED572F78F018B7AFF860851FE02E1C2372C1EEB075ABEEC9`; confirmation manifest `3442211ADEEE46E35015704406D7928AF82FB44023D039D1A8A961EF4F0C4F68`.
- Cross-assignment contamination declaration: `false`. Only the registry-listed Discovery, PRIMARY, and confirmation packages were read; no queued or unrelated candidate evidence was read or reused.
- Decision: `BLOCKED_USER_ACTION_REQUIRED`
- Quality tier: structural prior remains `TIER_B_Q2_VIABLE`; no Stage A evidence updates it.
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Novelty route: `N2`
- Stage semantics: the Stage A scientific pilot did not begin; preparation failed before the first claim-bearing observation.
- Scientific revision consumed: `no`
- Stage B: `false`; `stageb_user_approval_id=null`

## Frozen contract

The unexecuted contract is in `EXPERIMENT_CONTRACT.yaml`. It freezes the exact production object as a standard one-file bottommost-compaction `BlockBasedTable` SST built from each byte-frozen sorted KV manifest. It excludes `SstFileWriter` from claim-bearing use, pins RocksDB `1dfa7297933df05237ac11376d6cb69d32591b1d`, Zstd `82d322c4973d9e2968d94047a40892bc6d9a9bdf`, a two-cell legal byte-budget grid, the complete individually runnable comparator union, the candidate's single-pass bounded-memory retained-fragment rule, strict equality, full cost, and the p50+p90 killer.

The natural corpus was preregistered as 20 independent public manifests from two official structured-record families: NVD annual CVE JSON 2.0 feeds for 2015–2024 and PyPI JSON metadata for ten named packages. The converter and source list were hashed before acquisition. No workload was changed after observing outcomes because no scientific outcome exists.

## Headroom or theoretical gap

Not measured. Stage 0's hypothesis—that capped current sampling may omit reusable regimes before FastCover—remains an unverified hypothesis. The two successfully converted NVD manifests were never passed to RocksDB, a selector, or a trainer and therefore provide no headroom evidence.

## Minimal mechanism and strongest baselines

Not implemented or executed. The contract retains only a deterministic content-aware streaming coreset with fixed sketch/fragment/replacement rules and the unchanged trainer. It freezes individual comparisons against no-dict, current raw and trained midpoint+prime-stride whole-block selection, prefix, fixed-seed whole-block reservoir, deterministic eight-way key-range stratification, and both legal grid cells. No incompatible “universal baseline” is constructed.

## Natural workload and mechanism-specific prediction

- Required: 20 frozen manifests, two source families, each yielding at least 16 data blocks.
- Completed before failure: `nvd-2015` (996 records) and `nvd-2016` (954 records), both unexecuted.
- Blocked at: `nvd-2017`, 19,594 bytes short of the GET `Content-Length`.
- Prediction status: untested.

## Highest-risk probe result

- Risk-bearing premise: candidate-only retained fragments must survive the unchanged trainer into a useful dictionary/match effect, exceed the registered 10% action floor, preserve the production SST contract, and extend the full-cost frontier at both p50 and p90.
- Probe/counterexample-search scope: not entered.
- Negative-result meaning: none; a truncated download is not scientific evidence.
- Positive-result ceiling: `PRELIMINARY_SUPPORT`; no positive result exists.

## Directional increment

- Performance/quality/Pareto/complexity effect: not measured.
- Why it is not ordinary tuning or a weak-baseline artifact: not evaluated. The contract would require a residual action outside every frozen selector and grid member, but that predicate was not run.

## Performance evidence chain, if applicable

- Algorithm/data-structure change: specified but not implemented.
- Intermediate mechanism metric: not observed.
- End-to-end effect: not observed.
- Full-cost result: not observed.
- Generality region: not observed.
- No-gain or regression region: not observed.

No scientific evidence-chain link was executed. The only completed engineering fact is that the pinned pristine source builds with the pinned Zstd library; it does not support the candidate.

## Current critical-cost analysis

The contract charges acquisition/conversion, existing block buffering, every selector hash/sketch/lookup/heap/copy operation, retained bytes, training, compression, end-to-end build/write CPU, peak working set, all SST bytes, temporary I/O, reader verification, cold/warm scans, point/range reads, and cache/CDict/DDict effects. It forbids an uncalibrated work-to-byte conversion. None of these costs was measured.

Workspace at blocker capture was `1,286,089,846` bytes, below the 4 GiB cap. Pinned Zstd and pristine RocksDB compiled successfully with two build jobs; no GPU or exclusive device was used. Host peak RAM was unavailable and is not invented.

## AI execution ledger

- AI executability class: `NOT_MEASURED_DUE_PRECLAIM_RESOURCE_FAILURE`; Stage 0 prior was `AI_CORE_EXECUTABLE_WITH_HUMAN_SEMANTIC_AUDIT`.
- Measured ai_core_fraction: `null`.
- Reproducible commands/artifacts: `COMMAND_LOG.md`, `scripts/prepare_manifests.py`, pinned source commits, verified portable tool archives, pristine build hashes, and partial input hashes.
- Human-only items: restoring or supplying complete frozen official assets; later independent storage-domain audit remains outside this blocked run.

## Mechanism pivot, if used

None. No mechanism implementation or scientific revision occurred.

## Literature collision update

No new novelty search was needed or performed. The frozen source-bounded position remains: current RocksDB midpoint+prime-stride sampling, raw/trained per-SST dictionaries, Zstd Cover/FastCover, Liao et al. 2016, prefix/reservoir/stratification, and the finite legal grid are subtractors or controls. The narrow pre-trainer coreset residual remains `SEARCH_BOUNDED_OPEN`; this blocked run adds no priority or novelty evidence.

## Stage B minimal prototype

Not applicable while blocked. The unexecuted Stage A contract must first resume and reach a valid same-object observation. Stage B remains forbidden.

- Primary workload: the 20 frozen Stage A manifests, only after clean acquisition and hashing.
- Required orthogonal validation: not authorized or designed beyond the frozen Stage A gate.
- Candidate Q1 venue family: storage/database systems and software journals.

## Q1/Q2 evidence-gap review

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Updated reference set: unchanged from the independently confirmed Stage 0 set.
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`, currently interrupted by a resource blocker.
- Evidence already comparable: exact object, current source correction, method absorption, finite union, and a reproducible contract design only.
- Executable Stage B gaps: not reachable; all Stage A claim-bearing evidence is still missing.
- Human/resource-dependent gaps: complete official input acquisition and later semantic audit.

## Non-relaxable quality audit

- Same-object: frozen in contract; not executed.
- Latest collision: inherited bounded primary-source audit; no Stage A update.
- Strong fair baselines: individually frozen; not executed.
- Natural input/evidence: failed closed at 2/20 prepared manifests; no natural claim evidence.
- Full-cost: frozen; not measured.
- Reproducibility: preparation artifacts and hashes retained; scientific replay not reached.
- Evidence/claim honesty: `PASS`; no performance, mechanism, equality, STOP, reserve, or support claim is inferred.

## Supported and unsupported claims

Supported only as engineering/provenance facts:

- the required upstream packages match their manifests;
- the pinned source commits were acquired;
- the pinned pristine build completes on the recorded portable toolchain;
- input acquisition truncated at the exact recorded byte count before scientific execution.

Unsupported:

- natural headroom;
- candidate action difference or useful residual action;
- dictionary or match effect;
- semantic equality;
- compression, build/write, memory, SST-byte, read, or frontier benefit;
- PASS, STOP, reserve, main claim, generality, or publication readiness.

## Mandatory user gate before Stage B

- Independent Stage A gate decision: not requested while resource-blocked.
- User-facing evidence packet: `USER_REVIEW_PACKET.md` and `USER_BLOCKER_PACKET.md`.
- `PENDING_USER_STAGEB_REVIEW`: no
- Stage B user approval id/time: `null`
- Stage B authorized: `false`

## Human research reserve, if applicable

Not applicable. A transient data/network failure is not a reason for human reserve.

## User-action blocker, if applicable

- Claim-bearing observation obtained before failure: `no`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Scientific revision consumed: `no`
- Immutable failure directory: `<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\ROCKSDB-DICT-COVER`
- Resume directory and frozen contract: a new mainline-issued `resume1` (or later clean resume directory) using `EXPERIMENT_CONTRACT.yaml`; do not overwrite this package.
- Blocker packet: `USER_BLOCKER_PACKET.md`

Lane recommendation after delivery: `IDLE_REUSABLE_AWAITING_MAINLINE`.

