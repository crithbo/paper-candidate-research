# Candidate-grade deep reviews

## D01 — GNU ld section-layout constructor

- **Atomic action / union:** input-section mapping, ordering, alignment, VMA/LMA, symbols, PHDR assignment, orphan handling and script commands are the deployable same-information union.
- **Semantics and cost:** fixed input objects, linker script, target ABI and observable ELF/runtime behavior. Charge archive search, relocation, layout, padding, output bytes, link time/memory and executable/load verification.
- **Witness / killer:** two `.text`/`.data` inputs show that `SORT_BY_*`, script order and alignment are already native actions. Public build fixture; kill a claim if it changes ABI/script semantics or is expressible as script/order configuration.
- **Disposition:** `STRUCTURAL_DROP` — proposed layout choice is inside the union, not a new constructor.

## D02 — libxml2 XML C14N constructor

- **Atomic action / union:** parse, namespace handling, attribute sorting, escaping, node/document-order traversal and chosen C14N variant are native whole-construction actions.
- **Semantics and cost:** frozen XML infoset plus C14N version/options; charge parsing, canonical write, buffers/output bytes and native reparse/equality verification.
- **Witness / killer:** two namespaces and reordered attributes make local order observable, but alternate traversal/order is constrained by C14N or is an internal serializer action. Public XML corpus; kill if bytes cease to meet fixed canonicalization semantics.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## D03 — GNU diff edit-script constructor

- **Atomic action / union:** comparison mode, line/token equivalence, prefix/suffix trimming, edit-path search, heuristic/algorithm selection and unified-output emission form the current native union.
- **Semantics and cost:** identical file pair and fixed option set, with accepted edit script and reconstruction/equivalence. Charge read/tokenize, path construction, script bytes, verification, CPU and memory.
- **Witness / killer:** a three-line insertion/deletion pair exposes alternate paths but none is a new same-information whole action beyond native edit construction; changing output convention changes semantics. Public version pairs; kill on non-reconstructing script or omitted construction cost.
- **Disposition:** `NOT_ADMITTED_UNFROZEN` — no union-external N2 action certificate.

## D04 — Xapian inverted-index segment constructor

- **Atomic action / union:** document analysis, term insertion, posting/value storage, dictionary/position construction, commit/merge and query-visible database state are native actions.
- **Semantics and cost:** same documents, analyzer and query relation; charge indexing, commit/merge, database bytes, memory and native query equality/latency.
- **Witness / killer:** a term appearing in three documents demonstrates that posting order/encoding/merge scheduling are internal construction choices. Public text corpus; kill if a proposal is a backend/configuration choice or changes term/query semantics.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## D05 — FAISS IVF index constructor

- **Atomic action / union:** vector training, centroid construction, vector assignment, inverted-list storage and search/probe configuration define the current index-building union.
- **Semantics and cost:** fixed vectors, metric, trained-index contract and recall/search boundary. Charge training, add/assignment, list bytes, query cost, recall and memory.
- **Witness / killer:** reassigning a boundary vector or changing centroid seeds is an existing training/assignment action; a different recall target changes the object. Public vector corpus; kill if full train+add+query cost is not Pareto-superior under fixed metric/recall.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## D06 — Boost.Polygon Voronoi constructor

- **Atomic action / union:** site events, circle events, beach-line/topology updates, edge/vertex construction and output traversal are native direct-construction actions.
- **Semantics and cost:** same point/segment sites and same diagram topology/predicate model; charge event queue, topology storage, predicates, CPU/memory and native structural validation.
- **Witness / killer:** four nondegenerate sites expose event-order alternatives, but they lie in the sweep/topology construction union. Public GIS points; kill if topology differs or action is merely event-order tuning.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## Overall

Six full reviews, zero briefs. `NOT_ADMITTED_UNFROZEN` means the action certificate was not frozen, not that implementation, results, resources, or AI readiness are inadequate.
