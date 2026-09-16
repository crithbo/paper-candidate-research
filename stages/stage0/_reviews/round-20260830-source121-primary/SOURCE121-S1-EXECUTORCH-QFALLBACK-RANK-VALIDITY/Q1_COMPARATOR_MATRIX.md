# SOURCE121-S1-EXECUTORCH-QFALLBACK-RANK-VALIDITY Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: empirical software engineering / mobile systems measurement (`TSE / TOSEM / JSS` or equivalent)
- Calibration status: `PARITY_CONDITIONAL`
- Quality tier: `TIER_B_Q2_VIABLE`
- Search/cutoff date: `2026-08-30`

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | ExecuTorch: A Unified PyTorch Solution to Run ML Models On-Device | MLSys 2026 Industry Track, published | top ML-systems conference equivalent | 2026; <https://proceedings.mlsys.org/paper_files/paper/2026/hash/236f915dd02af4f11927f67330b21d4b-Abstract-Conference.html> | abstract, architecture, backend-delegate and evaluation extracts | Defines the same system object and subtracts framework/tool/performance novelty. |
| EVALUATION_ANCHOR | nn-Meter: Towards Accurate Latency Prediction of Deep-Learning Model Inference on Diverse Edge Devices | MobiSys 2021, Best Paper | top mobile-systems conference equivalent | 2021; <https://www.microsoft.com/en-us/research/publication/nn-meter-towards-accurate-latency-prediction-of-deep-learning-model-inference-on-diverse-edge-devices/> | abstract, method, devices, scale and reported accuracy | Calibrates held-out predictive validity, execution-unit features and large-scale evaluation. |
| DOMAIN_NEIGHBOR | MLPerf Mobile Inference Benchmark | MLSys 2022, published | top ML-systems benchmark paper equivalent | 2022; <https://proceedings.mlsys.org/paper_files/paper/2022/file/a2b2702ea7e682c5ea2c20e8f71efb0c-Paper.pdf> | benchmark design, full-SUT timing, quality/run rules | Establishes canonical full-system measurement and quality-threshold discipline across mobile stacks. |
| BOUNDARY_OR_NEGATIVE_ANCHOR | LiteRT Delegate Performance Benchmark | current official benchmark tool, not novelty paper | deployment baseline | current; <https://github.com/google-ai-edge/LiteRT/tree/main/tflite/tools/benchmark/experimental/delegate_performance/android> | README/tool scope | Shows delegate startup/stable-latency measurement already exists outside ExecuTorch; dashboarding alone is insufficient. |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | configuration selection for heterogeneous edge runtime | all anchors establish edge latency/tool importance | one-framework scope | Q2 plausible |
| Contribution type | proxy/ranking validity panel | nn-Meter predicts latency; MLPerf defines complete benchmark truth | ranking rather than absolute prediction is narrower | conditional |
| Nearest-prior delta | ExecuTorch fallback-boundary/full-cost rank audit | ExecuTorch paper/tools expose observables but no held-out rank conjunction | search-bounded novelty | survives |
| Algorithm/mechanism substance | boundary/partition trace features and rank estimator | nn-Meter has stronger learned kernel predictor | candidate must remain nontrivial and held out | Stage A killer |
| Baseline strength/fairness | native delegation share/subgraphs/delegate time/end-to-end plus nn-Meter-style ceiling | strong named proxies | implementation pending | finite |
| Natural workload/platform | three official public small LLMs on CPU/XNNPACK | MLPerf/nn-Meter are broader | canonical benchmark only | Tier B ceiling |
| Full-cost coverage | export through validation and observer effect | MLPerf full-SUT and ExecuTorch lifecycle | unobserved | mandatory |
| Main result/statistics | none at Stage 0 | anchors provide large evaluations | major future gap | allowed conditionally |
| Ablation/mechanism evidence | remove boundary/partition/init/observer features | nn-Meter ablates detection/sampling | predeclared, not run | finite |
| Scale/generalization | 3 models, 3+ configs, one CPU target | anchors cover many devices/models | narrower than Q1 | Q2 only |
| Failure boundary | full delegation, identical partitions, coarse trace, observer-effect rank change | candidate has explicit falsifiers | needs execution | strong plan |
| Artifact/reproducibility | exact commit/models/configs/traces/manifest | all anchors emphasize public/canonical artifacts | pending | feasible |

## Reviewer-shape assessment

- Editor/venue-fit view: viable as a focused Q2 measurement paper if the public panel changes a selection decision or establishes a validated safe-proxy region; not viable as an Inspector dashboard.
- Methodology view: profiling-off end-to-end rank must be the truth; boundary features cannot be circularly derived from that truth.
- Domain-contribution view: current ExecuTorch's rapid backend/quantization growth makes proxy validity timely, but one CPU target limits generality.
- Devil's-advocate view: if delegation share already predicts every cell, the paper collapses; this is correctly the first Stage A killer.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE`
- Status: `PARITY_CONDITIONAL`
- Closed gaps: exact object, current source/tool union, public three-model panel, quality contract, named proxies and finite falsifier.
- Executable next gaps: demonstrate legal config variation, trace attribution, observer-effect control and one held-out model.
- Human/resource-dependent gaps: none decisive for CPU-first Stage A; real phone/NPU evidence would only raise the ceiling.
- Bounded near-Q1 gaps: multiple devices/backends, larger model families, energy/thermal evidence and independent replication.
- Gap that would invalidate the paper: no held-out rank improvement or no decision-changing information beyond native proxies.
- Why this is calibration rather than novelty or baseline evidence: the anchors set expected paper/evaluation depth; novelty is independently judged from the same-object collision search.
- Why Tier B still closes the hard gates conditionally: same object and quality threshold, current strong baselines, official canonical inputs, full-cost dimensions and exact reproducibility path are all frozen; Stage A must still falsify the key premise.
