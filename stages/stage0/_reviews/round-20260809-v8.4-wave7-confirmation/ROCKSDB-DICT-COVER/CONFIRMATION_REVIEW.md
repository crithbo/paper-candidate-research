# ROCKSDB-DICT-COVER Stage 0 Confirmation Review

- Assignment: `STAGE0-C1-20260809-ROCKSDB-DICT-COVER-CONFIRM-V8.4`
- Role: independent `STAGE0-CONFIRMATION-SENTRY`
- Decision: `CONFIRM_PASS`
- Quality tier: `TIER_B_Q2_VIABLE`
- Structural paper potential: `TIER_B_Q2_VIABLE`, conditional on the frozen hypothesis succeeding
- Current evidence readiness: `MODERATE_FINITE_CPU_ROUTE`
- Confidence: `0.72`
- Novelty route: `N2_NEW_ALGORITHM_OR_OPTIMIZATION`
- Evidence ceiling: `DESIGN_SOURCE_AND_COLLISION_AUDIT_ONLY__NO_CLAIM_BEARING_RESULT`
- Direct fatal found: `false`
- Collision status: `SEARCH_BOUNDED_OPEN`
- Stage A authorized: `false`
- Stage B authorized: `false`
- Cutoff: `2026-08-09`

## Independent decision

I confirm the PRIMARY scientific disposition only for the narrow pre-trainer residual. If successful, a deterministic, single-pass, bounded-memory constructor that selects a per-SST retained-fragment coreset under a fixed training-byte cap, then invokes the unchanged pinned Zstd trainer, has a credible Tier-B algorithm/software paper shape. This is not a finding that natural headroom, useful residual actions, or a Pareto gain already exist.

The broad claim is not available. Current RocksDB already supplies the production per-SST dictionary path and a deterministic midpoint/prime-stride traversal over buffered whole blocks up to `max_sample_bytes`. Zstd Cover/FastCover already owns frequency/coverage-based final dictionary construction, while Liao et al. supplies the closest coverage/reservoir genealogy. Prefix, seeded reservoir, deterministic key-range stratification, and a finite legal settings grid are mandatory controls. The candidate therefore survives only if its retained-set constructor makes useful decisions that none of these same-information controls reproduce and those decisions survive the unchanged downstream trainer and full-cost accounting.

No checked primary/current source covers the complete conjunction of: one production-equivalent bottommost-compaction RocksDB `BlockBasedTable` SST; a per-SST finite-train-byte, single-pass bounded-memory pre-trainer coreset; an unchanged pinned Zstd trainer; strict object/reader equivalence; the complete finite fair baseline family; and a p50+p90 full-cost frontier claim. The residual is search-bounded, not a priority assertion.

## Frozen-input integrity

Discovery recomputed 4/4 against its manifest. The registry-listed full hashes agree with disk:

- brief: `AB142932C96A51EE5D1DCA1CF5A9C24DBBB6CD73AD6AB487BAAFAFB055A10247`
- handoff: `D10B56200F32D73FCEEF03CB07BAAADA3F5860C61581D2A796827DC5DCB2B9D5`
- Discovery manifest: `5D94A0BEF7C4C995ED9455C01812E1E46874F3313FB29FADFB9E087B22317AEF`

PRIMARY recomputed 4/4 against its manifest and matches the hashes supplied by mainline:

- report: `1F736E8D8300D46AD23A5493491CAA044FE33F3887059CD3BD9FD590C0655C64`
- Q1 comparator: `270B5B8AFEBE02B5BC07E7008CF298B0C4CA10142CE144E22EC3043F7AE73EB2`
- source audit: `0AF96705D5ECB3CCFB723D00DAFA69D0791949C0D61B9655B55EC91BCB51DC98`
- handoff: `B059E6045E02A3CEA11CF822B343D6558E5D90651F2C23C995D39CE6AE0E39B0`
- PRIMARY manifest: `62F3D0D8427E877A76FFEE56D1CC77CE8B94DB8D08502B2B6DDF0367A459E8B4`

No provenance conflict was found. This confirms input identity only and contributes no positive scientific evidence.

## Exact-object audit and object-drift boundary

The paper object is one standard `BlockBasedTable` SST produced through a production-equivalent bottommost-compaction creation context from one fixed sorted key-value manifest. A comparison cell must freeze RocksDB and Zstd revisions, build flags, comparator and internal-key treatment, table/checksum/index/filter formats, block and file sizing, compression type/level, dictionary sizes and training/buffer caps, cache state, creation reason, level, compaction style, and bottommost status.

An unqualified `SstFileWriter` is not the same object. Current builder source assigns external SST construction `TableFileCreationReason::kMisc`; that context omits ordinary in-LSM level/bottommost fields, and the context is passed to `CompressionManager::GetCompressorForSST` before dictionary guidance is obtained. The fact that an external SST may later be ingested at a bottom level does not retroactively make its construction context identical to a bottommost compaction.

`SstFileWriter` may be used only as a fixture after a mechanical parity check shows that it selects the identical compressor, `DictGuidance`, buffered block bytes, sample cap, trainer call, serialized dictionary path, table properties, and read/checksum behavior as the frozen production object. Otherwise its evidence ceiling is fixture-only and cannot support the deployment claim. This condition does not make Stage 0 fail: the production compaction path is public, finite, and directly executable on CPU.

## Strongest finite fair baseline

The union is a finite set of individually realizable, same-information configurations. Every candidate point must be compared within the same frozen option/budget cell against:

