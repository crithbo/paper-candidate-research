# Source65 S6 divergence seed pool

- Assignment / lane: `DISCOVERY-S6-20260815-ADAPTIVE-SOURCE65-R40-ORDINARY-BREADTH-V1` / `S6_DIRECT_ALGORITHM_SOFTWARE`
- Frozen profile: `RESEARCH_TOPIC_DISCOVERY_SKILL_CONSOLIDATED_R40_V1__ORDINARY_BREADTH_ONLY`
- Seed ceiling: `<=12`; generated: `8`
- Network-security exclusion check: `PASS`
- Generated before targeted evidence lookup: `YES`

| Engine | Seeds | Perspective |
|---|---|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | S65-01, S65-06 | theorist, compiler engineer |
| `PROBLEM_REFRAMING` | S65-02, S65-07 | compiler engineer, maintainer |
| `CONSTRAINT_MANIPULATION` | S65-03, S65-08 | backend engineer |
| `JANUSIAN_TENSION` | S65-04, S65-05 | operator, theorist |

| Seed | Non-evidence sketch and anchor candidate | Pre-evidence risk | Disposition |
|---|---|---|---|
| S65-01 | Rust pattern usefulness: fixed typed pattern matrix could admit a target-aware certificate of exhaustiveness plus unreachable-arm diagnostics. Anchor candidate: Rust Compiler Development Guide. | The decision may already be the generic Maranget matrix problem. | `KEEP_FOR_CONVERGENCE` |
| S65-02 | GCC C++ exception-region construction: cleanup regions and landing pads may expose a whole-CFG guarantee beyond local EH lowering. Anchor candidate: GCC internals/source. | ABI/EH semantics may force the construction; generic CFG layout risk. | `RQ_BACKLOG` |
| S65-03 | CPython exception-table assembly could jointly choose protected ranges and handler intervals while retaining interpreter semantics. Anchor candidate: CPython compiler source. | Likely serialization/layout-only. | `RQ_BACKLOG` |
| S65-04 | GHC pattern compilation may trade decision-tree size against failure precision on a fixed Core program. Anchor candidate: GHC user guide/source. | Likely covered by general decision-tree compilation. | `RQ_BACKLOG` |
| S65-05 | SQLite query-plan selectivity feedback might construct a certified plan family for a fixed SQL query. Anchor candidate: SQLite query planner documentation. | Controller/estimator rather than a new direct algorithm. | `RQ_BACKLOG` |
| S65-06 | OpenJDK C2 escape-analysis graph construction might retain an object-specific alias certificate across optimization phases. Anchor candidate: OpenJDK source. | Generic pointer analysis or historic compiler collision. | `RQ_BACKLOG` |
| S65-07 | GNU Bison parser-table compression could optimize a fixed grammar/table under parser-equivalence. Anchor candidate: Bison manual/source. | Mature generic table-compression kernel. | `RQ_BACKLOG` |
| S65-08 | NumPy `einsum` contraction-path construction could be parameterized by fixed array shapes and numerical semantics. Anchor candidate: NumPy docs/source. | Generic contraction scheduling/packing. | `RQ_BACKLOG` |

## Clustering and frozen convergence

| Cluster | Members | Representative | Reason |
|---|---|---|---|
| compiler semantic analysis | S65-01, S65-02, S65-04, S65-06 | S65-01 | It has an immediate official semantic oracle and a bounded contrary route. |
| format/table construction | S65-03, S65-07 | S65-03 | Kept only as non-evidence backlog because layout risk is high. |
| optimizer/search | S65-05, S65-08 | S65-05 | Kept only as non-evidence backlog because controller/generic-kernel risk is high. |

Selected before evidence: `S65-01 -> RQ-S65-01`.  All remaining seeds are append-only, non-scientific backlog and were not used to replace the selected locator after its contrary evidence arrived.

`DIVERGENCE_COVERAGE_ADVISORY: PASS` — four engines and four perspectives were used; this is advisory only.
