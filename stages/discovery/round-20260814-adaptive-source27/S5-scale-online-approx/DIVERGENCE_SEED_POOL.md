# Divergence Seed Pool — Source27 S5

## Pool metadata

- Assignment / lane: `DISCOVERY-S5-20260814-ADAPTIVE-SOURCE27-ORIGIN-GROUNDED-V1` / S5.
- Profile: `SOURCE27_ORIGIN_GROUNDED_ORTHOGONAL_RESIDUAL_V1`; v8.7 canonical, V9 OFF.
- Seed count: 8 (≤12; ≤6 per source capsule). No external lookup occurred during generation.
- Network-security exclusion: PASS. None of the sketches concerns attacks, exploits, vulnerabilities, protocol security, or malicious traffic.

## Coverage

| Engine | Seed IDs |
|---|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | S27-01 |
| `PROBLEM_REFRAMING` | S27-02 |
| `CONSTRAINT_MANIPULATION` | S27-03 |
| `NEGATION_OR_INVERSION` | S27-04 |
| `ABSTRACTION_LADDER` | S27-05 |
| `ADJACENT_POSSIBLE_OR_BOUNDARY` | S27-06 |
| `JANUSIAN_TENSION` | S27-07 |
| `COMPOSE_DECOMPOSE_SIMPLIFY` | S27-08 |

Perspectives: THEORIST (S27-01/S27-05), COMPILER_OR_BACKEND_ENGINEER (S27-02/S27-06), MEASUREMENT_REVIEWER (S27-03), HARDWARE_ARCHITECT (S27-04), MAINTAINER (S27-07), END_USER (S27-08).

## Herdtools7 capsule sketches

### S27-01

- Engine / role: `BISOCIATION_STRUCTURAL_TRANSFER` / THEORIST.
- Sketch: Transfer incremental graph-maintenance ideas to a fixed `.cat` relation graph after a single litmus-test edit, but require identical allowed/outcome set. The mapping is instruction edit → candidate relations → stock herd counterexample/acceptance.
- Conclusion-first: A narrow result would be a memory-model-specific bounded-reanalysis guarantee, valuable for a named architecture corpus; it cannot be merely a cached checker.
- Risk / evidence needed: Herdtools may only expose whole test/model checking; need exact `.cat`, stock command/config union, and a public dated litmus pair.
- Preliminary: `KEEP_FOR_CONVERGENCE`, `PASS` noun-swap.

### S27-02

- Engine / role: `PROBLEM_REFRAMING` / COMPILER_OR_BACKEND_ENGINEER.
- Sketch: Instead of asking whether a program is allowed, ask for a stable minimal witness explanation under a small model or program edit. Freeze the same architecture relation and the same counterexample semantics.
- Conclusion-first: A possible contribution is a target-model witness-stability guarantee, not a generic reducer.
- Risk / evidence needed: stock herd counterexample/reducer or a generic MUS/MCS algorithm may absorb it.
- Preliminary: `KEEP_FOR_CONVERGENCE`, `PASS` noun-swap.

### S27-03

- Engine / role: `CONSTRAINT_MANIPULATION` / MEASUREMENT_REVIEWER.
- Sketch: Vary a fixed architecture model's relation budget and seek a natural stable law in outcomes or witness size across a versioned litmus corpus. The measurement endpoint, not a checker speedup, would be primary.
- Conclusion-first: An N3 characterization could change which model relation a user investigates first, only if a stable law and confounder control are available.
- Risk / evidence needed: public corpus version, formal estimand, and decision consequence are currently unknown.
- Preliminary: `KEEP_FOR_CONVERGENCE`, `PASS` noun-swap.

### S27-04

- Engine / role: `NEGATION_OR_INVERSION` / HARDWARE_ARCHITECT.
- Sketch: Reverse the default assumption that all allowed executions need the same explanatory relation set, then find a configuration-specific sparse relation certificate. The certificate must be checked by the stock model, not be a generic SAT witness.
- Conclusion-first: Only a target-architecture certificate-size/coverage guarantee could matter.
- Risk / evidence needed: generic formal wrapper risk is high; need a native partial primitive in current model source.
- Preliminary: `KEEP_FOR_CONVERGENCE`, `PASS` noun-swap.

