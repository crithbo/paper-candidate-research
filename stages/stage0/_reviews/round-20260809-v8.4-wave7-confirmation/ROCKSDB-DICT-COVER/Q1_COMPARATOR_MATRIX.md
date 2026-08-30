# ROCKSDB-DICT-COVER Q1/Q2 Paper Calibration

- Stage: `INDEPENDENT_REVIEW`
- Candidate venue family: storage/database systems and software journals
- Calibration status: `PARITY_PLAUSIBLE`
- Quality tier: `TIER_B_Q2_VIABLE`
- Search/cutoff date: `2026-08-09`

## Reference set

| Role | Paper/source | Venue/status | Basis | Read scope | Why selected |
|---|---|---|---|---|---|
| `CONTRIBUTION_SHAPE_ANCHOR` | Dai et al., “From WiscKey to Bourbon: A Learned Index for Log-Structured Merge Trees” | OSDI 2020 | top systems venue | official paper page, mechanism and evaluation shape | Demonstrates that an LSM mechanism needs a nontrivial algorithm, cost-benefit account, natural/synthetic workloads, and production-quality comparison; not a dictionary-selection novelty baseline |
| `EVALUATION_ANCHOR` | Zhang et al., “Finesse: Fine-Grained Feature Locality based Fast Resemblance Detection for Post-Deduplication Delta Compression” | FAST 2019 | top storage venue | official paper page, mechanism and end-to-end evaluation | Calibrates feature/locality algorithms against compression ratio, overhead, and throughput; different exact object |
| `DOMAIN_NEIGHBOR_AND_SUBTRACTOR` | Liao et al., “Effective Construction of Relative Lempel-Ziv Dictionaries” | WWW 2016 | refereed algorithm/application paper | paper method, object, and evaluation boundary | Closest methodological collision: reservoir-estimated frequent k-mers and local maximum-cover segments; removes broad coverage/reservoir novelty |
| `DEPLOYMENT_BOUNDARY` | RocksDB “Preset Dictionary Compression” plus current `BlockBasedTableBuilder` | official production design and source | implementation authority | per-SST lifecycle, sample/trainer/cache costs, current sampling and creation context | Defines the same object and strongest deployment baseline; corrects stale random-sampling prose |

## Comparator matrix

| Dimension | Candidate if successful | Anchor evidence | Remaining gap | Disposition |
|---|---|---|---|---|
| Problem importance/readership | Reduce standard RocksDB bottommost-SST space/cost without semantic change | Bourbon/Finesse show storage relevance | Per-SST dictionary sampling is narrower | Tier B plausible |
| Contribution type | Bounded online retained-fragment constructor before unchanged trainer | Liao/FastCover own coverage-based dictionary construction | Must stay at pre-trainer coreset layer | Narrow N2 only |
| Nearest-prior delta | Current prime-stride and simple selectors fail to retain some useful fragments under cap | Current RocksDB, FastCover, Liao | Natural residual is unobserved | Stage A risk premise |
| Algorithmic substance | Streaming state, replacement rule, bounds/invariants, deterministic fallback | Finesse and Liao show nontrivial mechanism expectations | Could collapse to sampling wrapper | Fatal if product collapse occurs |
| Baseline strength | Every applicable current/simple/legal finite-grid member under same information and cap | Official source/design | Must avoid fictional incompatible union | Design passes with caveat |
| Natural workload | At least 20 pinned natural sorted-KV manifests yielding nontrivial SSTs | Systems anchors use natural workloads | Corpus not yet frozen/run | Readiness gap only |
| Full cost | SST+dictionary bytes, CPU, RSS, buffering, temporary I/O, preprocessing, reads and caches at p50+p90 | RocksDB design and Finesse evaluation | No result exists | Later evidence requirement |
| Main result/statistics | Frontier extension at both p50 and p90 within frozen budgets | Systems-paper evaluation shape | No measured result | Not required for Stage-0 potential |
| Mechanism evidence | At least 10% useful residual action that survives the trainer | FastCover absorption is explicit | Raw retained-set difference is insufficient | Finite falsifier |
| Scale/generalization | Multiple natural regimes and explicit no-gain boundary | Bourbon/Finesse breadth | Narrow object limits Tier A | Tier B ceiling |
| Failure boundary | Homogeneous SSTs, cap too large/small, trainer absorption, overhead dominance | Required by collision structure | Must be preregistered | Paper-bearing if honest |
| Reproducibility | Pinned source/options/manifests/seeds plus strict readers and cost scripts | Public RocksDB/Zstd | Artifacts do not yet exist | Finite route |

## Reviewer-shape assessment

- Editor/venue-fit view: a focused storage/database software paper is plausible if the mechanism and end-to-end frontier both survive; the scope is too narrow for a Tier-A presumption.
- Methodology view: the finite union, strict equality, useful-action trace, and p50+p90 full-cost ledger can support a credible evaluation.
- Domain-contribution view: the contribution must be the bounded pre-trainer constructor under the RocksDB per-SST lifecycle, not a new dictionary trainer or a generic compression claim.
- Devil's-advocate view: this is probably upstream prime-stride or reservoir/stratification followed by FastCover under a new name. The useful-action and full-cost killer is the correct way to falsify that concern.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE`
- Status: `PARITY_PLAUSIBLE`
- Closed gaps: exact object is definable; current same-object baseline is corrected; coverage/reservoir genealogy is subtracted; finite evidence route exists.
- Executable next gaps: fixture parity, natural residual-action incidence, algorithm-versus-selector ablation, p50+p90 full-cost frontier.
- Human/resource-dependent gaps: semantic audit of production equivalence and final publication-positioning review; no proprietary resource is required.
- Bounded near-Q1 gaps: breadth and theoretical generality remain limited.
- Gap that would invalidate the paper: product absorption by current/simple sampling plus unchanged FastCover, or absence of useful residual/full-cost frontier extension.
- Why this is calibration rather than novelty evidence: the anchors define contribution/evaluation shape; novelty is separately bounded by current source and the collision matrix.
- Why Tier B still closes the design gates: same object, latest collision set, finite fair baselines, natural evidence route, full-cost ledger, and public reproducibility path are all definable; their empirical truth remains later research.
