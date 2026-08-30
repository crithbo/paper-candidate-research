# Natural opportunity, full-cost, and trace-fidelity audit

## Opportunity hypothesis

The source-grounded hypothesis is coherent: if SSTs form several repetition regimes, one global dictionary can underfit, while independent per-SST dictionaries can duplicate training and dictionary bytes. An intermediate portfolio may occupy a full-cost Pareto region. Official RocksDB documentation supports per-file dictionary training; DCC/WSDM support the general value and cost of multiple dictionaries.

The exact 20-manifest collection has no admissible positive observation in this assignment. Predecessor `ROCKSDB-DICT-COVER` outputs are contrary/boundary material only. Therefore the hypothesis is `PLAUSIBLE_AND_FALSIFIABLE__NOT_OBSERVED_ON_EXACT_OBJECT`.

Absence of a candidate result is not a Stage0 failure. The opportunity is finite enough to test, but it cannot compensate for the generic N2 collapse.

## Minimum falsifier

- Legal 4–8 native SSTs with at least two precommitted repetition regimes;
- every record exactly once, fixed 4096-byte blocks, unchanged checksums/reader/ZDICT/Zstd semantics;
- compare no-dict, current per-file, one-global, historical shared-one, equal-budget per-SST, generic facility-location/k-medoids, current AutoSkip/CompressionManager combination, and a tiny offline oracle;
- kill on generic-solver equivalence, semantic/trace illegality, unbounded oracle gap, or full-cost domination.

This is a valid falsifier plan, but no StageA route is recommended because the contribution gate fails first.

## Full-cost ledger

Required dimensions are complete as a contract:

- deterministic multi-SST construction and record/denominator verification;
- fragment sketching, retention, and global sample bytes;
- ZDICT training and portfolio search/assignment probes;
- compaction/build CPU, wall time, RSS, temporary I/O, and buffering/cache charges;
- output SST bytes plus each per-SST dictionary meta block;
- reader/decompression CPU, memory, cache interaction, cold/warm point/range/full scans;
- reproduction, source/tool pinning, and failure-region reporting.

No dimension may be removed or posthoc reweighted to create a win.

## Trace fidelity

Current builder source exposes final serialized dictionary bytes and verifies decompression with that dictionary. It does not expose exact retained-fragment membership or dictionary-offset matches for each compressed block in the checked public loci. Assignment-local instrumentation of RocksDB/Zstd internals could plausibly close the trace without changing the public SST format or reader semantics, but that remains a nontrivial preclaim fidelity task.

Trace status: `FINITE_FIDELITY_GAP__ENGINEERING_ROUTE_PLAUSIBLE`. Trace success would support mechanism attribution; it would not establish a new optimization algorithm.

## Disposition

- Natural carrier route: `PASS_AS_ROUTE`
- Exact-object positive opportunity evidence: `NOT_PRESENT__NOT_REQUIRED_FOR_STAGE0`
- Full-cost contract: `PASS_AS_PLAN`
- Trace closure route: `FINITE_CONDITIONAL`
- Structural paper effect: insufficient to overcome `NO_NONTRIVIAL_N2_RESIDUAL`

