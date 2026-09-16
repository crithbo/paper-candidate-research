# Candidate-grade deep reviews

## SNAP-COMMUNITY-ADJACENCY-BLOCK — NOT_ADMITTED_UNFROZEN

- Natural artifact and stable observation: the official SNAP collection includes real social, citation, communication, road and Internet networks. These commonly expose community clusters, local neighbor overlap and power-law degree skew.
- Exact object/function: a mutable labeled graph with the same vertex/edge identifiers and outputs for a fixed graph-algorithm/query contract.
- Minimal action-divergence witness: two communities have dense internal adjacency and sparse cut edges; a constructor would assign a contiguous physical block to each community while maintaining an inverse label map.
- Same-information union: current SNAP provides compact graph representations and dynamic node/edge updates, but this screening did not freeze a current source-level representation/update contract that distinguishes a physical block constructor from generic relabeling or cache/layout tuning.
- Full-cost denominator: build/relabel time, inverse-map space, all update costs, graph-operation time, memory, and output equivalence—never locality metric alone.
- Finite Stage A killer: freeze one current SNAP graph representation plus 20–50 natural graphs; if all retained benefits require static relabeling that invalidates supported dynamic operations, same-object fails. If a current native representation performs the same block construction under the identical update contract, direct absorption follows.
- Fidelity plan: `FINITE_FIDELITY_GAP`; exact native action interface is not yet frozen. Structural-paper potential could reach `TIER_B_Q2_VIABLE` only if a complete update-preserving constructor survives this killer. Current readiness does not support DROP.

## SUITESPARSE-MASKED-SPGEMM-WORKSPACE — DROP

- Natural artifact and stable observation: SuiteSparse contains 2,900+ real sparse matrices across applications; rows/columns have highly uneven nonzero counts and mask locality.
- Exact object/function: masked sparse matrix product under a fixed GraphBLAS semiring, yielding exactly the same matrix entries.
- Minimal action-divergence witness: a masked row cluster could share a symbolic workspace/accumulator allocation rather than allocate one independently per row.
- Current strongest union: current GraphBLAS defines sparse matrix objects, CSC format and `GrB_Matrix_exportHint`; representations and export hints already cover format-level workspace/layout choices. The proposed action provides no new algorithmic constraint or quality guarantee outside this union.
- Current-upstream reality check: inspected current GraphBLAS API/specification and binary sparse specification at cutoff. This is positive evidence of supported representation actions, not an absence claim. No missing flag is asserted.
- Full-cost denominator: symbolic and numeric phases, allocation/initialization, mask handling, conversion/export, peak memory, and exact result—not kernel time alone.
- Finite Stage A killer: enumerate a small SuiteSparse masked product using each legal current representation/export choice. If the proposed workspace differs only by selection, it is tuning; if it changes the semiring/mask semantics, same-object fails. This is a structural killer.
- Structural-paper potential: `BELOW_Q2_STOP` for the stated mechanism; no resource/readiness fact was used.
