# RQ candidates — Source54 S6

## RQ01 — GCC IPA-RA call-graph allocation construction

- **Seed / anchor:** S01; current GNU GCC Optimize Options `-fipa-ra` and the official source locus `gcc/ipa-ra.cc`, to be source-pinned by ordinary closure.
- **Exact object:** fixed whole-program C/C++ call graph, target ABI, live ranges, optimization flags, and externally visible behavior.
- **Primary RQ:** Can a target-specific algorithm jointly construct legal interprocedural allocation/caller-save decisions for this fixed call graph with a non-generic exact/FPT/certified-Pareto guarantee over spill/move cost, emitted code size and compiler resource cost beyond GCC IPA-RA's current composition?
- **Immutable guarantee:** ABI, calling convention, program output and exception/unwind semantics remain unchanged.
- **Decision consequence:** it would change a compiler's legal whole-call-graph allocation decision; if the action is already native or reduces to ordinary RA, it cannot become raw.
- **Contribution type:** `COMPILER_TOOL / N2`.
- **FINER-lite:** feasibility `CONDITIONAL` through GCC docs/source plus GCC tests; importance `CONDITIONAL`; novelty threat `HIGH`; scope `PASS`; relevance `CONDITIONAL` on a target-specific liveness/ABI invariant.
- **Precommitted sources:** ANCHOR/CURRENT = official GCC manual and source locus; CONTRARY = published IPA-RA work or generic interprocedural RA.  Transport fallback only: official GCC Git service.
- **Selected for ordinary evidence closure:** `YES`.
