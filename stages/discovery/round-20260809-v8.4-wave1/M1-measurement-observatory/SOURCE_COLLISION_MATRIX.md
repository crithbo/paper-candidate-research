# Source and collision matrix — M1 wave 1

Accessed on `2026-08-09`. Primary papers and official/project sources are listed below. Source presence means only that the artifact or stated claim was verified; it does not elevate a result above its stated evidence conditions.

| ID | Primary/official source | Role in screen | Verified object or claim | Direction impact |
|---|---|---|---|---|
| A1 | [ServeGen, arXiv:2505.09999](https://arxiv.org/abs/2505.09999) | Production-workload anchor | Characterizes cloud serving workloads and generates per-client workloads; reports under-provisioning avoided by its method | Absorbs generic realistic-workload generation/benchmark gap |
| A2 | [ServeGen official repository](https://github.com/alibaba/ServeGen) | Artifact metadata | Releases model-category distributions, rate traces, hashed multi-turn structure and offline traces | Confirms public natural-material route already exists |
| A3 | [TraceLab, arXiv:2606.30560](https://arxiv.org/abs/2606.30560) | Latest coding-agent anchor | Releases coding-agent sessions, LLM steps and tool calls; identifies tool-latency/KV management opportunities | Absorbs generic coding-agent characterization claim |
| A4 | [BurstGPT official repository](https://github.com/HPMLL/BurstGPT) | Independent trace counterweight | Public real LLM-serving traces with session and elapsed-time fields | Shows agent/serving trace release is not a single-source premise |
| A5 | [Qwen-Bailian anonymous traces](https://github.com/alibaba-edu/qwen-bailian-usagetraces-anon) | Trace/replay artifact | Scenario-specific KV-cache traces plus timestamp-faithful public replayer metadata | Absorbs generic trace-replay benchmark contribution |
| A6 | [vLLM benchmark documentation](https://docs.vllm.ai/en/latest/benchmarking/) | Deployment baseline | Supports dataset-driven and timed-trace serving benchmarks with detailed results | Strong current deployment baseline; not novelty evidence |
| A7 | [CacheWise, arXiv:2606.16824](https://arxiv.org/abs/2606.16824) | Nearest direct collision | Coding-agent traces + prefix-aware scheduling + tool-metadata reuse-aware eviction | `DIRECT_FATAL` for direction A's policy claim |
| A8 | [MORI, arXiv:2606.00866](https://arxiv.org/abs/2606.00866) | Direct competing mechanism | Relative-idleness ranking, HBM/DRAM placement and admission for tool-call windows | `DIRECT_FATAL` / alternate mechanism already implemented |
| A9 | [TokenCake, arXiv:2510.18586](https://arxiv.org/abs/2510.18586) | Direct competing mechanism | Event-driven offload and predictive upload during function-call stalls | `DIRECT_FATAL` for generic cache-stall policy |
| A10 | [Continuum, arXiv:2511.02230](https://arxiv.org/abs/2511.02230) | Direct competing mechanism | Tool-aware cache TTL plus program-level scheduling | `DIRECT_FATAL` for duration-aware retention/scheduling |
| B1 | [TokenPowerBench, arXiv:2512.03024](https://arxiv.org/abs/2512.03024) | Energy anchor and direct collision | GPU/node/system power; phase-aligned prefill/decode per-request attribution across configuration factors | `DIRECT_FATAL` for generic phase-aware energy benchmark |
| B2 | [The Illusion of Power Capping in LLM Decode, arXiv:2605.11999](https://arxiv.org/abs/2605.11999) | Mechanism collision | Phase-aware DVFS characterization and energy/performance frontiers across attention architectures | `DIRECT_FATAL` for generic energy-ranking correction |
| B3 | [Prefill/Decode-Aware Evaluation on Emerging AI Accelerators, arXiv:2606.17104](https://arxiv.org/abs/2606.17104) | Latest cross-platform collision | Common-model phase-separated GPU/accelerator evaluation and heterogeneous disaggregation | `DIRECT_FATAL` for generic phase-aware accelerator selector |
| B4 | [llama.cpp benchmark documentation](https://github.com/ggml-org/llama.cpp/blob/master/tools/llama-bench/README.md) | Boundary counter-evidence | States its measurements exclude tokenization and sampling | Supports full-boundary requirement; does not itself prove a new gap |

## Facet collision matrix

| Screened shape | Exact object | Candidate action/claim | Direct coverage | Collision class | Residual after subtraction | Decision |
|---|---|---|---|---|---|---|
| A: agentic trace realism + tool-gap-aware KV policy | Multi-turn coding/agent LLM serving sessions interrupted by external tool calls | Detect trace-induced ranking bias and choose retention/offload/prefetch/scheduling based on tool state/duration | CacheWise (tool metadata + reuse eviction), MORI (idleness placement), TokenCake (predictive offload/upload), Continuum (TTL + scheduling), TraceLab (natural workload characterization) | `DIRECT_FATAL` | None without a new semantics-changing primitive or independent formal action/guarantee | `DROP` |
| B: phase-aware energy / accelerator ranking correction | LLM inference prefill and decode across configurations/platforms | Show aggregate metrics hide rankings; recommend phase-specific setting/platform selection | TokenPowerBench (phase energy benchmark), Illusion (phase energy/DVFS mechanism), Prefill/Decode-Aware Evaluation (cross-accelerator ranking) | `DIRECT_FATAL` | None for a generic measurement/selector claim | `DROP` |

## Strong-baseline and evidence-boundary notes

- Direction A must treat current vLLM timed-trace/dataset benchmark capability as a deployment baseline and compare cache-transfer cost, cache capacity, tool delay, request semantics, TTFT, job completion time and throughput under one locked contract.
- Direction B must separate source measurement stage (analytical, simulation, board/ASIC/silicon), cold/warm state, host/transfer and tokenization/sampling boundary. No raw accelerator comparison was performed here.
- `SEARCH_BOUNDED_OPEN` is the only permissible novelty status beyond the documented direct collisions. It is not a global-first claim.
