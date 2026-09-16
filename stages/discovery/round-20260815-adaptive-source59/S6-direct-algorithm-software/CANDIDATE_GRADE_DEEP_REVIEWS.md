# Candidate-grade deep review

## D1 — UOF-S59-01

### Current-upstream reality check

`genautomata.cc` at GCC 15.2 and a current rendered GCC source view both state that reverse automata and union automaton states are not generated; the latter is described as necessary for more accurate interlock scheduling at a CFG joint point.  GCC Internals describes the stock DFA recognizer and its relevant generator switches.  This is source-supported evidence of a bounded implementation/action gap, but the mainline commit and every non-default entry point are intentionally assigned to `CQ59_GCC_GENAUTOMATA_MAINLINE_AND_COLLISION` rather than asserted closed.

### Fair subtraction

The baseline is not only default deterministic generation.  It includes NDFA variants, minimisation controls, comb-vector choices, and the scheduler's current use of the generated recognizer.  The 2003 automaton-scheduler paper is a primary contrary source: it already identifies union states and the state-explosion obstacle.  The candidate survives only if it supplies a GCC-reservation-specific bounded recurrence and a sound precision/cost guarantee beyond generic DFA construction; otherwise this paper and the current union absorb it.

### Minimal legality witness

For a fixed processor-reservation description, choose two predecessor basic blocks that issue different legal reservations and join before one common instruction.  The paths preserve the same program, target description and successor instruction.  The candidate state is the finite set of their stock recognizer states; a successor issue is legal only under the defined conservative all-members transition rule.  Stage0 must materialize this using a real public target `.md`; Discovery did not build it.

### Paper shape, cost and killer

Potential `COMPILER_TOOL / THEORY_FORMAL` paper: parameterized exact construction for bounded join-interface/horizon, or a certified conservative coarsening frontier, plus a reproducible target-MD study.  Cost includes construction, generated recognizer bytes, compiler CPU/RSS/temp, and precision/code-quality implications.  Within 72 hours Stage0 must pin GCC mainline, materialize the two-path target-MD witness, and decide whether existing source actions already form equivalent union states.  Any of: current union coverage, generic-only recurrence, changed hazard semantics, or an infeasible finite witness is decisive rejection.

### Disposition

`CLEAN_STAGE0_BRIEF__FINITE_FIDELITY_GAP`.  This is not a scientific result and does not claim that a Q2 paper will result.
