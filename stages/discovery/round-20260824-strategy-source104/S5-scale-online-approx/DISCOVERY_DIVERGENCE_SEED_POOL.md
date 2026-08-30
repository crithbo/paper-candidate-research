# Discovery Divergence Seed Pool

本表只记录非证据性创意；生成完成前未进行外部检索、下载、资源动作或科学判断。

## Pool metadata

- Assignment / lane: `DISCOVERY-S5-20260824-SOURCE104-PUBLIC-CARRIER-DIVERSIFIED-V1` / `DISCOVERY_S5`
- Frozen profile: `SOURCE104_PUBLIC_CARRIER_FIRST_DIVERSIFIED_LLM_VLA_V1`
- Seed ceiling / actual: `<=12 / 10`
- RQ candidate ceiling / selected: `<=8 / 7`
- Network-security exclusion check: `PASS`
- Generation completed before evidence lookup: `YES`
- Group repository and parallel Rule Audit: `FORBIDDEN__NOT_READ`

## Divergence coverage

| Engine | Used | Seed IDs |
|---|---:|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | yes | S5-104-03, S5-104-09 |
| `PROBLEM_REFRAMING` | yes | S5-104-01, S5-104-06 |
| `CONSTRAINT_MANIPULATION` | yes | S5-104-02, S5-104-05 |
| `NEGATION_OR_INVERSION` | yes | S5-104-07 |
| `ABSTRACTION_LADDER` | yes | S5-104-04 |
| `ADJACENT_POSSIBLE_OR_BOUNDARY` | yes | S5-104-08 |
| `JANUSIAN_TENSION` | yes | S5-104-10 |
| `COMPOSE_DECOMPOSE_SIMPLIFY` | yes | S5-104-02, S5-104-05 |

## Seed records

### `S5-104-01`

- Engine / perspective: `PROBLEM_REFRAMING` / `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor: llama.cpp current CPU/GPU layer offload and backend scheduler source.
- Exact public anchor candidate: `ggml-org/llama.cpp`, current `ggml_backend_sched` and model-loading offload configuration; version `TO_BE_FROZEN`.
- Idea: Treat partial CPU/GPU offload not as one static layer-count flag but as a versioned online plan with a bounded number of legal plan edits after a measured memory-pressure event. The potential residual is an incremental plan-maintenance action over the runtime’s actual tensor/backend schedule, with reload, migration and synchronization cost charged.
- Conclusion-first test: a cautious result would only claim lower complete recourse cost for one public CPU/GPU carrier than rebuilding its same legal plan.
- Structural risk: runtime offload may be load-time-only, leaving no same-object online action.
- Needed evidence: source-defined runtime plan representation, update API and equivalence witness.
- Generic-shell test / disposition: `PASS / KEEP_FOR_CONVERGENCE`

### `S5-104-02`

- Engine / perspective: `CONSTRAINT_MANIPULATION` / `MAINTAINER`
- Starting anchor: llama.cpp multi-sequence KV state and slot/context reuse APIs.
- Exact public anchor candidate: llama.cpp current server/`llama_memory` sequence operations; version `TO_BE_FROZEN`.
- Idea: Under a fixed multi-slot model and exact prefix semantics, maintain a dynamic sequence-sharing structure that decides whether a sequence-state copy, removal or recomputation is legal after slot pressure changes. The candidate is a bounded-recourse sequence-state operation with copy and defragmentation cost, not a new cache-lifecycle policy.
- Conclusion-first test: a cautious result would identify a source-defined KV sequence action that changes same-runtime full-cost behavior.
- Structural risk: existing prefix/slot cache policy or generic cache lifecycle absorption.
- Needed evidence: native sequence-state action, request/slot semantics and a finite oracle.
- Generic-shell test / disposition: `PASS / KEEP_FOR_CONVERGENCE`

### `S5-104-03`

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `HARDWARE_ARCHITECT`
- Starting anchor: llama.cpp KV-cache defragmentation and CPU/GPU buffer management.
- Exact public anchor candidate: llama.cpp current KV cache allocator/defragmentation source; version `TO_BE_FROZEN`.
- Idea: Transfer incremental compacting-garbage-collector structure to KV-cache defragmentation: select a legal sequence of relocations that bounds pause and copy bytes while preserving cache-token ownership. The mechanism must be an online relocation schedule tied to native block ownership, not a generic allocator heuristic.
- Conclusion-first test: a cautious result would show a defined no-gain region and a lower relocation/latency Pareto point for one runtime allocator.
- Structural risk: current defragmenter already owns the same relocation action, or remaining work is generic memory compaction.
- Needed evidence: allocator symbols, relocation legality and current triggering configuration.
- Generic-shell test / disposition: `PASS / KEEP_FOR_CONVERGENCE`

### `S5-104-04`

- Engine / perspective: `ABSTRACTION_LADDER` / `OPERATOR`
- Starting anchor: MLC LLM public engine configuration and paged KV/runtime memory path.
- Exact public anchor candidate: `mlc-ai/mlc-llm` current engine/KV cache source; version `TO_BE_FROZEN`.
- Idea: At the runtime level, distinguish request-local context growth from globally reusable prefix state, then maintain a fixed-quality online memory reservation frontier rather than a generic request scheduler. The candidate must expose a carrier-specific memory reservation action and a clear full-cost denominator.
- Conclusion-first test: a cautious result would change a memory-admission decision for one MLC runtime configuration under a named capacity event.
- Structural risk: no public native reservation action, or generic prefix cache scheduling.
- Needed evidence: source-defined allocation/memory-reservation semantics and current comparator union.
- Generic-shell test / disposition: `PASS / KEEP_FOR_CONVERGENCE`

### `S5-104-05`

- Engine / perspective: `COMPOSE_DECOMPOSE_SIMPLIFY` / `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor: llama.cpp draft/target speculative decoding with heterogeneous CPU/GPU execution.
- Exact public anchor candidate: llama.cpp current speculative decoding and backend selection source; version `TO_BE_FROZEN`.
- Idea: Decompose a speculative step into draft, verify and cache-commit actions, then seek a bounded online granularity policy that changes only the source-defined draft/verify boundary while preserving target output semantics. The residual must be more than a generic scheduler and must charge verification waste, CPU-GPU transfer and KV effects.
- Conclusion-first test: a cautious result would improve a fixed same-output speculative execution contract on a public single-GPU/CPU carrier.
- Structural risk: native speculative engine already has an adaptive boundary, or no same-output heterogenous action is exposed.
- Needed evidence: current source action set, default/non-default flags and exact-output witness.
- Generic-shell test / disposition: `PASS / KEEP_FOR_CONVERGENCE`

