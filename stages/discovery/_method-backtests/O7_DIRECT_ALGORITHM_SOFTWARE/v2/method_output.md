# Executor method output — O7 v2

Role: `DISCOVERY-BACKTEST-EXECUTOR`. Sealed packet only; this document neither proposes a candidate nor assesses calibration.

## S6-POS-01

- **Recovered problem shape.** Image-pipeline performance needs a same-semantics representation that separates algorithm from schedule, allowing nontrivial locality/parallelism/recomputation decisions to map one pipeline across CPU/GPU targets.
- **Baseline limitation.** Parameter search and stream/data-parallel DSLs expose only parts of the search; hand-written decomposition entangles computation with memory-hierarchy scheduling and does not generalize across architectures.
- **Decision structure.** Define functional stages then choose tiling, fusion, storage, recomputation, vectorization, parallelization and target mapping under correctness, locality, compile/search cost and hardware constraints. Competing mechanisms: explicit schedule language/compiler versus architecture-specific kernel tuning.
- **Contribution route.** N1: algorithm/schedule separation and schedule representation; N2: schedule transformations/code generation. N3 conditional on reusable pipeline structure.
- **Evidence entry.** Same-output comparisons against strong hand-tuned/ATLAS-like and DSL baselines across pipelines/targets; ledger compile/search time, memory, performance and cases with little locality/parallelism.
- **Abstain.** No.

## S6-POS-02

- **Recovered problem shape.** Tensor-program compilers need to find high-quality implementations outside fixed templates without exploding search cost; jointly design a richer program representation, candidate generation, cost model and budget allocation.
- **Baseline limitation.** Vendor libraries cover common cases and schedule-template spaces limit expressiveness; naive expansion produces infeasible search.
- **Decision structure.** Generate program sketches/representations, select transformations/candidates, allocate measurements/search budget across tasks and choose hardware-specific code. Competing mechanisms: hierarchical sketch-plus-search versus template autotuning/learned ranking over a fixed space.
- **Contribution route.** N1: expressive hierarchical program/sketch representation; N2: guided search, learned costing and multitask allocation; N3: cross-task schedule-feature regularity.
- **Evidence entry.** Same-function performance plus tuning time, search samples, generalization and compilation costs against TVM/TC/FlexTensor-style baselines; identify covered common-operator and out-of-space/no-transfer boundaries.
- **Abstain.** No.

## S6-POS-03

- **Recovered problem shape.** Bulk Boolean vector operations are channel-bandwidth-bound; determine whether commodity DRAM internal behavior can implement a complete Boolean basis safely with minimal modifications and explicit command sequencing.
- **Baseline limitation.** Row copy/init and prior DRAM/NVM bitwise proposals establish isolated primitives or different substrates, but do not establish a complete, reliable, commodity-DRAM Boolean computation path and cost envelope.
- **Decision structure.** Choose cell/row activation sequences, data encoding, temporary rows and command/controller support under timing, reliability/variation, area, energy, application and ISA/interface constraints. Competing mechanisms: in-DRAM analog/row-operation logic versus CPU/GPU channel-mediated execution and prior special-substrate PIM.
- **Contribution route.** N1: primitive/command abstraction for DRAM Boolean operations; N2: sequence/compiler mapping for a Boolean basis; N3 conditional on bulk-bitwise workload locality.
- **Evidence entry.** Circuit/timing and architecture simulation with explicit modification/area/reliability assumptions; compare latency, energy and channel traffic against CPU/GPU and prior PIM, with unsupported-operation and variation boundaries.
- **Abstain.** No.

## S6-NEG-01

- **Recovered finding.** Renaming LRU and varying an already baseline-exposed cache capacity leaves state, eviction action, objective and complexity unchanged.
- **Baseline limitation / decision structure.** There is no algorithmic delta or workload-dependent action to test.
- **Contribution/evidence route.** None within O7.
- **Abstain.** Yes.
