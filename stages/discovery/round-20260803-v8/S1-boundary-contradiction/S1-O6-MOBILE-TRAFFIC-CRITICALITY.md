# S1-O6-MOBILE-TRAFFIC-CRITICALITY Workload-critical memory traffic class for mobile XPU coexistence

- Status: `PROPOSE_STAGE0`
- Opportunity origins: `O1 / O6`
- Domain tags: mobile SoC; NPU/XPU; memory controller; QoS; on-device LLM
- Contribution route: `N1`
- Discovery date: 2026-08-03
- Discovery method revision: v2 (independently calibrated)

## Research question

Can a mobile SoC preserve interactive-service tail latency during concurrent NPU LLM execution by propagating a **workload-criticality** tag to shared-memory arbitration, rather than treating accelerator identity or host scheduling priority as the unit of protection, while holding the interactive quality contract and model-output quality fixed?

## Paper genealogy

- Anchor paper: [Sereno (OSDI 2026)](https://www.usenix.org/conference/osdi26/presentation/xin), which identifies a real priority inversion: fixed high-priority NPU traffic can raise UI jank while starving the LLM; Sereno resolves it with software-visible speculative-decoding yield points.
- Key predecessors: [XSched (OSDI 2025)](https://www.usenix.org/conference/osdi25/presentation/shen-weihang), a preemptive command scheduler for diverse XPUs; [Layerweaver+ (IEICE 2022)](https://doi.org/10.1587/transinf.2021EDL8084), which schedules DNN layers under NPU QoS constraints.
- Follow-up / competing papers: [ShadowNPU](https://arxiv.org/abs/2508.16703) is a current NPU-centric mobile-LLM design; [When NPUs Are Not Always Faster](https://arxiv.org/abs/2605.27435) and [Is Your NPU Ready for LLMs?](https://arxiv.org/abs/2607.05475) demonstrate that mobile phase/framework conclusions remain unstable and must be controlled, not assumed.
- Counter-evidence / negative source: Sereno’s software yielding already reduces jank substantially; if its protected/UI and LLM-throughput Pareto frontier matches a traffic-class primitive when both use identical traces, the hardware primitive has no residual claim. Public Qualcomm material found in this pass exposes no verified programmable NPU-to-DRAM QoS-tag interface, so a vendor-API implementation claim is deliberately excluded.
- Artifact / benchmark / specification: [XSched artifacts](https://github.com/XpuOS/xsched-artifacts); Sereno’s published OSDI paper; a trace must contain synchronized UI frame deadlines, camera/ISP or display traffic when available, and LLM request/token boundaries. No author artifact for Sereno was located in this pass.
- Search boundary: fresh primary-source search through 2026-08-03 over OSDI/USENIX, author papers, arXiv, official NVIDIA/Qualcomm searches, and artifact repositories. This is a collision screen, not a claim that no undiscovered work exists.

## Topic-origin card

- Trigger: software schedulers label a command or accelerator, whereas shared DRAM/NoC arbitration observes individual requests after that label has become too coarse.
- Measurable observation / quantitative anchor: Sereno reports up to 153% UI-jank increase from background LLM execution and reports that its yielding approach can reduce jank by 92.6% while increasing throughput by up to 67.9% on its evaluated setting. Those numbers anchor the phenomenon, not a predicted gain for this proposal.
- Baseline limitation: accelerator-wide priority and host-side yielding conflate latency-critical display/UI requests with best-effort requests issued by the same accelerator or model phase; yielding also removes useful work instead of arbitrating the contested resource.
- Optional inherited assumption: `accelerator identity / command priority is an adequate proxy for every downstream memory request’s urgency`.
- Structural cause: the actionable variable (per-request criticality) is lost between XPU command submission and shared-interconnect/DRAM arbitration; a single accelerator can emit both deadline-sensitive and throughput-oriented bursts.
- Decision variable: for each DMA/request epoch, choose `{deadline-critical, bounded-latency, best-effort}` class plus a bounded class budget/deadline; the memory controller chooses request service subject to DRAM timing, starvation bound, and per-workload loss budget. This is not a choice of an accelerator, a preemption point, or a generic controller wrapper.
- Candidate Q1 venue family: OSDI/SOSP/EuroSys/ASPLOS/HPCA/TC.

## Historical method calibration

- Source-session backtest file: `stages/discovery/_method-backtests/O1_O6_BOUNDARY_CONTRADICTION/v2/backtest_review.md`
- Backtest status: `CALIBRATED` (3/3 positives reasonably recovered; negative control abstained; no contamination/leakage).
- This field calibrates the discovery method and is not candidate evidence.

## Importance and group fit

On-device LLMs increasingly run beside UI, camera, audio, and display work on a shared mobile SoC. The object is a microarchitectural QoS primitive and a constrained scheduling rule, not a platform-specific app policy. It fits computer architecture/system work if it proves a general resource-level causal mechanism across at least two natural interactive traces and multiple model phases.

## Exact object

A shared-DRAM/NoC request-class propagation primitive for concurrent mobile XPU workloads: command metadata produces bounded per-request class/deadline tokens; an interconnect/memory-controller arbiter uses those tokens under explicit starvation, bandwidth, and DRAM-timing constraints. Exact evaluation object: the same mobile-SoC-like memory subsystem, same model/operator graph and output quality, same interactive trace, and same thermal/power envelope across all baselines.

## Named fair baselines

- Deployment/default baseline: stock accelerator-wide priority and conventional FR-FCFS/weighted arbitration with no workload-critical request tag.
- Closest recent-paper baseline: Sereno’s speculative-decoding yielding policy, reproduced/adapted from its published algorithm on identical request traces.
- Competitive simple baseline: XSched-style command-level preemptive priority, using its public artifact where its platform assumptions apply.
- Optional offline ceiling: clairvoyant earliest-deadline request scheduling with the identical request stream and the same starvation/bandwidth constraints; it is a ceiling, never a deployable baseline.

## Mechanism hypothesis

Propagating a bounded criticality/deadline class to the first shared arbitration point separates urgent interactive traffic from nonurgent traffic emitted by the same XPU. A two-level policy (admission budget plus DRAM-aware arbitration) can improve the jank/token-throughput Pareto frontier over command-level yielding without changing model semantics or reserving a whole accelerator.

## Competing mechanisms

- Mechanism A: host/XPU command-level preemption or yielding (Sereno/XSched): reduce or interrupt the source of interference.
- Mechanism B: accelerator-wide fixed priority: protect all traffic from a selected XPU/command class.
- Optional mechanism C: bandwidth cap/reservation: bound an XPU’s aggregate traffic without distinguishing urgent requests.
- Preferred mechanism and why: request-criticality propagation can arbitrate the contested resource at request granularity while retaining noncritical work; it is only preferred if the falsifier shows a causal gain beyond A–C under equal quality and cost.

## Mechanism signature

The signature is a measurable mediation chain: (1) identical command mix produces class-distinguishable memory requests; (2) class tokens alter queueing delay at the shared arbiter; (3) reduced deadline-request tail delay explains jank improvement; (4) token throughput and model output remain fixed within the stated contract. If queueing is unchanged, a gain cannot be credited to this primitive.

## Seed-distance test

- What changes relative to the anchor: Sereno changes decode execution/yield timing; this proposal changes the information carried by memory requests and the arbitration constraint at the contested resource.
- What changes relative to the closest prior work: XSched decides command order/preemption; this proposal decides per-request service after command issue and includes a starvation-bounded request-class budget.
- Why this is not an application/backend rename: neither decision variable is model name, accelerator identity, or framework; both are request metadata and memory-service feasibility.
- Result of method-name deletion test: removing proposed names leaves a distinct claim—“bounded request criticality propagates through an XPU DMA path and changes DRAM arbitration under a fixed command stream”—not merely “schedule mobile LLM better.”

## Candidate paper claim

For natural mobile interactive traces co-running with on-device LLM inference, a starvation-bounded workload-critical request-class primitive can improve the equal-quality jank/throughput Pareto frontier over stock accelerator-wide priority, command-level preemption, and speculative-yield baselines, with quantified metadata, storage, arbitration, power, and fairness costs.

## Evidence route

- `PERFORMANCE`

## Software/algorithm performance admissibility, if applicable

- Same-function contract: same application trace, frame/deadline definition, model weights, decoding rule, token/output-quality metric, and request arrival sequence; no semantic approximation hidden in the mechanism.
- Algorithmic delta: a hardware request-class representation plus constrained request arbitration, not a parameter sweep over a scheduler.
- Full-cost ledger scope: tag bits and propagation, queue/storage state, comparator/arbitration delay, starvation bound, bandwidth lost to protected traffic, DRAM row-buffer/timing effects, energy/power proxy, and any source-side bookkeeping.
- Generality hypothesis: holds across UI-plus-LLM and camera/ISP-plus-LLM traces only when a shared-memory contention window exists; it should not be claimed for compute-bound or naturally isolated workloads.
- Why this is not routine tuning: it changes the unit of QoS from accelerator/command to memory request and introduces a new feasibility constraint at arbitration.
- Expected no-gain region: no shared-memory bottleneck, already isolated memory paths, or traces where all requests have identical deadline criticality.

## Nearest-prior facet matrix

| Facet | Candidate | Closest prior (Sereno) | Residual |
|---|---|---|---|
| Research problem | Interactive quality versus mobile LLM progress | Same | No residual at problem statement alone |
| Exact object | NoC/DRAM request path | Decode execution/yield path | Different intervention layer |
| Decision variables | Request class, bounded budget, service order | Yield/preemption points | New variables |
| Constraints / information | Request deadline class; DRAM timing; starvation/bandwidth budgets | Command/model-phase observability | New information reaches arbiter |
| Core algorithm or mechanism | Tag propagation plus DRAM-aware arbitration | Speculative decoding yielding | N1 primitive, not controller wrapping |
| Guarantee | Equal-quality Pareto plus starvation bound | Measured software trade-off | Must be tested, not assumed |
| Evidence object | Request-level queue-delay mediation | End-to-end jank/throughput | Needs trace-calibrated model |

## Current collision classification

- DIRECT_FATAL: none found for request-criticality propagation plus bounded memory arbitration; absence is not a novelty proof.
- DIRECT_SUBTRACT: Sereno removes any claim framed as “make mobile LLM yield/preempt better”; XSched removes any claim framed as a generic cross-XPU scheduler.
- METHODOLOGICAL_ADJACENT: Layerweaver+ provides QoS-aware NPU layer scheduling but not a mobile shared-memory request-class primitive.
- DEPLOYMENT_BASELINE: stock accelerator-wide priority, conventional DRAM arbitration, and vendor QoS settings where publicly exposed.
- SEARCH_BOUNDED_OPEN: current post-2024 work can still appear; Stage 0 must rerun a collision search specifically for SoC interconnect QoS tags, AMBA/CHI QoS use, and mobile memory-controller arbitration.

## Decisive falsifier

On a trace-calibrated model, replay an identical UI/LLM request stream through (i) Sereno-style yielding, (ii) command-level preemption, (iii) aggregate bandwidth cap, and (iv) the proposed class primitive, all with the same output and frame contracts. Drop the direction if (a) the class cannot influence the first shared arbitration point, (b) it cannot beat the best of i–iii on the equal-quality Pareto frontier after full cost, or (c) its benefit disappears once DRAM timing and starvation constraints are enforced.

## Executable evidence path

### 72-hour first evidence

No hardware or benchmark execution is authorized in Discovery. If Stage 0 accepts the object, the fastest authorized killer is a small trace-driven queueing/DRAM model calibrated only from published Sereno measurements and public XSched traces. It must first establish whether the request stream contains class-separable contention windows; otherwise stop before building a simulator/RTL. This is a design/falsification probe, not evidence of performance.

### AI core fraction and critical path

`AI_AUXILIARY_ONLY`: AI can extract trace schemas, implement a transparent baseline model, generate deterministic plots, and check accounting. A researcher must define the microarchitecture, obtain/validate natural traces, establish causal validity, and interpret hardware cost. AI is not relied upon for the main scientific claim.

### Semantics-preserving open alternatives

XSched’s public artifacts can exercise command-level baseline logic. A portable trace-driven model is an open alternative for early falsification, but cannot substitute for vendor/RTL evidence of a real mobile SoC implementation. There is no verified open Qualcomm interface for per-request NPU memory QoS tags.

## Q1 sufficiency hypothesis

- Why this could support a complete Q1 paper: it addresses a measured current mobile coexistence failure with a distinct primitive, explicit causal signature, strong software baselines, a full cost ledger, and a clear no-gain boundary.
- What would still be required at Stage B: an independent current-collision audit; two or more natural traces; trace-to-model validation; equal-quality and thermal/power controls; area/timing/energy accounting; ablations proving tag propagation and arbitration each matter; and no benefit hidden by altered LLM semantics.
- Preliminary contribution-shape analogs, if any: Sereno (OSDI 2026) and XSched (OSDI 2025) calibrate the systems problem and baseline strength; Layerweaver+ calibrates accelerator QoS. They are analogs only, not novelty evidence.
- Reminder: preliminary analogs do not replace Stage 0 Q1 calibration.

## Dual-axis score

- Academic value: `53/70`
- AI executability bonus: `3/30`
- Total: `56/100`

## AI and researcher boundary

Researcher-owned: formulation of request semantics, microarchitecture, trace validity, fairness/causality and all publication claims. AI-owned auxiliary work: bibliography hygiene, reproducible parsing/model scaffolding, baseline-code assistance, and mechanical cost-ledger checks. Because the principal proof requires architecture and natural-trace validation, this direction may appropriately route to `HUMAN_RESEARCH_RESERVE` after independent review; this brief only recommends Stage 0 screening.
