# WEBGRAPH-REFERENCE-FOREST Q1/Q2 Paper Calibration

- Stage: `STAGEA`
- Candidate venue family: compressed data structures, graph algorithms and graph systems
- Calibration status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Quality tier: `TIER_B_Q2_VIABLE` conditional on one bounded revision
- Search/cutoff date: `2026-08-10`

## Reference set

This matrix reuses the frozen Stage 0 primary-source reference set; Stage A did not perform a new broad literature search.

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Boldi & Vigna, “The WebGraph Framework I: Compression Techniques” | WWW 2004 | top web/data-systems conference equivalent | 2004; official project/author record | compression, native format, random access, evaluation | canonical same-object paper shape |
| EVALUATION_ANCHOR / DIRECT_SUBTRACT | Versari et al., “Zuckerli: A New Compressed Representation for Graphs” | IEEE Access 8, DOI `10.1109/ACCESS.2020.3040673` | journal anchor for graph-compression construction/access tradeoffs | 2020; Google Research/IEEE | reference selection, construction, access and natural evaluation | closest heuristic genealogy and evidence bar |
| DOMAIN_NEIGHBOR | Xu et al., “Improving Graph Compression for Efficient Resource-Constrained Graph Analytics” (Laconic) | PVLDB 17(9), DOI `10.14778/3665844.3665852` | top data-management venue | 2024; official PVLDB PDF | representation, costs, datasets and artifact | calibrates modern breadth/full-cost expectations |
| IMPLEMENTATION_BOUNDARY | Fontana, Vigna & Zacchiroli, “WebGraph: The Next Generation (Is in Rust)” | Web Conference 2024 Companion, DOI `10.1145/3589335.3651581` | peer-reviewed implementation boundary | 2024; official project record | implementation scope | establishes first-party Rust status; not an equal Q1 anchor |

## Comparator matrix

| Dimension | Candidate Stage A evidence | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | exact native BVGraph size/access tradeoff | anchors target graph footprint and access | only two natural graphs | Q2 plausible |
| Contribution type | exact complete-action FPT frontier DP | WebGraph format; Zuckerli heuristic; Laconic representation | practicality and breadth | algorithmically distinct |
| Nearest-prior delta | uses alternative parents discarded before BvCompZ depth DP | BvCompZ/Zuckerli global best-edge forest | full literature collision remains open | current-source residual survives |
| Algorithm/mechanism substance | explicit state/recurrence/exactness; 227M natural transitions audited | anchors give concrete construction algorithms | compact implementation absent | revision needed |
| Baseline strength/fairness | full released final BvCompZ, same action table/config/writer | Zuckerli compares established graph compressors | Java/default grids later | Stage A hard baseline PASS |
| Natural workload/platform | LAW cnr-2000 + SNAP Wiki-Vote, CPU only | anchors use broader/large suites | two graphs and small W/D | limited preliminary breadth |
| Full-cost coverage | download, transform, input load, states, CPU/wall/RSS, bytes, EF, seq/random readers | anchors report construction/decompression/resources | energy and broader regimes absent | complete for bounded pilot |
| Main result/statistics | 4.897% / 0.114% payload residual; 104.7× / 13.0× build slowdown | anchors show broad quantified benefits | no broad distribution/confidence study | mixed result |
| Ablation/mechanism evidence | 2,048 frozen cases; tiny exhaustive; chunk action coverage | anchors isolate algorithms/settings | dense-state/tie-break ablations absent | strong Stage A mechanism evidence |
| Scale/generalization | 325k-node crawl and 7k-node network | anchors include much larger/diverse graphs | insufficient for paper | Stage B gap after revision |
| Failure boundary | random p50 +9.4%/+4.2%; higher RSS/build cost | strong papers disclose tradeoffs | need same-optimum remedy or stop | revision killer |
| Artifact/reproducibility | portable pinned toolchain, sources, data hashes, raw outputs/audits, full manifest | modern artifact expectations | external clean-room replay pending | strong pilot artifact |

## Reviewer-shape assessment

- Editor/venue-fit: the exact complete-edge residual is no longer speculative, and a 4.9% same-format saving is potentially interesting; a 100× constructor without a clear offline-use story or compact algorithm is not ready for acceptance.
- Methodology: same-object and baseline fidelity are unusually strong. The preregistered no-regression rule must control the recommendation, so size gains cannot be promoted to PASS.
- Domain contribution: the result exposes a real best-parent restriction in current BvCompZ. Q2 viability depends on making the exact method practical and characterizing access consequences.
- Devil's advocate: the current implementation may be only a small-parameter oracle whose size gain buys deeper/slower access. If a dense exact implementation and exact-optimal tie-break cannot close that boundary, the narrow paper should stop.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE` conditional on one same-object revision.
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`.
- Closed gaps: exact object, complete-action algorithm/guarantee, native structural divergence, current final BvCompZ comparator, two natural size residuals, writer/reader fidelity and full-cost disclosure.
- Executable next gaps: dense state/backpointer implementation, equal-bit access-minimizing tie-break, no-new-corpus replay and independent Stage A gate.
- Human/resource-dependent gaps: mainline/user decision whether to spend the one revision; no resource blocker.
- Bounded near-Q1 gaps: larger diverse graph suite, default/high W/D scalability, formal refinements, strong statistics and independent artifact replay.
- Gap that would invalidate the paper: same-optimum implementation remains impractical or random access remains materially worse under the unchanged exact-size objective.
- Why this is calibration rather than novelty evidence: the papers define expected shape; novelty remains bounded-open beyond the checked current source.
- Why Tier B remains possible: all integrity gates and a real natural residual are closed, while the remaining full-cost defect has one concrete, same-object, falsifiable revision path.
