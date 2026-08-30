# IREE-GRAPHTUNE Peak-live-aware coordinated dispatch tuning

- Status: `PROPOSE_STAGE0`
- Primary lane: compiler/runtime system
- Discovery date: 2026-08-02

## Research question

For a static MLIR/IREE inference graph, can coordinated dispatch tuning select legal layouts, fusion boundaries, and per-dispatch schedules using peak live temporary memory and compile budget, yielding Pareto points that independent dispatch tuning cannot reproduce?

## Importance and group fit

Public IREE tuning improves individual dispatches, but a module can lose its local gains through incompatible layouts, materialization, and peak temporaries. This is a static graph-level decision, deliberately distinct from `NPU-SHAPEBUDGET`'s dynamic-shape variant/guard portfolio.

## Exact object

IREE static-shape modules with a frozen backend and model inputs. Decision variables are inter-dispatch layout contracts, legal fusion boundaries, and tuning configurations; cost includes compilation, conversion/materialization, temporary allocation, and execution time.

## Strongest fair baseline

IREE default tuning specs, SHARK/individual-dispatch tuning, compiler default aggressive fusion, and their fair combinations under an identical time/compile budget.

## Mechanism hypothesis

A small number of interface layouts acts as a graph-level coordination variable: selecting them jointly avoids locally optimal schedules that create high peak-live temporaries or conversions.

## Competing mechanisms

- Mechanism A: interface-layout coordination plus dispatch tuning; prediction: equal local kernel scores but lower peak-live/end-to-end cost; counterexample: local optimum always composes.
- Mechanism B: peak-live-aware fusion cuts; prediction: a nonmaximal fusion choice wins after temporaries count; counterexample: maximal fusion dominates.
- Mechanism C: compile-budget allocation across dispatches; prediction: tuning only high-leverage interfaces dominates uniform budget; counterexample: uniform tuning is equivalent.
- Preferred mechanism and why: A is concrete, observable in IR, and separates this topic from generic autotuning.

## Candidate paper claim

On public static-shape modules, interface-layout coordination finds end-to-end latency/peak-memory/compile Pareto points not attainable by independent tuning plus a fixed global fusion policy under matching accounting.

## Current collision subtraction

IREE exposes individual-dispatch tuning and layout-affecting options. This is a `DIRECT_SUBTRACT` baseline, not evidence of equivalence. `CGPU-DECSLICE` targets GPU codegen decision-slice minimization; the object and claim here are graph-level coordinated performance decisions. `SEARCH_BOUNDED_OPEN` pending Stage 0 code/related-work audit.

## Decisive falsifier

Stop if existing IREE/SHARK tuning already jointly searches these interface contracts with full temporary/conversion accounting, or independent optima reproduce every measured coordinated point.

## Executable evidence path

### 72-hour first evidence

Compile two public IREE test-suite modules for a reproducible CPU/RISC-V backend, enumerate a small legal layout/fusion set, replay the standard tuner, and emit a complete module-level cost ledger.

### AI core fraction and critical path

`AI_CORE_EXECUTABLE`, about 0.74. AI can build IREE, instrument IR/allocation, implement the coordinator, and run baselines. The initial claim remains compiler/model-level if no accelerator backend is available.

### Semantics-preserving open alternatives

IREE's CPU or documented RISC-V backend supports the same IR coordination object, while narrowing any accelerator-specific performance claim.

## Dual-axis score

- Academic value: `58/70`
- AI executability bonus: `23/30`
- Total: `81/100`

## AI and researcher boundary

AI owns the reproducible compiler path; the researcher decides target-device validation and final contribution boundary.
