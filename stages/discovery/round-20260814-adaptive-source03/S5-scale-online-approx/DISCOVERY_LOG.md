# DISCOVERY-S5-20260814-ADAPTIVE-SOURCE03

Canonical v8.7 Discovery only (`DISCOVERY_CLAIM_PACK_MODE=OFF`). All work was
bounded, read-only source and primary-paper inspection on 2026-08-14. No V9
output, experiment, E2, build, installation, or benchmark was run.

## Carry-forward closure — Soufflé incremental Datalog

**Exact object.** A fixed Datalog program, EDB fact-update sequence, and
derived relation answers. A potential action would have to maintain the same
answers across insertions/deletions while changing the engine's relation state,
rule instrumentation, delta bookkeeping and epoch cleanup. Natural carrier:
versioned static-analysis fact traces, e.g. public Doop-style program-analysis
inputs. Full cost: fact/update ingestion, relation and auxiliary-relation bytes,
rule evaluation CPU/RSS, compiled/interpreted setup and output-equivalence.

**Source triad.** The official current project documents interpreter/compiled
execution, facts, relation I/O, parallel execution, generated C++ interfaces,
and configurable relation data structures. The PPDP'21 primary paper describes
an *extended* Soufflé implementation of elastic incrementalization: tuple
counts/iteration numbers, update-capable relation structures, specialized
existence checks, update-specific instrumented rules, plus/minus deltas and
epoch cleanup. Thus it is a powerful direct subtractor, but it is not evidence
that every such action is exposed by the current official command/interface.

**Decision.** `NOT_ADMITTED_UNFROZEN__CURRENT_UNION_AND_TARGET_SPECIFIC_GUARANTEE_NOT_CLOSED`.
The official current docs do not define a complete current incremental action
union, while the paper already occupies the broad incremental-Datalog claim.
No current-absence claim is made. A valid residual would need a source-pinned
stock-legal action, a fixed online information model, and a non-generic bound
(for example parameterized update cost for a stated recursive fragment) that
the PPDP mechanism does not already cover. None was frozen. The finite Stage A
killer is therefore not yet legal, rather than blocked by implementation.

Sources: [official execution manual](https://www.souffle-lang.com/execute),
[official C++ interface](https://www.souffle-lang.com/interface),
[official current repository](https://github.com/souffle-lang/souffle),
[PPDP'21 elastic incrementalization](https://souffle-lang.github.io/pdf/ppdp21incremental.pdf).

## Five fresh raw families — one primary disposition each

| # | Family | Frozen same-object starting point | Primary disposition |
|---|---|---|---|
| F1 | Kani Rust contract/harness verification | fixed Rust crate, annotated contracts/harnesses, proof result semantics | `DROP__GENERIC_BMC_HARNESS_SELECTION_OR_UNWIND_CONFIGURATION` |
| F2 | Binaryen ReReloop | fixed Wasm module, validation and emitted Wasm semantics | `DROP__CURRENT_NATIVE_RELOOPER_ACTION__NO_TARGET_SPECIFIC_GUARANTEE` |
| F3 | Z3 fixedpoint relations | fixed Datalog-with-constraints query answer | `NOT_ADMITTED_UNFROZEN__CURRENT_ACTION_AND_FORMAL_RESIDUAL_NOT_CLOSED` |
| F4 | Rosette symbolic synthesis | fixed sketch, synthesis/solution semantics | `DROP__GENERIC_SOLVER_OR_SKETCH_SELECTION_NOT_TARGET_SPECIFIC_N2` |
| F5 | SPIN partial-order reduction | fixed Promela model and safety/liveness verdict | `NOT_ADMITTED_UNFROZEN__NO_SOURCE_PINNED_UNION_EXTERNAL_ACTION_PROMISE` |

### F1 — Kani

Current Kani documentation defines proof harnesses, contract-checking harnesses,
verified stubs, selected/all-harness execution and loop-unwind bounds. Its own
result semantics are success/failure/unknown/resource outcome. Changing harness
selection, unwinding, stubs or solver is a generic BMC policy and changes neither
into a Kani-specific certified Pareto/FPT constructor. The carrier could be
versioned Rust verification crates; a fair full-cost ledger would include model
generation, solver time, memory, unwinding and replay. Direct drop is only for
this frozen generic residual, not a claim that Kani has no novel research gap.

Sources: [Kani overview](https://model-checking.github.io/kani/),
[Kani usage/current flags](https://model-checking.github.io/kani/usage.html),
[contracts API](https://model-checking.github.io/kani/crates/doc/kani/contracts/index.html).

### F2 — Binaryen ReReloop

The official Binaryen repository documents ReReloop as a pass that converts
structured Wasm control flow to a CFG and back using the Relooper algorithm,
with validation and deterministic tools. The broad whole-control-flow action
is already native. A new claim would require a Wasm-specific recourse/approx or
FPT guarantee beyond the Relooper's current action; none was frozen. Source-map
or pass-order tuning is not admissible. Carrier: public Wasm corpus; cost:
validation, pass CPU/RSS, binary size and runtime, with stock Wasm validation as
oracle.

Source: [official Binaryen repository and pass list](https://github.com/WebAssembly/binaryen).

### F3–F5 — bounded non-admission

Z3 fixedpoint exposes Datalog-like fixedpoint queries but this review did not
pin its complete relation representations/configuration union or a specific
online guarantee. Rosette's documented symbolic synthesis is explicitly a
solver/sketch search, so its residual would be a generic solver construction.
SPIN partial-order reduction has a direct mature algorithmic lineage, but no
current source-pinned target-specific action-promise card was formed. These are
not resource or readiness rejections. No TOPIC_BRIEF is created.

Sources: [Z3 official repository/release notes](https://github.com/Z3Prover/z3/blob/master/RELEASE_NOTES.md),
[Rosette solver API](https://docs.racket-lang.org/rosette-guide/sec_solvers-and-solutions.html),
[Rosette synthesis semantics](https://docs.racket-lang.org/rosette-guide/ch_syntactic-forms_rosette.html),
[Spin POR primary paper](https://spinroot.com/spin/symposia/ws05/044_paper.pdf).

## Claim ceiling

No clean brief is present. The two Drops are limited to actions directly
described by the named current tools or generic-kernel boundary. The four
unfrozen entries are not terminal findings and are not inferred from missing
implementation, result, resource or AI readiness.
