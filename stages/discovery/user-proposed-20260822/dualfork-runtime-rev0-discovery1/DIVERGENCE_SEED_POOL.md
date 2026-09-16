# DualFork Runtime — Divergence Seed Pool

## Pool metadata

- Assignment / lane: `DISCOVERY-S4-20260822-DUALFORK-RUNTIME-REV0` / `S4_OBJECTIVE_CONSTRAINT`
- Frozen profile: `v8.7 canonical; claim-pack=OFF; RQ frontend=OFF; Terra/high`
- Seed ceiling: `<=12`; generated before external evidence lookup: `YES`
- Network-security exclusion: `PASS` (normal agent-runtime resource management only)

## Seed records (non-evidence)

### S4-DF-01

- Engine / perspective: `CONSTRAINT_MANIPULATION` / operator.
- Sketch: A branch is useful only if its model KV and resumable sandbox checkpoint can both be restored inside a fixed deadline. A coupled retain/park/resume/evict decision might dominate two plane-local eviction policies under shared GPU, host-memory and storage budgets.
- Conclusion-first test: If true, a runtime could change the feasible branch set at a fixed end-to-end budget, not merely improve an eviction score.
- Anchor candidate: OpenHands software-agent SDK at the frozen commit plus a version-pinned inference engine and sandbox implementation.
- Generic-kernel risk: high — may reduce to two-resource caching/knapsack.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`.

### S4-DF-02

- Engine / perspective: `JANUSIAN_TENSION` / agent-runtime maintainer.
- Sketch: KV retention rewards rapid token continuation, while sandbox retention rewards fast tool continuation; independently optimal choices can disagree on a branch. The target question is whether semantic branch pairing creates a state-transition constraint unavailable to scalar utility control.
- Conclusion-first test: A nontrivial result would expose a target-specific state coupling, or falsify it by showing independent policies are equivalent.
- Anchor candidate: same frozen SDK branch interface and a public branching-agent workload.
- Generic-kernel risk: medium-to-high; a fixed joint state machine and same-branch semantic guard are required.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`.

### S4-DF-03

- Engine / perspective: `PROBLEM_REFRAMING` / systems researcher.
- Sketch: Treat branch termination as a coupled commit-or-abort action whose cost includes discarded model transfers and sandbox restoration, rather than as independent cache eviction. The decision could support an online feasibility or approximation statement only if the information contract is observable before the action.
- Conclusion-first test: If successful, the outcome is an online branch-runtime algorithm with a stated no-gain region, not a scheduler wrapper.
- Anchor candidate: official inference and sandbox lifecycle APIs; natural workload candidate must show simultaneous branches.
- Generic-kernel risk: high; require a finite counterexample against a generic multi-resource formulation.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`.

### S4-DF-04

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / storage/runtime engineer.
- Sketch: Copy-on-write snapshots couple a logical version tree to physical page ownership; an agent branch analog would couple prompt/KV ancestry to tool-workspace ancestry. A result requires a branch-level action that preserves the paired ancestry rather than independently deduplicating bytes.
- Conclusion-first test: The cautious claim would be that paired ancestry changes legal transition choices under a full-cost deadline.
- Anchor candidate: current KV lifecycle and OpenHands sandbox/checkpoint source loci.
- Generic-kernel risk: medium; source must show both state planes actually persist across a common branch identity.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`.

### S4-DF-05

- Engine / perspective: `NEGATION_OR_INVERSION` / reliability reviewer.
- Sketch: If sandbox restore dominates only after a branch has regained KV residency, then reducing KV misses alone can worsen time-to-useful-branch. The hypothesis is a Pareto reversal caused by coupled restore ordering, not a new weight vector.
- Conclusion-first test: If supported, the paper changes the branch-residency action/order; if not, it remains an ordinary metric tradeoff.
- Anchor candidate: a versioned branching workload carrier plus current runtime lifecycle sources.
- Generic-kernel risk: high; no result without same-object ordering semantics.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`.

### S4-DF-06

- Engine / perspective: `COMPOSE_DECOMPOSE_SIMPLIFY` / theorist.
- Sketch: Compare a paired-state online policy against the deployable union of one KV policy and one sandbox policy that see identical branch-tree information. The residual survives only if an atomic joint transition is legal and cannot be reproduced by synchronized independent actions at equal full cost.
- Conclusion-first test: The strongest modest outcome is a falsifiable equivalence/separation condition for coupled branch state.
- Anchor candidate: official current engine/sandbox configuration surfaces and a finite branch-tree witness.
- Generic-kernel risk: decisive; generic two-resource tree caching must be a named contrary route.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`.

## Convergence

All six seeds concern the same proposed object and are alternatives, not separate opportunity families. They converge on `S4-DF-RQ-01`; no outcome-aware selection or replacement was performed.

| Selected seed | Coverage retained | RQ candidate |
|---|---|---|
| S4-DF-02 / S4-DF-06 | semantic pairing plus generic-kernel falsifier | `RQ_CANDIDATE.md#S4-DF-RQ-01` |

## Advisory

- Engines used: 6; perspectives: operator, maintainer, systems researcher, storage/runtime engineer, reliability reviewer, theorist.
- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS`.
- These sketches make no novelty, current-absence, quality-tier or feasibility claim.
