# Noncanonical V9 shadow comparison

Shadow inputs are limited to the same neutral snapshot that preceded canonical review. The V9 ledgers add typed source-role records, direct-coverage predicates, claim ceilings, evidence/readiness axes and explicit stopping fields. They do not add a new source-derived mechanism, natural observation, baseline, or canonical decision.

| Family | Canonical disposition | Shadow disposition | Source/action correction | Decision stability |
|---|---|---|---|---|
| Kallsyms | `NOT_ADMITTED_UNFROZEN` | `NOT_ADMITTED_UNFROZEN` | Adds source-role and unresolved-predicate ledger | Stable |
| ELF GNU hash | `NOT_ADMITTED_UNFROZEN` | `NOT_ADMITTED_UNFROZEN` | Makes hash-style union explicit | Stable |
| zipimport | `NOT_ADMITTED_UNFROZEN` | `NOT_ADMITTED_UNFROZEN` | Separates importer contract from missing producer closure | Stable |
| Journal | `NOT_ADMITTED_UNFROZEN` | `NOT_ADMITTED_UNFROZEN` | Records native indexing as partial, not absence | Stable |

No shadow-only prose is copied into `../canonical-v8.7/`; canonical decision stability is therefore a comparison result, not an input to canonical work.
