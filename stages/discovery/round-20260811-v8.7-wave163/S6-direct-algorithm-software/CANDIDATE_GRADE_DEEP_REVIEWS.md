# Candidate-grade deep review

## DepQBF QRP/BQRP producer union — STRUCTURAL_DROP

### Same-object semantics, natural carrier, and oracle

The input is a version-pinned public QBFLIB QDIMACS PCNF instance. Its quantifier prefix, matrix, satisfiability result, and output proof-system semantics are fixed.  The stock oracle is QRPcheck on the original QBF and emitted ASCII/binary QRP; acceptance plus the terminal result is the correctness predicate. A Stage-A carrier would record the QBFLIB URL/version/hash and the QDIMACS/QRP hashes before any claim-bearing run. No corpus was downloaded here.

### Current upstream reality and strongest fair union

The official DepQBF page says 6.03 is the latest release and directs users to `lonsing/depqbf`; its official GitHub README declares 6.03. That README is the frozen current configuration contract:

| action class | documented native union |
|---|---|
| proof emission | `--trace` writes every clause/cube-learning resolution step to stdout in QRP; `--trace=bqrp` emits binary QRP |
| proof-system/search mechanisms | QCDCL, clause/cube learning, long-distance resolution, dependency schemes, dynamic QBCE and generalized axioms |
| trace compatibility | no incremental trace; `--dep-man=simple`; `--no-lazy-qpup` for QPUP-based tracing |
| cost-relevant modes | ASCII versus binary trace; default configuration; expensive assertions/statistics are separately configurable |
| checker | QRPcheck consumes binary/ascii QRP resolution proofs |

This is the comparator union, including non-default trace conditions—not an untraced default solver. The review makes no unsupported source-absence claim.

### Action-divergence test

QRP defines an ordered sequence of unique steps, each an input clause/cube, reduction, resolution, or terminal empty clause/cube, with at most two antecedents. Consider independent legal `C1` and `C2` before `C3=resolve(C1,C2)`. A topological order can vary, but DepQBF's trace action already emits every learning resolution step of its actual QCDCL derivation. Reordering an emitted proof, deleting now-unused steps, batching writes, or changing binary layout is generic proof compression/output postprocessing, disallowed by the assignment. Selecting different `C1/C2/C3` changes conflict analysis, learning, and QCDCL search; it is a changed solver construction, not a certificate-writer residual.

No complete same-object action remains outside this union. The nearby generalization—proof-producing generalized axioms—has a direct current collision: QRP+Gen (SAT 2025) extends QRP with checkable oracle evidence and reports DepQBF integration.

### Full cost and finite falsifier

If a genuinely new static action ever appears, the complete denominator must include solver/producer CPU-wall/RSS, QRPcheck CPU-wall/RSS, trace bytes, stdout/file I/O, temporary space, result latency, and any oracle-proof bytes/time. The natural QBF and checker must remain identical.

The finite 72-hour falsifier is: pin the exact DepQBF/QRPcheck/QRP+Gen commits and flags; freeze one QBFLIB instance with a two-antecedent witness; enumerate trace and search modes; then reject immediately if the proposed action is representable as trace mode/output rewrite, changes the QBF/checker/search object, duplicates QRP+Gen generalized proof production, or cannot meet the full-cost ledger. This was not executed.

### Six-dimensional residual result

| facet | result |
|---|---|
| decision rule | every learning resolution step is already emitted; residual rewriting is prohibited postprocessing |
| information | no additional same-object information is available |
| complexity/resource | no union-external primitive/algorithm remains |
| quality/guarantee | QRPcheck acceptance/result is fixed; stronger generalized route has a direct collision |
| full cost | well-defined but cannot restore an absorbed action |
| generalization/no-gain | remaining variants are output encoding or changed solver search |

**Decision:** `STRUCTURAL_DROP__CURRENT_PRODUCER_COVERS_DERIVATION_EMISSION__REMAINDER_POSTPROCESS_OR_CHANGED_SEARCH`. This is a direct action/collision conclusion, never an inference from lack of implementation or results.
