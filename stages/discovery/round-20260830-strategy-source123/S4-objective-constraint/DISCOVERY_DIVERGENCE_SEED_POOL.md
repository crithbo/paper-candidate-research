# SOURCE123 S4 Discovery Divergence Seed Pool

## Pool metadata

- Assignment / lane: `DISCOVERY-S4-20260830-SOURCE123 / DISCOVERY_S4`
- Frozen profile: `EXACT_PUBLIC_CARRIER_FIRST / OBJECTIVE_CONSTRAINT / gpt-5.6-sol high`
- Frozen before first source call: `YES`
- Seed ceiling: `8 <= 12`
- RQ candidate ceiling after convergence: `1 <= 8`
- Network-security exclusion check: `PASS`
- Generation completed before evidence lookup: `YES`
- Scientific status: non-evidence seed portfolio; no novelty, current-absence, Q2, or feasibility claim.

## Seed records

### `S4-123-SEED-01` — vLLM V1 CUDA Graph capture portfolio

- Engine / perspective: `CONSTRAINT_MANIPULATION / COMPILER_OR_BACKEND_ENGINEER`
- Exact public anchor candidate: current official vLLM V1 `CompilationConfig` and CUDA Graph dispatcher, version to be pinned from official source.
- Idea sketch: Treat the set of captured batch sizes as a finite resource-allocation action under graph-memory and startup/capture-time budgets. Ask whether the current default capture-size portfolio is dominated for finite-horizon single-GPU serving once capture cost, graph memory, latency, and uncaptured fallbacks share one denominator.
- Counterfactual consequence: change the capture-size portfolio selected before serving, without changing model outputs or request semantics.
- Generic/current-union risk: high; may collapse to an exposed configuration knob or ordinary autotuning if current source already contains the same objective/action.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`.

### `S4-123-SEED-02` — PyTorch compiled LLM finite-horizon mode selection

- Engine / perspective: `PROBLEM_REFRAMING / OPERATOR`
- Exact public anchor candidate: official PyTorch `torch.compile` inference modes and regional compilation examples.
- Idea sketch: Reframe steady-state speed selection as a finite-session objective including first compile, recompiles, cache residency, peak memory, and request latency. The candidate action would select compilation granularity/mode before a bounded session horizon.
- Counterfactual consequence: change whether and how a model is compiled for a known request horizon.
- Generic/current-union risk: very high; likely measurement-only or ordinary mode selection.
- Preliminary disposition: `BACKLOG_NOT_ELIGIBLE_FOR_RESULT_AWARE_REPLACEMENT`.

### `S4-123-SEED-03` — TensorRT-LLM token-budget constrained scheduler

- Engine / perspective: `CONSTRAINT_MANIPULATION / RUNTIME_MAINTAINER`
- Exact public anchor candidate: official TensorRT-LLM in-flight batching scheduler and `max_num_tokens` configuration.
- Idea sketch: Freeze token-capacity as a hard memory constraint and test whether a target-native admission/scheduling action changes latency-throughput Pareto efficiency relative to current policy.
- Counterfactual consequence: alter batch admission/order while preserving request and output semantics.
- Generic/current-union risk: likely absorbed by current scheduler policies or generic queue scheduling.
- Preliminary disposition: `BACKLOG_NOT_ELIGIBLE_FOR_RESULT_AWARE_REPLACEMENT`.

### `S4-123-SEED-04` — llama.cpp microbatch/full-batch memory frontier

- Engine / perspective: `COMPOSE_DECOMPOSE_SIMPLIFY / OPERATOR`
- Exact public anchor candidate: official llama.cpp server and `llama-bench` batch/microbatch controls.
- Idea sketch: Separate prompt-processing batch and microbatch decisions under a fixed single-GPU memory ceiling, with latency and throughput measured on the same request stream.
- Counterfactual consequence: choose batch decomposition instead of a single batch-size knob.
- Generic/current-union risk: ordinary tuning unless a nonseparable target-native mechanism survives.
- Preliminary disposition: `BACKLOG_NOT_ELIGIBLE_FOR_RESULT_AWARE_REPLACEMENT`.

### `S4-123-SEED-05` — vLLM sleep/wake memory-release frontier

- Engine / perspective: `JANUSIAN_TENSION / OPERATOR`
- Exact public anchor candidate: official vLLM sleep-mode API and implementation.
- Idea sketch: Quantify and act on the tension between released GPU memory and wake-up/reload latency for colocated single-GPU workflows.
- Counterfactual consequence: choose sleep level/timing under a memory-release target.
- Generic/current-union risk: deployment-specific policy or already-defined two-level API; natural colocated carrier may be unavailable.
- Preliminary disposition: `BACKLOG_NOT_ELIGIBLE_FOR_RESULT_AWARE_REPLACEMENT`.

### `S4-123-SEED-06` — exact-output KV offload boundary

- Engine / perspective: `BOUNDARY_OR_FAILURE / RUNTIME_MAINTAINER`
- Exact public anchor candidate: official runtime CPU KV offload controls with exact, non-quantized semantics.
- Idea sketch: Treat GPU-memory release as a constraint and derive a latency/full-cost boundary for exact-output KV offload on one GPU plus CPU.
- Counterfactual consequence: choose offload extent before or during serving.
- Generic/current-union risk: overlaps S2 portfolio and generic tiering; not selected in S4.
- Preliminary disposition: `BACKLOG_OVERLAP_OTHER_LANE`.

### `S4-123-SEED-07` — compiler cache cold-start budget

- Engine / perspective: `ABSTRACTION_LADDER / COMPILER_OR_BACKEND_ENGINEER`
- Exact public anchor candidate: official torch.compile/Inductor cache controls and documented cache artifacts.
- Idea sketch: Select a cache materialization policy under storage and startup budgets while preserving exact compiled semantics.
- Counterfactual consequence: choose which artifacts to retain/prewarm.
- Generic/current-union risk: overlaps recently active TorchDynamo guard/cache families and ordinary cache policy.
- Preliminary disposition: `EXCLUDED_ACTIVE_OR_RECENT_IDENTITY_RISK`.

### `S4-123-SEED-08` — canonical benchmark cold-start validity

- Engine / perspective: `NEGATION_OR_INVERSION / MEASUREMENT_REVIEWER`
- Exact public anchor candidate: official runtime benchmark harnesses that omit or separate initialization/warmup.
- Idea sketch: Ask whether excluding initialization reverses configuration rankings for short-lived single-GPU inference sessions.
- Counterfactual consequence: change benchmark conclusion and deployment choice, not claim natural deployment prevalence.
- Generic/current-union risk: measurement validity may lack a nontrivial mechanism and could overlap Source120 MLPerf measured/inferred work.
- Preliminary disposition: `EXCLUDED_BY_FROZEN_PORTFOLIO_BOUNDARY`.

## Clustering and convergence

| Cluster | Seeds | Shared object | Material distinction | Frozen outcome |
|---|---|---|---|---|
| Graph/compile startup | 01, 02, 07 | compiled inference startup/runtime | capture-size portfolio vs mode/cache choice | select 01 only |
| Runtime resource Pareto | 03, 04, 05, 06 | memory-constrained serving | scheduling, microbatching, sleep, offload | backlog only |
| Benchmark validity | 08 | finite-horizon ranking | conclusion endpoint rather than runtime action | excluded by portfolio boundary |

## Coverage-constrained convergence

- Selected seed: `S4-123-SEED-01`.
- Why: it has a named current runtime/compiler carrier, a target-native finite action (capture-size portfolio), an immutable same-output contract, a concrete full-cost boundary, and a canonical public serving route. It also has a cheap fatal test: current source may already optimize the same action/objective, in which case the family closes honestly.
- Primary RQ artifact: `DISCOVERY_RQ_CANDIDATE.md`.
- Result-aware backfill: `FORBIDDEN`; seeds 02–08 remain non-evidence backlog and cannot replace seed 01 after source results.

