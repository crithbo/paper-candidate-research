# GPU-L2LEASE Lease-aware allocation of CUDA persisting-L2 windows across concurrent graph nodes

- Status: `PROPOSE_STAGE0`
- Primary lane: CUDA/GPU runtime and memory system
- Discovery date: 2026-08-02
- Novelty state: `SEARCH_BOUNDED_OPEN`

## Research question

Can a CUDA-Graph compiler allocate a bounded, time-scoped persisting-L2 lease (window, hit ratio, and explicit release) across overlapping graph nodes so that reuse survives without concurrent streams mutually evicting each other?

## Importance and group fit

CUDA exposes persisting-L2 access windows and explicitly warns that concurrent windows can evict one another; the documented mitigation is a user-chosen `hitRatio`, while Graph kernel nodes can carry the same attribute. This creates a graph-level allocation problem rather than a per-kernel hint. Natural objects include multi-stream inference graphs, pipeline-parallel stages, and CUTLASS graph captures. This is distinct from `CGPU-RPIV` (register/IV rewrite), `CGPU-DECSLICE` (specialization signature), and `GPU-TMAPHASE` (async protocol safety).

## Exact object

A CUDA Graph DAG whose kernel nodes expose conservative read/reuse intervals for contiguous global-memory regions. The decision is each eligible node's access-policy window, hit ratio, lease start/end, and reset-to-normal operation under a fixed persisting-cache budget. Costs include cache-budget contention, release operations, graph/node attribute updates, and any lost reuse; it excludes redesigning a kernel's algorithm or generic cache replacement.

## Strongest fair baseline

The fair baseline is CUDA's documented manual per-stream/per-graph `accessPolicyWindow` tuning, including fixed hit ratios and no timely reset; a secondary baseline is static single-kernel window sizing. Comparison must use the same graph, cache budget, region sizes, concurrency trace, and all launch/update costs.

## Mechanism hypothesis

A conflict graph over live reuse intervals plus a probabilistic capacity model can select fractional hit ratios and explicit lease expiry; this should avoid the high-hit-ratio self/inter-stream thrashing that manual independent windows permit.

## Competing mechanisms

- Mechanism A: interval-conflict fractional packing; variables are node lease intervals and hit ratios; predicts fewer overcommitted concurrent bytes; strongest counterexample is hardware randomness dominating any static allocation; minimum artifact is a graph/trace analyzer and cache-accounting simulator.
- Mechanism B: online feedback controller using graph replay counters; variables are next-replay hit ratios and admission; predicts adaptation to changed branch frequencies; counterexample is feedback noise or a nonstationary workload; minimum artifact is a simulator-driven controller.
- Mechanism C: region coalescing/rematerialization; variables are whether aliases share a lease; predicts less metadata/update cost; counterexample is discontiguous or aliased regions breaking safe coalescing; minimum artifact is a pointer-range analysis.
- Preferred mechanism and why: A, because it has a static, falsifiable objective and can be tested without claiming undocumented cache behavior.

## Candidate paper claim

For a declared graph/region abstraction, lease-aware allocation reduces modeled overcommitment and exposed DRAM traffic relative to independent manual windows, while preserving graph semantics and accounting for reset/update costs. This is a candidate claim, not measured hardware performance.

## Current collision subtraction

CUDA supplies the API and manual fractional hint, not a compiler allocation algorithm. A 2023 static-profiling result appears to size an access-policy window for an application and is therefore `DIRECT_SUBTRACT` for single-kernel sizing; it does not yet establish the same concurrent graph lease/release decision. Search scope is recorded in `source_log.md`; no claim of firstness is made.

## Decisive falsifier

Drop if an accessible prior system already jointly selects graph-node windows, hit ratios, expiry, and capacity under the same costs; or if 15+ public graph traces show no conflict-sensitive reuse regime in which A differs from fixed/manual allocation.

## Executable evidence path

### 72-hour first evidence

Extract 12--20 CUDA Graph or synthetic multi-stream DAGs; implement interval/conflict accounting; compare fixed 1.0, equal-share, and A under a documented sensitivity range. The decisive observation is at least one natural trace family where A changes the non-dominated traffic/retention frontier after reset and update costs.

### AI core fraction and critical path

- `ai_core_fraction`: 74%
- Class: `AI_CORE_EXECUTABLE`
- AI can implement trace extraction, the allocator, reproducible simulator, and ablations. A real Ampere+ GPU improves calibration only; no simulated result may be called a hardware speedup.

### Semantics-preserving open alternatives

Use CUDA Graph JSON/source captures and a CPU cache-accounting model when a GPU is unavailable. Later hardware validation must retain the exact graph and include graph-update and stream synchronization costs.

## Dual-axis score

- Academic value: `55/70`
- AI executability bonus: `24/30`
- Total: `79/100`

## AI and researcher boundary

AI can close the static/simulator claim. The researcher must confirm group ownership, select a final GPU calibration target, and prevent a model-only result from being presented as measured cache behavior.
