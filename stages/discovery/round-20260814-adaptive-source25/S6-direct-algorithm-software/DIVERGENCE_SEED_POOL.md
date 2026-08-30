# Source25 divergence seed pool (generated before evidence lookup)

- Assignment/lane: `DISCOVERY-S6-20260814-ADAPTIVE-SOURCE25-DIVERGENCE-V1R1` / S6.
- Seed ceiling: 12; locator ceiling after convergence: 8.
- Network-security exclusion: PASS.  Generation completed before evidence lookup: YES.
- Seeds below are non-evidentiary sketches; they do not assert novelty, current absence, or paper quality.

## Coverage

| Engine | Used | Seed IDs |
|---|---:|---|
| BISOCIATION_STRUCTURAL_TRANSFER | yes | S01, S06 |
| PROBLEM_REFRAMING | yes | S02, S07 |
| CONSTRAINT_MANIPULATION | yes | S03, S08 |
| JANUSIAN_TENSION | yes | S04, S09 |
| COMPOSE_DECOMPOSE_SIMPLIFY | yes | S05, S10 |

## Seed records

| ID | Engine / perspective | Idea sketch and conclusion-first test | Main risk | Status |
|---|---|---|---|---|
| S01 | Structural transfer / compiler-backend engineer | Treat RISC-V vector configuration state as a finite automaton and jointly place legal `vsetvli` transitions across CFG joins.  A cautious conclusion would be an exact/FPT state-minimal transition construction for fixed vector semantics. | Existing backend pass may already solve the same state-placement problem. | Keep |
| S02 | Problem reframing / hardware architect | Treat AArch64 SME streaming-mode boundaries as a scope-construction problem rather than isolated instruction lowering.  A cautious conclusion would be bounded-scope minimization preserving ZA/ABI semantics. | Scope changes may be ABI/semantics or current compiler may already absorb it. | Keep |
| S03 | Constraint manipulation / end user | Constrain MLPerf Tiny quality and memory, then seek a target-specific inference-state constructor rather than a general allocator. | Likely generic arena packing. | Keep as contrast |
| S04 | Janusian tension / operator | Use mixed-precision iterative refinement’s accuracy/cost tension to seek a certified precision-state construction on natural sparse systems. | May be a configuration/controller or known numerical method. | Keep as contrast |
| S05 | Compose/decompose / maintainer | Jointly select a target-specific load/store pair and addressing-mode realization instead of independent peepholes. | Generic instruction selection/peephole shell. | Keep |
| S06 | Structural transfer / theorist | Transfer bounded recourse ideas to compiler register-bank assignment after legalisation. | Generic register allocation/solver. | Keep |
| S07 | Problem reframing / measurement reviewer | Recast an accelerator trace’s copy/compute overlap as a stable-law characterization with a noncontroller decision consequence. | Can collapse to measurement-only or scheduling. | Keep |
| S08 | Constraint manipulation / compiler-backend engineer | Limit SVE predicate/register state and seek a joint tail-predication plus predicate-liveness construction. | Active/current backend may already implement it. | Keep |
| S09 | Janusian tension / operator | Balance code-size vs cold-start in a fixed embedded inference artifact using layout/state co-design. | Generic layout/packing. | Keep |
| S10 | Compose/decompose / hardware architect | Decompose GPU shared-memory swizzles and recombine them with warp mapping under a fixed tensor contract. | Generic layout or paper-owned kernel mapping. | Keep |

## Clustering and coverage-constrained convergence

| Cluster | Seeds | Representative selected for locator | Why selected |
|---|---|---|---|
| ISA finite-state scope | S01, S02, S08 | S01, S02 | Different ISAs and distinct state contracts. |
| Natural numerical / Tiny constraints | S03, S04 | S04 | Preserves a numerical-method contrast without another generic layout seed. |
| Backend local composition | S05, S06 | S05 | Tests whether a target-specific addressing action can avoid generic-RA collapse. |
| Accelerator data movement | S07, S09, S10 | S07 | Keeps an N3/cross-layer contrast; no claim yet. |

## Append-only backlog

Unselected seeds: S03, S06, S08, S09, S10.  They are non-evidentiary and will not be used in this assignment without a new convergence decision.

Advisory: engines=5; perspectives=end user/operator/maintainer/compiler backend engineer/hardware architect/measurement reviewer/theorist; `DIVERGENCE_COVERAGE_ADVISORY=PASS`.
