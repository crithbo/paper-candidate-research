# SOURCE123-S4-VLLM-CUDAGRAPH-CAPTURESET Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: LLM serving/runtime systems and performance engineering
- Calibration status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Quality tier: `TIER_B_Q2_VIABLE`
- Search/cutoff date: `2026-08-30`

## Reference set

| Role | Paper/source | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Efficient Memory Management for Large Language Model Serving with PagedAttention | SOSP 2023 | premier systems / Q1-equivalent | 2023, [ACM DOI](https://doi.org/10.1145/3600006.3613165) | system mechanism, public artifact, model/workload breadth, latency-throughput evidence | exact vLLM domain and systems-paper bar |
| EVALUATION_ANCHOR | Medusa: Accelerating Serverless LLM Inference with Materialization | ASPLOS 2025 | premier architecture/systems / Q1-equivalent | 2025, [author PDF](https://minhui-xie.github.io/papers/asplos25-medusa.pdf) | 10 models, ShareGPT, A100, cold-start stages, CUDA Graph materialization and tail latency | closest peer-reviewed cold-start/CUDA-Graph evaluation shape |
| DOMAIN_NEIGHBOR | Foundry: Template-Based CUDA Graph Context Materialization for Fast LLM Serving Cold Start | 2026 preprint + public artifact | current strong source; venue not used to inflate tier | 2026, [paper](https://arxiv.org/abs/2604.06664), [artifact](https://github.com/foundry-org/foundry) | vLLM integration, broad dense/MoE configs, graph templates, restoration assumptions and throughput | strongest current mechanism subtractor |
| BOUNDARY_OR_NEGATIVE_ANCHOR | TensorRT-LLM CUDA Graph batch-size tuning study | official current technical study | not peer reviewed; baseline/boundary evidence only | 2026, [official study](https://nvidia.github.io/TensorRT-LLM/1.3.0rc14/blogs/tech_blog/blog20_Tuning_CUDA_Graph_Batch_Sizes_for_Higher_Output_Throughput.html) | fixed-size grids, padding, graph memory, KV capacity, startup and future auto-tuning | closest same-action empirical evidence on another runtime |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | finite-horizon CUDA Graph startup-memory-service tradeoff in vLLM | Medusa/Foundry/TRT study show material costs | prevalence on target public GPU unmeasured | important and current |
| Contribution type | integrated profiler + budgeted native selector + held-out benchmark | anchors deliver concrete runtime mechanisms/artifacts | no implementation/result | Q2 conditional |
| Nearest-prior delta | trace-conditioned vLLM subset under two budgets | native manual/interactivity; lazy; materialization; TRT fixed grids | residual is narrow | survives direct-fatal audit |
| Algorithm/mechanism substance | target-native legality/multiplicity/KV coupling plus ordered optimization | generic 1-D DP is known | must prove target features matter | decisive killer |
| Baseline strength/fairness | full v0.28 native union + frequency/lazy/materialization/oracle | anchors compare strong systems | faithful lazy/Foundry availability uncertain | conditional baselines explicit |
| Natural workload/platform | BurstGPT chronological trace; public single CUDA GPU | Medusa uses ShareGPT/A100; Foundry uses H/B200 | one consumer GPU limits generality | adequate for Tier B with claim ceiling |
| Full-cost coverage | startup, graph memory/KV capacity, service, observer and horizon | TRT study explicitly measures core tradeoff | no candidate ledger/result | finite gap |
| Main result/statistics | none | anchors report broad repeated gains | complete gap | Stage A only probes premise |
| Ablation/mechanism evidence | native-vs-generic features, horizons, budgets, trace shift | anchors provide component breakdowns | none yet | mandatory |
| Scale/generalization | planned ≥8 models, 3 families, 2 carriers, 3 horizons/budgets | Medusa 10 models; Foundry 15 configs | no second GPU | Tier B only |
| Failure boundary | long horizon, loose memory, archive availability, distribution shift | lazy/Foundry/TRT expose competing regimes | must be measured | explicit |
| Artifact/reproducibility | exact tag, observer, selector, splits, raw ledger | vLLM/Foundry artifacts public | candidate artifact absent | open |

## Reviewer-shape assessment

- Editor/venue-fit view: viable Q2 only as an integrated vLLM tool plus held-out full-cost study; a “best list of batch sizes” note is below Q2.
- Methodology view: chronological holdout, descriptor instrumentation and graph-memory→KV-capacity accounting are mandatory; BurstGPT request rows cannot be used as direct batch descriptors.
- Domain-contribution view: v0.28.0 interactivity heuristic and TensorRT evidence substantially narrow novelty but also provide strong fair baselines and validate importance.
- Devil's-advocate view: the selector may be ordinary 1-D facility location with vLLM labels, and Foundry may erase startup pressure. The proposed killer can decisively expose either failure.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE`; no Tier-A label.
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Closed gaps: exact tag source/dispatcher, atomic action, bounded current union, direct-fatal audit, public carrier, finite falsifier.
- Executable next gaps: exact commit pin, source-pinned instrumentation, Linux/CUDA resource, witness/oracle, held-out native comparison and full-cost ledger.
- Human/resource-dependent gaps: compatible Linux/CUDA environment only; scientific core remains automatable.
- Bounded near-Q1 gaps: second GPU architecture, production trace diversity, formal robustness guarantee and upstream-quality integration. These are not current Tier-A evidence.
- Gap that would invalidate the paper: no held-out Pareto gain beyond native/simple/generic baselines after full-cost charging.
- Why this is calibration rather than novelty or baseline evidence: venue papers define evaluation depth; exact source/current systems independently define collision and baselines.
- Why Tier B can close the hard gates: the exact vLLM action and public carriers are finite; one-GPU claims can remain appropriately bounded while still closing same-object, latest collision, strong baselines, natural evidence, full cost and reproducibility.

