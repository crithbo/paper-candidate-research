# RQ refinement result

No seed was promoted to an RQ candidate.  A valid 2–3 version refinement requires a shared exact object and a frozen carrier/action endpoint; it cannot be generated from a compiler, accelerator, or workload label alone.

| Surface | Reason excluded before RQ | Disposition |
|---|---|---|
| AMX joint tile configuration | Source28 exact family has active Stage0 routing. | `EXCLUDED_BEFORE_RQ__ACTIVE_SOURCE28_IDENTITY` |
| UPMEM bounded route | Source28 exact family is in a frozen closure assignment. | `EXCLUDED_BEFORE_RQ__ACTIVE_SOURCE28_IDENTITY` |
| NVDLA local graph/buffer route | Source28 exact family is in a frozen closure assignment. | `EXCLUDED_BEFORE_RQ__ACTIVE_SOURCE28_IDENTITY` |
| Generic versioned accelerator/model/toolchain concepts | No exact artifact/version, same-object semantics, or atomic offline action. | `LOCATOR_ONLY__ABSTRACT_DOMAIN_BUCKET_FORBIDDEN` |
