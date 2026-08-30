# PatchYield Stage 0 Revision 1 — static mechanism review

## Frozen scope

This is `DISCOVERY-S5-20260821-PATCHYIELD-STAGE0-REVISION1`.  The assignment hash was verified as `4685B495024D68E57DB108446789A27669F7771247A08E4529BB529A77130B26`.  This is the sole scientific revision of `PATCHYIELD-CALL`; no execution, model acquisition, agent run, replay, benchmark, or Stage transition was performed.

The object, action, information boundary, H100 configuration, three arrival-relative deadlines, fairness definition, and live-reexecution evidence ceiling remain exactly those frozen in the repair package.  The review only asks whether a target-specific online policy can meet the frozen hard fairness cap while remaining a non-generic mechanism.

## Result

`REVISION_GATE_NOT_CLOSED__RETURN_TO_STAGE0_STOP_SENTINEL`

The gate cannot be closed because the frozen requirement `bypass_i <= 16 for every legal queue state` is infeasible under the unchanged action grammar.  The grammar permits an arbitrary finite number of admitted, simultaneously ready, nonpreemptive calls, while the frozen `max_num_seqs=8` bounds each dispatch batch.  A legal state containing 25 such calls forces at least one call to observe 24 other-call dispatches before its own batch.  No ranking, progress state machine, custom scheduler, or legal composition can repair that counting lower bound without changing a prohibited part of the contract: queue/admission semantics, bypass definition, batch capacity, pausing/preemption, or the action itself.

This is a static contract-feasibility finding, not a claim-bearing result and not a Stage 0 `STOP` decision.  The pre-registered return target is `BELOW_Q2_STOP__GENERIC_PRIORITY_OR_EXISTING_FAIR_LLM_APPLICATION_SCHEDULING`; mainline/independent Stage 0 retains the sole authority to determine any formal disposition.

## What was closed

| Required revision item | Static conclusion |
| --- | --- |
| Complete call grammar and native mapping | Closed; see `ACTION_GRAMMAR_AND_NATIVE_MAPPING.md`. |
| Online information and leakage boundary | Closed; see `LEAKAGE_AUDIT.md`. |
| Executable all-legal-state bounded-bypass policy | Not satisfiable; formal counterexample is in `PROGRESS_INCREMENTAL_POLICY_CERTIFICATE.yaml`. |
| Non-scalar progress mechanism | Cannot become admissible because the hard feasibility prerequisite fails. |
| Same-object divergence witness | Closed negatively by the same 25-call witness; see `SAME_OBJECT_DIVERGENCE_WITNESS.md`. |
| Current-subtractor separation | Closed to the claim ceiling in `COMPARATOR_SEPARATION_MATRIX.md`; no absence claim is made. |
| Full-cost and finite H100 falsifier | Preserved without execution; see `FULL_COST_AND_STAGEA_FALSIFIER.md`. |

## Integrity boundary

The report does not infer a negative result from missing resources, implementation, or AI readiness.  The counterexample follows only from frozen, explicit contractual quantities: a maximum of eight complete calls per batch, arbitrary finite ready queues, and a bound of sixteen bypassed calls.  It therefore consumes the permitted revision as an actual static mechanism test.