### `S5-104-06`

- Engine / perspective: `PROBLEM_REFRAMING` / `MEASUREMENT_REVIEWER`
- Starting anchor: llama.cpp’s public benchmark and offload configuration surface.
- Exact public anchor candidate: `llama-bench` / server metrics and current offload flags; version `TO_BE_FROZEN`.
- Idea: Reframe an offload “speedup” as a breakpoint-estimation problem: infer the capacity/load region where an identical model’s CPU-GPU split changes the full TTFT/decode decision once model load, transfer and KV memory are charged. This is a measurement mechanism only if a fixed estimand and held-out decision threshold exist.
- Conclusion-first test: a cautious result would establish a reproducible breakpoint estimator for a canonical CPU/GPU carrier, not a dashboard.
- Structural risk: merely plotting existing metrics or unobservable system-memory costs.
- Needed evidence: benchmark hooks, configuration identity and a stable estimand.
- Generic-shell test / disposition: `PASS / KEEP_FOR_CONVERGENCE`

### `S5-104-07`

- Engine / perspective: `NEGATION_OR_INVERSION` / `END_USER`
- Starting anchor: public edge LLM application using llama.cpp session state.
- Exact public anchor candidate: llama.cpp session save/restore path; version `TO_BE_FROZEN`.
- Idea: Invert “reuse is always beneficial”: characterize when session-state persistence becomes inferior to recomputation because the CPU/GPU transfer, serialization and stale-state costs dominate. A candidate contribution requires a source-defined persistence action and a decision-changing no-reuse threshold.
- Conclusion-first test: a cautious result would identify a reproducible full-cost no-reuse region for one runtime state carrier.
- Structural risk: generic cache lifecycle policy already excluded by Source103.
- Needed evidence: native session-state semantics distinct from prefix policy and an exact full-cost boundary.
- Generic-shell test / disposition: `PASS / KEEP_FOR_CONVERGENCE`

### `S5-104-08`

