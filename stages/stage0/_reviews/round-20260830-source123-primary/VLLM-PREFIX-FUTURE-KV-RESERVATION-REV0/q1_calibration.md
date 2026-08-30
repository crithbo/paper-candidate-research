# VLLM-PREFIX-FUTURE-KV-RESERVATION-REV0 Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: systems / ML systems
- Calibration status: `PARITY_NOT_PLAUSIBLE`
- Quality tier: `BELOW_Q2_STOP`
- Search/cutoff date: `2026-08-30`

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Efficient Memory Management for Large Language Model Serving with PagedAttention | SOSP 2023 | top systems conference equivalent | 2023, arXiv/official paper | abstract, mechanism, evaluation claims | Shows the mechanism and implementation breadth expected for a runtime-memory contribution. |
| EVALUATION_ANCHOR | Sarathi-Serve: Taming the Throughput-Latency Tradeoff in LLM Inference | OSDI 2024 | top systems conference equivalent | 2024, arXiv/author paper | method, workload/platform/evaluation scope | Shows full-system evaluation, strong baselines, and mechanism ablations for scheduling work. |
| DOMAIN_NEIGHBOR | Preble: Efficient Distributed Prompt Scheduling for LLM Serving | arXiv preprint | not used as quartile proof | 2024, arXiv | full abstract and design/evaluation sections exposed by source | Direct prefix-aware scheduling neighbor. |
| BOUNDARY_OR_NEGATIVE_ANCHOR | Mitigating KV Cache Competition to Enhance User Experience in LLM Inference (CacheOPT) | arXiv preprint | not used as quartile proof | 2025, arXiv | full abstract and system-design loci | Covers estimated output-length KV allocation, global reserve, and preemption control. |
| BOUNDARY_OR_NEGATIVE_ANCHOR | Robust KV Cache Management under Output Token Length Uncertainty | arXiv preprint | not used as quartile proof | 2026, arXiv | formulation, guarantees, baselines, trace evaluation | Covers reservation/admission as a DRO/critical-fractile optimization problem. |
| DOMAIN_NEIGHBOR | TOPAS: Workflow-Aware Prefix-State Scheduling | arXiv preprint | not used as quartile proof | 2026, arXiv | full abstract, related-work and evaluation loci | Covers joint prefix-state/request scheduling under cache budget. |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | KV preemption and prefix-aware capacity are important | All anchors address consequential serving bottlenecks | none | strong problem |
| Contribution type | hard reservation contract plus unspecified online selector | vLLM/Sarathi introduce concrete mechanisms; Robust KV gives a formal optimizer | mechanism delta not frozen | fatal |
| Nearest-prior delta | hard guarantee beyond SGLang heuristic | SGLang already uses cap-aware future KV budgeting; CacheOPT/Robust cover reservation | residual is conservative exact mode | fatal |
| Algorithm/mechanism substance | generic cap-sum/set-union packing | anchors define new allocator/scheduler/optimization | no new structure, bound, or algorithm | fatal |
| Baseline strength/fairness | baseline list is broad | requires native SGLang ratio/clip grid and exact cap-sum | Discovery omitted strongest current native action | repaired in review, still fatal |
| Natural workload/platform | proposed vLLM/Mooncake/BurstGPT/Azure route | anchors use real traces/platforms | public traces lack declared cap plus prefix provenance | fatal |
| Full-cost coverage | good conceptual ledger | anchors report latency/throughput/cost tradeoffs | rejection/starvation/cap incentives also needed | major |
| Main result/statistics | none required at Stage 0 | anchors have extensive results | not itself fatal | open |
| Ablation/mechanism evidence | finite small-state oracle proposed | anchors isolate concrete mechanisms | likely proves generic equivalence, not candidate gain | fatal risk |
| Scale/generalization | single GPU only | anchors span models/hardware/distributed settings | acceptable for Q2 only if mechanism is strong | major |
| Failure boundary | loose caps/no sharing correctly named | Robust KV directly shows fixed/max reservation regime dependence | likely broad no-gain region | major |
| Artifact/reproducibility | public runtimes available | vLLM/SGLang open source | exact cap-bearing natural packet absent | fatal |

## Reviewer-shape assessment

- Editor/venue-fit view: important operational problem but contribution would read as a strict configuration/contract around an existing scheduler budget.
- Methodology view: no-output-leakage is well specified, yet the named public traces cannot instantiate it because they store realized lengths rather than arrival-time declared caps.
- Domain-contribution view: vLLM does not reserve future output caps, but SGLang already covers the core cap-aware future-budget action; TOPAS/Preble cover prefix-aware selection.
- Devil's-advocate view: if caps are tight, static cap-sum is already strong; if caps are loose, the hard guarantee strands memory. The proposed online selector has no specified lever that escapes this dichotomy.

## Decision

- Quality tier: `BELOW_Q2_STOP`
- Status: `PARITY_NOT_PLAUSIBLE`
- Closed gaps: current vLLM/SGLang source reality, collision union, comparator set, hard-guarantee semantics, and public trace schema.
- Executable next gaps: none within this stopped topic.
- Human/resource-dependent gaps: none; Linux/CUDA availability is not the scientific blocker.
- Bounded near-Q1 gaps: none.
- Gap that would invalidate the paper: lack of a nontrivial post-subtraction algorithm/mechanism and lack of a non-leaking natural evidence carrier; both are present.
- Why this is calibration rather than novelty or baseline evidence: the matrix compares contribution/evaluation shape; novelty is separately decided by the current-source and collision audit.
- Why Tier B, if applicable, still closes same-object, latest-collision, fair-baseline, natural-evidence, full-cost and reproducibility gates: not applicable; Tier B is denied because the natural-evidence and nontrivial-contribution gates fail.

