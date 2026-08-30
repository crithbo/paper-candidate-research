# Source104 S5 Question Cards and Ordinary Source Closure

## Scope and isolation

- Assignment / lane: `DISCOVERY-S5-20260824-SOURCE104-PUBLIC-CARRIER-DIVERSIFIED-V1` / `DISCOVERY_S5`
- Search date: `2026-08-24`; mode: ordinary closure only, selective depth `OFF`.
- Source104 diversification: carrier-first allocation only; no science gate, scoring or outcome-aware replacement change.
- Read boundaries: no group repository, no Source103 temporary judgments, no parallel Rule Audit output, no private/credential-gated material.
- Resource actions: none. Public source inspection used the web connector only; no file was downloaded, copied, built or persisted under `resources/`.
- Identity preflight: Source104’s diversification note was used as the frozen terminal/failure surface. The explicit Source103 identities `EXECUTORCH_ONLINE_RUNTIME_REPARTITION_ON_AOT_OBJECT`, `OPENVLA_UNCHANGED_VISUAL_TOKEN_REUSE_ALREADY_COVERED_BY_VLA_CACHE`, `GENERIC_PREFIX_CACHE_LIFECYCLE_POLICY_ALREADY_IN_VLLM_SGLANG` and `GENERIC_KV_PLACEMENT_POLICY` were not recreated. Related but different actions were examined only as `RELATED_ONLY`.

## Primary/current sources

- llama.cpp backend scheduler: https://github.com/ggml-org/llama.cpp/blob/master/ggml/include/ggml-backend.h
- llama.cpp current KV-cache interface: https://github.com/ggml-org/llama.cpp/blob/master/src/llama-kv-cache.h
- llama.cpp current KV-cache implementation: https://github.com/ggml-org/llama.cpp/blob/master/src/llama-kv-cache.cpp
- llama.cpp public configuration: https://github.com/ggml-org/llama.cpp/blob/master/include/llama.h
- llama.cpp speculative example: https://github.com/ggml-org/llama.cpp/blob/master/examples/speculative-simple/speculative-simple.cpp
- llama.cpp current server benchmark/metrics: https://github.com/ggml-org/llama.cpp/blob/master/tools/server/bench/speed-bench/README.md and https://github.com/ggml-org/llama.cpp/blob/master/tools/server/README.md
- MLC LLM current engine modes: https://github.com/mlc-ai/mlc-llm/blob/main/docs/deploy/python_engine.rst

## `S5-104-QC01` — llama.cpp online CPU/GPU plan repair

- RQ: `S5-104-RQ01`; carrier: current `ggml_backend_sched` CPU/GPU backend scheduler.
- Current evidence: the scheduler assigns tensors based on backend operation support and preallocated tensor locations, initializes/reserves a graph, then computes; llama.cpp load configuration exposes layer/tensor split settings and fit-to-memory options.
- Required raw discriminator: a source-defined deployment-time mutation of the same loaded backend plan after a capacity event.
- Closure result: `UNRESOLVED_BACKLOG`.
- Front-end disposition: `LOCATOR_ONLY`.
- Reason: current sources establish a real public carrier, but not the frozen online plan-repair action or a finite same-object update oracle. Treating load-time flags as runtime recourse would change the object.

## `S5-104-QC02` — sequence-state copy/removal under slot pressure

- RQ: `S5-104-RQ02`; carrier: llama.cpp `seq_rm`, `seq_cp`, `seq_keep`, state read/write and slot preparation APIs.
- Current evidence: the current KV cache owns these sequence operations and maintains copy/state-recovery paths.
- Frozen failure identity relation: `EXACT` to Source103’s prohibited generic prefix/session cache lifecycle policy at the proposed action level.
- Closure result: `EARLY_FATAL`.
- Front-end disposition: `EXCLUDED_BEFORE_RAW`.
- Reason: the frozen candidate only selects copy/removal/recompute lifecycle actions; it supplies no target-specific algorithmic action or guarantee beyond the excluded generic cache-policy kernel. Renaming the llama.cpp carrier does not create a new family.

## `S5-104-QC03` — KV relocation/defragmentation schedule

- RQ: `S5-104-RQ03`; carrier: current llama.cpp KV cell ownership, `prepare`, `update` and K-shift paths.
- Current evidence: source exposes sequence ownership, slot finding, recoverable preparation and stream-copy/K-shift update paths. The public `defrag_thold` configuration is marked deprecated; an older issue describes a possible defragmentation improvement, but an old issue is not evidence of a current action gap.
- Required raw discriminator: current source-defined relocation operation, its triggering semantics and a fixed legality/equivalence witness distinct from generic compaction.
- Closure result: `UNRESOLVED_BACKLOG`.
- Front-end disposition: `LOCATOR_ONLY`.
- Reason: the carrier is concrete, but the exact current relocation action and a non-generic decision consequence remain unclosed. No absence or performance claim follows.

