# SOURCE123 S4 Type-Specific Deep Review

## Candidate

- Topic ID: `SOURCE123-S4-VLLM-CUDAGRAPH-CAPTURESET`
- Contribution type: `COMPILER_TOOL`
- Route: `N2`, with a supporting N3 law only if later held-out measurements establish one.
- Claim ceiling here: hypothesis and finite falsifier only; no performance, novelty, or Q2 result has been observed.

## Atomic-action survival

The candidate action is not “tune batch size” or “disable CUDA Graphs.” It freezes a calibration trace and budget before outcomes, measures or models the native cost of each eligible capture size, and chooses an ordered capture-size subset consumed unchanged by current vLLM. The current dispatcher then supplies the semantics: an observed token batch is mapped to a captured descriptor or to eager fallback. Model, request, output and backend semantics stay fixed.

This action survives the current default and manual knob at the level of mechanism: upstream uses a fixed dense pattern and exposes manual override, while the candidate is a result-independent selector under explicit startup/memory/horizon constraints. It does not yet survive as a paper contribution merely because a dynamic program can select breakpoints.

## Generic-kernel audit

With additive per-size costs and one-sided padding loss, the mathematical core resembles ordered facility selection, segmentation or knapsack. A paper whose only novelty is applying such a solver to `cudagraph_capture_sizes` is below the project bar.

The residual is admissible only if Stage 0/Stage A closes all three target-native elements:

1. native key multiplicity and validity constraints from CUDA Graph mode, uniform decode/speculation and LoRA specialization materially alter feasible portfolios;
2. capture memory/startup cost and padding/fallback service cost cannot be represented faithfully by an existing generic scalar tuner without new target-specific modeling;
3. a held-out public trace shows a stable, decision-changing frontier rather than one configuration win.

Failure of any element narrows the claim to measurement or yields `BELOW_Q2_STOP`.

## Current union and subtractors

### Current deployable union

- vLLM v0.28.0 default dense capture-size pattern and hardware-dependent maximum.
- Manual `cudagraph_capture_sizes` override.
- `cudagraph_mode` alternatives including `NONE`, `FULL_DECODE_ONLY`, `FULL_AND_PIECEWISE`.
- `enforce_eager` as no-graph baseline.
- `cudagraph_specialize_lora`, warmup count and current dispatcher padding/fallback.
- Official memory-guide small set `[1,2,4,8,16]`.

### Direct subtractor

Upstream issue #20098 already identifies unused eager captures, startup/space waste and an eager-subset plus lazy-remainder direction. It is closed as not planned and has no linked implementation, but it subtracts the broad problem statement and any claim that reducing or delaying capture is new. The candidate can claim only a concrete current-vLLM selection objective/action and its evidence.

### Strong paper subtractor

Foundry eliminates most online capture by persisting execution context and reconstructing graph templates, including on-demand specialization across sizes. It is stronger for elastic deployments that can afford an offline SAVE phase, deterministic allocation and roughly gigabyte-scale archives. It does not directly cover a no-archive, current-vLLM-compatible size-set choice under graph-memory and finite-horizon budgets. Any brief must state this assumption difference and compare or condition its claim rather than ignore Foundry.

### Method-adjacent subtractor

Prior CUDA Graph work already models capture/replay overhead and chooses batching granularity. Therefore the candidate cannot claim the generic principle that graph construction should be amortized.

## Fair baseline contract

1. Exact upstream v0.28.0 default, unchanged.
2. Official manually reduced `[1,2,4,8,16]` set under the same maximum and graph mode.
3. `enforce_eager` / no graphs.
4. A simple frequency/top-k set with the same graph-count or memory budget.
5. Lazy-capture baseline only if a faithful same-object implementation can be frozen before results; otherwise issue #20098 is positioning evidence, not an executable baseline.
6. Foundry only when its artifact and assumptions can be reproduced fairly; otherwise report a separate conditional ceiling.
7. Exhaustive subset oracle on the small witness, never presented as deployable.

No baseline may receive a smaller request set, different model outputs, ignored startup cost or a different memory denominator.

## Natural/canonical evidence route

- Natural route: official `BurstGPTDataset` timed trace, deterministically split into calibration and held-out segments before any candidate result.
- Canonical route: official ShareGPT or deterministic random dataset through `vllm bench serve`; claims limited to benchmark validity/feature performance unless natural trace results agree.
- Minimum panel: one small dense model fitting a single RTX 4070 if the runtime can be supported, plus one second model family if resources allow; no multi-GPU claim.
- Held-out rule: capture set is frozen from calibration data, then evaluated once on held-out trace/horizon. Reserve traces are frozen before results.

## Full-cost and reproducibility gates

Required denominators: capture/warmup and server-ready wall time, peak and resident GPU memory attributable to graphs, graph/key count, profiling/selection overhead, TTFT, TPOT, E2E and P99, throughput, padding/fallback counts, OOM/failure, and the exact finite horizon over which startup is amortized. Report absolute units and the complete request denominator.

Reproducibility requires the exact v0.28.0 commit/tag, model/weights hash, CUDA/PyTorch/vLLM environment, attention backend, graph mode, capture sets, request trace/split hash, commands, raw metrics, random seeds, GPU and driver. Discovery performed none of these runs.

## Fidelity and resource realism

- Fidelity state: `RESOURCE_BLOCKED_FIDELITY_GAP`.
- Reason: the authorized Discovery assignment forbids build/experiment, and the current project policy does not permit assuming a Linux/WSL vLLM CUDA environment. A single RTX 4070 is physically aligned, but exact official vLLM/CUDA execution availability is not frozen.
- Finite closure: Stage A can use an explicitly authorized official vLLM container/Linux host or another mainline-approved same-object environment; otherwise route to resource blocker or human reserve without scientific STOP.
- Stage A preclaim must first pin the exact dispatcher tag content, instrument full-cost producers, validate identical outputs and pass the exhaustive `1..64` oracle.

## Q1/Q2 shape audit

- Q2 hypothesis: plausible only as an integrated target-native profiler/selector plus held-out natural/canonical evaluation across multiple models/budgets, with clear superiority to default/manual/frequency baselines and honest Foundry assumption boundary.
- Q1 potential: not established. It would require a broadly stable law, multiple hardware/model families, an upstream-quality implementation and strong systems baselines including materialization/lazy approaches.
- Fatal path: equivalent optimizer in exact current source; direct same-assumption domination; generic segmentation only; no held-out frontier gain; or full-cost reversal.

## Decision

`PROPOSE_STAGE0 / TIER_B_Q2_VIABLE_CONDITIONAL`.

This is a clean brief candidate because the exact object, action, current union, strongest subtractors, canonical/natural route, full-cost boundary and finite falsifier are all named. It is not a claim that the method is new or that it works.

