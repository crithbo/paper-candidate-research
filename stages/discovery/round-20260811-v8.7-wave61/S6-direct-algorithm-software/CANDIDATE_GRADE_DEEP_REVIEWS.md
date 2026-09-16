# Candidate-grade deep review — Wave61

## QRP-PROOF

- Exact object: one fixed prenex QBF and a QRP proof accepted by the fixed native QRP checker, proving the same truth/falsity result.
- Candidate action tested: construct a globally shared/reordered proof DAG under the same QRP rules, rather than emit a solver-local stream.

| Dimension | Review |
|---|---|
| Decision | Choose derivation nodes, dependencies and topological emission. |
| Information | Fixed QBF and derivable clauses/cubes; no external oracle. |
| Complexity/resource | Charge proof construction, memory, bytes and checker time. |
| Guarantee | Exact QRP checker acceptance for the same QBF result. |
| Full cost | Derivation search, sharing, serialization and checking. |
| Generalization/no-gain | QBFEVAL is a finite canonical carrier; no gain if only a generic proof compressor/postprocessor is added. |

The named global sharing/reordering construction is not an independent proof-producing action until it states how QRP derivations are found under all rule/dependency constraints; otherwise it is a generic postprocessor/wrapper. Existing QRP proof systems and native checker/producers form the direct union. No complete atomic N2, approximation/FPT guarantee, or finite action interface beyond “compress/reorder” was specified.

`DROP_GENERIC_POSTPROCESSOR_OR_UNFROZEN_PROOF_PRODUCER`.
