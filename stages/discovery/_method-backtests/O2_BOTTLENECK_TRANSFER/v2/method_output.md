# Executor method output — O2 v2

Role: `DISCOVERY-BACKTEST-EXECUTOR`. Reconstruction is confined to the sealed packet and is not a candidate or calibration judgment.

## S2-POS-01

- **Recovered problem shape.** Mixed precision and parallelism raise compute throughput/model scale faster than per-device memory, transferring the limiting resource to optimizer/gradient/parameter state placement and communication.
- **Baseline limitation.** Data/model/pipeline parallel baselines optimize compute partitioning but may replicate state and independently price neither its partitioning nor communication.
- **Decision structure.** Partition/offload optimizer, gradients, parameters, and activations across devices; schedule communication against memory and update correctness. Competing mechanisms: state sharding with communication overlap versus replica/pipeline/tensor-parallel layouts.
- **Contribution route.** N2: coordinated state partitioning and communication algorithm; N1 conditional on a new state ownership abstraction; N3 conditional on measured state/communication dominance.
- **Evidence entry.** Measure memory capacity release, communication volume, throughput, convergence/semantic equivalence, scale and interconnect boundaries against strong parallel-training baselines.
- **Abstain.** No — the packet states a concrete before/after resource-balance change.

## S2-POS-02

- **Recovered problem shape.** With voltage/frequency scaling weakening, transistor growth transfers the design question from faster single cores to power-limited parallelism/specialization; quantify useful performance under area, power, parallel fraction, and workload constraints.
- **Baseline limitation.** Transistor-count or conventional performance extrapolation omits dark/underutilized area, power density, serial fractions, and heterogeneous core choices.
- **Decision structure.** Allocate area/power among core types and active cores, select workload mapping, and model scaling; compare homogeneous many-core, specialization, and constrained active-area mechanisms.
- **Contribution route.** N1: constrained scaling model/abstraction; N2: optimization of heterogeneous allocation; N3: workload parallelism/power regularities if validated.
- **Evidence entry.** Analytic/simulation sweeps with explicit power, area, performance and sensitivity ledger; falsify under high serial fraction, uniform workloads, or restored voltage scaling.
- **Abstain.** No — causal transfer is explicit, although claims must remain model-bounded.

## S2-POS-03

- **Recovered problem shape.** Compact/sparse mobile networks reduce dense work and reuse, transferring accelerator pressure to sparse metadata, operand delivery, interconnect bandwidth, and load balance across heterogeneous layer shapes.
- **Baseline limitation.** Dense dataflows assume regular reuse; sparse-weight engines do not by themselves co-handle irregular activation/weight interactions and their overheads.
- **Decision structure.** Choose representation/dataflow, operand matching, distribution, accumulation, and compression granularity across layers. Competing mechanisms: sparsity-aware joint scheduling versus dense/reconfigurable fallback per layer.
- **Contribution route.** N1: representation/dataflow for jointly irregular operands; N2: scheduling/accumulation organization; N3: stable layer/sparsity-shape patterns if measured.
- **Evidence entry.** Cross-network/layer energy, throughput, utilization, metadata/interconnect and area measurements against dense and sparse baselines; falsify on dense, balanced, or metadata-dominated layers.
- **Abstain.** No.

## S2-NEG-01

- **Recovered finding.** One unchanged cache-resident CPU kernel has measurement vocabulary but no regime transition.
- **Baseline limitation / decision structure.** Neither workload, platform, scale, representation, nor resource balance changes, so no causal transfer can be assigned.
- **Contribution/evidence route.** Counter collection alone is not an O2 mechanism.
- **Abstain.** Yes.
