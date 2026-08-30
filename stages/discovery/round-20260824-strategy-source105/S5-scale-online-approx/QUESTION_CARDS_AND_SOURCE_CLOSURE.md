# Source105 S5 Question Cards and Ordinary Source Closure

## Scope

- Assignment: `DISCOVERY-S5-20260824-SOURCE105-PUBLIC-NDP-ROTATION-V1`
- Mode: ordinary carrier/current/contrary closure; selective depth `OFF`.
- Isolation: group repository and A3 Rule Audit output were not read. No resource-producing action occurred.
- Frozen exact non-revival surface was applied: generic llama.cpp lifecycle/speculative paths and generic placement policies were not recreated.

## Sources checked

- PowerInfer official repository: https://github.com/Tiiny-AI/PowerInfer
- PowerInfer paper: https://arxiv.org/abs/2312.12456 and author-hosted PDF https://ipads.se.sjtu.edu.cn/_media/publications/song-sosp24.pdf
- FlexGen official repository: https://github.com/Relaxed-System-Lab/FlexGen
- CoreInfer contrary route: https://arxiv.org/abs/2410.18311
- PowerInfer-2 public route: https://arxiv.org/abs/2406.06282

## Card dispositions

### `S5-105-QC01` — online hot-neuron residency

- Exact carrier: PowerInfer public CPU/GPU sparse-neuron execution.
- Current source: PowerInfer’s paper states that an offline solver determines the neuron-placement policy, then the online engine loads the model into CPU/GPU memory according to that policy.
- Minimum falsifier: a native mutable residency-update action with a same-output oracle.
- Result: `EARLY_FATAL / EXCLUDED_BEFORE_RAW`.
- Reason: the seed’s online residency update is not a source-defined same-object action. Replacing the offline policy with runtime migration changes the carrier.

### `S5-105-QC02` — predictor uncertainty and exact fallback

- Exact carrier: PowerInfer activation predictor and sparse CPU/GPU execution.
- Current/contrary: PowerInfer already uses adaptive predictors and neuron-aware sparse operators. CoreInfer supplies a stronger alternative that avoids per-token predictor calls by fixing sentence-level core neurons during decoding.
- Minimum falsifier: an uncertainty/fallback action not expressed by either current adaptive predictor route and with a fixed quality contract.
- Result: `EARLY_FATAL / EXCLUDED_BEFORE_RAW`.
- Reason: the frozen mechanism is predictor-guided sparse activation/fallback; its generic core is already in the current/strong contrary union.

### `S5-105-QC03` — co-activation residency graph

- Exact carrier: PowerInfer sparse neuron grouping/placement.
- Current evidence: public PowerInfer carrier and offline placement policy are established; no source-defined mutable group-residency action was found.
- Minimum falsifier: current source exposes an online group update that differs from generic graph partitioning.
- Result: `UNRESOLVED_BACKLOG / LOCATOR_ONLY`.
- Reason: co-activation recourse remains a generic graph-placement sketch, not a source-supported target-native action.

### `S5-105-QC04` — FlexGen placement metadata reconciliation

- Exact carrier: FlexGen CPU/disk/GPU offloading configuration.
- Current evidence: FlexGen’s documented `--percent` controls parameter, attention-cache and hidden-state offloading; its FAQ says strategies are manually tried and an automatic policy optimizer was future work.
- Minimum falsifier: a runtime placement-metadata mutation and a finite same-semantics witness.
- Result: `UNRESOLVED_BACKLOG / LOCATOR_ONLY`.
- Reason: the public carrier exposes static strategy configuration, not the frozen incremental reconciliation action; neither absence nor scientific failure is claimed.

### `S5-105-QC05` — sparse pipeline batch decomposition

- Exact carrier: PowerInfer predictor/gather/CPU-GPU sparse pipeline.
- Current/contrary: PowerInfer already combines adaptive predictors with neuron-aware sparse operators. The proposed batch decomposition supplied no source-specific action beyond a scheduler wrapper.
- Result: `EARLY_FATAL / EXCLUDED_BEFORE_RAW`.
- Reason: generic batching is not a contribution contract and cannot enter raw without a nontrivial target-native mechanism.

### `S5-105-QC06` — sparse heterogeneous no-gain boundary

- Exact carrier: PowerInfer plus a public CPU/GPU baseline.
- Current evidence: public papers report model-level quality and speed, but the frozen carrier lacks a versioned public trace/layer estimator and held-out decision threshold required for the proposed measurement-mechanism endpoint.
- Result: `UNRESOLVED_BACKLOG / LOCATOR_ONLY`.
- Reason: a performance table or dashboard cannot substitute for a stable, decision-changing measurement estimand.

### `S5-105-QC07` — sparse transfer versus recompute

- Exact carrier: public CPU/single-GPU sparse activation state action.
- Current/contrary: public heterogeneous I/O-aware recomputation and offload systems exist, but no single carrier was frozen that exposes both actions under one exact output/quality oracle.
- Result: `UNRESOLVED_BACKLOG / LOCATOR_ONLY`.
- Reason: without a same-object action interface and finite witness, this would be generic placement/I/O theory rather than an admissible carrier-specific claim.

## Funnel telemetry

| Unit | Count |
|---|---:|
| Offline seed | 10 |
| RQ candidate | 7 |
| Ordinary source closure | 7 |
| Evidence-qualified raw | 0 |
| Deep review | 0 |
| Clean Stage 0 brief | 0 |
| Early fatal / excluded | 3 |
| Locator only | 4 |

## Conclusion

`COMPLETE_ZERO_PROPOSALS__THREE_CURRENT_OR_GENERIC_EARLY_FATAL__FOUR_LOCATOR_ONLY_UNFROZEN`.

No resource failure occurred. The four locator-only items are not STOPs and may only re-enter under a future frozen, different five-field claim package.