## RISC-V Sail capsule sketches

### S27-05

- Engine / role: `ABSTRACTION_LADDER` / THEORIST.
- Sketch: Descend from an ISA configuration to a single extension interaction and seek a configuration-preserving partial-execution constructor that supplies an exact Sail-state equivalence certificate across a small instruction edit.
- Conclusion-first: It would be a RISC-V configuration-specific transition guarantee, not theorem-prover memoization.
- Risk / evidence needed: current Sail model may already parameterize this completely, and a stock emulator/checker must be fixed.
- Preliminary: `KEEP_FOR_CONVERGENCE`, `PASS` noun-swap.

### S27-06

- Engine / role: `ADJACENT_POSSIBLE_OR_BOUNDARY` / COMPILER_OR_BACKEND_ENGINEER.
- Sketch: Use a newly bounded ISA configuration to ask whether semantic configuration deltas can be compiled into an executable decision DAG with a certified state-space bound while preserving stock Sail execution.
- Conclusion-first: Only a named configuration plus exact state/result contract would be worth a formal/algorithmic paper.
- Risk / evidence needed: generic partial evaluation and paper-owned constructor danger; needs a stock native configuration/action union.
- Preliminary: `KEEP_FOR_CONVERGENCE`, `PASS` noun-swap.

### S27-07

- Engine / role: `JANUSIAN_TENSION` / MAINTAINER.
- Sketch: Hold both readable Sail source and fast generated simulator output as constraints, then seek bounded recourse regeneration after a configuration edit while keeping exact ISA behavior.
- Conclusion-first: At most this is an exact source-to-simulator state-transfer guarantee; it cannot be a build-system trigger policy.
- Risk / evidence needed: likely source-tool generation/rebuild policy and forbidden mature-tool wrapper.
- Preliminary: `KEEP_FOR_CONVERGENCE`, `PASS` noun-swap.

### S27-08

- Engine / role: `COMPOSE_DECOMPOSE_SIMPLIFY` / END_USER.
- Sketch: Decompose RISC-V state into architectural registers, CSR, memory and trap effects, then seek a checker-backed minimal replay projection for a fixed failing conformance trace. The target is the formal state transition, not test triage policy.
- Conclusion-first: A valid result would quantify a target-specific exact replay projection guarantee.
- Risk / evidence needed: could be generic trace slicing; a public test ID, exact counterexample semantics, and native projection action would be essential.
- Preliminary: `KEEP_FOR_CONVERGENCE`, `PASS` noun-swap.

## Clustering and coverage-constrained selection

| Cluster | Seeds | Difference | Representative |
|---|---|---|---|
| Herd relation/witness | S27-01, S27-02, S27-04 | incremental relation update vs witness stability vs sparse certificate | S27-01 |
| Herd characterization | S27-03 | N3 estimand, not constructor | S27-03 |
| Sail configuration/state | S27-05, S27-06, S27-07, S27-08 | transition equivalence vs decision DAG vs regeneration vs replay projection | S27-05 |

| Selected seed | Exact locator precommit | Orthogonality to other selected locators | Question Card |
|---|---|---|---|
| S27-01 | Herdtools7 fixed `.cat` architecture model plus one edited public litmus; bounded relation-reanalysis construction | differs from QC27-02 in type/action/carrier/falsifier, from QC27-03 in object/action/carrier | QC27-01 |
| S27-03 | Herdtools7 versioned litmus corpus N3 relation/outcome law | differs from QC27-01 in contribution type/action/falsifier, from QC27-03 in object/action/carrier | QC27-02 |
| S27-05 | RISC-V Sail fixed ISA configuration plus one public test; certified exact state-transition partial action | differs from both Herd cards in exact object, carrier, action, and falsifier | QC27-03 |

Backlog: S27-02, S27-04, S27-06, S27-07, S27-08. It is append-only and non-evidentiary; no outcome-aware substitution is allowed.

`DIVERGENCE_COVERAGE_ADVISORY`: PASS — eight engines and six perspective roles used without filler.
