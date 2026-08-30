# Unique opportunity family

## DepQBF QRP/BQRP proof-stream producer

**Exact object and oracle.** A fixed PCNF QBF, same truth value, and a QRP/BQRP certificate accepted by stock QRPcheck.  Same-object equality is QBF byte/hash identity, checker acceptance, and result (`sat` or `unsat`); neither proof bytes nor solver search path must be identical.

**Complete current producer/config union.** Official current DepQBF 6.03 material exposes `--trace` (ASCII QRP), `--trace=bqrp` (binary QRP), QCDCL clause/cube learning, long-distance resolution, dynamic QBCE, generalized axioms, dependency manager options, and QPUP mode.  Trace mode itself writes every resolution step during clause/cube learning.  Its relevant constrained union is further frozen by: no incremental trace support; `--dep-man=simple`; and `--no-lazy-qpup` for QPUP-based trace generation.  The source loci are `qdpll.c`, `qdpll_config.h`, and the trace-output path named in the official README.

**Minimal legal witness.** Let derived clauses `C1` and `C2` be produced from input clauses, then let `C3` resolve using `C1,C2`; QRP permits unique step IDs and at most two antecedents.  `C1` and `C2` may only be reordered when their dependencies allow it.  This is a grammar witness, not a residual: the current producer already writes every such learning step, while any after-the-fact reordering/deletion is proof compression/postprocessing.

**Outcome.** `STRUCTURAL_DROP__CURRENT_PRODUCER_COVERS_DERIVATION_EMISSION__REMAINDER_POSTPROCESS_OR_CHANGED_SEARCH`. A new derivation-selection algorithm would alter QCDCL search/learning—therefore the solver construction—not a same-object certificate-stream writer.  The stronger generalized-axiom producer/checker route is directly covered by QRP+Gen (SAT 2025).
