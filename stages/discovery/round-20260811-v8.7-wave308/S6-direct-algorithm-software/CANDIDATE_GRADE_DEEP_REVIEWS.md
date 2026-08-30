# Candidate-grade depth review — PaPILO

## Fixed semantics and native oracle

The object is a fixed MIP/LP and a fixed solver/checker contract. A legal producer emits a reduced problem and sufficient postsolve state; a solver answer in reduced space is lifted back to original variables. Feasibility and objective are judged on the original instance. The oracle is stock `papilo postsolve`/`Postsolve::undo`, followed by the fixed solver/checker.

## Current upstream reality check

The official current PaPILO repository (`main`, source/documentation retrieved 2026-08-11) supplies a `Presolve<REAL>` controller, `Problem`, `Postsolve`, default presolver registration, parameter collection, timing categories, `Reductions`, and serialized postsolve state. It exposes binary `solve`, `presolve`, and `postsolve` paths; parameters are published in `parameters.txt` and may be supplied by CLI/settings or programmatically. The documentation describes `fast`, `medium`, and `exhaustive` timing categories, and individual presolvers writing reductions against the problem.

This establishes the deployable strongest union as: default and added presolvers + their timings/type filters + parameter settings + reduction collection/application + index compression/state callbacks + postsolve storage/lifting + linked-solver path. The observed source/documentation did **not** yield an immutable commit SHA through the available official web route; this provenance limit is recorded rather than manufactured. It does not create an absence claim.

## Minimal legal action-divergence witness

For a small model containing two independently reducible components, reduction A then B and B then A can be distinct native reduction histories. When their recorded inverse operations commute, each may lead to a reduced model whose solutions lift to the same original solution. This is a lawful *schedule-level* divergence only. It does not demonstrate a new PaPILO-specific whole constructor, nor does it prove a nontrivial recourse frontier.

## Candidate recurrence and guarantee test

The requested proposition would need a recurrence over a dependency/commutativity graph of reductions, selecting batches while proving all of:

1. every selected batch is valid under the same numeric/feasibility assumptions;
2. its postsolve record lifts every accepted reduced-space solution correctly;
3. a target-specific bounded-recourse or reduction-size/postsolve-cost Pareto bound exceeds the current composition.

The available candidate has only a topological batching/scheduling kernel. That kernel is not target-specific: it is an ordering of known reduction actions, and its proposed cost ledger is already naturally represented by PaPILO's reduction and postsolve paths. No PaPILO-specific parameter, invariant, or theorem was frozen that turns it into a non-generic exact/FPT/approximation result. Claiming novelty would therefore amount to a controller/scheduler or generic DAG-packing wrapper, which is excluded.

## Direct collision and fair subtractor

The official PaPILO repository identifies its 2023 INFORMS Journal on Computing article and the established presolve-reduction literature. The official code and documentation already make parallel reduction processing and parameterized presolver composition part of the fair comparator. This prevents a comparison solely against one fixed presolver order. A complete bibliographic direct-collision closure beyond the primary sources is unnecessary to the disposition: the candidate fails the target-specific N2 requirement before novelty is reached.

## Natural route, full cost, and finite killer

- **Carrier:** versioned public MIPLIB instances, fixed solver/version and fixed solution checker.
- **Full-cost denominator:** parse + presolve + reduction/archive serialization + solver + postsolve/lift + original feasibility/objective check; CPU/wall, RSS, temporary storage, reduced model bytes and archive bytes.
- **72-hour fidelity/killer:** a two-component MIP witness must replay both legal histories through stock postsolve, then show either a stated target-specific bound beyond a fair composition or collapse to ordinary commutative scheduling. The presently specified construction collapses to the latter without running the test.

## Disposition

`STRUCTURAL_DROP`. This is not due to missing implementation, result, resource, or AI readiness. Under identical lifting semantics, the currently named action divergence is only generic reduction scheduling; no non-generic PaPILO-specific recurrence/guarantee remains. No Stage0 brief is warranted.

