# Candidate-grade deep reviews

## 1. MUMPS multifrontal construction — NOT ADMITTED UNFROZEN

**Current union.** Analysis includes an ordering of the symmetrized pattern and symbolic factorization; numeric multifrontal factorization adds standard threshold pivoting and, for symmetric indefinite systems, 1x1/2x2 pivoting. Relevant action is therefore a joint ordering/symbolic/pivot/front construction, not merely an ordering callback.

**Proposed residual test.** A complete bounded-recourse elimination-tree/front assignment preserving MUMPS's selected pivoting/tolerance could be N2 only with a nontrivial complexity/approximation guarantee. The legal two-order witness does not prove it is beyond MUMPS's complete current ordering packages/configuration union. `NOT_ADMITTED_UNFROZEN`.

## 2. SuperLU_DIST analysis/pivot/partition construction — NOT ADMITTED UNFROZEN

**Current union.** The official FAQ specifies serial or parallel symbolic factorization, current ordering pathways, static pivoting, and optional tiny-pivot replacement. Parallel symbolic factorization with ParMETIS directly couples ordering and analysis.

**Proposed residual test.** A same-information joint permutation/partition/static-pivot construction with a fill/communication/stability guarantee would be nontrivial. The required strongest union must include all ordering, `ParSymbFact`, `ColPerm`, `ReplaceTinyPivot`, process-grid and factor options. This has not been source-exhausted; generic reordering and parameter choices are absorbed. `NOT_ADMITTED_UNFROZEN`.

## 3. PaStiX graph/order/symbol construction — NOT ADMITTED UNFROZEN

**Current union.** Official PaStiX material represents a symmetrized graph used by ordering and symbolic factorization, with options to load an ordering/symbol matrix rather than create it and native ordering selection.

**Proposed residual test.** A full graph-to-order-to-symbol constructor might be a valid N2 only if it specifies a new action beyond current ordering/symbol imports and a guarantee under the same pivot/accuracy model. No minimal union-external witness is frozen. `NOT_ADMITTED_UNFROZEN`.

## 4. STRUMPACK sparse multifrontal construction — NOT ADMITTED UNFROZEN

**Current union.** STRUMPACK already supports exact sparse-direct and structured/low-rank approximate factor actions, reordering and compression. A tolerance/rank/ordering setting is not a residual.

**Proposed residual test.** A joint front-tree/compression allocation with a stated error-and-resource guarantee could be N2, but would need to subtract its existing exact and approximate construction union. No such atomic action witness was independently established. `NOT_ADMITTED_UNFROZEN`.

### Natural carrier, full cost and finite 72-hour killer (common)

Natural carrier: a versioned SuiteSparse Matrix Collection subset spanning circuit, PDE, optimization and power matrices; include declared arithmetic and RHS construction. Oracle: relative residual/backward error plus solver status under the same pivot/tolerance contract. Full ledger: analysis, factorization and solve CPU; peak RSS; factor bytes; and, for distributed families, communication volume/synchronization and process memory. A finite closure would pin each release/source, enumerate every ordering/partition/pivot/compression configuration, build a small two-order witness, and reject if the full native union can express the action, if tolerance/pivot semantics change, or if no guarantee remains. No experiments were run.

