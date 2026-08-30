# Source103 S6 Divergence Seed Pool

冻结 assignment `DISCOVERY-S6-20260824-SOURCE103-LLM-VLA-STRATEGY-V1` 的离线非证据性创意池；不构成 locator、raw、候选证据、新颖性或 current-absence 声明。课题组仓库未被读取或用作科学证据。

## Pool metadata

- Assignment / lane: `DISCOVERY-S6-20260824-SOURCE103-LLM-VLA-STRATEGY-V1` / `DISCOVERY_S6`
- Frozen profile: `SOURCE103_USER_LLM_VLA_PUBLIC_SINGLE_GPU_CPU_FIRST_V1`
- Seed ceiling: `8 / 12`; RQ candidate ceiling: `<=8`
- Network-security exclusion check: `PASS`
- Generation completed before evidence lookup: `YES`

## Seed records

### `S6-103-01`

- Engine / perspective: `PROBLEM_REFRAMING` / `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor or hunch: public Triton or PyTorch compiler low-bit GEMM lowering for irregular small-M tails.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: Treat a tail as a finite partition problem over legal tile families, packing overhead, and epilogue semantics rather than a smaller GEMM. A residual exists only if a target-aware partition algorithm has a same-semantics, full-cost delta over ordinary dispatch.
- Conclusion-first test: A named lowering can preserve its low-bit operator contract while improving explicit end-to-end cost on a natural irregular-shape distribution.
- Likely risk / evidence needed: existing autotuning, split-K, or tile heuristics may absorb it; require a versioned lowering locus, natural tail carrier, and finite comparator set.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`

### `S6-103-02`

- Engine / perspective: `ADJACENT_POSSIBLE_OR_BOUNDARY` / `OPERATOR`
- Starting anchor or hunch: public single-GPU LLM runtimes with a prefill/decode GEMM-to-GEMV shape transition.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: A compiler could retain a legal packed/layout representation across one exact operator-chain boundary rather than materializing separate paths. It is valid only if it is semantically exact and not reducible to a cache knob, graph capture, or one-shape fusion.
- Conclusion-first test: A fixed public runtime path admits a compiler decision that reduces packing/layout/launch cost without changing numerical or serving semantics.
- Likely risk / evidence needed: native fused kernels may cover it; require exact runtime version, operator chain, layout path, and natural request-shape carrier.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`

### `S6-103-03`

- Engine / perspective: `JANUSIAN_TENSION` / `HARDWARE_ARCHITECT`
- Starting anchor or hunch: low-bit GEMM must trade dense tensor-core-friendly packing against irregular-tail-safe execution.
- Intended source role: `CONTRARY`
- Two-sentence idea sketch: Search for a two-level tail descriptor where regular blocks preserve packing and a bounded descriptor avoids repeated repack/padding. It must account for metadata, conversion, and lost tensor-core utilization, and cannot merely rename an existing block format.
- Conclusion-first test: A bounded descriptor changes a specified low-bit layout cost frontier, not universal kernel speed.
- Likely risk / evidence needed: existing sparse/block formats or padded layouts may absorb it; require exact layout semantics, native format paths, and no-gain regime.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`

### `S6-103-04`

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `THEORIST`
- Starting anchor or hunch: compiler tile selection may contain a bounded partition structure, but legality/output semantics stay compiler-native.
- Intended source role: `ESCAPE`
- Two-sentence idea sketch: Investigate an approximation or bounded search for a finite set of legal tile-and-layout actions under a fixed output contract. The transfer survives only with a target-specific complexity or guarantee delta and a checker/oracle route, never as a generic solver wrapper.
- Conclusion-first test: A bounded algorithmic guarantee exists for one precise lowering decision.
- Likely risk / evidence needed: generic autotuners, ILP, or current cost models may absorb it; require public action space, legal-cost model, and strongest generic comparator.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`

### `S6-103-05`

- Engine / perspective: `COMPOSE_DECOMPOSE_SIMPLIFY` / `MAINTAINER`
- Starting anchor or hunch: quantized GEMM, dequantize, activation, and GEMV chain boundaries may materialize avoidable state for a fixed public graph family.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: A compiler representation could compose only fragments whose layout/scale invariants match, preserving exact quantization and activation semantics. It is disallowed if it collapses to ordinary fusion, generic graph partitioning, or a one-off rewrite.
- Conclusion-first test: An invariant-guided chain construction algorithm has a bounded full-cost benefit on a named public graph family.
- Likely risk / evidence needed: vendor libraries may directly express it; require graph/lowering source, scale/rounding contract, and current fusion flags.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`

