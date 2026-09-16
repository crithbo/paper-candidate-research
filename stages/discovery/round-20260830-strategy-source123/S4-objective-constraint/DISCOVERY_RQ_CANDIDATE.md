# SOURCE123 S4 Research Question Candidate

## Identity

- RQ candidate ID: `S4-123-RQ01`
- Discovery lane / assignment: `DISCOVERY_S4 / DISCOVERY-S4-20260830-SOURCE123`
- Divergence seed ID/path: `S4-123-SEED-01 / DISCOVERY_DIVERGENCE_SEED_POOL.md`
- Tentative public object: current official vLLM V1 CUDA Graph capture configuration and dispatch path.
- Exact public anchor candidate: official vLLM documentation and upstream source defining `CompilationConfig.cudagraph_capture_sizes`, CUDA Graph modes, capture-size selection, and dispatch/fallback; exact version/commit to be pinned from the first official source closure.
- Stable object and immutable guarantee envelope: same vLLM V1 single-GPU model, same request stream, same model outputs and decoding semantics; only the pre-serving capture-size portfolio may change.
- Decision-relevant counterfactual consequence: which finite batch sizes are graph-captured before serving under fixed graph-memory and startup/capture budgets.
- Contribution type hypothesis: `COMPILER_TOOL` with a possible `MEASUREMENT_CHARACTERIZATION` subtractor.

## Frozen primary research question

> For current vLLM V1 single-GPU serving, can a result-independent, target-native selection of CUDA Graph capture sizes improve the finite-horizon latency-throughput frontier under joint graph-memory and capture/startup-cost constraints, compared with the current default capture-size portfolio, while preserving identical request and output semantics?

No alternate RQ is frozen. A fatal/current-union result closes this RQ; it does not authorize a replacement topic.

## Scope and answerability

- In scope: official current vLLM V1 CUDA Graph configuration/dispatcher; one public single-GPU serving harness; batch-size capture portfolio; capture/warmup wall time, graph-associated memory, request latency/throughput, fallback incidence, and total finite-horizon cost.
- Out of scope: model quantization, output-quality changes, multi-node/multi-GPU serving, KV-cache replacement/offload, MLPerf measured/inferred pairing, LeRobot AoI, build or experiment in Discovery.
- Immutable semantic boundary: same model, weights, request order/content, sampling/decoding settings, output semantics, device, and runtime version.
- Candidate action: choose a finite capture-size set before any serving results; dispatch behavior remains native vLLM.
- Minimum falsifier: current official source already implements the same constrained portfolio-selection objective/action, or the dispatcher accepts arbitrary sizes without a meaningful capture-memory/startup tradeoff, leaving only routine knob tuning.
- Evidence route: official docs plus upstream source for current reality; official benchmark/workload entry for canonical carrier; strongest current baseline is the exact upstream default plus exhaustive-small/offline oracle only as a ceiling at Stage A.

## FINER-lite scheduling assessment

- Feasible: `CONDITIONAL` — static source closure is bounded; empirical claim requires later Stage A, not Discovery.
- Interesting: `CONDITIONAL` — only if capture portfolios materially trade startup/memory against finite-horizon service cost.
- Novelty threat: `HIGH` — exposed capture controls, automatic size generation, or existing optimization can directly absorb the action.
- Ethical/scope fit: `PASS`.
- Relevant: `CLEAR` — the answer would change a concrete pre-serving configuration decision for memory-constrained single-GPU serving.

## Pre-evidence selection

- Selected for evidence lookup: `YES`.
- Selection reason: exact-carrier candidate and a cheap current-union fatal test exist.
- Alternative explanation/null: the upstream default is already a sufficient portfolio and any alternative is ordinary workload-specific tuning with no general mechanism.
- Precommitted primary source route: official `docs.vllm.ai` configuration/CUDA Graph documentation, then official `github.com/vllm-project/vllm` source for `CompilationConfig` and CUDA Graph dispatch.
- Precommitted transport-only fallback: alternate official docs version page or official raw GitHub view of the same source locus.
- Forbidden outcome-aware reformulation: changing to torch.compile mode choice, sleep mode, scheduler policy, KV offload, or benchmark-validity after seeing evidence.

## Pre-RQ closure nomination

- Nomination: `ORDINARY_CLOSURE`.
- Exact anchor and stable object/guarantee frozen: `YES` at project/symbol level; version/commit pending official source.
- Outcome-independent anchor question: What exact capture-size set does current vLLM generate/use, how is it dispatched, and what documented/source-level memory/startup tradeoff or automatic optimization already exists?
- Co-defined bundle: `carrier + atomic action + full-cost surfaces`.
- Named primary sources: `TWO` official surfaces (docs and upstream source).
- Known direct fatal: `NO_KNOWN_FATAL` before source lookup.
- Finite stop condition: docs plus source establish current action/union; if no official canonical carrier or non-generic residual survives, abstain.
- Requested model route: frozen lane `gpt-5.6-sol/high`; no subagent/selective-depth packet.
- Packet result: `NOT_RUN`.

## Disposition

`RQ_READY_FOR_ORDINARY_CLOSURE`

