# ROCKSDB-MULTISST-DICT-TRACE-COVERAGE — Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: `ACM TOS / VLDB Journal / FAST- or SIGMOD-adjacent storage systems`
- Calibration status: `PARITY_NOT_PLAUSIBLE`
- Quality tier: `BELOW_Q2_STOP`
- Search/cutoff date: `2026-08-26`

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Pibiri, Petri, Moffat, “Fast Dictionary-Based Compression for Inverted Indexes” | ACM WSDM, peer reviewed | selective flagship conference equivalent | 2019, DOI 10.1145/3289600.3290962 | relevant full sections | demonstrates a named new codec, algorithmic details, memory/cache trade-offs, public corpora, and strong experiments |
| EVALUATION_ANCHOR | Qiao et al., “Closing the B+-tree vs. LSM-tree Write Amplification Gap on Modern Storage Hardware with Built-in Transparent Compression” | USENIX FAST, peer reviewed | flagship storage-systems conference equivalent | 2022, official USENIX page | abstract/background in frozen source set | calibrates broad full-system evaluation and workload/platform evidence |
| DOMAIN_NEIGHBOR | Dong et al., “Optimizing Space Amplification in RocksDB” | CIDR, peer reviewed | selective database-systems venue | 2017, cidrdb.org | abstract/relevant indexed sections | establishes RocksDB space-amplification and shared-dictionary domain context |
| BOUNDARY_OR_NEGATIVE_ANCHOR | Mitzenmacher, “On the Hardness of Finding Optimal Multiple Preset Dictionaries” | IEEE DCC, peer reviewed | specialist theory/compression venue | 2001, author-hosted proceedings PDF | relevant full paper | establishes the generic segmentation kernel and a clear complexity contribution |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | RocksDB multi-SST compression is relevant | anchors address high-impact retrieval/storage surfaces | bounded | adequate |
| Contribution type | claimed METHOD_ALGORITHM/N2 | DINT has a named codec; DCC has a theorem | candidate has neither a new solver structure nor guarantee | fatal |
| Nearest-prior delta | target-specific costs and trace | DCC covers portfolio/assignment; WSDM covers selector suites/cost | residual is bookkeeping/instrumentation | fatal |
| Algorithm/mechanism substance | baseline-initialized local search/facility opening | anchors specify distinct algorithms/complexity | generic facility-location heuristic | fatal |
| Baseline strength/fairness | B0–B6 plus newly required AutoSkip/CompressionManager | strong matrix possible | Discovery omitted current B7 but fix is finite | executable gap |
| Natural workload/platform | exact 20 manifests, CPU/single machine | anchors use broad public corpora/system workloads | one frozen collection, no observed exact-object headroom | major but not alone fatal |
| Full-cost coverage | comprehensive proposed ledger | systems anchors measure end-to-end cost | no measurements yet, acceptable at Stage0 | StageA gap |
| Main result/statistics | none required at Stage0 | anchors carry publication-scale results | future work | normal Stage0 gap |
| Ablation/mechanism evidence | exact dictionary-match trace proposed | DINT/FAST isolate mechanisms | trace feasibility not closed | finite gap |
| Scale/generalization | one collection/version planned | anchors span datasets/configurations/platforms | too narrow for Q1, possibly Q2 if novelty existed | major |
| Failure boundary | homogeneous/isolated SST regimes named | anchors report trade-offs | credible | adequate plan |
| Artifact/reproducibility | public RocksDB/Zstd/manifests | anchors provide reproducible methodologies | route is strong | adequate plan |

## Reviewer-shape assessment

- Editor/venue-fit view: important systems surface, but the paper pitch lacks a publishable algorithmic core after subtraction.
- Methodology view: the falsifier, full-cost ledger, and trace plan are unusually strong; these improve rigor but do not create novelty.
- Domain-contribution view: current RocksDB integration could be useful engineering, yet target-specific coefficients around generic facility location are below the minimum N2 line.
- Devil's-advocate view: the strongest explanation is “generic compression segmentation with RocksDB nouns and instrumentation”; the candidate does not defeat it.

## Decision

- Quality tier: `BELOW_Q2_STOP`
- Status: `PARITY_NOT_PLAUSIBLE`
- Closed gaps: new-ID identity, same-function semantics, bounded current-source audit, falsifier, full-cost plan.
- Executable next gaps: current AutoSkip baseline, trace preflight, tiny oracle; not routed because contribution fails first.
- Human/resource-dependent gaps: none decisive.
- Bounded near-Q1 gaps: not applicable; the gap is contribution identity, not evidence breadth alone.
- Gap that invalidates the paper: no nontrivial algorithmic residual beyond generic segmentation/facility location.
- Why this is calibration rather than novelty evidence: anchors set the expected paper shape; collision is decided separately.
- Why Tier B does not hold: same-object and reproducibility routes exist, but the N2 contribution contract fails after strong generic subtraction.

