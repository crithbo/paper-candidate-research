# Discovery log — S5 Source17

## Frozen assignment and result

- Assignment: `DISCOVERY-S5-20260814-ADAPTIVE-SOURCE17-PROBLEM-EVIDENCE-FIRST-V1`
- Method: canonical v8.7; claim-pack mode `OFF`; V9 output not generated.
- Result: `COMPLETE_ONE_PROPOSE_STAGE0__VERILATOR_SEMANTIC_BOUNDED_RECOURSE_MTASK_CONSTRUCTOR`.
- Search order: independent problem evidence → native union → strongest subtractor → versioned carrier/oracle → pre-outcome D1 → depth.  No outcome-aware backfill.

## Locator and raw screen (6 / ceiling 8)

| ID | Opportunity-bearing anchor | Native union / strongest subtractor | Carrier + oracle | Pre-outcome result |
|---|---|---|---|---|
| R1 Verilator macro-task construction | Current internals specify static dependency ordering and static MTask-to-thread assignment; variance/fragmentation is documented | serial evaluation; `V3Order`/`V3Partition`; `--threads`, Thread-PGO, `--threads-max-mtasks` | CVA6 versioned RTL/regressions; SystemVerilog scheduling semantics and regression outputs | D1; deep 1; brief |
| R2 Yosys/ABC technology mapping | Current Yosys pass and ABC union | prior Yosys/ABC candidate and current mapping controls | Yosys tests / equivalence flow | Historical/active object; no depth |
| R3 OpenROAD detailed placement | placement and legalization are solver-shaped whole actions | stock DRC/placement legality | public LEF/DEF designs | Generic solver/ILP origin; no depth |
| R4 CUTLASS grouped kernels | grouped scheduler modes already choose work assignment | stock grouped scheduler/output checker | profiler problem sets | scheduler/controller residual; no depth |
| R5 Kafka tiered-storage recourse | rebalance/tier assignment union | Kafka current union | public traces | historical family; no depth |
| R6 Tree-sitter incremental parse | incremental parser update union | parser output/test oracle | grammar corpus | historical repeat; no depth |

Only R1 was promoted. R2/R5/R6 were excluded by exact historical/active identity, R3 by the generic-solver prohibition, and R4 because its residual is policy selection.  The unused second deep slot expired; it was not filled based on R1’s outcome.

## R1 deep review: Verilator

Exact object: a fixed legal SystemVerilog design, its elaborated dependency graph, fixed Verilator timing/threads configuration, and the same cycle/event-visible simulation outputs required by IEEE 1800 scheduling as implemented by current Verilator.  The two legal outputs are (a) the current statically partitioned generated model and (b) an epoch-boundary rebinding of semantically closed macro-task bundles through a generated dispatch representation.  Both retain the same event/NBA ordering and generated-model interface.

Current official internals place the semantic ordering in `V3Sched`/`V3Order`; in threaded mode `V3Order` creates a dependency graph, `V3Partition` coarsens it, and the runtime uses a static assignment/order.  Current user documentation exposes `--threads`, `--threads-max-mtasks`, `--prof-exec`, and `--prof-pgo`; profile collection provides an admissible information stream but is not itself the proposed action.  The official internals also identify fragmentation caused by predicted-versus-actual MTask costs.  Thus the anchor is independently problem-bearing rather than a generic scheduling wish.

The proposed atomic action is not an online trigger or parameter controller: at a semantics-safe `eval()` epoch boundary it rebuilds a bounded number of *complete dependency-closed MTask bundles* and switches a pre-emitted dispatch table only when all predecessor and trigger/NBA invariants are satisfied.  A target-specific algorithm can be required to prove: (i) trace equivalence to the fixed serial/SystemVerilog scheduler, (ii) no cross-epoch execution of a task before its recorded predecessor set, and (iii) bounded task-bundle recourse per epoch; its performance statement must be an explicitly conditional approximation/competitive bound against the current static MTask union under the same profile information, not an offline omniscient ceiling.

Strongest competing explanation: static Thread-PGO and existing MTask-count configuration may already absorb practical gain.  That is a fair baseline, not a reason to assert no residual: neither exposes a runtime dependency-closed rebinding action in the current source/documented union.  Stage 0 must re-check this exact action against the pinned source before admitting any performance claim.

## Search boundary and evidence ceiling

Only official Verilator current documentation/source and the official CVA6 repository were used.  No source was built, downloaded, or run.  The candidate has a finite source/test closure route but no empirical result; this is a Discovery potential judgement, not a performance conclusion.

## Primary sources

- Verilator, [current internals](https://github.com/verilator/verilator/blob/master/docs/internals.rst) (scheduler, MTask partitioning, static runtime assignment and profile-related limitations).
- Verilator, [current argument reference](https://verilator.org/guide/latest/exe_verilator.html) and [runtime profiling](https://verilator.org/guide/latest/simulating.html) (`--threads`, MTask controls, profiling).
- OpenHW Group, [CVA6 README](https://github.com/openhwgroup/cva6/blob/master/README.md?plain=1) and [Makefile](https://github.com/openhwgroup/cva6/blob/master/Makefile) (versioned public Verilator simulation route).
