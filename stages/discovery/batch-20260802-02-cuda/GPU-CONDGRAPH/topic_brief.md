# GPU-CONDGRAPH Profile-free specialization of CUDA conditional graph bodies

- Status: `PROPOSE_STAGE0`
- Primary lane: CUDA/GPU runtime and compiler
- Discovery date: 2026-08-02
- Novelty state: `SEARCH_BOUNDED_OPEN`

## Research question

Can a compiler transform a CUDA conditional graph into a bounded set of device-side branch bodies that specialize buffer lifetime, capture legality, and update cost without requiring host round trips or profile-trained branch probabilities?

## Importance and group fit

CUDA conditional IF/WHILE/SWITCH nodes now permit device-evaluated control inside a graph. GraCE establishes that generic compiler support materially improves CUDA-Graph coverage and deployment, but it does not by itself establish a conditional-body representation/cost model. The object is not `CGPU-DECSLICE`: it does not cache codegen signatures or specialize kernel code; it transforms graph-level device-side control and resource lifetime.

## Exact object

Input is a capture-eligible CUDA Graph with conditional nodes and statically bounded body alternatives. The decision is body cloning/hoisting, branch-local allocation/lifetime, and whether a branch remains device-side versus uses a safe generic body. The contract preserves node dependencies, condition-handle initialization/update semantics, memory reachability, and observable kernel/memcpy order. Costs include graph instantiation, body size, branch-local resource retention, and skipped host launch work.

## Strongest fair baseline

Unchanged conditional graph; host-dispatched alternatives; and GraCE's generic capture/parameter-copy/selective deployment techniques where applicable. The comparison must include construction/update amortization and not treat a host-free branch as free.

## Mechanism hypothesis

A resource-lifetime-aware graph partial evaluator can hoist branch-invariant nodes and split only when a static upper bound proves that reduced lifetime or host work exceeds body duplication/update cost.

## Competing mechanisms

- Mechanism A: symbolic condition/lifetime partial evaluation; variables are hoist/split decisions; predicts lower peak live bytes and host edges; counterexample is dynamic pointer reachability; minimum artifact is a graph IR checker.
- Mechanism B: cost-guided body cloning; variable is clone subset; predicts a break-even frontier; counterexample is graph-instantiation overhead dominates; minimum artifact is a static cost model.
- Mechanism C: device-side generic loop with predication; variable is retain versus branch; predicts lower graph growth; counterexample is useless work dominates; minimum artifact is a semantic interpreter.
- Preferred mechanism and why: A, because its safety and resource claims can be checked prior to performance measurement.

## Candidate paper claim

For a bounded conditional-graph subset, the transform preserves graph semantics and reduces modeled host-edge or peak-lifetime cost relative to unchanged, host-dispatched, and generic-body baselines; the break-even boundary is reported explicitly.

## Current collision subtraction

GraCE is `DIRECT_SUBTRACT` for generic CUDA-Graph coverage, parameter-copy elimination, and selective graph deployment. CUDA's conditional-node API is a `DEPLOYMENT_BASELINE`. The only retained residual is conditional-body resource/lifetime specialization; if GraCE or another accessible system already covers it, this topic is a `DIRECT_FATAL` drop.

## Decisive falsifier

Drop if the conditional-node legality rules leave no nontrivial capture-eligible subset, or if collision review finds GraCE-equivalent conditional-body specialization under the same costs.

## Executable evidence path

### 72-hour first evidence

Implement a small graph IR/interpreter for 8 public/synthetic IF/WHILE/SWITCH patterns and validate transformed versus original event traces. Pass only if A produces a safe transform with a non-dominated static resource/host-edge point in at least two natural patterns.

### AI core fraction and critical path

- `ai_core_fraction`: 68%
- Class: `AI_CORE_CONDITIONAL`
- AI can implement semantics, checker, and model; a CUDA 12.8+ target is needed later to calibrate actual construction and launch costs.

### Semantics-preserving open alternatives

CUDA documentation and samples plus a CPU event interpreter support the semantic first gate; any device result later must use a named toolkit and include graph-build/update costs.

## Dual-axis score

- Academic value: `53/70`
- AI executability bonus: `20/30`
- Total: `73/100`

## AI and researcher boundary

The narrow residual is collision-sensitive. AI should not promote this beyond Stage 0 without a focused GraCE/conditional-node subtraction and researcher confirmation of the paper boundary.
