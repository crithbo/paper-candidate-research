# ROCKSDB-DICT-COVER Q1/Q2 Paper Calibration

- Stage: `STAGEA`
- Candidate venue family: storage/database systems and software journals
- Calibration status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Quality tier: structural prior `TIER_B_Q2_VIABLE`; Stage A has no scientific update
- Search/cutoff date: `2026-08-09`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`

## Reference set

| Role | Paper/source | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Dai et al., “From WiscKey to Bourbon” | OSDI 2020 | top systems equivalent | official USENIX paper/artifact page | Stage 0 mechanism/evaluation scope | Calibrates an integrated LSM algorithm and full-system evidence shape; not novelty evidence here |
| EVALUATION_ANCHOR | Zhang et al., “Finesse” | FAST 2019 | top storage equivalent | official USENIX paper page | Stage 0 mechanism and end-to-end evaluation scope | Calibrates feature-based compression mechanism, overhead, ratio, and throughput evidence |
| DOMAIN_NEIGHBOR | Liao et al., “Effective Construction of Relative Lempel-Ziv Dictionaries” | WWW 2016 | refereed method genealogy | official proceedings PDF | method/object/evaluation boundary | Subtracts broad reservoir, k-mer coverage, and dictionary-construction novelty |
| BOUNDARY_OR_NEGATIVE_ANCHOR | RocksDB Preset Dictionary Compression and current `BlockBasedTableBuilder`; pinned Zstd FastCover | official production design/source | implementation authority | pinned upstream sources | per-SST lifecycle, current sample path, trainer and cost boundary | Defines the exact deployment baseline and product-absorption risk |

No reference was upgraded by this run. The blocked preparation produced no paper-quality evidence.

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | Same standard bottommost RocksDB SST with lower fully charged cost | Storage anchors establish relevance | No natural or system result | Structural Tier B prior only |
| Contribution type | Bounded online retained-fragment coreset before unchanged trainer | Anchors require nontrivial mechanism | Constructor not implemented | Open executable gap |
| Nearest-prior delta | Residual only before current FastCover trainer | Current RocksDB/FastCover/Liao absorb broader actions | No residual action observed | `SEARCH_BOUNDED_OPEN`, untested |
| Algorithm/mechanism substance | Frozen sketch/replacement invariant and bounds | Finesse/Liao calibrate mechanism expectations | No implementation/complexity audit | Contract only |
| Baseline strength/fairness | No-dict, raw/current prime-stride, prefix, seeded reservoir, stratified, two-cell legal grid | Official source fixes current path | No comparator run | Frozen design, no evidence |
| Natural workload/platform | 20 official NVD/PyPI manifests | Systems anchors use natural inputs | Acquisition stopped at 2/20 | Resource blocked |
| Full-cost coverage | SST/build/write/RSS/read/cache plus all selection/training/precompute costs | RocksDB design and FAST shape require full cost | No cost measured | Frozen ledger only |
| Main result/statistics | p50+p90 frontier extension | Systems-paper evaluation shape | No SST exists | Missing entirely |
| Ablation/mechanism evidence | >=10% useful residual action through dictionary/match trace | FastCover absorption makes this mandatory | No retained set or dictionary | Missing entirely |
| Scale/generalization | Two structured-record families and no-gain regions | Anchors require breadth | Only two unexecuted inputs prepared | Missing entirely |
| Failure boundary | Equality, action, trainer absorption, frontier, full-cost, and product-collapse killers | Collision structure defines valid negative evidence | Killer not entered | No scientific disposition |
| Artifact/reproducibility | Pinned source/toolchain/converter/inputs/commands/hashes | Public RocksDB/Zstd route | Scientific replay absent | Preparation reproducible; evidence unavailable |

## Reviewer-shape assessment

- Editor/venue-fit view: the independently confirmed narrow Tier-B shape remains conditional; this run supplies no result that strengthens or weakens it.
- Methodology view: the contract is auditable and fail-closed, but 2/20 prepared inputs cannot satisfy the natural-evidence floor and were never executed.
- Domain-contribution view: production bottommost compaction and the unchanged trainer remain mandatory; neither was run on natural data.
- Devil's-advocate view: product absorption remains the dominant scientific risk, but a network truncation cannot test it.

## Decision

- Quality tier: no update to the Stage 0 structural prior `TIER_B_Q2_VIABLE`.
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`, additionally `BLOCKED_USER_ACTION_REQUIRED` for evidence acquisition.
- Closed gaps: frozen input list/converter, exact commits, portable build toolchain, pristine source compilation, and a fully specified unexecuted contract.
- Executable next gaps: every claim-bearing Stage A item after clean data acquisition.
- Human/resource-dependent gaps: byte-complete official input access; later storage-domain parity audit.
- Bounded near-Q1 gaps: not assessable without a valid Stage A result.
- Gap that would invalidate the paper: product absorption, equality failure, action below 10%, trainer erasure, or no p50+p90 full-cost frontier—none evaluated.
- Why this is calibration rather than novelty or baseline evidence: the anchors only specify paper/evaluation shape; this run did not execute the mechanism or union.
- Why Tier B is not newly established here: Tier B is inherited solely as a conditional Stage 0 structural judgment. Resource failure supplies neither positive nor negative scientific evidence.

