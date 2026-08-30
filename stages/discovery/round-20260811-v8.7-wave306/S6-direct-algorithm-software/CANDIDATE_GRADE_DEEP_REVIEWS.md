# Candidate-grade deep reviews

No implementation or benchmark was run. `NOT_ADMITTED_UNFROZEN` means that the object may be scientifically viable, but the required source/collision closure is absent—not that the mechanism has been disproved.

## D1. Soufflé recursive relation construction

- **Exact object / oracle:** a fixed Datalog program, input relations, language semantics and resulting relation set; the compiled/interpreted Soufflé result is the stock oracle.
- **Current union:** translation to parallel C++, interpreter paths, relation data structures, index selection, provenance/profiling and compilation options are confirmed upstream. The complete default/non-default relation-representation, join-plan and recursive scheduling union is not source-pinned.
- **Legal divergence:** two complete evaluation constructions can preserve the same least-fixed-point result while using distinct relation representation/join-frontier histories. Native legality under all aggregates, subsumption and provenance modes remains unclosed.
- **N2 proposition:** parameterized exact fixed-point constructor with a frontier-width work/space bound; not a generic join planner or engine selector.
- **Natural route / cost / killer:** Doop/Soufflé program-analysis facts, output relation equality; compile, construction, evaluation, RSS/temp, output and query cost. Within 72h, a finite recursive skew witness must establish the stated frontier parameter and compare the whole stock union.
- **Outcome:** `NOT_ADMITTED_UNFROZEN` — the source union and direct Datalog-evaluation collision matrix are incomplete.

## D2. PaPILO presolve/postsolve reduction constructor

- **Exact object / oracle:** fixed MIP/LP, reduced instance, solution lifting and objective/feasibility semantics; PaPILO postsolve plus stock solver answer are the oracle.
- **Current union:** upstream documents default presolvers, timing classes, parameter set, reductions and postsolve archive. The full current reduction-conflict/order union and proof/certificate status across all modes were not closed.
- **Legal divergence:** distinct batches of individually legal reductions can yield equivalent reduced-instance and lifting semantics while emitting different postsolve traces.
- **N2 proposition:** a target-specific certified batch-constructor with bounded reduction recourse and a reduction-size versus postsolve-cost Pareto guarantee.
- **Natural route / cost / killer:** MIPLIB versioned instances; feasibility/objective/lift oracle; presolve, solve, postsolve/check, archive bytes, CPU/RSS/temp. Killer: a small instance where a claimed batch is either non-commuting under lift semantics or establishes a proper Pareto point.
- **Outcome:** `NOT_ADMITTED_UNFROZEN` — known presolve reduction literature and current full union need independent closure.

## D3. OR-Tools CP-SAT presolve and encoding construction

- **Exact object / oracle:** fixed CP-SAT model, objective and all solution/optimality answers; stock CP-SAT validation is the oracle.
- **Current union:** the official repository exposes CP-SAT, presolve, solver and configuration surfaces. Complete source-level subtraction across encodings, presolve, subsolvers, symmetry and proof/response paths was not completed.
- **Legal divergence:** two model-preserving preprocessing/encoding constructions can produce different yet answer-equivalent native solver inputs. A full same-information witness is not closed.
- **N2 proposition:** an exact/FPT constructor for a named bounded incidence structure that couples legal encoding and presolve actions with a solve-plus-construction bound.
- **Natural route / cost / killer:** public OR-Library / MiniZinc-derived CP instances with fixed model semantics; solution/optimality oracle; preprocess, solve, validation, CPU/RSS/temp and model size. Killer: a finite model family that falsifies the claimed structural bound or shows no difference from the current composition.
- **Outcome:** `NOT_ADMITTED_UNFROZEN` — no complete current-union or direct-collision closure.

## D4. Redis probabilistic-set constructor

- **Exact object / oracle:** fixed insertion/query stream and explicit probabilistic error contract; Redis command results and stored state semantics are the oracle.
- **Current union:** official Redis materials enumerate built-in probabilistic structures but the precise module/core construction and all deployable configuration union were not frozen.
- **Legal divergence:** a common stream can admit different legal hash/bucket/state construction histories under the same error contract. It is not yet shown that the possible action is native in the current object.
- **N2 proposition:** a stream-shape-aware certified construction with a bounded false-positive/memory/update Pareto frontier, not a threshold tuner.
- **Natural route / cost / killer:** versioned access-log/key stream route; membership/error oracle; construction, update/query, RSS, serialized bytes and latency. Killer: finite trace and fixed error budget that either validates the same-object state transition or demonstrates absorption by current implementations.
- **Outcome:** `NOT_ADMITTED_UNFROZEN` — exact native union, checker boundary and direct collision remain incomplete.

## Decision

`COMPLETE_ZERO_PROPOSALS`; four deep rows, eight unique families. There is no grounded brief because no row simultaneously closed current strongest composition, direct collision, and a target-specific non-generic guarantee.

