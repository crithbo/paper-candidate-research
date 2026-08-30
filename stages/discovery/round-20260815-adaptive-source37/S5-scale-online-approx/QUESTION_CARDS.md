# Source37 evidence-qualified raw gate

## OFST-LEXICON-ONLINE-EXACT-RECOURSE

- **Exact identity:** an OpenFst-compatible mutable weighted lexicon transducer compiled from a versioned CMU pronunciation dictionary; logical weighted input/output relation is the fixed endpoint.
- **Problem/estimand:** edit-sensitive construction cost and recourse while retaining exact relation equivalence after insertions, deletions, or pronunciation changes from a version diff.
- **Claim endpoint and counterfactual:** an algorithmic bound must be compared with stock rebuild/determinization and any current incremental action that implements the same relation. If all legal complete constructors must rebuild globally on the carrier, the route fails.
- **Non-generic discriminator:** the proposed result must exploit functional weighted-transducer structure and prove exact relation preservation; a generic dynamic-graph package, selector, controller, or mere operation order does not qualify.
- **Current-source locus:** OpenFst `MutableFst` API exposes add/delete state/arc actions; `Determinize` consumes an FST and emits a `MutableFst` with the documented equivalence/determinism property.
- **Natural carrier:** `cmusphinx/cmudict`, a maintained public pronunciation dictionary that states it is continually updated and releases major versions; repository history provides versioned deltas.
- **Minimum falsifier:** a current OpenFst action union already offers the same whole incremental exact determinization/compaction action and same bounded guarantee, or a smallest dictionary delta forces an unavoidable global change under the proposed contract.
- **Finite closure route:** source-pin OpenFst release/current source and flags; enumerate mutable/determinize/minimize/rebuild union; construct two small legal lexicon updates; use relation equivalence and stock read/lookup as oracle; then select bounded CMUdict historical diffs and ledger update, build, query, bytes, RSS, and temporary-space cost.
- **Full-cost initial boundary:** input parse, state/arc allocation/copy/free, determinization/minimization or rebuild, serialized bytes, peak RSS/temp, and query/read cost. No result is asserted.
- **Status:** `EVIDENCE_QUALIFIED_RAW__FINITE_CLOSURE_DEBT`.

### Why raw admission is not a brief

Complete current union, direct collision search, full witness catalogue, quantitative headroom, Q2 calibration, and a Stage-A killer remain bounded downstream work. No claim of an implementation gap or novelty has been made.
