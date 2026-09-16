# Executor method output — O1/O6 v2

Role: `DISCOVERY-BACKTEST-EXECUTOR`. This reconstruction uses only the sealed packet. It is not a candidate proposal or calibration verdict.

## S1-POS-01

- **Recovered problem shape.** Exact long-context attention remains semantically desirable, but its dense implementation may be limited by memory traffic/materialization rather than arithmetic; seek an exact reformulation or execution order that avoids storing or moving an (n^2)-scale intermediate.
- **Baseline limitation.** Dense attention materializes/interchanges large score/probability tensors; approximation/sparsity changes semantics, while existing exact memory reduction alone does not establish a throughput-efficient hierarchy-aware execution.
- **Decision structure.** Choose tiling/block order, online normalization/accumulation, and SRAM/register residency subject to exact softmax-attention semantics, numerical stability, and GPU memory limits. Competing mechanisms: IO-aware exact blocking versus semantic-changing sparse/linear attention.
- **Contribution route.** N1: express exact attention as an online blocked reduction; N2: derive/schedule an IO-efficient kernel. N3 is conditional on stable long-sequence IO dominance.
- **Evidence entry.** Establish HBM traffic and arithmetic intensity against dense exact and approximation baselines; test exactness/numerical error, runtime over sequence lengths, memory use, and the small-sequence/compute-bound no-gain boundary.
- **Abstain.** No — a causal primitive mismatch and falsifiable exact-IO route are present.

## S1-POS-02

- **Recovered problem shape.** Autoregressive serving has variable-length, growing per-request state. Scheduling/batching/offload cannot by themselves remove repeated state movement and fragmented capacity; a state representation/management mechanism is needed to raise admitted batch size without breaking token semantics.
- **Baseline limitation.** Contiguous per-request state allocation and coarse batching create memory waste, copy/reallocation pressure, and admission constraints; kernel/model-parallel optimizations do not decide how evolving state is partitioned and shared.
- **Decision structure.** Allocate, map, share, and reclaim fixed-granularity state blocks; choose request admission/batching with tradeoffs among capacity, indirection cost, fragmentation, transfers, and latency. Competing mechanisms: virtualized/paged state management versus improved contiguous allocation/offload scheduling.
- **Contribution route.** N1: decouple logical sequence state from physical storage; N2: block allocator/mapping and scheduler integration; N3: exploit stable prefix/state reuse only if measured.
- **Evidence entry.** Compare against strong contiguous and offload-serving baselines under real length distributions; ledger throughput, tail latency, memory waste, block-table overhead, copy volume, and short/unshared-request boundaries.
- **Abstain.** No — the packet supports a distinct state-management decision problem, not merely a limitation.

## S1-POS-03

- **Recovered problem shape.** Ordered-key indexes pay comparison/tree-navigation costs despite nonuniform key distributions; learn or fit a position predictor, then retain bounded correction/fallback to preserve exact lookup and update semantics.
- **Baseline limitation.** B+-trees are distribution-agnostic and cache-aware layouts reduce pointer cost but do not use the cumulative key distribution to predict position; interpolation search alone lacks robust general guarantees.
- **Decision structure.** Select model/partition granularity and error bounds; predict a search interval and use a fallback index/search under build, update, model-size, tail-latency, and worst-case constraints. Competing mechanisms: learned position approximation plus bounded correction versus adaptive/cache-conscious classical indexing.
- **Contribution route.** N1: treat an index as a model of the key CDF; N2: hierarchical model-plus-fallback search. N3: stable key-distribution regularity is the exploitable observation.
- **Evidence entry.** Evaluate exact correctness and lookup/update/build costs against B+-tree, interpolation, and adaptive-index baselines across distributions and drift; report model footprint, prediction error, fallback frequency, and adversarial/no-structure boundaries.
- **Abstain.** No — a measured distribution-to-decision mechanism and exact fallback route are available.

## S1-NEG-01

- **Recovered finding.** Fixed exact square GEMM on a supported GPU exposes only mature tile and launch tuning.
- **Baseline limitation / decision structure.** No changed workload, primitive mismatch, or nontrivial generalizable action is supplied; ordinary parameters are already part of the strong CUTLASS-style baseline.
- **Contribution/evidence route.** None defensible beyond engineering tuning.
- **Abstain.** Yes.
