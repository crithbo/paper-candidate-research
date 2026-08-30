# Discovery log — Source05 problem-first

## Frozen envelope

- Assignment: `DISCOVERY-S5-20260814-ADAPTIVE-SOURCE05`
- Lane: `S5_SCALE_ONLINE_APPROX`; cutoff 2026-08-14.
- Canonical method: `V8_7_POTENTIAL_READINESS_SEPARATED`; `DISCOVERY_CLAIM_PACK_MODE=OFF`.
- Problem-first rule applied: a real checker route plus a target-specific online/approximation/incremental theorem promise is enough for **raw**. A union-external whole action is still required for targeted depth and for any brief.

## Raw opportunity families

| Signature | Problem anchor and theorem promise | First-party/checker route | Raw disposition |
|---|---|---|---|
| `ROCQ_LIBRARY_PROOF_ENVIRONMENT__CHECKED_IMPORT_CLOSURE__VERSIONED_LIBRARY_INCREMENTAL_CERTIFICATION__CHECK_TIME_MEMORY_COST` | When versioned proof-library imports change, seek an incremental certification construction preserving the checked import closure, with a bounded-recheck or certified-reuse theorem. | Official Rocq documentation and core repository identify a machine-checked proof environment. | `RAW_TARGETED_GUARANTEE_GAP__ACTION_NOT_YET_CLOSED` |
| `AGDA_INTERFACE_FILE__SAFE_MODULE_TYPECHECKING__VERSIONED_INTERFACE_STATE_RECONSTRUCTION__TYPECHECK_MEMORY_IO_COST` | For a versioned Agda module graph, seek a bounded-recourse interface-state construction preserving Safe-Agda module acceptance and exact elaborated interface semantics. | Official interface-file documentation specifies that `.agdai` stores type-check results and is loaded for external modules. | `RAW_TARGETED_GUARANTEE_GAP__ACTION_NOT_YET_CLOSED` |
| `UPPAAL_TIMED_AUTOMATA__SAFETY_LIVENESS_VERDICT__INCREMENTAL_SYMBOLIC_ZONE_FRONTIER__VERIFY_MEMORY_TIME_COST` | After a local model/query update, seek an incremental symbolic-zone construction preserving the fixed timed-automata safety/liveness verdict, with a certified explored-frontier/recourse bound. | `verifyta` and trace output are official checker/witness routes. | `RAW_TARGETED_GUARANTEE_GAP__ACTION_NOT_YET_CLOSED` |
| `PRISM_PROBABILISTIC_MODEL__EXACT_PROPERTY_VALUE__CERTIFIED_APPROXIMATION_FRONTIER__ERROR_SAMPLE_MEMORY_COST` | Seek a target-specific certified approximation frontier for fixed PRISM `P`/`R` properties: an explicit error/confidence guarantee at a bounded update/compute cost, without changing the property or probabilistic model semantics. | Official PRISM manual documents exact checking and several approximate/statistical checking methods with accuracy controls. | `RAW_TARGETED_GUARANTEE_GAP__ACTION_NOT_YET_CLOSED` |
| `ACL2_BOOK_LIBRARY__CERTIFICATION_ACCEPTANCE__DEPENDENCY_AWARE_INCREMENTAL_BOOK_CERTIFICATION__CHECK_TIME_MEMORY_COST` | For a versioned ACL2 book dependency graph, seek a bounded-recourse certification plan that preserves every book's checker acceptance. | Official `certify-book` documentation supplies a finite checker route. | `RAW_TARGETED_GUARANTEE_GAP__ACTION_NOT_YET_CLOSED` |
| `FDR4_CSP_REFINEMENT__REFINEMENT_ASSERTION_VERDICT__INCREMENTAL_REFINEMENT_FRONTIER__STATE_TIME_MEMORY_COST` | For a versioned CSPM process/assertion, seek an incremental refinement construction retaining the same FDR assertion verdict with a target-specific frontier/recourse bound. | Official FDR 4.2 documentation states CSP refinement checking and command-line, machine-readable output. | `RAW_TARGETED_GUARANTEE_GAP__ACTION_NOT_YET_CLOSED` |

## Targeted depth closure (two rows only)

### D01 — FDR4 CSP refinement

Current official FDR documentation fixes the object as CSPM processes and refinement assertions; its documented verification pipeline has evaluation, compilation and checking stages. The finite formal carrier can be a public CSPM model plus its assertion and FDR's machine-readable verdict. A putative atomic action would have to update an already constructed refusal/divergence exploration frontier after a specified process edit while preserving the exact assertion verdict.

The required current-union closure was not achieved from the bounded official snapshot: the documentation does not establish a complete source-pinned action grammar or an invariant-preserving, two-output legal transition distinct from its native evaluation/compilation/checking pipeline. Treating a search order, cluster setting, or caching policy as the action would violate the contract. Therefore this row stays `NOT_ADMITTED_UNFROZEN`, not an absence claim.

### D02 — UPPAAL timed-automata verification

UPPAAL officially describes on-the-fly symbolic-state exploration using clock constraints, a stand-alone `verifyta`, and trace formats. A finite formal carrier can be an official/public timed-automata model and fixed safety/liveness query; the stock verdict and trace are the oracle. A putative atomic action would jointly preserve zones and the query-relevant frontier under a declared local automaton/query edit, with a target-specific recourse bound.

The bounded check did not close the full native union over symbolic exploration, reductions and trace semantics. In particular, UPPAAL's own documentation cautions that symbolic traces need not be forward stable, so an alleged witness cannot use an arbitrary displayed counterexample as a legal state-transition certificate. No complete union-external whole action was frozen; this remains `NOT_ADMITTED_UNFROZEN`.

## Final decision

`COMPLETE_ZERO_PROPOSALS`. The six raw rows satisfy the assignment-local problem/guarantee/checker entrance, but neither targeted closure passes the unchanged v8.7 clean-brief gate. No theorem, current-implementation absence, or global novelty claim is made. The four non-depth raw rows are not scientific drops; they require the same union/action closure before any promotion.

## Cost, reproducibility and prohibited work

The potential full-cost denominators are explicitly fixed per raw signature (update/check/build wall time, CPU, RSS, I/O/state bytes and checker/verdict generation). Each has a finite formal carrier and stock checker route. No experiment, benchmark, E2 smoke, build, installation, large download, V9 output, Stage0/A/B creation, automation, or shared-control write was performed.
