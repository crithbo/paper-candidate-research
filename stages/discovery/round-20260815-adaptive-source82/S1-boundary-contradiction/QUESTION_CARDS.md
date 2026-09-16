# Question cards

## QC01 — OpenMP detach completion versus event fulfillment

### Identity and contract

- Exact public identity: OpenMP 5.2 detachable task plus matching event handle and `omp_fulfill_event`.
- Carrier kind: `NATURAL`; official examples identify async I/O, MPI, and GPU-stream work as natural async carriers.
- Same-object problem: improve runtime lifecycle cost while retaining fixed task output, task/dependence completion order, event destruction, and structured-block semantics.
- Contribution hypothesis: N2 joint event/task lifecycle construction.
- Network-security exclusion: PASS.

### Evidence-qualified raw gate

- Current loci: OpenMP 5.2 task semantics, `omp_fulfill_event` operation, and LLVM libomp current tasking implementation.
- Current union: the task must have both structured-block completion and a fulfilled allow-completion event; fulfillment destroys the event; libomp turns unfinished tasks into proxies and fulfillment may free task data.
- Default/non-default check: no hidden flag or threshold creates an alternate same-guarantee fulfilment timing. Switching detach, changing dependences, or adding controller logic changes the fixed object.
- Strongest skeptic: timing of fulfillment is the completion signal itself. Earlier fulfillment changes dependent-task eligibility/observability; later fulfillment retains the task and changes completion; identical timing is the existing event protocol.
- Minimum falsifier: a two-task dependency trace whose successor observes the alternate fulfillment point, or a second fulfillment attempt. The former changes completion order; the latter is non-conforming.
- Finite closure: official event/task semantics plus the current libomp state transition provide a finite native oracle. No build, download, or experiment was performed.
- Full-cost: task proxy metadata, lock/synchronization work, event lifecycle, runtime scheduling, async resource retention, and end-to-end completion latency.

### Gate disposition

`EXCLUDED_BEFORE_RAW__COMMITMENT_EVENT_IS_OBSERVABLE_OR_GENERIC_TASK_LIFETIME_CONTROL`.

Changing fulfillment alters the protocol-defined completion event; preserving it leaves only ordinary task lifetime control. No target-specific N1/N2/N3 remains under the fixed endpoint.
