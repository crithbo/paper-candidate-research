# OPENJDK-JIMAGE-VERSIONAWARE-LAYOUT-DELTA — Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: systems / programming languages / software tools
- Calibration status: `PARITY_NOT_PLAUSIBLE`
- Quality tier: `BELOW_Q2_STOP`
- Search/cutoff date: `2026-08-11`

## Reference set

| Role | Paper/source | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Basso et al., “Heap-Snapshot Matching and Ordering using CAHPs” | PACMPL OOPSLA2, published | top PL venue / Q1-equivalent | 2025, author paper/artifact | contribution, ordering algorithm, evaluation/limitations | Shows that a layout-ordering paper needs a domain-specific mechanism, not merely a chosen ordering |
| EVALUATION_ANCHOR | Basso et al., “Improving Native-Image Startup Performance” | CGO, published | top code-generation venue | 2025, DOI `10.1145/3696443.3708927` / author paper | end-to-end layout/startup pipeline | Calibrates full-cost and multi-workload evidence expected for an adjacent runtime-image ordering paper |
| DOMAIN_NEIGHBOR | JEP 220 / current jlink documentation | official specification/tool documentation | authoritative implementation boundary | current docs/source | runtime-image semantics and legal controls | Fixes same-object scope; not a novelty anchor |
| BOUNDARY_OR_NEGATIVE_ANCHOR | Current OpenJDK `OrderResourcesPlugin` + generic finite layered shortest path | first-party current source + established generic algorithm | direct method boundary | current HEAD/pinned 2026-08-11 | complete action and guarantee mapping | Demonstrates the frozen candidate's action is native input selection and its DP guarantee is generic |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | runtime-image/update size and layout | CGO/OOPSLA show startup/layout can matter | narrower jimage delivery target | plausible problem, insufficient contribution |
| Contribution type | finite candidate generator + chain DP | anchors have specific matching/order mechanisms | generic layered selection | fatal |
| Nearest-prior delta | passes list to current jlink | current plugin already accepts lists/patterns | no new primitive or solver structure | fatal |
| Algorithm/mechanism substance | exact only over pre-materialized `F_i` | generic shortest path gives same exactness | no target-specific recurrence | fatal |
| Baseline strength/fairness | complete jlink + VCDIFF named | current source/docs give full action surface | strong fair union is feasible | exposes collapse |
| Natural workload/platform | chronological official tags planned | CGO/OOPSLA use natural workloads | no results yet | readiness only |
| Full-cost coverage | broadly specified | evaluation anchor charges full pipeline | good design | non-curative |
| Main result/statistics | none | published anchors have results/artifacts | absent | not a stop reason |
| Ablation/mechanism evidence | proposed candidate family | anchors justify mechanism ablations | no mechanism to ablate | fatal |
| Scale/generalization | 20–50 tags planned | anchors span multiple workloads | unrun | readiness only |
| Failure boundary | finite, pre-registered | strong | generic collapse already triggered | stop |
| Artifact/reproducibility | pinned open source route | anchors publish artifacts/current source transparent | possible | non-curative |

## Reviewer-shape assessment

- Editor/venue-fit view: the problem alone can support a systems result, but a configuration controller over an existing list-taking plugin is not a Q2 central contribution.
- Methodology view: use of actual complete delta edges is honest; it also makes the DP simply a generic layer-DAG selection after candidate materialization.
- Domain-contribution view: jimage's resource indices and stock reader produce a valuable fidelity contract, yet no target-specific state/guarantee remains.
- Devil's-advocate view: any observed reduction can be attributed to using a better `order-resources` list plus a conventional delta encoder; the candidate would be a post hoc configuration search, not a general method.

## Decision

- Quality tier: `BELOW_Q2_STOP`
- Status: `PARITY_NOT_PLAUSIBLE`
- Closed gaps: current native action surface, fair comparator, same-object reader, full-cost route.
- Executable next gaps: none for this ID; a different N2 needs a new ID.
- Human/resource-dependent gaps: none decisive.
- Bounded near-Q1 gaps: none.
- Gap that invalidates the paper: identical generic shortest-path solution applies once the candidate's own finite list family and actual delta edge weights are supplied.
- Why this is calibration rather than novelty/baseline evidence: the papers calibrate expected contribution/evidence shape; current source and the action mapping decide this candidate's stop.
- Why Tier B does not apply: contribution substance and exact-action model fail before any empirical requirement enters the decision.

