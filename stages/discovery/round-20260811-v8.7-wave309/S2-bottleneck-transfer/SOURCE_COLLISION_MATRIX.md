# Source and collision matrix — Wave309

| Facet | Primary/current source | Baseline union evidence | Effect |
|---|---|---|---|
| ThinLTO pipeline | [LLVM ThinLTO documentation](https://clang.llvm.org/docs/ThinLTO.html) | Summaries, combined index, analysis, importing, parallel backends and final link are current composition. | Defines strongest same-object baseline. |
| Default/non-default controls | [LLVM ThinLTO documentation](https://clang.llvm.org/docs/ThinLTO.html) | Jobs, incremental cache and cache pruning policy are documented linker surfaces. | Flag/threshold/cache-policy proposals excluded. |
| Distributed backend | [LLVM DTLTO documentation](https://www.llvm.org/docs/DTLTO.html) | Distributor, separate thin link/backend/link composition and cache are current supported mechanisms. | Distributor/scheduler proposals excluded. |
| Current source interface | [ThinBackend API](https://www.llvm.org/docs/doxygen/structllvm_1_1lto_1_1ThinBackend.html) | Backend function and thread pool strategy are already modeled after thin link. | Parallelism/dispatch not a residual. |
| Primary mechanism | [ThinLTO paper](https://storage.googleapis.com/gweb-research2023-media/pubtools/4743.pdf) | Original primary work covers scalable/incremental summary-index design. | Direct subtractor; not novelty clearance. |
| Candidate witness | P0/P1 same modules, toolchain and executable semantics | No source-authorized joint summary/import/partition action distinct from generic selection or existing composition frozen. | NOT_ADMITTED_UNFROZEN. |

## Collision verdict

The action prerequisite fails before novelty can be assessed. Existing primary and official mechanisms form the fair comparator union; no direct paper collision is asserted cleared or decisive beyond that. SEARCH_BOUNDED_OPEN is not used as a novelty conclusion.
