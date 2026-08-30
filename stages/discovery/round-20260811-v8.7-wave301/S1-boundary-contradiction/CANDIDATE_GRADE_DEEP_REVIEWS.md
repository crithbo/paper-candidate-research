# Candidate-grade deep reviews — Wave301

## D01 glibc lazy binding / dlopen — `DROP`

The [glibc dynamic-linker documentation](https://sourceware.org/glibc/manual/latest/html_node/Dynamic-Linker.html) fixes the loader's responsibility for dependencies and runtime shared-object loading. Current [hardening guidance](https://www.sourceware.org/glibc/manual/latest/html_node/Dynamic-Linker-Hardening.html) explicitly names lazy binding, `dlopen`, static TLS and `-Wl,-z,now`; it warns that lazy binding can allocate memory and is not async-signal-safe. A current glibc source commit documents lazy binding observing intermediate `dlopen` state. The legal state choice is therefore existing loader/linker configuration and initialization semantics; rescheduling it is a controller or changes observable binding/initialization guarantees. `DROP__CURRENT_LOADER_LINKER_UNION`.

## D02 futex2 waitv — `DROP`

The official [futex2 documentation](https://docs.kernel.org/6.11/userspace-api/futex2.html) defines `futex_waitv` as wait-on-any over up to 128 entries. Current kernel locking documentation defines wait setup/enqueue under bucket locks and wake/requeue/timeout outcomes. The caller's vector and the kernel's atomic expected-value check fix the state transition; choosing which waiter to awaken or reorder is a scheduler/controller and changes fairness/observable completion. No target-specific whole action or formal guarantee beyond current kernel state machine was identified. `DROP__KERNEL_STATE_MACHINE_OR_CONTROLLER`.

## D03 Python import commit — `DROP`

Current [importlib documentation](https://docs.python.org/3/library/importlib.html) defines `ModuleSpec` state, loader state and cache invalidation. It requires a loader to create and place a module in `sys.modules` before loading to prevent recursive import. This pre-execution commit is the stock semantic action; changing its placement risks recursion/observable identity semantics, while an import-order/cache policy is a controller or loader wrapper. `DROP__CURRENT_IMPORT_SEMANTIC_COMMIT_UNION`.

For any new object, the finite killer is source-pin current runtime/kernel; replay a public natural trace against stock oracle; require same observable state/guarantee and a target-specific strict Pareto/algorithmic certificate after all CPU/RSS/bytes/latency/state costs. Kill on controller/wrapper, changed commit semantics, current-union expression or no strict point. No killer was run.
