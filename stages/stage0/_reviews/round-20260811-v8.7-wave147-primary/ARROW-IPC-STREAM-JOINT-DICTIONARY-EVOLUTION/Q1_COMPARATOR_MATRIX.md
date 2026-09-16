# ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: data management / data formats / compression
- Calibration status: `PARITY_NOT_PLAUSIBLE` for Q1; Q2 viability is conditional on the atomic revision.
- Quality tier: `TIER_B_Q2_VIABLE` if revision closes; otherwise `BELOW_Q2_STOP`
- Search/cutoff date: 2026-08-11

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Raman & Swart, “How to Wring a Table Dry: Entropy Compression of Relations and Querying of Compressed Relations” | VLDB 2006, peer reviewed | top-tier database conference equivalent | 2006, original IBM/VLDB paper page | problem, guarantee, system evidence | Shows the algorithm/theory/system depth expected from a compression contribution. |
| EVALUATION_ANCHOR | Liu et al., “A Deep Dive into Common Open Formats for Analytical DBMSs” | PVLDB 16, peer reviewed, artifact available | top-tier database venue equivalent | 2023, official PVLDB PDF | format facets, workloads, evaluation | Calibrates full-format, multi-metric, natural-workload evaluation including Arrow. |
| DOMAIN_NEIGHBOR | Hildebrandt, Habich, Lehner, “Integrating Lightweight Compression Capabilities into Apache Arrow” | ICISSP 2020, peer reviewed | direct domain neighbor, not asserted Q1 | 2020, publisher original PDF | Arrow scope, mechanism, evaluation | Tests whether the candidate is more than adding compression/emitter support to Arrow. |
| BOUNDARY_OR_NEGATIVE_ANCHOR | Apache Arrow Columnar/IPC specification and current C++ source | official standard/upstream | authoritative object boundary, not venue calibration | current at 2026-08-11 | grammar, reader/writer actions | Defines legality, same-object, current action surface, and reproducibility. |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | Arrow stream byte/work trade-off | PVLDB format study shows format choice matters broadly | candidate is a narrow subproblem | Q2 at best without broader impact |
| Contribution type | proposed N2 planner over cuts and dictionary histories | VLDB anchor combines new encoding/guarantee and implementation | non-product algorithm not yet defined | revision hard gate |
| Nearest-prior delta | same-reader joint history planner | ArrowComp changes compression capability; current source exposes actions | action novelty was overstated | recast as algorithm only |
| Algorithm/mechanism substance | desired dominance-reduced state-lattice method | anchors contain substantive algorithms/formal properties | current proposal is generic product DP | revise |
| Baseline strength/fairness | arbitrary direct batches + options + generic planner + exact ceiling | PVLDB anchor uses broad format controls | Discovery baseline omitted direct inputs | corrected in PRIMARY |
| Natural workload/platform | two official NYC TLC months, CPU | evaluation anchor uses diverse public data | one carrier/family initially | acceptable Q2 Stage A start |
| Full-cost coverage | bytes, construction/planning, writer/reader, RSS, latency, fallback | anchors report compression/performance trade-offs | not measured and construction cost was omitted | finite readiness gap |
| Main result/statistics | none claimed | anchors provide broad quantitative evidence | major evidence gap | appropriately deferred |
| Ablation/mechanism evidence | state dominance, cut sharing, delta/replacement ablations planned | anchors isolate encoding choices | cannot design until revision closes | pending |
| Scale/generalization | two months first, more months later | PVLDB anchor covers multiple formats/workloads | narrow | Q1 not plausible currently |
| Failure boundary | stable, single-field, synchronized, generic-product cases | strong anchors state trade-offs | explicit but untested | acceptable Stage0 honesty |
| Artifact/reproducibility | pinned Arrow, official input hashes, streams and ledgers planned | PVLDB artifact standard | artifact absent | not fatal at Stage0 |

## Reviewer-shape assessment

- Editor/venue-fit view: an Arrow-specific exact/approximate planner with a clean theorem and robust full-cost residual can support a focused Q2 paper; an ILP wrapper or option tuner cannot.
- Methodology view: equality on concatenated logical rows is sound. Arbitrary `WriteRecordBatch` inputs and dictionary construction costs must be in the comparator contract.
- Domain-contribution view: current writer already implements all local delta/replacement semantics. The paper must contribute the planner/guarantee, not protocol support.
- Devil's-advocate view: because fields interact only through shared cuts and additive overhead, ordinary product-state segmentation may completely explain the proposal. The revision must defeat this simpler account.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE` only if the atomic revision closes
- Status: `PARITY_NOT_PLAUSIBLE`
- Closed gaps: exact stream/reader contract, current source pin, full first-party action surface, legal static history pair, public natural route.
- Executable next gaps: dominance-reduced action catalog, non-product algorithm/property, comparator-separating witness, complexity and finite falsifier.
- Human/resource-dependent gaps: none decisive.
- Bounded near-Q1 gaps: not applicable at current scope; Q1 would require a stronger general theorem and broader format/system impact.
- Gap that would invalidate the paper: collapse to current caller-input control or generic Cartesian segmentation with no independent N2.
- Why this is calibration rather than novelty or baseline evidence: these papers set contribution/evaluation shape; source audit separately establishes collisions and current controls.
- Why Tier B can still close the gates: if revision succeeds, same-object and current baselines are public and finite, NYC TLC supplies natural data, full cost is defined, and Stage A has direct falsifiers. Missing measured gains alone is not a Stage0 failure.