## `S5-104-QC04` — MLC LLM online memory-reservation frontier

- RQ: `S5-104-RQ04`; carrier: current MLC LLM Python engine.
- Current evidence: the documented `local`, `interactive` and `server` modes set request concurrency and KV capacity, thereby changing GPU memory usage.
- Required raw discriminator: a source-defined online reservation-update action distinct from engine creation/configuration, plus a finite full-cost estimator.
- Closure result: `UNRESOLVED_BACKLOG`.
- Front-end disposition: `LOCATOR_ONLY`.
- Reason: current documentation establishes mode configuration, not the frozen online maintenance action. Recasting an initialization choice as online recourse would change the object.

## `S5-104-QC05` — speculative draft/verify boundary

- RQ: `S5-104-RQ05`; carrier: llama.cpp speculative-simple draft/target execution.
- Current evidence: the public example loads a draft model and reports accepted draft tokens; a current llama.cpp issue records that speculative decoding is already implemented and points to the example. Current discussion also exposes a `spec-draft-p-min` continuation threshold.
- Frozen failure identity relation: `EXACT` to an already implemented native speculative path; no separate target-native boundary action was frozen before the closure result.
- Closure result: `EARLY_FATAL`.
- Front-end disposition: `EXCLUDED_BEFORE_RAW`.
- Reason: generic online speculative-boundary tuning is absorbed by the current carrier. A different action/guarantee would require a future assignment, not an outcome-aware rewrite.

## `S5-104-QC06` — CPU/GPU offload breakpoint estimator

- RQ: `S5-104-RQ06`; carrier: llama.cpp benchmark/server metrics and offload configuration.
- Current evidence: llama.cpp supplies `llama-bench`, server benchmark support and prompt-throughput/busy-slot metrics. Current sources do not freeze a workload lifecycle event, complete load/transfer/KV denominator or held-out backend-choice threshold for the proposed ranking/breakpoint conclusion.
- Strong contrary route: current on-device CPU/GPU scheduling work already studies adaptive partitioning and performance trade-offs, so a mere configuration sweep would be a weak generic benchmark result.
- Closure result: `UNRESOLVED_BACKLOG`.
- Front-end disposition: `LOCATOR_ONLY`.
- Reason: a real benchmark carrier exists but the measurement estimand and decision-changing falsifier are not yet defined. No raw measurement claim is admissible.

## `S5-104-QC08` — public unified-memory transfer triage

- RQ: `S5-104-RQ08`; carrier: prospective CPU/single-GPU unified-memory backend.
- Current evidence: public llama.cpp material documents multiple CPU/GPU backends and a scheduler; a non-canonical build document notes a unified-memory switch, but no first-party versioned carrier established the three required native actions (zero-copy, transfer and recompute) or a common numeric oracle.
- Closure result: `UNRESOLVED_BACKLOG`.
- Front-end disposition: `LOCATOR_ONLY`.
- Reason: no versioned primary carrier satisfies the anchor contract. Neither private NPU access nor a generic placement problem may substitute for it.

## Funnel and source-role telemetry

| Unit | Count | Result |
|---|---:|---|
| Offline seed | 10 | complete before lookup |
| RQ candidate | 7 | all frozen before lookup |
| Ordinary pre-RQ closure | 7 | no selective slots used |
| `EVIDENCE_QUALIFIED_RAW` | 0 | none reached the immutable raw minimum |
| Deep review | 0 | none eligible |
| Clean Stage 0 brief | 0 | zero is valid |
| `EXCLUDED_BEFORE_RAW` | 2 | QC02, QC05 |
| `LOCATOR_ONLY` | 5 | QC01, QC03, QC04, QC06, QC08 |

| Source role | Result |
|---|---|
| `ANCHOR` | versioned public carriers found for llama.cpp and MLC LLM; unified-memory triage did not close an eligible carrier |
| `CURRENT` | scheduler, KV sequence/state, configuration, speculative and benchmark loci checked |
| `CONTRARY` | Source103 exact failure identities and current CPU/GPU scheduling literature prevented generic re-entry |
| `ESCAPE` | CPU/GPU I/O-aware KV recomputation and adaptive partition literature are adjacent mechanisms, not evidence of a new same-object residual |

## Conclusion

`COMPLETE_ZERO_PROPOSALS__TWO_EARLY_FATAL_EXACT_FAILURE_IDENTITIES__FIVE_LOCATOR_ONLY_UNFROZEN`.

The five locator-only items are not STOPs and are not evidence of novelty/absence. They may only be reconsidered in a future frozen assignment that supplies a different exact object/action/endpoint/guarantee/full-cost contract; this assignment does not backfill after seeing search results.
