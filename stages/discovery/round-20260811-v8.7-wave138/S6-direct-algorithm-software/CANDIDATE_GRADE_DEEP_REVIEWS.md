# Candidate-grade N3 deep reviews

## Lucene BKD recursive partitioning — NOT_ADMITTED_UNFROZEN

**Object/union.** Fixed point set to Lucene BKD index readable by `BKDReader`; `BKDWriter` recursively assigns points to rectangles until a configured maximum leaf cardinality, using radix/offline/heap point primitives. **Phenomenon hypothesis:** on versioned public geo/time-series corpora, intrinsic dimensional concentration may create a repeatable selectivity/leaf-I/O crossover that a fixed leaf threshold misses.

**Required closure.** Freeze corpus release and ingestion schema; stratify dimension count, cardinality, skew and query selectivity; hold index dimensions, point count, query set, JVM, storage and warm/cold cache state fixed. Full cost is index bytes, build CPU/RSS/temp I/O, query CPU/I/O/latency and reader correctness. A ≤72-hour killer would reproduce the sign of the crossover on two natural releases after controlling these factors, then show an explicit writer action beyond the current recursive partition/leaf primitive. Neither condition is currently frozen. No claim/brief.

## PostgreSQL BRIN range summarization — NOT_ADMITTED_UNFROZEN

**Object/union.** Fixed table/index/query semantics with a native BRIN reader. **Phenomenon hypothesis:** time/order correlation causes a stable phase change between compact and lossy summaries as insertion disorder grows. Existing summary types/options and planner/index-scan behavior must be fully enumerated before an exploitation action is named.

**Confounds/full cost.** Freeze table release, ingest order, page range, VACUUM/analyze state, hardware/cache, query selectivity and correlation estimator. Include table/index/WAL bytes, build/maintenance/query CPU/RSS/I/O, not index size alone. Killer: two versioned natural traces must preserve a correlation threshold after these controls; then prove the action is outside current union. This breadth pass cannot do so without inventing a source absence; no claim/brief.

## LLVM machine block placement — STRUCTURAL_DROP

Fixed input IR/profile and emitted-code semantics could support a natural CFG-shape characterization. But current `MachineBlockPlacement.cpp` already maintains function-wide chains, has tail-duplication paths, and exposes `applyExtTsp` as a global layout post-processing action. A claim that natural profiles reveal a need for whole-function layout is therefore directly absorbed. Cost would include compilation CPU/RSS, code size and run-time metrics; no experiment was run. Killer is source-level action inclusion, already met.

## CPython `.pyc` marshalling — STRUCTURAL_DROP

Fixed Python source and CPython import semantics have a native reader, but the supposed structure is metadata-induced nondeterminism, not a newly evidenced natural workload transition. PEP 552's hash-based invalidation directly occupies the deterministic header action. Sharing/code-object representation changes format/reader compatibility and therefore fails same-object. Killer: inspect header mode and reader; already absorbed.

## OpenJDK CDS archive layout — STRUCTURAL_DROP

The apparent phenomenon is class-load locality across applications. The proposed use is archive/runtime placement policy: an online/image-layout controller, not a fixed same-object direct constructor. Even with natural application traces and full build/load CPU/RSS/bytes metrics, it does not enter this lane.

## PostgreSQL GiST split characterization — NOT_ADMITTED_UNFROZEN

Natural spatial data could plausibly display a split-quality phase boundary, but neither a corpus release nor current GiST support-function/configuration union was frozen. A finite route exists—pin PostgreSQL source, `amcheck`, dataset version, insertion order and query suite; charge index/WAL/build/query costs; kill on absent repeatability or union absorption—but no phenomenon claim is admissible now.
