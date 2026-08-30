# S1-O6-MOBILE-TRAFFIC-CRITICALITY Q1/Q2 Paper Calibration

- Stage: `STAGEA`
- Candidate venue family: systems/architecture (`OSDI/SOSP/EuroSys/ASPLOS/HPCA/TC`), conditional only
- Calibration status: `PARITY_CONDITIONAL`
- Quality tier: `TIER_B_Q2_VIABLE`
- Search/cutoff date: `2026-08-09`

The permitted frozen source set contains two top-tier systems anchors, one peer-reviewed accelerator-QoS neighbor, and official transaction-QoS specifications. It does not contain three same-object Q1 papers; that insufficiency is reported rather than repaired with secondary or off-scope sources.

## Reference set

| Role | Paper/source | Venue/status | Quartile/equivalent basis | Read scope | Why selected |
|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Sereno | OSDI 2026 | top-tier systems equivalent | Full paper, official page | Same natural commercial-mobile LLM/foreground setting; software-yield direct subtractor and evaluation anchor. |
| EVALUATION_ANCHOR | XSched | OSDI 2025 | top-tier systems equivalent | Full paper + immutable author artifact README | Strong command-level scheduling/preemption baseline and artifact-quality anchor. |
| DOMAIN_NEIGHBOR | Layerweaver+ | IEICE Trans. Inf. & Syst. 2022 | peer-reviewed domain neighbor, not asserted Q1 | Full paper | Calibrates NPU request/layer QoS scheduling but not first-arbiter action. |
| BOUNDARY_OR_NEGATIVE_ANCHOR | Arm AXI/ACE IHI0022H + AMD Versal QoS | official standards/vendor documentation | primary technical authority, not a paper | Relevant QoS sections/pages | Establishes native per-transaction QoS as a mandatory subtractor and rejects a “new tag” claim. |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | Mobile foreground QoS under on-device LLM traffic | Sereno demonstrates the natural system problem | Closed structurally | Q2-relevant problem |
| Contribution type | N1 first-shared-arbiter source/budget contract | Sereno/XSched change software or command scheduling | Actual action not instantiated | Human-dependent |
| Nearest-prior delta | Request-level action after issue | Existing anchors act above the request arbiter; Arm/AMD expose native QoS | Could reduce to native QoS | Decisive unresolved risk |
| Algorithm/mechanism substance | Contract plus legal comparator action and starvation budget | No public implementation on frozen object | Complete mapping/comparator absent | Not evaluable |
| Baseline strength/fairness | B0–B4, strongest B4 same-information native dynamic QoS | Arm/AMD make B4 mandatory | Actual mobile B4 parameters absent | Fail closed |
| Natural workload/platform | Natural phone foreground plus LLM | Sereno supplies this setting | No public per-request trace | Human input required |
| Full-cost coverage | Mapping, metadata, queue, arbiter, DRAM, QoS, power/thermal, fallback | Sereno/XSched cover only subsets at their layers | Unit-bearing same-object paths absent | Not evaluable |
| Main result/statistics | Equal-quality p50/p90 full-cost Pareto residual | No claim-bearing run | Entire result missing | No PASS/STOP |
| Ablation/mechanism evidence | First-arbiter causal delta vs B4 | No witness | Entire causal witness missing | Killer untested |
| Scale/generalization | UI/camera families and LLM phases | Sereno has apps/models; XSched has diverse XPUs | Frozen object not yet instantiated once | Deferred, not Stage B authorization |
| Failure boundary | Native QoS absorption or candidate reduction | Precisely preregistered | Cannot test without comparator | Open |
| Artifact/reproducibility | Frozen sources, contract, audit, hashes | XSched provides artifact anchor | Candidate object/artifact absent | AI-auditable preflight only |

## Reviewer-shape assessment

- Editor/venue-fit view: a successful result could form a credible Q2 systems/architecture paper, but the current package is an evidence-readiness audit, not a paper result.
- Methodology view: same-object identity and native-QoS parity are the first-order validity threats; the new pre-claim gate correctly prevents proxy evidence.
- Domain-contribution view: the possible residual is narrower than “QoS” and survives only if the full source/budget contract produces an action not expressible by the actual B4 comparator.
- Devil's-advocate view: the candidate may collapse to setting AxQOS values; without a natural witness, even novelty and implementability cannot be adjudicated.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE` as structural potential, not Stage A evidence completion.
- Status: `PARITY_CONDITIONAL`.
- Closed gaps: natural problem importance; strongest comparator identity; explicit action and full-cost contract; public-source provenance.
- Executable next gaps: none autonomously under current public materials.
- Human/resource-dependent gaps: natural per-request mapping, actual native comparator, unit-bearing full costs, small witness, then same-object B4 comparison.
- Bounded near-Q1 gaps: none claimed.
- Gap that would invalidate the paper: native QoS covers all equal-quality candidate points or the candidate reduces to native QoS.
- Why this is calibration rather than novelty or baseline evidence: the matrix compares expected paper shape and evidence depth; it does not infer a mechanism result.
- Why Tier B remains conditional: all non-relaxable gates must still close on the natural object after the human research package is supplied.
