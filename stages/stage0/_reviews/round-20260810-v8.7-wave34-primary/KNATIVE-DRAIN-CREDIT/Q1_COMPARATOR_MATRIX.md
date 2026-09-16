# KNATIVE-DRAIN-CREDIT Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: serverless systems/runtime
- Calibration status: `PARITY_NOT_PLAUSIBLE`
- Quality tier: `BELOW_Q2_STOP`
- Search/cutoff date: `2026-08-10`

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Cvetković et al., “Dirigent: Lightweight Serverless Orchestration” | SOSP 2024 | top systems conference/Q1-equivalent | 2024, paper abstract and official venue metadata | problem, architecture, claims, evaluation scale | Shows that an orchestration paper needs a coherent system object, architectural mechanism, and production-scale latency evidence |
| EVALUATION_ANCHOR | Shahrad et al., “Serverless in the Wild” | USENIX ATC 2020 | top systems conference/Q1-equivalent | 2020, USENIX page and paper | workload characterization, policy, trace/artifact claims | Calibrates natural production-trace characterization and policy validation |
| DOMAIN_NEIGHBOR | Zhang et al., “Faster and Cheaper Serverless Computing on Harvested Resources” | SOSP 2021 | top systems conference/Q1-equivalent | 2021, DOI/paper | invocation-duration trace, eviction deadline, reliability/cost evaluation | Nearest strong shape for duration-aware completion risk under a deadline |
| BOUNDARY_OR_NEGATIVE_ANCHOR | Cinque et al., “PREEMPT-FaaS” | ECRTS 2026 | major peer-reviewed real-time systems conference | 2026, Dagstuhl paper record/abstract | orchestration action, Knative patch, priority guarantee, evaluation | Demonstrates a distinct Knative-adjacent scheduling object; it does not legalize cross-Revision HTTP migration |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | Tail completion and churn during serverless transitions | All anchors establish serverless orchestration importance | none at problem level | positive but insufficient |
| Contribution type | Claimed online admit/withdraw/migrate credit | Dirigent has a coherent architecture; Harvest has a defined eviction policy | candidate actions cross protocol commit points | fatal |
| Nearest-prior delta | Duration-aware transition credit | Native Knative already supplies routing, per-Revision buffering and pod drain | only trigger logic remains after illegal migration is removed | below Q2 |
| Algorithm/mechanism substance | O(1) counters plus duration quantile | Anchors name a scheduler/resource manager and measurable guarantees | no lawful single decision space or competitive/formal guarantee | fatal |
| Baseline strength/fairness | Discovery lists native settings plus MPC/PREEMPT | Strong papers compare the complete compatible deployment pipeline | must include B0/B1 and legal dynamic same-information controller | corrected in review |
| Natural workload/platform | Azure 2021 invocation trace plus proposed Knative witness | ATC/Harvest use production trace with matching modeled state | trace lacks revision/route/pod/queue/HTTP semantics | fatal as sole carrier |
| Full-cost coverage | queue/retry/routing/control/warm time | systems anchors include control and resource overhead | request-body buffering/replay, partial response, duplicate effects, propagation omitted | fatal |
| Main result/statistics | none required at Stage 0 | anchors provide broad empirical results | readiness gap alone would be acceptable | not STOP cause |
| Ablation/mechanism evidence | planned config grid | anchors separate mechanism components | cannot ablate an incoherent atomic action | fatal |
| Scale/generalization | proposed 20 trace windows | anchors use broad workloads/platform scale | too narrow for Q1, potentially Q2 only after object fix | secondary |
| Failure boundary | short/homogeneous/no-transition | good papers state resource/semantic limits | unsafe/non-idempotent/streaming HTTP omitted | fatal |
| Artifact/reproducibility | public source/trace, local CPU cluster | anchors expose reproducible workloads/systems | resources are adequate | positive but non-curative |

## Reviewer-shape assessment

- Editor/venue-fit view: the motivating problem fits systems venues, but an editor would see no single implementation object behind the main claim.
- Methodology view: arrival/duration replay cannot stand in for revision selection, endpoint readiness, Queue-Proxy admission, response commit, retry and failure state.
- Domain-contribution view: native Knative's pipeline already performs the legal component actions; the only claimed delta is tied to an unsafe/undefined migration step.
- Devil's-advocate view: either migration is real and violates unchanged general HTTP semantics, or it is not migration and the contribution collapses to a duration-aware configuration/controller.

## Decision

- Quality tier: `BELOW_Q2_STOP`
- Status: `PARITY_NOT_PLAUSIBLE`
- Closed gaps: source release, current route/Activator/Queue-Proxy action ordering, trace schema and principal subtractors were independently checked.
- Executable next gaps: none under this ID.
- Human/resource-dependent gaps: none decisive.
- Bounded near-Q1 gaps: not applicable.
- Gap that would invalidate the paper: already present—no replay-free, same-object atomic action for the unchanged HTTP contract.
- Why this is calibration rather than novelty or baseline evidence: the listed papers define expected systems-paper shape; source-level collision and object findings are documented separately in `SOURCE_AUDIT.md`.
- Why Tier B is not assigned: same-object, natural-carrier, full-cost and surviving N2 gates fail even under conditional Stage 0 semantics.

## Primary-source links

- Dirigent: https://arxiv.org/abs/2404.16393
- Serverless in the Wild: https://www.usenix.org/conference/atc20/presentation/shahrad
- Harvested Resources: https://doi.org/10.1145/3477132.3483580
- PREEMPT-FaaS: https://doi.org/10.4230/LIPIcs.ECRTS.2026.22
