# Candidate-grade deep reviews

## D1 — ZK compilation provenance

- Proposed N2 if closed: a compiler-and-proof joint constructor that retains fixed source/compiler/binary/proof-verifier semantics and supplies a non-generic proof-production cost guarantee.
- Strong comparator: the primary 2026 construction plus its current executable producer/configuration union, not generic zkVM compilation.
- Required reality check: current producer commit; proof format/verifier; compiler flags; proof-system parameters and all default/nondefault output modes.
- Natural route and full cost: versioned public compiler workloads; compile/prove/verify CPU/RSS/temp, binary/proof bytes, and verification latency.
- 72-hour killer: one fixed source must yield two verifier-accepted outputs that differ in a claimed joint action; current producer union must not already express that construction.
- Status: `NOT_ADMITTED_UNFROZEN`; finite plan is not yet closed enough to issue a brief.

## D2 — LLVM AArch64/SVE joint instruction selection and scheduling

- Proposed N2 if closed: target-specific finite-state joint selector/scheduler using legal existing actions, with an exact/FPT/Pareto guarantee over code size, compile cost and schedule quality.
- Same-object contract: fixed LLVM IR, target feature set, ABI/exception semantics and executable behavior.
- Strong comparator: current GlobalISel/SelectionDAG plus AArch64 machine scheduler/default and nondefault target modes, and direct target-specific literature.
- Natural route/full cost: public LLVM test-suite/MIR corpus; compile CPU/RSS/temp, output bytes, verifier and CPU execution cost; no hardware claim is required to test semantic closure.
- 72-hour killer: a MIR case needs two legal complete selection/scheduling histories under one target contract and a non-generic guarantee not expressed by current composition.
- Status: `NOT_ADMITTED_UNFROZEN`; no current-source pin/action union/direct-collision matrix has been completed.

## D3 — OpenACM cross-layer compiler construction

- Proposed N2 if closed: joint architecture-mapping/compiler construction under a frozen numerical-error and macro contract, with a certified accuracy-cost frontier.
- Structural risk: macro/variation settings may change the exact architecture contract rather than be legal actions for one same-object problem.
- 72-hour killer: a fixed macro/model must admit two same-accuracy legal mappings and distinguish their full compile/PPA/verification ledger without changing hardware semantics.
- Status: `NOT_ADMITTED_UNFROZEN` pending source-triad, comparator and same-contract closure; resource absence was not used as evidence.

No brief is emitted.
