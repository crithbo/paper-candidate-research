# Source54 S6 — bounded non-evidence seed portfolio

## Metadata

- Assignment / lane: `DISCOVERY-S6-20260815-ADAPTIVE-SOURCE54-R40-ORDINARY-BREADTH-V1` / S6.
- Method: canonical v8.7; RQ production; selective-depth, claim-pack and V9 OFF.
- Seeds generated offline before selected-candidate evidence lookup: `YES`.
- Seed count: 7 (`<=12`); no seed is an opportunity-family, novelty, current-absence, or raw claim.
- Network-security screen: `PASS`; all seeds concern ordinary compiler/program semantics.

## Seeds

### S01 — GCC interprocedural register allocation

`CONSTRAINT_MANIPULATION` from a compiler-backend engineer view.  Holding the call graph, ABI and externally visible C/C++ behavior fixed, caller/callee register decisions can trade spills/moves against compilation state.  A cautious success would be a target-specific whole-call-graph allocation guarantee, not a generic register-allocation solver.

- Anchor candidate: current GCC Optimize Options `-fipa-ra` and official producer locus `gcc/ipa-ra.cc`.
- Noun-swap test: `PASS`; call-clobber/ABI and cross-call liveness remain after removing GCC names.
- Risk: the current pass or a generic RA kernel may absorb the action.

### S02 — GHC worker/wrapper specialisation

`COMPOSE_DECOMPOSE_SIMPLIFY` from a compiler engineer view.  Worker construction plus caller rewrite could offer a joint semantic construction, but it is close to the Source53 recursive-specialisation surface and is retained only as non-selected backlog.

### S03 — LLVM global-address base grouping

`ABSTRACTION_LADDER` from an architecture view.  A fixed module can exchange global-base reuse against offset reachability, but any surviving formulation risks generic packing; it remains backlog.

### S04 — GCC interprocedural mod/ref summary construction

`BISOCIATION_STRUCTURAL_TRANSFER` from a theorist view.  Function summaries might share a bounded formal state across calls, but its outcome may be analysis scheduling rather than a direct constructor; it remains backlog.

### S05 — OpenMP target-map plan construction

`JANUSIAN_TENSION` from a cross-layer engineer view.  Fixed mapping semantics could couple source-region maps and device transfers, yet the likely residual is runtime policy/controller; it remains backlog.

### S06 — C++ template-instantiation DAG scheduling

`NEGATION_OR_INVERSION` from a build-systems view.  Compile-time duplication versus parallelism is potentially measurable but risks controller-only status; it remains backlog.

### S07 — LLVM function splitting and code layout

`ADJACENT_POSSIBLE_OR_BOUNDARY` from a backend view.  It shares a broad layout surface with historical linker/BOLT work; no selected RQ is formed without exact five-field separation.

## Convergence

| Cluster | Seeds | Decision |
|---|---|---|
| Cross-function compilation construction | S01, S02, S04 | Select S01: fixed ABI/liveness has the sharpest potential same-object decision. |
| Layout/addressing | S03, S07 | Backlog; generic/identity risk. |
| Cross-layer runtime/build | S05, S06 | Backlog; controller risk. |

| Selected seed | Why selected before evidence | RQ |
|---|---|---|
| S01 | It poses one frozen call-graph/ABI decision and a finite official source route. | RQ01 |

Backlog seeds are append-only non-evidence records; they do not populate this cycle's raw denominator.
