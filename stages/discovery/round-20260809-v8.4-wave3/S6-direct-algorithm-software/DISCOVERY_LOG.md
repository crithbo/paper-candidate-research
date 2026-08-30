# S6 Discovery log — V8.4 Wave 3

- Assignment: `DISCOVERY-S6-20260809-V8.4-WAVE3`
- Completed: 2026-08-09 (Asia/Shanghai)
- Production method: accepted/calibrated `v2/v8.1` only.  The O7 v2 backtest record is `CALIBRATED`; TLS-blocked `two-axis v8.2r2` was excluded.
- Scope: publicly reproducible solver, verification, database, runtime, and algorithm systems; CPU-first; no Wave2 MLIR/Triton/descriptor object was reconsidered.
- Result: one bounded `PROPOSE_STAGE0` recommendation, `PB-DELETE-SCHEDULE`; four screened drops are recorded in the collision matrix.

## Search passes

1. **Genealogy/seed distance.**  The candidate stays inside certified MaxSAT preprocessing, not generic proof checking.  Its proposed variable is the legal checked-deletion schedule and batch partition, held against a fixed preprocessing trace/output.
2. **Competing mechanism / same-object collision.**  The checked-deletion rule, VeriPB implementation, CakePB workflow, and MaxPre proof emission are explicitly subtracted.  Trace order and greedy legal scheduling are named baselines; unchecked deletion is documented as a weaker-guarantee reference rather than an unfair speed baseline.
3. **Artifact/natural corpus/AI route.**  MaxPre/VeriPB/CakePB and MaxSAT/PB competition resources are public.  A finite CPU-only Stage-A killer freezes traces before any schedule change and requires identical outputs/checker acceptance.

## Primary and official sources

1. [Certified MaxSAT Preprocessing](https://doi.org/10.1007/978-3-031-63498-7_24), IJCAR 2024; primary PDF: [Chalmers record](https://research.chalmers.se/publication/542304/file/542304_Fulltext.pdf).
2. [Certified Symmetry and Dominance Breaking for Combinatorial Optimisation](https://www.bartbogaerts.eu/articles/2023/005-JAIR-CertifiedDominance/CertifiedSymmetryAndDominanceBreakingForCombinatorialOptimisation_JournalExtension.pdf), JAIR 2023.
3. [VeriPB proof-format overview](https://gitlab.com/MIAOresearch/software/VeriPB/blob/HEAD/proof_format_overview.md) and [VeriPB releases](https://gitlab.com/MIAOresearch/software/VeriPB/-/releases), upstream.
4. [Pseudo-Boolean Competition 2025 rules](https://www.cril.univ-artois.fr/PB25/) and [SAT Competition 2025 output/checker contract](https://satcompetition.github.io/2025/output.html), official.
5. [PBLean](https://arxiv.org/abs/2602.08692), 2026; [Redundancy Rules for MaxSAT](https://drops.dagstuhl.de/storage/00lipics/lipics-vol341-sat2025/html/LIPIcs.SAT.2025.7/LIPIcs.SAT.2025.7.html), SAT 2025.
6. [DuckDB v1.5.1 release](https://github.com/duckdb/duckdb/releases), upstream current collision for external-aggregation radix selection.
7. [Z3 release notes](https://github.com/Z3Prover/z3/blob/master/RELEASE_NOTES.md), upstream boundary for an ungrounded online-trimming future-work direction.

## Evidence integrity

`SEARCH_BOUNDED_OPEN` means only that the focused search found no published same-object deletion-scheduling algorithm.  It is not a novelty conclusion.  Discovery did not build software, download corpora, or measure a result.  The brief distinguishes structural paper potential (`TIER_B_Q2_VIABLE`) from current readiness (`MODERATE_FINITE_CPU_ROUTE`), and its Stage-A killer may disprove the mechanism without relaxing same-object or certificate semantics.
