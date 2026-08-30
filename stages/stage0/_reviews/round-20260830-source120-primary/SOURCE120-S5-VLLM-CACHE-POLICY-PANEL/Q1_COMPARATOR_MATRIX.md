# SOURCE120-S5-VLLM-CACHE-POLICY-PANEL Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: none retained
- Calibration status: `PARITY_NOT_PLAUSIBLE`
- Quality tier: `BELOW_Q2_STOP`
- Search/cutoff date: `2026-08-30`

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | KVCache Cache in the Wild: Characterizing and Optimizing KVCache Cache at a Large Cloud Provider | USENIX ATC 2025, published | top systems conference equivalent | 2025; <https://www.usenix.org/conference/atc25/presentation/wang-jiahao> | paper abstract, trace table, characterization and policy contribution | Directly studies workload-dependent KV-cache policy, production trace requirements and vLLM integration. |
| EVALUATION_ANCHOR | UniCache: Unifying Prefix Cache Eviction for Heterogeneous LLM Serving Workloads | PACM/POMACS, SIGMETRICS 2026, published | top measurement/performance venue equivalent | 2026; <https://jxing.me/pdf/unicache-sigmetrics26.pdf> | full-paper extracted methods, workloads, baselines and main results | Runs the policy panel the candidate proposes, at broader workload/model/capacity depth. |
| DOMAIN_NEIGHBOR | Mooncake: Trading More Storage for Less Computation—A KVCache-centric Architecture for Serving LLM Chatbot | FAST 2025, Best Paper | top storage/systems conference equivalent | 2025; <https://www.usenix.org/conference/fast25/presentation/qin> | official abstract, architecture, trace/evaluation and cache-management sections | Establishes real tiered KV storage, trace carrier and system full-cost/SLO evidence. |
| BOUNDARY_OR_NEGATIVE_ANCHOR | ARC: A Self-Tuning, Low Overhead Replacement Cache | FAST 2003, published | foundational top storage conference | 2003; <https://www.usenix.org/conference/fast-03/presentation/arc-self-tuning-low-overhead-replacement-cache> | abstract, method and multi-trace evaluation | Shows that ARC/LRU cross-workload comparisons and scan resistance are classical, not new by themselves. |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | current vLLM offload policy choice | all anchors show KV-cache importance | important but already studied | insufficient alone |
| Contribution type | benchmark validity / rank stability | ATC25 and UniCache already characterize workload/policy sensitivity | no new estimand | fatal Q2 gap |
| Nearest-prior delta | new native CPU/tiered API and three public carriers | UniCache uses vLLM and a broader policy panel; ATC25 audits ShareGPT/Mooncake | medium/version reproduction only | below Q2 |
| Algorithm/mechanism substance | no new policy; standard LRU/ARC/LFU/GDSF | anchors propose ARC/UniCache/workload-aware policy and theory | none | fail |
| Baseline strength/fairness | LRU/ARC/simple policy/OPT | UniCache includes stronger panel and OPT | feasible but derivative | no rescue |
| Natural workload/platform | ShareGPT content + synthetic time; Mooncake time/hash topology; synthetic prefix | ATC25 provides richer production traces; Mooncake real deployment | weaker natural evidence | fail |
| Full-cost coverage | proposed CPU/secondary-tier transfer and serving metrics | Mooncake/ATC25/UniCache report system/hit/latency costs | unobserved and narrow | executable but not novel |
| Main result/statistics | none at Stage 0 | anchors provide published results and stable findings | complete gap | cannot be demanded at Stage0, but shape remains absorbed |
| Ablation/mechanism evidence | carrier and capacity panel | UniCache already performs workload/capacity/model/hardware comparison | duplicated | fail |
| Scale/generalization | one engine, three carrier classes | anchors span production traces, seven tasks, mixed traces and multiple models | much narrower | fail |
| Failure boundary | high capacity/policy convergence/carrier synthesis | anchors already discuss trace and workload boundaries | no new boundary | fail |
| Artifact/reproducibility | current public API and traces | UniCache/open vLLM/Mooncake artifacts available | feasible | engineering value only |

## Reviewer-shape assessment

- Editor/venue-fit view: a clean current-version reproduction could be a useful artifact report or upstream benchmark, but not a Q2 research paper.
- Methodology view: ShareGPT and Mooncake must be treated as different evidence classes; ATC25 already makes the decisive trace-information argument.
- Domain-contribution view: current native offload policy support is a software event, not a scientific contribution.
- Devil's-advocate view: the paper's expected headline—policy rankings depend on workload/carrier/capacity—is already a published figure and conclusion.

## Decision

- Quality tier: `BELOW_Q2_STOP`
- Status: `PARITY_NOT_PLAUSIBLE`
- Closed gaps: exact current object, public implementation, policy interface and finite replay path.
- Executable next gaps: none authorized for this ID.
- Human/resource-dependent gaps: none.
- Bounded near-Q1 gaps: not applicable.
- Gap that would invalidate the paper: already present—no nontrivial scientific residual after current-union subtraction.
- Why this is calibration rather than novelty or baseline evidence: the anchors define the accepted depth and also reveal direct subtraction; they are not candidate results.
- Why Tier B is not reached: same-object feasibility, full-cost and reproducibility cannot compensate for an already-established measurement endpoint and weaker natural-evidence panel.
