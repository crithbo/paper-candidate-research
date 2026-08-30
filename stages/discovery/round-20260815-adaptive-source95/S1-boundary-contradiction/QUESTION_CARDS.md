# S95-S1-QC01 — TaskGroup group-exit semantics

- Identity: Python 3.14.7 `asyncio.TaskGroup`; carrier `IMPLEMENTATION_CARRIER_ONLY`; network-security exclusion PASS.
- Fixed endpoint: all group tasks complete; mandated cancellation propagation, exception grouping, and cancellation-count handling are unchanged.
- Problem: exit synchronization may be costly, but it is inseparable from an observable cancellation/exception contract.
- Candidate insight: only a target-specific group-exit construction with a non-generic invariant could survive.

## Raw gate

- Current official locus: the Python docs specify wait-for-all on exit, cancel remaining tasks after non-cancellation failure, exception grouping, and preservation of cancellation counts.
- Strongest skeptic: changing cancellation order/handling changes the fixed exception/cancellation endpoint; retaining it leaves generic event-loop/state-machine scheduling.
- Falsifier: a same-TaskGroup two-action witness with identical task results, ExceptionGroup and cancellation counts but a target-specific non-generic guarantee.
- Initial full cost: event-loop steps, cancellation/wake latency, exception aggregation, CPU/RSS and cleanup latency.

## Disposition

- RQ_COMPLETE; RAW_REQUIRED INCOMPLETE because no source-supported non-generic discriminator survives.
- `EXCLUDED_BEFORE_RAW__FIXED_CANCELLATION_EXCEPTION_ENDPOINT_OR_GENERIC_EVENT_LOOP_SCHEDULING`.
- STRUCTURALLY_UNCLOSABLE for this RQ, not due to implementation, main-result, resource, or AI-readiness absence; C0 NO.