1. no dictionary;
2. current RocksDB raw-dictionary mode;
3. current RocksDB trained mode with the exact midpoint/prime-stride whole-block traversal and the identical sample-byte cap and trainer;
4. first-prefix selection;
5. preregistered seeded uniform byte and whole-block reservoirs;
6. deterministic key-range-stratified selection;
7. every legal point in the frozen finite grid for dictionary size, training bytes, dictionary-buffer bytes, block/file settings, compression level, and Cover/FastCover choice.

“Beat the union” means beat every applicable member as an independently runnable comparator. It does not mean combine incompatible options into a fictional super-system. The candidate receives no extra information, training bytes, buffering, passes, or hidden offline search. All selectors feed the same pinned trainer within a cell. A tiny exact maximum-coverage solver is an offline ceiling only and is excluded from the deployable union.

## Collision decision

| Collision class | Independent finding | Consequence |
|---|---|---|
| `DIRECT_FATAL` | None found for the full frozen object, decision layer, guarantees, and full-cost claim | Does not stop Stage 0 |
| `DIRECT_SUBTRACT` | Current RocksDB per-SST path and midpoint/prime-stride sampling; Zstd Cover/FastCover final dictionary construction | Per-SST integration, current sampling, coverage objective, and trainer construction are unavailable as novelty |
| `METHODOLOGICAL_DIRECT_SUBTRACT` | Liao et al. WWW 2016 reservoir-estimated frequent k-mers and local maximum-cover dictionary construction | Generic representative sampling, k-mer coverage, and redundancy-removal claims are unavailable |
| `METHODOLOGICAL_ADJACENT` | Reservoir/stratified sampling and storage resemblance/delta methods | Mandatory controls or paper-shape comparators, not the residual claim |
| `DEPLOYMENT_COLLISION` | `SstFileWriter` follows an external-file creation context unless parity is demonstrated | Fixture evidence cannot silently support the bottommost-compaction claim |
| `PRODUCT_ABSORPTION_RISK` | A seed/order/prefix/stratum selector followed by unchanged FastCover | Stop if the mechanism reduces to this composition |
| `SEARCH_BOUNDED_OPEN` | Bounded online retained-fragment coreset before the unchanged trainer under the exact SST lifecycle | The only retained conditional residual |

The strongest counterargument is product absorption: upstream already chooses a bounded sample sequence and FastCover already optimizes coverage inside the supplied samples. If the candidate merely reorders blocks, changes a seed, stratifies key ranges, tunes the finite grid, or causes different retained bytes without distinct downstream dictionary/match actions, there is no N2.

## Structural paper potential

If the narrow hypothesis succeeds, a Tier-B paper can contribute: a clearly specified bounded streaming retained-set algorithm; state/time bounds and deterministic fallback; integration at the exact per-SST lifecycle point; a residual-action certificate against every finite-union member; strict SST equivalence; natural workload evidence; a full-cost p50+p90 frontier; and explicit no-gain regions.

Tier A is not justified by current structure. The object is narrow and the novelty distance to current sampling plus FastCover/Liao is small. A stronger tier would require a broader principle or guarantee and materially wider evidence, not merely larger RocksDB numbers.

## Current readiness and AI route

Readiness is moderate. RocksDB, Zstd, the production compaction path, validators, and candidate instrumentation are public and CPU-executable; natural sorted KV manifests can be frozen. Missing implementation, results, proof, or measured headroom are Stage A/later research gaps and are not Stage-0 STOP reasons.

AI executability is `AI_CORE_EXECUTABLE_WITH_HUMAN_SEMANTIC_AUDIT`, estimated at `0.72-0.78`. Human review is most important for checking production/fixture parity, fair option cells, and publication-level novelty language. Those checks do not make the computational evidence route indefinite.

## Finite Stage A killer assessment

The acceptable highest-risk probe is one preregistered finite acceptance predicate over at least 20 pinned natural manifests, each with enough blocks for a nontrivial capped selection:

`K = production-object/fixture parity AND strict SST equality AND useful residual retained action >= 10% AND downstream dictionary/match effect AND a claim-bearing full-cost point outside every applicable baseline frontier at both p50 and p90.`

“Useful residual retained action” cannot mean byte-set difference alone. The denominator and tracing rule must be frozen; an action counts only when a candidate-retained fragment is absent from the corresponding current/simple selectors and makes a traceable unique contribution to the final dictionary, match use, or marginal compressed bytes under the unchanged trainer. The test must separately report the raw retained-set difference to expose trainer absorption.

Full cost includes output SST bytes and dictionary meta-block bytes, builder/trainer/compression CPU, peak RSS, buffered and retained bytes, temporary I/O, precompute/sketch/update/optimization cost, decompression/point/range-read cost, and cache/CDict/DDict effects. A point does not bear the claim merely because unbounded CPU or memory makes it technically nondominated; it must extend a preregistered equal-quality frontier within a fixed resource envelope at both p50 and p90.

A positive probe is preliminary support/non-falsification only. It does not establish the main claim. Stop without object or mechanism pivot if parity/equality fails, useful residual action is below 10%, FastCover erases the retained-set delta, no full-cost p50+p90 frontier extension remains, overhead removes the gain, or the mechanism collapses to current sampling, reservoir/stratification, finite-grid tuning, Cover/FastCover, a policy selector, or a wrapper.

## Permission boundary

`CONFIRM_PASS` is a conditional paper-potential judgment, not a result PASS. It does not authorize Stage A, Stage B, an experiment, or a project directory. Mainline acceptance remains required.

Lane return after delivery: `IDLE_REUSABLE_AWAITING_MAINLINE`.
