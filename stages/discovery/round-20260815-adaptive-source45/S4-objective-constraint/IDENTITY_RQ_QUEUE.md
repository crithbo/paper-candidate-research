# Source45 S4 — five-field identity preflight

| Item | Relation | Decision | Certificate |
|---|---|---|---|
| `SOURCE43_SWIFT_ASYNC_CONTEXT_FORWARDING` | `FROZEN_DIRECT_CURRENT_COLLISION` / active bounded identity | excluded before raw | Source45 CONTROL `identity_overrides`. |
| `SOURCE43_LLVM_BYREF_INVOKE` | `FROZEN_DIRECT_CURRENT_COLLISION` / queued closure identity | excluded before raw | Source45 CONTROL `identity_overrides`. |
| `SOURCE43_AMDGPU_GFX12_GLOBAL_LOAD_LDS` | bounded unresolved after prebrief | excluded before raw | Source45 CONTROL `identity_overrides`. |
| `SOURCE44_RVV_VXRM_INTERPROCEDURAL` | active Stage0 exact identity | excluded before raw | Source45 CONTROL `identity_overrides`. |
| generic benchmark/accelerator measurement material | `RELATED_ONLY` | no exclusion; no novelty inference | Tool/carrier/domain overlap alone does not satisfy all five identity fields. |

The selected RQs are recorded in `DISCOVERY_LOG.md`.  RQ45-03 has the sole concrete source queue item, `SC45-01`; RQ45-01 and RQ45-02 remain `LOCATOR_ONLY__RQ_BACKLOG` because no exact project/object/version or deterministic single-project rule was frozen.
