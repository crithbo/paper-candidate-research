# COMPILER-PGO-STALE-REPAIR — Stale-profile repair under a bounded recompilation budget

- Status: `PROPOSE_STAGE0`
- Primary lane: compiler optimization / runtime systems
- Discovery date: 2026-08-02

## Research question

Given evolving workloads and a fixed recompilation budget, can a compiler choose a **joint** profile-age and IR-impact repair frontier that limits regret against an offline fresh-profile `OPT`, rather than periodically rebuilding or independently ranking functions?

## Importance and group fit

LLVM documents that PGO quality depends on representative workloads and provides a reproducible profile artifact. Real profile drift makes profile freshness a resource allocation problem with measurable compile and execution cost.

## Exact object

LLVM-like module, versions of profile counters, observed workload epochs, bounded compile-time budget `B`, and end-to-end objective of runtime gain minus compilation/redeployment cost. `OPT` sees future workload epochs only as a reference.

## Strongest fair baseline

Same-observation fixed-period refresh, top-k stale-function recompilation, and IR impact clustering, each using the same `B`, profiling visibility and deployment cost ledger.

## Mechanism hypothesis

Maintain a dependency-aware repair frontier: recompile an SCC only when its counter drift and transitive optimization-impact jointly cross a budget-calibrated threshold. **Separation hypothesis:** on phase-shifting call-graph workloads, this joint frontier has a consistency/regret trade-off not reproducible by any independent age ranking plus static impact cluster without spending more budget or accepting a larger execution-cost spike.

## Competing mechanisms

- Mechanism A: joint drift-impact SCC repair frontier.
- Mechanism B: fixed refresh / periodic PGO rebuild.
- Mechanism C: stale-profile top-k selector with static clusters.
- Preferred mechanism and why: A must expose an irrevocable grouped repair action and a formal online objective; otherwise it is only a selector.

## Candidate paper claim

Conditional online regret/consistency bound and a reproducible LLVM profile-replay study. This is a Stage 0 hypothesis.

## Current collision subtraction

LLVM PGO build and profile merge are baseline artifacts, not contribution. `COMPILER-IRHASH-CHANGEFRONTIER` stopped because checksums/dependency rebuilds already replicated its action; this candidate survives only if the joint workload-drift/optimization-impact action cannot collapse to that history or to static clustering.

## Decisive falsifier

If a same-prefix fixed-refresh + profile-cluster union matches every SCC repair decision and full ledger on the witness workload, stop as product/selector collapse.

## Executable evidence path

LLVM/Clang PGO builds with supplied `llvm-profdata`, versioned workloads (e.g., SPEC-like open alternatives or LLVM test-suite subsets), compile-time logs and runtime replay.

### 72-hour first evidence

Build a small module set, synthesize phase shifts by rotating test inputs, and compare joint frontier against fixed refresh/top-k. Measure end-to-end runtime, compilation, deployment/restart and profile collection cost; no claim from a single microbenchmark.

### AI core fraction and critical path

`0.83`: AI can compile, profile, implement controllers, run deterministic replays and audit ledgers locally.

### Semantics-preserving open alternatives

LLVM official tools/docs, LLVM test-suite and deterministic synthetic call graphs if a full compiler build is too costly for the first killer.

## Dual-axis score

- Academic value: `48/70`
- AI executability bonus: `25/30`
- Total: `73/100`

## AI and researcher boundary

The critical first experiment is AI-executable. A researcher owns workload representativeness and the final research claim.
