# LEROBOT-AOI-SLO-RUNTIME-REV0 Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: robotics systems / ML systems / real-time and embedded systems
- Calibration status: `PARITY_CONDITIONAL`
- Quality tier: `TIER_B_Q2_VIABLE`
- Search/cutoff date: `2026-08-30`

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Real-Time Execution of Action Chunking Flow Policies | NeurIPS 2025 main track | premier conference / Q1-equivalent | 2025, official proceedings + full text | method, baselines, simulator and real-robot evaluation, limits | closest accepted paper showing the substance and evidence expected for asynchronous action-chunk execution |
| EVALUATION_ANCHOR | LeRobot: An Open-Source Library for End-to-End Robot Learning | ICLR 2026 | premier conference / Q1-equivalent | 2026, official OpenReview/arXiv | generalized async stack, supported models, latency tables, inference appendix | exact platform and reproducibility/evaluation-shape anchor |
| DOMAIN_NEIGHBOR | Diffusion Policy: Visuomotor Policy Learning via Action Diffusion | International Journal of Robotics Research 44(10–11) | established top robotics journal; Q1-equivalent calibration | 2025, official SAGE/IJRR | action-chunk/receding-horizon formulation and 15-task/4-benchmark evaluation | anchors the multi-task, real/sim and artifact depth expected in a mature robotics paper |
| BOUNDARY_OR_NEGATIVE_ANCHOR | ActFovea; RAPID; A2C2; FutureRTC; StreamingVLA; FlashVLA | 2025–2026 current preprints / accepted status where stated | not used as quartile evidence | primary arXiv/full text and official repositories | direct-subtract mechanisms and evaluation boundaries | defines the dense current collision frontier; not used to inflate venue parity |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | fresh, continuous remote VLA control on a widely used open stack | RTC and LeRobot establish high latency and async deployment as central | residual is narrower than either anchor | adequate for Q2 if mechanism survives |
| Contribution type | protocol/runtime algorithm + profiler/benchmark | RTC has a concrete inference algorithm; LeRobot has a full reusable stack | candidate algorithm is not implemented or experimentally distinguished | conditional |
| Nearest-prior delta | explicit low-information contributor-age SLO on LeRobot | ActFovea/RAPID/A2C2/FutureRTC already cover many adjacent actions | broad safeguarding/adaptive-refresh claims are unavailable | narrowed residual only |
| Algorithm/mechanism substance | provenance-aware joint dispatch/admission with constrained fallback | RTC has formalized inpainting; AoI/UoI literature has threshold/index policies | must exceed generic thresholding and scalar tuning | first Stage A killer |
| Baseline strength/fairness | full g-grid, jointly tuned static config, latency-adjusted static, RTC where fair | RTC compares naive async/BID/TE/sync; LeRobot exposes tuning knobs | must account for fps/actions-per-chunk/aggregation and request budget | finite |
| Natural workload/platform | public LeRobot tasks with actual same-host timing; LAN/robot later | RTC includes 6 real tasks and LAN plus injection; LeRobot paper uses same-machine client/server | no measured timing/task joined corpus yet | canonical ceiling until collected |
| Full-cost coverage | calls, bytes, GPU, queue, discard, idle/hold, age, success | RTC reports model latency, throughput and task outcomes; LeRobot reports model latency/memory | candidate has only a ledger plan | open |
| Main result/statistics | none | RTC uses 2048 simulated rollouts/point and real trials; Diffusion Policy spans 15 tasks | complete gap | Stage A only tests premise |
| Ablation/mechanism evidence | equal-occupancy/different-age signature proposed | RTC isolates soft masking and delay; current papers isolate modules | no evidence | open |
| Scale/generalization | model-agnostic hypothesis | LeRobot supports diverse policies; anchors evaluate multiple settings | needs at least two policies or narrower claim | bounded |
| Failure boundary | deterministic delay/age-insensitive tasks/static threshold parity declared | RTC and current papers discuss delay/horizon limits | must be measured, not narrated | open |
| Artifact/reproducibility | proposed component, sidecar schema, checker, trace splits | LeRobot and Diffusion Policy provide public code/data | no candidate artifact | open |

## Reviewer-shape assessment

- Editor/venue-fit view: a Q2 systems/robotics paper is plausible if the work becomes a reusable LeRobot component and benchmark; a thin “replace threshold with AoI” paper is out of scope.
- Methodology view: the strongest contribution is not the age metric itself, but provenance semantics for overlapping aggregated action chunks plus a constrained online control rule and full-cost evaluation.
- Domain-contribution view: the exact open-stack carrier and policy-agnostic interface are valuable, but canonical simulator-only evidence imposes a ceiling.
- Devil's-advocate view: ActFovea and RAPID already provide adaptive re-query/discard/hold with richer signals, while generic AoI/UoI scheduling already supplies threshold/index machinery. The candidate must show that the low-information explicit SLO yields a distinct, useful Pareto point rather than rediscovering queue tuning.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE`
- Status: `PARITY_CONDITIONAL`
- Closed gaps: exact object, current native behavior, no direct-fatal source, finite low-information semantics route, named strong baselines, explicit failure boundary.
- Executable next gaps: provenance/clock witness; actual timing carrier; nontrivial controller; matched grid; equal-occupancy mechanism test; task/full-cost pilot.
- Human/resource-dependent gaps: real robot and physically distributed LAN evidence raise external-validity/Q1 ceiling but are not decisive for the first Stage A gate.
- Bounded near-Q1 gaps: multi-policy, multi-platform, real-robot natural traces, independent reproduction and a stronger theoretical/service contract. These are too large to label the current topic Q1-potential.
- Gap that would invalidate the paper: the controller collapses to static tuning/generic thresholding, requires richer semantic signals or protocol changes, or has no full-cost Pareto advantage.
- Why this is calibration rather than novelty or baseline evidence: the anchors define contribution/evaluation depth; novelty is decided by the separate current-union audit.
- Why Tier B still closes the hard gates conditionally: same object is pinned; the latest union was independently checked; strong baselines, natural/canonical evidence, full-cost and reproducibility have finite Stage A/B routes; no positive result is presumed.

