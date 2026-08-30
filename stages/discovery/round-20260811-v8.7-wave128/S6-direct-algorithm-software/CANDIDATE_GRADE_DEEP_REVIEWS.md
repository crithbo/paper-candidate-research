# Candidate-grade depth reviews

## D01 — SQLite B-tree page-cell assignment

- **Exact object / oracle:** fixed table/index contents and SQLite page size to a valid database accepted by SQLite with identical query results and B-tree invariants.
- **Current strongest union:** record serial encoding, local page insert/delete, page split/balance, overflow allocation, freelist reuse, journaling/WAL interactions and all format/page settings that preserve the contract.
- **Minimal action-divergence witness:** two variable-length records whose cells fit together on either of two sibling pages while the local balance path selects one placement. The global cell-to-page assignment is distinguishable, but it cannot be separated from existing B-tree balancing, overflow and free-page union without a fixed update model and source-level action catalog.
- **N2/full cost/72h killer:** potential N2 is a whole local-neighborhood packing algorithm with reader-preserved invariants; full cost includes record encoding, page moves, overflow/freelist, journal/WAL, bytes, update/query CPU/RSS and native integrity/query checks. Killer: a bounded natural DB with insert sequence; fail if the method is generic bin packing, changes update/transaction semantics, or loses under the complete ledger.
- **Disposition:** `NOT_ADMITTED_UNFROZEN`.

## D02 — LMDB page/free-list assignment

- **Exact object / oracle:** fixed key/value transaction sequence to an LMDB environment with identical visible key/value states and transactional reader behavior.
- **Current strongest union:** copy-on-write page allocation, free-page tracking/reuse, branch/leaf/overflow page construction, transaction commit/meta-page update and all map/page configuration actions.
- **Minimal action-divergence witness:** two reclaimed pages and two new variable-size records create alternative legal page assignments. The current allocation/reuse model is native, but a global assignment action has not been separated from free-list/COW semantics and transaction-history requirements.
- **N2/full cost/72h killer:** potential N2 is a transaction-preserving batch page-assignment constructor, not a cache policy; charge COW copies, free-list metadata, map growth, commit, bytes, CPU/RSS and reader transaction correctness. Killer: a finite public KV trace; fail on snapshot/transaction divergence, generic packing substitution, or no complete-cost Pareto.
- **Disposition:** `NOT_ADMITTED_UNFROZEN`.

## D03 — PDF object-number/xref assignment

- **Exact object / oracle:** fixed document object graph and PDF version to a conforming PDF whose native reader resolves the same object graph/rendered content.
- **Current strongest union:** object serialization, indirect-ID allocation, xref/xref-stream generation, offsets, object-stream/linearization choices and PDF writer options.
- **Minimal action-divergence witness:** two equivalent indirect objects can exchange legal identifiers, affecting xref representation, but ID/offset assignment is entangled with current object-stream/linearization and writer layout actions. A smaller xref alone is an emitter-level effect.
- **N2/full cost/72h killer:** potential N2 would require a global grammar-aware ID/xref assignment with a proof that it is beyond reader-equivalent writer union; charge serialization, xref/object-stream, bytes, writer/read/render CPU/RSS and PDF validation. Killer: public PDFs; fail if the effect is merely numbering/order, a postprocessor, or rendered/object equality breaks.
- **Disposition:** `STRUCTURAL_DROP` — claim ceiling is emitter-local layout.

## Result

Three candidate-grade reviews, zero briefs. SQLite and LMDB have named legal action divergences but not an admission-grade separation from their full native update/transaction unions. PDF numbering is only local emitter layout. No result/resource/implementation/AI-readiness factor was used.