- Engine / perspective: `ADJACENT_POSSIBLE_OR_BOUNDARY` / `OPERATOR`
- Starting anchor: public CPU/GPU unified-memory or zero-copy inference support in a llama.cpp-compatible backend.
- Exact public anchor candidate: a versioned public backend with a documented CPU/GPU unified-memory transfer path; carrier `TO_BE_FROZEN`.
- Idea: At the capacity boundary, choose between zero-copy access, copy-to-GPU and low-bit recomputation using a source-defined legality/cost interface. The possible contribution is an online approximate transfer action only if it preserves a stated numeric contract.
- Conclusion-first test: a cautious result would change one backend’s transfer decision under a public, reproducible memory boundary.
- Structural risk: private hardware, unavailable carrier, or generic placement policy.
- Needed evidence: first-party public source, CPU/single-GPU execution route and deterministic comparison oracle.
- Generic-shell test / disposition: `PASS / KEEP_FOR_CONVERGENCE`

### `S5-104-09`

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `HARDWARE_ARCHITECT`
- Starting anchor: public llama.cpp mixture-of-experts CPU/GPU placement path.
- Exact public anchor candidate: llama.cpp current MoE offload configuration/source; version `TO_BE_FROZEN`.
- Idea: Transfer online ski-rental with recourse to expert residency: migrate only a source-defined subset of experts when observed routing changes, while charging weight transfer and preserving the same quantized expert semantics. This can survive only if runtime exposes a mutable expert-residency action rather than a load-time option.
- Conclusion-first test: a cautious result would bound migration cost and demonstrate a different legal expert-residency decision on one public carrier.
- Structural risk: no mutable action or generic placement kernel.
- Needed evidence: current expert-placement symbols, default and non-default flags and a finite witness.
- Generic-shell test / disposition: `PASS / KEEP_FOR_CONVERGENCE`

### `S5-104-10`

- Engine / perspective: `JANUSIAN_TENSION` / `MAINTAINER`
- Starting anchor: MLC LLM or llama.cpp low-bit CPU/GPU decode path.
- Exact public anchor candidate: versioned public low-bit decode implementation; carrier `TO_BE_FROZEN`.
- Idea: Preserve exact token output while changing only the online batching/verification granularity when low-bit GPU decode and CPU fallback contend for memory. The residual must retain a native token-equivalence oracle and be distinct from a low-bit format/packing rename.
- Conclusion-first test: a cautious result would expose a target-native online granularity action with a fixed output guarantee and full synchronization cost.
- Structural risk: ordinary batching, existing speculative scheduling or a forbidden low-bit packing rename.
- Needed evidence: current runtime action/flags and explicit same-token semantics.
- Generic-shell test / disposition: `PASS / KEEP_FOR_CONVERGENCE`

## Clustering and convergence

| Cluster | Seeds | Representative | Pre-evidence selection result |
|---|---|---|---|
| llama.cpp mutable offload/state action | 01, 02, 03, 05, 07, 09 | S5-104-03 | select 01, 02, 03, 05, 09; retain 07 as related risk |
| public runtime memory/measurement carrier | 04, 06, 08 | S5-104-06 | select 04, 06, 08 |
| low-bit online granularity | 10 | S5-104-10 | backlog pending distinct native action |

| Selected seed | Portfolio coverage reason | Intended object / problem boundary | RQ candidate ID |
|---|---|---|---|
| S5-104-01 | CPU/GPU plan-maintenance route | llama.cpp backend plan | S5-104-RQ01 |
| S5-104-02 | native KV sequence-operation route | llama.cpp multi-slot KV state | S5-104-RQ02 |
| S5-104-03 | allocator/defragmentation route | llama.cpp KV relocation | S5-104-RQ03 |
| S5-104-04 | alternative public runtime route | MLC LLM memory reservation | S5-104-RQ04 |
| S5-104-05 | speculative draft/verify route | llama.cpp speculative execution | S5-104-RQ05 |
| S5-104-06 | measurement-characterization route | llama.cpp offload breakpoint | S5-104-RQ06 |
| S5-104-08 | public unified-memory carrier route | CPU/GPU transfer boundary | S5-104-RQ08 |

## Append-only backlog

| Seed | Reason |
|---|---|
| S5-104-07 | High risk of Source103 exact generic prefix/session lifecycle identity. |
| S5-104-09 | Requires proof that expert residency is mutable at runtime. |
| S5-104-10 | Requires a distinct native action beyond low-bit format/packing terminals. |

## Advisory

- Engines used: `8/8`; perspectives: `COMPILER_OR_BACKEND_ENGINEER / MAINTAINER / HARDWARE_ARCHITECT / OPERATOR / MEASUREMENT_REVIEWER / END_USER`
- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS`
- Plain-Chinese note: 所有条目均在查证前冻结；它们与 Source103 的 exact failure identities 保持不同或明确标记为高风险，不以“不同 runtime 名称”主张新颖性。
