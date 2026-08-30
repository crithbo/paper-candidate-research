# Unique opportunity families

## F01 — OpenMP detach-event completion seam

- Signature: `OPENMP_DETACH_TASK__FULFILL_EVENT_COMPLETION_TRANSITION__FIXED_TASK_DEPENDENCE_ENDPOINT__LIBOMP_RUNTIME_FULL_COST`
- History relation: `NO_MATCH__NOT_NOVELTY_PROOF` in the permitted preflight.
- Current strongest union: OpenMP detach/fulfillment specification and current LLVM libomp detached-task proxy path.
- Natural carrier/oracle: standard async I/O/MPI/GPU-stream detachable task; OpenMP completion/dependence semantics.
- Disposition: `EXCLUDED_BEFORE_RAW__COMMITMENT_EVENT_IS_OBSERVABLE_OR_GENERIC_TASK_LIFETIME_CONTROL`.

This is a structural exclusion, not a result, implementation, hardware, or resource inference.
