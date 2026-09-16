# Discovery log — Source08 R18V2 residual-survival triage

## Frozen envelope

- Assignment: `DISCOVERY-S5-20260814-ADAPTIVE-SOURCE08-R18V2`
- Method: `V8_7_POTENTIAL_READINESS_SEPARATED`; `DISCOVERY_CLAIM_PACK_MODE=OFF`.
- Cutoff: 2026-08-14. Six raw rows; base depth is two. The precommitted third-depth condition was evaluated before any depth review.

## Residual-survival cards and pre-registered ranking

The rank is lexicographic in the contract order: same-object guarantee survival, concrete witness, bounded source closure, then selector/generic risk. `D1` means a finite checker-backed witness can be named now; it does **not** mean a union-external action is established.

| Pre-rank | Raw signature | Residual-survival card | D1 | Depth decision |
|---:|---|---|---|---|
| 1 | `CADP_BISIMULATOR_LTS__FIXED_EQUIVALENCE_OR_PREORDER_VERDICT__LOCAL_PRODUCT_FRONTIER_RECONSTRUCTION__STATE_TIME_MEMORY_COST` | Fixed pair of labelled transition systems, relation and TRUE/FALSE diagnostic. Promise: after a transition-local revision, preserve the same relation verdict with bounded recourse over the on-the-fly BES frontier. Stock diagnostic can check a two-output witness. Main risk: native `-bfs/-dfs/-tauconfluence` and BES machinery may already absorb the action. | yes | D01 |
| 2 | `PROB_EVENTB_REFINEMENT__FIXED_TRACE_REFINEMENT_VERDICT__SAVED_ABSTRACT_STATE_INCREMENTAL_REFINEMENT__STATE_TIME_MEMORY_COST` | Fixed B/Event-B abstract/refinement machines and trace-refinement verdict. Promise: certified bounded update of the saved abstract-state structure after a refinement edit. `probcli -ref_check` plus counterexample is a finite route. Main risk: the official saved-state/refinement action is already native. | yes | D02 |
| 3 | `MCRL2_LTS_BISIMULATION__FIXED_LTS_EQUIVALENCE__INCREMENTAL_PARTITION_FRONTIER_CONSTRUCTION__STATE_TIME_MEMORY_COST` | Fixed mCRL2/LTS relation and equivalence verdict. Promise: bounded-recourse partition update maintaining an exact bisimulation class relation. | no | no depth |
| 4 | `TAMARIN_PROTOCOL_THEORY__FIXED_TRACE_LEMMA_SEMANTICS__INCREMENTAL_PROOF_STATE_FRONTIER__SEARCH_MEMORY_PROOF_COST` | Fixed `.spthy` theory, adversary and trace lemma. Promise: an incremental proof-state frontier retaining the same trace-property theorem/counterexample boundary. | no | no depth |
| 5 | `MAUDE_REWRITE_THEORY__FIXED_REACHABILITY_OR_LTL_VERDICT__INCREMENTAL_REWRITE_SEARCH_FRONTIER__STATE_TIME_MEMORY_COST` | Fixed rewrite theory, initial term and property verdict. Promise: exact/parameterized reuse of a rewrite-search frontier under one legal theory update. | no | no depth |
| 6 | `PROB_CSP_ASSERTION__FIXED_REFINEMENT_OR_TEMPORAL_VERDICT__INCREMENTAL_ASSERTION_FRONTIER__STATE_TIME_MEMORY_COST` | Fixed CSP-M process/assertion and stock verdict. Promise: a bounded-recourse assertion frontier retaining the exact selected semantic model. | no | no depth; cross-tool proximity to Source05 FDR4 recorded. |

### Third-depth precondition

Before depth, only two of six rows were D1-witnessable. The contract permits a third review only if at least three D1 witnesses are available. Therefore the third slot was **not activated**; no outcome-aware backfill occurred.

## Base depth results

### D01 — CADP BISIMULATOR

The current official manual pins the object, comparison relation, inputs, output verdict/diagnostic, and the on-the-fly Boolean Equation System reduction. It also enumerates native comparison algorithms and tau-confluence reduction. A candidate that merely chooses traversal, emits the documented BES, or turns on reduction is a native configuration/algorithm choice, not a new same-object constructor. The bounded snapshot did not yield an invariant-preserving union-external local product/frontier action with a target-specific recourse theorem. Status: `NOT_ADMITTED_UNFROZEN`; no absence claim.

### D02 — ProB refinement state

Official ProB documentation explicitly makes the abstract state space a saved artifact for later refinement checking and exposes command-line `-refchk/-ref_check` models. Thus the central proposed action—reusing saved abstract state for refinement—is already expressed by the current native union. Altering the refinement semantics would be a changed guarantee; selecting a checking mode would be a configuration. Status: `DROP__CURRENT_UNION_DIRECTLY_EXPRESSES_CORE_ACTION`.

## Final decision

`COMPLETE_ZERO_PROPOSALS`. The six rows were retained as raw problem families only long enough to execute the pre-registered survival/rank procedure. Neither base-depth row satisfies the unchanged clean-brief boundary: no exact union-external atomic action plus target-specific theorem and finite legal witness is frozen. The non-depth rows remain unclosed rather than being rejected for implementation, result, resource, or AI-readiness reasons.

## Prohibited work

No experiment, benchmark, E2 smoke, build, installation, large download, V9 output, Stage0/A/B creation, automation, or shared-control write was performed.
