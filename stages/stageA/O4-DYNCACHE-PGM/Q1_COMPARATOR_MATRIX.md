# O4-DYNCACHE-PGM Q1/Q2 Paper Calibration

- Stage: `STAGEA`
- Candidate venue family: VLDB Journal / ACM TODS / IEEE TKDE; SIGMOD/PVLDB/PACMMOD contribution-shape equivalents
- Calibration status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Quality tier: `TIER_A_Q1_POTENTIAL`
- Search/cutoff date: 2026-08-09

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | [The PGM-index](https://www.vldb.org/pvldb/vol13/p1162-ferragina.pdf) | PVLDB 13(8) | flagship data-management proceedings equivalent; no JCR quartile claim made here | 2020, official PVLDB PDF | abstract, object, operations, guarantees, evaluation claims | Theory/representation plus deployable dynamic learned-index shape. |
| EVALUATION_ANCHOR | [ALEX: An Updatable Adaptive Learned Index](https://arxiv.org/abs/1905.08898) | SIGMOD 2020 | flagship selective conference equivalent | 2020, author manuscript and official Microsoft artifact | abstract, operation mix, baseline/result scope, artifact identity | Strong dynamic learned-index systems baseline and evaluation bar. |
| DOMAIN_NEIGHBOR | [A Dynamic Piecewise-Linear Geometric Index with Worst-Case Guarantees](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ESA.2025.64) | ESA 2025 / LIPIcs | top algorithms-conference equivalent | 2025, official paper and artifact metadata | full object/abstract, conclusion, artifact links | Closest same-object theorem/artifact and decisive subtractor. |
| BOUNDARY_OR_NEGATIVE_ANCHOR | [HIRE: A Hybrid Learned Index for Robust and Efficient Performance under Mixed Workloads](https://doi.org/10.1145/3786657) | PACMMOD 4(1), SIGMOD 2026 | flagship data-management publication | 2026, official ACM record/abstract | mechanism and evaluation claims | Latest direct subtractor for hybrid leaves, log updates, tail stability, and nonblocking recalibration. |
| EVALUATION_ANCHOR | [Benchmarking Learned Indexes](https://doi.org/10.14778/3421424.3421425) | PVLDB 14(1) | flagship data-management proceedings equivalent | 2020, official DOI record | benchmark scope and fairness focus | Fair implementation, cache, build-time, and traditional-baseline expectations. |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | Fully dynamic exact ordered indexes under locality and worst-case update/space constraints | PGM, ALEX, ESA, HIRE all establish broad data-management/algorithm relevance | None at problem level | comparable if full index is realized |
| Contribution type | N1 page-local certificate + N2 dual-version maintenance | PGM and ESA combine representation/theory; ALEX/HIRE combine mechanism/systems | Current probe covers only leaf microkernel | conditional |
| Nearest-prior delta | Local certificate and explicit page-touch/peak-space pair beyond ESA hull and HIRE hybrid/log controller | ESA/HIRE directly subtract general dynamic and robust-update claims | Global novelty remains search-bounded; no proof of non-absorption at full-index level | open but bounded |
| Algorithm/mechanism substance | Exact-rational certificate, deterministic local transition, copy-on-write publication | Anchors deliver complete data structures | Scalable directory and deferred credit state absent | core executable gap |
| Baseline strength/fairness | ESA, PGM, ALEX, TLX B+tree locked to immutable revisions | Anchors and benchmark paper require strong traditional/learned comparisons | No baseline was built or run in Stage A | mandatory Stage B gap |
| Natural workload/platform | Locked OSM replication minute diff, CPU replay | ALEX/HIRE use multiple real datasets/workloads | Observed-window witness is insert/upsert dominated and lacks initial snapshot | material executable gap |
| Full-cost coverage | Leaf route/read/write, certificate, rebuilt slots, aux pages/bytes | Systems anchors include latency, throughput, memory, build/update costs | Directory, allocator, synchronization, cache/TLB, baseline conversion absent | material executable gap |
| Main result/statistics | Complete small-state exact checks; deterministic byte-exact rerun | Anchors provide large experimental evaluations and/or theorems | No performance effect, confidence interval, or theorem | expected Stage A limitation |
| Ablation/mechanism evidence | Certificate and dual-version accounting jointly exercised | ALEX/HIRE provide component-level mechanisms | No certificate-vs-copy-on-write ablation or alternate certificate | Stage B gap |
| Scale/generalization | 8-key exhaustive universe; 639 effective natural updates | Anchors cover large datasets and workload families | Multi-level scale, second stream, CPUs/cache levels absent | major gap |
| Failure boundary | Explicit no-claim boundary; natural deletes unobserved; root excluded | ESA reports contiguous-layout advantage except adversarial cases | No empirical no-gain frontier | Stage B gap |
| Artifact/reproducibility | Frozen contract, scripts, raw input, exact rerun, hashes | ESA/PGM/ALEX provide public artifacts | Candidate artifact is a pilot, not a baseline-compatible package | Stage A comparable, paper parity not reached |

## Reviewer-shape assessment

- Editor/venue-fit view: the paired locality/update-space question fits data structures and data-management venues, but the present evidence is a risk pilot rather than a paper result.
- Methodology view: the exhaustive checker is strong for its declared finite model; external validity is sharply limited by eager fixed-page rebuild and the missing directory.
- Domain-contribution view: the result shows a coherent leaf-local state machine, not yet a new fully dynamic learned index.
- Devil's-advocate view: a reviewer may reasonably call the current transition a copy-on-write B+tree leaf with an affine hint. Only a scalable ε-cover certificate and a nontrivial global/deferred maintenance residual can defeat that absorption argument.

## Decision

- Quality tier: `TIER_A_Q1_POTENTIAL`
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Closed gaps: executable leaf-local transition; finite exactness/page-touch/space counterexample search; one locked natural feed-order witness; deterministic reproduction; authoritative ESA/PGM/ALEX/B+tree revision lock.
- Executable next gaps: scalable directory/fence transition; deferred credit schedule; full OSM snapshot plus delete/reinsert stream; independent second chronological stream; fair baseline builds; full-cost cache/update/space comparison; mechanism ablations.
- Human/resource-dependent gaps: formal proof audit of the global guarantee and venue-level theorem judgment. No private resource is currently required.
- Bounded near-Q1 gaps: none can yet be labeled non-core; current status is conditional, not near-parity.
- Gap that would invalidate the paper: global page-certificate maintenance or dual-version credit becomes unbounded, is absorbed by a current baseline, or loses the natural full-cost Pareto comparison.
- Why this is calibration rather than novelty or baseline evidence: the matrix compares expected contribution/evaluation shape only; collision and baseline validity are separately locked in `BASELINE_LOCK.md`.
