# ROCKSDB-DICT-COVER Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: storage/database systems; credible Q2-equivalent target, with FAST/SIGMOD/VLDB-style shape as an aspirational comparison rather than a venue claim
- Calibration status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Quality tier: `TIER_B_Q2_VIABLE`
- Search/cutoff date: `2026-08-09`
- Evidence ceiling: `DESIGN_AND_PRIMARY_SOURCE_AUDIT_ONLY__NO_CLAIM_BEARING_RESULT`

## Reference set

| Role | Paper/source | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Dai et al., “From WiscKey to Bourbon: A Learned Index for Log-Structured Merge Trees” | OSDI 2020, refereed systems conference | top systems-conference equivalent | [USENIX paper and artifact page](https://www.usenix.org/conference/osdi20/presentation/dai) | abstract, contribution, system/evaluation summary, artifact availability | Shows the shape required for a non-trivial algorithm integrated into an optimized LSM: mechanism, cost-benefit policy, natural/synthetic evaluation and production-quality comparison. It is not a novelty baseline for dictionary selection. |
| EVALUATION_ANCHOR | Zhang et al., “Finesse: Fine-Grained Feature Locality based Fast Resemblance Detection for Post-Deduplication Delta Compression” | FAST 2019, refereed storage conference | top storage-conference equivalent | [USENIX paper page](https://www.usenix.org/conference/fast19/presentation/zhang) | abstract, mechanism, baseline and throughput/compression evaluation summary | Calibrates a bounded feature-based storage-compression algorithm whose overhead and end-to-end throughput must be evaluated, rather than reporting compression ratio alone. Different object and method. |
| DOMAIN_NEIGHBOR | Liao et al., “Effective Construction of Relative Lempel-Ziv Dictionaries” | WWW 2016, refereed conference | high-impact algorithm/application paper; method genealogy, not same-object quality proof | [official WWW proceedings PDF](https://archives.iw3c2.org/www2016-Proceedings/proceedings/p807.pdf) | full method/object/baseline/evaluation boundary | Closest methodological collision: reservoir-estimated frequent k-mers plus local maximum-cover segment construction. It sharply subtracts the generic coverage claim and is the genealogy of Cover. |
| DEPLOYMENT_BOUNDARY | RocksDB, “Preset Dictionary Compression” plus current `BlockBasedTableBuilder` | official production design and upstream source | authoritative implementation boundary, not a paper-quality anchor | [design](https://rocksdb.org/blog/2021/05/31/dictionary-compression.html), [source](https://github.com/facebook/rocksdb/blob/main/table/block_based/block_based_table_builder.cc) | per-SST scope, sample/trainer/cache costs, current sampling code | Defines the exact object and strongest deployment baseline. It also corrects the old random-sampling description. |

## Comparator matrix

| Dimension | Candidate if successful | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | Reducing SST space/write/read cost without changing standard RocksDB semantics is relevant to storage/database readers. | Bourbon and Finesse motivate optimized production storage mechanisms and full-system effects. | Dictionary training is narrower and may apply only to small-block structured SSTs. | Tier B plausible; Tier A depends on breadth and effect size. |
| Contribution type | Bounded online retained-fragment coreset before an unchanged trainer. | Bourbon supplies an integrated algorithm; Finesse supplies a bounded feature mechanism. | Must show an invariant/algorithm, not sampling glue. | Conditional pass. |
| Nearest-prior delta | Current prime-stride input selection and FastCover are fixed; residual is online coreset selection under SST lifecycle/budget. | Liao/FastCover already own k-mer coverage for dictionary construction. | Very narrow distance; generic “coverage” language is unavailable. | Highest novelty risk. |
| Algorithm/mechanism substance | Sketch + marginal-coverage-per-byte replacement with bounded state and deterministic fallback. | Finesse demonstrates feature locality and end-to-end benefit; Liao gives a coverage heuristic. | Need complexity, invariants and an ablation against reservoir/stratification. | Credible N2 if residual actions survive. |
| Baseline strength/fairness | No-dict; current raw/trained prime-stride; prefix, seeded reservoir, stratified; finite settings grid; unchanged trainer. | RocksDB source/design define production actions and costs. | No experiment yet; current sampler correction must be implemented exactly. | Design closes fairness; readiness open. |
| Natural workload/platform | 20 licensed/hash-frozen structured-record manifests from >=2 source families, each >=16 data blocks. | Bourbon uses real and synthetic datasets; Liao uses large natural text collections. | Mapping bias and representativeness must be audited. | Finite executable gap. |
| Full-cost coverage | SST bytes plus manifest/build/selection/training/write CPU-RSS/cache/read/fallback. | Finesse reports final system throughput as well as compression quality; RocksDB enumerates buffer/cache/read costs. | Must include production-equivalent compaction context and cold/warm protocols. | Strong planned ledger, no current evidence. |
| Main result/statistics | p50 and p90 non-dominated full-cost point versus every finite-union member. | Top anchors report cross-workload system results. | No result exists; effect size and variance are unknown. | Readiness gap only. |
| Ablation/mechanism evidence | Residual selected fragments, final dictionary attribution/matches, sketch size and replacement decisions. | Liao and Finesse connect feature/coverage choices to outcomes. | Byte-different samples are insufficient if FastCover output is unchanged. | Mandatory Stage A discriminator. |
| Scale/generalization | Multiple record regimes, sizes and at least two natural source families; explicit homogeneous/incompressible no-gain cases. | Anchors characterize several datasets/workloads. | Current corpus is only a plan. | Tier B conditional. |
| Failure boundary | Trainer saturation, homogeneous data, large blocks, memory pressure and overhead dominance. | RocksDB production design documents configuration/cache tradeoffs. | Thresholds must be preregistered. | Clearly definable. |
| Artifact/reproducibility | Pinned public RocksDB/Zstd, deterministic conversions/manifests/seeds, standard reader checks and full command ledger. | Bourbon has an artifact link; RocksDB/Zstd are public. | No candidate artifact or pinned commits yet. | Moderate finite CPU route. |

## Reviewer-shape assessment

- Editor/venue-fit view: a narrow but coherent storage/database paper is possible if the contribution is presented as an online coreset under an SST lifecycle, not “better dictionary training.” It currently fits Tier B more comfortably than a top-tier claim.
- Methodology view: the frozen union and equality/full-cost ledger are adequate in design. The current prime-stride sampler, trainer mode, compaction creation context and all settings must be pinned before measurement.
- Domain-contribution view: using one standard SST and unchanged decoder/format is a strong boundary. The system value depends on showing an end-to-end compaction/read Pareto benefit, not only fewer compressed bytes.
- Devil's-advocate view: FastCover and Liao already perform coverage-based segment selection. A pre-trainer selection stage may merely discard input that the trainer could handle. Unless the bounded retained set changes useful downstream actions cheaply on natural SSTs, this is a wrapper and should stop.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE`
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Closed gaps: exact object and semantics are definable; current deployment and method genealogy are identified; finite strong union, full-cost ledger and natural killer are specified; public CPU execution path exists.
- Executable next gaps: pin commits/context; freeze 20 manifests; implement the current sampler and retained-set tracer; measure residual action, equality and compact full-cost Pareto evidence.
- Human/resource-dependent gaps: only independent storage-domain audit of deployment equivalence and corpus mapping; no mandatory proprietary resource.
- Bounded near-Q1 gaps: breadth across structured record families, an explicit retained-set invariant/complexity result, substantial effect after all cost, and a stronger systems narrative could raise the ceiling.
- Gap that would invalidate the paper: the candidate collapses to FastCover/current sampling/simple reservoir or has no natural p50/p90 full-cost residual.
- Why this is calibration rather than novelty or baseline evidence: the anchors define expected paper/evaluation shape. Novelty and fairness are established separately from current upstream and closest method sources.
- Why Tier B still closes the design gates: same-object, current collision, finite fair baseline, natural-evidence plan, full-cost and reproducibility are all concretely specified. The missing result affects readiness, not conditional potential.
