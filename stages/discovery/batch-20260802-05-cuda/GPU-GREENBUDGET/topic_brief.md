# GPU-GREENBUDGET Request-class-aware CUDA Green Context budgeting

- Status: `PROPOSE_STAGE0`
- Primary lane: GPU system / runtime resource coordination
- Discovery date: 2026-08-02

## Research question

Within one CUDA application that mixes latency-critical and throughput work, can a request-class-aware controller select Green Context SM/workqueue partitions and epoch boundaries that improve service tail without wasting capacity relative to static partitioning?

## Importance and group fit

CUDA Green Contexts newly make subsets of SMs and workqueues explicit to a single application. NVIDIA's motivating example is static isolation for latency-sensitive work, while the API also documents alignment, non-guaranteed concurrency, and partition limits. The research residual is a resource-budgeting algorithm that pays reconfiguration/underutilization costs and uses measurable request classes—not a dashboard around a new API.

## Exact object

One GPU process with two real CUDA workload classes, e.g. an interactive decode-like kernel stream and throughput-oriented GEMM/batch stream. Decision variables are each epoch's SM/workqueue partition descriptor, epoch duration, and admission to the latency class. Costs include partition granularity/alignment, context/stream creation or reuse, idle reserved SM time, interference, and missed service deadlines.

## Strongest fair baseline

No partition with ordinary streams, NVIDIA's static Green Context split, and MPS active-thread-percentage caps where applicable, all calibrated to the same average throughput and request trace.

## Mechanism hypothesis

Static isolation is either over-reserved at light load or misses bursts. A controller that classifies the upcoming request mix and selects only legal partitions at epoch boundaries can target a service-tail/throughput Pareto frontier while exposing when strict isolation is counterproductive.

## Competing mechanisms

- Mechanism A: queueing-based SM-budget controller with legal partition enumeration; prediction: it outperforms the best static split under bursty arrivals but converges to it under stationary load; counterexample: reconfiguration/idle capacity erase all gains.
- Mechanism B: workqueue-aware partition choice that reduces launch interference independently of SM count; prediction: equal SM budgets differ in service tail; counterexample: workqueue settings are not observable enough to matter.
- Mechanism C: deadline-aware admission that defers throughput work instead of expanding the latency partition; prediction: it preserves throughput better than a conservative reserve; counterexample: queue delay dominates either way.
- Preferred mechanism and why: A has an analytical baseline, uses only documented legal partitions, and has a clear stationary-load null result.

## Candidate paper claim

On public two-class CUDA traces, an epochal legal-partition controller achieves service-tail/throughput Pareto points unavailable to no split, the best static Green Context allocation, or MPS caps after idle-reservation and reconfiguration costs are charged.

## Current collision subtraction

CUDA Green Contexts are a `DEPLOYMENT_BASELINE`; the official guide explicitly frames static SM partitions and warns that concurrency is not guaranteed. This candidate differs from `GPU-NCCLGROUPCUT` (no multi-GPU collective), `GPU-L2LEASE` (no L2 state), and `GPU-CONDGRAPH` (no conditional buffer lifetime). `SEARCH_BOUNDED_OPEN` pending a Stage 0 literature/code audit for equivalent dynamic Green Context controllers.

## Decisive falsifier

Drop if the best static split matches all controller points after each cost is counted, if legal partition transitions cannot be amortized for public burst traces, or if independent work fails to overlap regardless of partitioning.

## Executable evidence path

### 72-hour first evidence

Use CUDA's Green Context API on a compatible GPU with two open kernels (latency-sensitive microkernel plus CUTLASS/Triton GEMM), replay one frozen burst trace, enumerate legal static splits, then compare an epochal A controller using CUPTI/Nsight counters for actual provisioned resources and timeline costs.

### AI core fraction and critical path

`AI_CORE_CONDITIONAL`, about `0.63`. AI can implement the controller, trace replay, legal-partition enumerator, static baselines, and ledger. Decisive evidence requires a CUDA version/device supporting Green Contexts; otherwise only the controller model can be validated.

### Semantics-preserving open alternatives

The CUDA runtime/driver documentation and CUPTI APIs provide an open, auditable substrate. MPS is a baseline rather than a semantic replacement because its process-level percentage does not identify fixed SM subsets.

## Dual-axis score

- Academic value: `56/70`
- AI executability bonus: `19/30`
- Total: `75/100`

## AI and researcher boundary

AI owns the controller and reproducibility harness. The researcher must authorize access to an appropriate CUDA platform and decide whether application-level service traces are representative.