### `S6-103-06`

- Engine / perspective: `CONSTRAINT_MANIPULATION` / `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor or hunch: fixed-layout low-bit kernels commonly impose preferred K/N divisibility.
- Intended source role: `CURRENT`
- Two-sentence idea sketch: Hold output semantics and precision fixed while relaxing only divisibility, then seek a jointly legal remap/remainder action instead of padding or fallback. The action must price metadata and conversion and name the region where padding/fallback remains superior.
- Conclusion-first test: A target-native legality-preserving remainder construction exists under a frozen low-bit contract.
- Likely risk / evidence needed: native masks, guards, or remainder kernels may already express it; require source symbols, default/non-default configurations, and exact contract.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`

### `S6-103-07`

- Engine / perspective: `NEGATION_OR_INVERSION` / `MEASUREMENT_REVIEWER`
- Starting anchor or hunch: low-bit headline metrics can omit scale/zero conversion, tail masking, and fallback costs.
- Intended source role: `CONTRARY`
- Two-sentence idea sketch: Reverse the optimization choice: decide when not to select a low-bit/tensor-core path for irregular shapes under a fixed full-cost denominator. It must be a target-native decision mechanism or formal boundary, not a dashboard reporting slowdown.
- Conclusion-first test: A reproducible no-gain classifier changes one compiler/runtime decision while retaining operator semantics.
- Likely risk / evidence needed: static thresholds or current cost models may cover it; require native selection locus, threshold policy, and cost observables.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`

### `S6-103-08`

- Engine / perspective: `ADJACENT_POSSIBLE_OR_BOUNDARY` / `HARDWARE_ARCHITECT`
- Starting anchor or hunch: public compiler IR can expose a data-movement cut that is modeled against a GPU-only baseline and an NDP-style abstraction.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: Search for an executable cost-model/mapping algorithm using a fixed public IR and explicit CPU/GPU fallback. Any NDP relation remains a public-assumption model bridge until approved hardware evidence exists.
- Conclusion-first test: A compiler/memory-model decision is supported at model level, never as implemented NDP hardware speedup.
- Likely risk / evidence needed: placement solvers may absorb it; require IR semantics, cost inputs, same-object GPU baseline, and ceiling.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`

## Clustering and coverage-constrained convergence

| Cluster | Seed IDs | Representative selected seed | RQ candidate ID |
|---|---|---|---|
| Tail construction | 01, 03, 06 | S6-103-01 | S6-103-RQ01 |
| Operator-chain construction | 02, 05 | S6-103-02 | S6-103-RQ02 |
| Algorithm/guarantee search | 04 | S6-103-04 | S6-103-RQ03 |
| Full-cost boundary | 07 | S6-103-07 | S6-103-RQ04 |
| Architecture-adjacent model | 08 | S6-103-08 | S6-103-RQ05 |

The selected representatives preserve non-dominated object, action, evidence-carrier, and contrary-route coverage before lookup. S6-103-03, S6-103-05, and S6-103-06 remain append-only non-evidence backlog and may not replace a selected seed because of a later result.

## Advisory

- Engines used: 7; perspective roles used: 6
- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS`
- Plain-Chinese note: 本池优先公开 CPU/单 GPU 可闭合的软件和编译决策；任何 NDP 关联仅为模型层桥接，不是硬件实现主张。
