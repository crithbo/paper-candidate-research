# GRAPH-TEMPORAL-TRIANGLE-DEADLINE — Deadline-bounded recourse for event-time temporal triangle counts

- Status: `PROPOSE_STAGE0`
- Primary lane: dynamic/temporal graph algorithms
- Discovery date: 2026-08-02

## Research question

Can a sharded event-time temporal-triangle counter satisfy a per-window publication deadline under bounded out-of-order updates by explicitly bounding ownership migration and count correction, rather than choosing only batch size or rebuild cadence?

## Importance and group fit

Temporal interaction data requires repeated motif statistics while updates and event-time order disagree. The object exposes an algorithmic trade-off among deadline debt, recourse and exact/approximate count corrections.

## Exact object

Insert-only timestamped edge stream; triangle window length `W`, lateness bound `L`, shard-local adjacency/state, deadline `D`, and output correction semantics. Offline globally ordered evaluation is only `OPT`.

## Strongest fair baseline

Same-input micro-batch reorder plus exact dynamic triangle maintenance, and periodic rebuild with equal memory, partition visibility and publication deadline.

## Mechanism hypothesis

Maintain an affected wedge frontier whose ownership is committed only when its deadline debt crosses a threshold. **Separation hypothesis:** on a bursty hub-and-spoke-then-close family, deadline-aware ownership changes give a recourse/correction bound that cannot be obtained by static partitioning plus batch size selection without violating `D` or moving asymptotically more wedges.

## Competing mechanisms

- Mechanism A: debt-indexed wedge ownership / partial recertification.
- Mechanism B: fixed shards + micro-batch reorder.
- Mechanism C: periodic global rebuild.
- Preferred mechanism and why: A decides which maintained wedges may migrate; it is not merely an update scheduler if its recourse invariant survives audit.

## Candidate paper claim

An online bicriteria bound connecting `D`, bounded lateness and wedge recourse, plus public-trace evidence. Hypothesis only; the bound may fail.

## Current collision subtraction

This is not k-core recertification and not the stopped late temporal-motif estimator: its exact object is temporal triangles with a hard publication deadline and explicit migration accounting. Dynamic-triangle and streaming-motif unions remain open collision work.

## Decisive falsifier

If a same-information batch/reorder or dynamic-triangle baseline duplicates the committed-wedge action with equal deadline, memory and recourse across the witness family, stop.

## Executable evidence path

SNAP temporal interaction data or generated timestamped graphs; a CPU reference counter and deterministic partition/reorder controls are sufficient for the first gate.

### 72-hour first evidence

Enumerate adversarial burst families and replay one public temporal trace. Log deadline misses, edge/wedge migrations, correction counts and exactness; reject on no action-level divergence.

### AI core fraction and critical path

`0.74`: AI can implement/replay CPU prototypes and enumerate witnesses. The remaining gap is theorem validation, not unavailable hardware.

### Semantics-preserving open alternatives

Public temporal graph data, NetworkX/CSR CPU baselines and a deterministic simulator.

## Dual-axis score

- Academic value: `49/70`
- AI executability bonus: `23/30`
- Total: `72/100`

## AI and researcher boundary

AI can execute the first killer. A researcher must validate final graph-theoretic claims and positioning.
