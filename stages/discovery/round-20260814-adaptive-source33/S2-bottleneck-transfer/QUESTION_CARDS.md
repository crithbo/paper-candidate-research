# Question Cards — Source33 S2

## QC-S33-01

- **Identity and same-object endpoint:** fixed DPC++ multi-tile program, input sequence, root/subdevice topology and observable program outputs; no reader, API, output, or consistency guarantee is changed.
- **Opportunity anchor:** once a computation is distributed over tiles, data location and host/device transfer can dominate the full path rather than arithmetic.
- **Current-source locus:** Intel's current DPC++ Level Zero multi-tile guidance documents device/subdevice partitioning, USM allocation kinds, queue creation, implicit root-device scaling, explicit subdevice queues and explicit copy paths. It treats them as legal caller-composed choices.
- **Candidate action:** jointly construct allocations and queues before submitting the fixed workload.
- **Contrary test:** a candidate must differ from the complete documented composition, not merely choose a different documented placement or queue setting.
- **Result:** `LOCATOR_ONLY__CURRENT_UNION_COMPOSITION__NO_TARGET_SPECIFIC_N2`. The only actionable difference identified is a policy/placement selection. This is excluded before evidence-qualified raw, not a scientific STOP and not evidence against a future distinct object.
- **Natural carrier / oracle:** the official multi-tile example can be a finite carrier; fixed program output and Level Zero completion semantics are the native oracle. This route is not used because the action gate already fails.
- **Full-cost denominator if reopened with an external evidence delta:** host-device copies, queue submission, kernel time, CPU, device/host memory, temporary bytes, and end-to-end latency.
- **Minimum falsifier:** exhibit a non-product, target-specific state/action with a guarantee that cannot be represented by the documented allocation-plus-queue composition. None is frozen here.
