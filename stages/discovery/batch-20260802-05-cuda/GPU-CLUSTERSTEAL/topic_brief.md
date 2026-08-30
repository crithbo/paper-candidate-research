# GPU-CLUSTERSTEAL Cancellation-budgeted irregular-tile scheduling with CUDA Cluster Launch Control

- Status: `PROPOSE_STAGE0`
- Primary lane: CUDA algorithm / GPU runtime
- Discovery date: 2026-08-02

## Research question

For naturally irregular GPU tile workloads, can a cancellation-budgeted policy use Blackwell Cluster Launch Control (CLC) to reclaim straggler work while retaining the preemption and launch-overhead advantages of a fixed grid?

## Importance and group fit

CUDA exposes CLC precisely to bridge fixed-work grids and persistent kernels: a block or cluster can cancel an unstarted block and compute its work. The open question is not whether work stealing exists, but when cancellation should be spent. An indiscriminate policy can destroy locality, collide with higher-priority work, or add cancellation overhead. A bounded, structure-aware policy has a paper-shaped algorithmic decision and a clear false case.

## Exact object

Blackwell CLC-enabled CUDA kernels with heterogeneous tile cost, initially sparse/block-masked attention or routed MoE tiles. Decision variables are the cancellation budget, candidate-victim class, locality radius, and stop rule. Costs include failed cancellations, lost locality, extra state, priority/preemption opportunities, and all workqueue effects.

## Strongest fair baseline

Fixed-work-per-threadblock launch, fixed-number persistent kernels, and NVIDIA's unmodified CLC work-stealing pattern under the same tile mapping, GPU priority setup, precision, and queue depth.

## Mechanism hypothesis

The expected benefit of stealing depends jointly on observed service-time dispersion and victim locality. A policy that reserves cancellation for high predicted tail blocks and restricts theft to locality-compatible victims can avoid the two failure modes of a fixed grid (tail) and naïve stealing (overhead/locality loss).

## Competing mechanisms

- Mechanism A: variance-triggered cancellation budget with locality-compatible victims; prediction: tail improvement appears only above a measurable dispersion threshold; counterexample: CLC overhead dominates at every threshold.
- Mechanism B: remaining-work estimator from masked-tile metadata; prediction: metadata predicts stragglers better than FIFO position; counterexample: tile runtime is not predictable from exposed metadata.
- Mechanism C: priority-aware abstention after cancellation failure; prediction: it preserves a high-priority kernel's start time relative to persistent scheduling; counterexample: cancellation failures provide no actionable signal.
- Preferred mechanism and why: A turns the new primitive into a falsifiable policy with an explicit no-steal regime.

## Candidate paper claim

On public irregular-tile workloads, cancellation-budgeted CLC attains a latency/tail/preemption Pareto point unavailable to fixed grids, persistent kernels, or unmodified CLC after failed-cancellation and locality costs are measured.

## Current collision subtraction

CUDA documents CLC as the deployment primitive and is a `DEPLOYMENT_BASELINE`. The proposal does not repeat stopped `GPU-NCCLGROUPCUT` (no collective grouping), `GPU-L2LEASE` (no L2 lease API), or any single issue replay. `SEARCH_BOUNDED_OPEN`: Stage 0 must check whether NVIDIA samples or Blackwell kernels already contain the same variance/locality policy.

## Decisive falsifier

Drop if unmodified CLC or fixed-work scheduling matches every policy point under a natural irregular workload, or if exposed tile metadata cannot predict a tail regime better than a fixed threshold.

## Executable evidence path

### 72-hour first evidence

Start from NVIDIA's documented CLC sample pattern, implement A for one open block-masked attention or MoE tile generator, and compare p50/p99, failed cancellations, and a paired high-priority microkernel's start delay. Freeze identical masks, tile shapes, precision, and seeds.

### AI core fraction and critical path

`AI_CORE_CONDITIONAL`, about `0.61`. AI can implement the policy, create reproducible irregular tile inputs, run correctness checks, and analyze the full counter ledger. Decisive CLC evidence requires an accessible Blackwell GPU; lack of one limits automatic advance but is not an academic STOP.

### Semantics-preserving open alternatives

CUDA's CLC semantics are Blackwell-specific. A CPU/GPU discrete-event model may reject implausible policies but cannot establish the performance claim; it is only a pre-hardware filter.

## Dual-axis score

- Academic value: `57/70`
- AI executability bonus: `18/30`
- Total: `75/100`

## AI and researcher boundary

AI owns the policy, generator, reproducibility bundle, and pre-hardware model. The researcher controls Blackwell access and claims about real preemption behavior.

