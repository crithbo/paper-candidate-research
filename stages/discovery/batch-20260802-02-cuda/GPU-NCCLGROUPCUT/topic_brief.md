# GPU-NCCLGROUPCUT Legality-preserving partition of NCCL group calls to recover stream overlap

- Status: `PROPOSE_STAGE0`
- Primary lane: CUDA/GPU communication runtime
- Discovery date: 2026-08-02
- Novelty state: `SEARCH_BOUNDED_OPEN`

## Research question

Can a compiler partition or retain `ncclGroupStart/End` regions, with explicit CUDA-event dependencies, to trade launch aggregation against the global cross-stream synchronization that NCCL group semantics impose?

## Importance and group fit

NCCL documentation states that one group spanning multiple streams behaves as a global synchronization point, while group calls also aggregate launches and can be required for multi-device management. The resulting legality/performance trade-off is increasingly relevant to overlapping computation/communication. It is not collective-algorithm synthesis (`GC3`), compression, or occupancy shaping.

## Exact object

Input is a multi-rank CUDA/NCCL execution trace with collective order, communicator identity, stream dependencies, and buffer def-use. The decision is a partition of *eligible aggregation-only* group regions plus inserted event edges; mandatory multi-device-management groups remain fixed. The output preserves NCCL communicator order, buffer happens-before, and collective matching. Costs include extra launches, event record/wait, and lost aggregation.

## Strongest fair baseline

NCCL's original grouped program; fully ungrouped eligible operations; and a greedy contiguous split. GC3/AutoCCL are deployment/algorithm baselines only unless they optimize this same API-boundary and synchronization cost model.

## Mechanism hypothesis

A dependence-constrained dynamic program over group boundaries can find cuts whose released streams have useful compute slack, while a legality checker prevents communicator-order changes.

## Competing mechanisms

- Mechanism A: exact/approximate DAG cut over eligible boundaries; variables are cut positions and event edges; predicts exposed synchronization decreases only where slack exists; counterexample is launch overhead dominating; minimum artifact is trace parser plus discrete-event simulator.
- Mechanism B: critical-path greedy splitting; variable is marginal slack; predicts near-optimal results on nested layer traces; counterexample is nonlocal communicator-order coupling; minimum artifact is a rule-based rewrite.
- Mechanism C: occupancy-aware co-scheduling after a fixed partition; variables are compute-resource caps; predicts additional overlap; counterexample is hardware scheduler behavior; minimum artifact is integration with a portable occupancy model.
- Preferred mechanism and why: A, because it has an explicit safety contract and separates grouping from collective-algorithm generation.

## Candidate paper claim

For eligible NCCL regions, a verified group-boundary partitioner reduces simulated critical-path synchronization relative to grouped, ungrouped, and greedy baselines after accounting for launch/event overhead, without changing collective matching or communicator order.

## Current collision subtraction

GC3 generates collective algorithms; AutoCCL tunes collective schedules; recent resource-aware overlap shapes occupancy. Each is a strong `METHODOLOGICAL_ADJACENT` or `DEPLOYMENT_BASELINE`, but none located in this search makes the exact API grouping-cut decision under NCCL's documented multi-stream group semantics. This residual needs Stage 0 audit.

## Decisive falsifier

Drop if legality forces all realistic multi-stream groups to remain atomic, if the fair ungrouped baseline dominates every trace after costs, or if an accessible prior optimizer already covers the same group-boundary decision and correctness contract.

## Executable evidence path

### 72-hour first evidence

Build a small trace IR from public NCCL examples and PyTorch/NCCL captures; implement collective-order validation plus a discrete-event model. Use 10 traces with at least two streams and report only modeled critical paths. Evidence passes only if A improves a natural trace that B cannot match and the validator accepts the rewrite.

### AI core fraction and critical path

- `ai_core_fraction`: 72%
- Class: `AI_CORE_EXECUTABLE`
- AI can implement the trace IR, validator, optimizer, simulator, and baseline matrix. Multi-GPU measurement is a later calibration layer, not the only test of the scheduling claim.

### Semantics-preserving open alternatives

Use NCCL source/examples and traces with a simulator before hardware access. Do not infer actual overlap or speedup from the simulator without later disclosed hardware validation.

## Dual-axis score

- Academic value: `57/70`
- AI executability bonus: `23/30`
- Total: `80/100`

## AI and researcher boundary

AI can prove trace-level legality and execute the model. The researcher must approve any multi-node execution and ensure runtime behavior is reported as a calibration, not assumed by the model.
