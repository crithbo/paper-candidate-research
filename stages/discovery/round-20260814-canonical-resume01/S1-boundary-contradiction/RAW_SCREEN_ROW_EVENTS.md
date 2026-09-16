# RAW_SCREEN_ROW_EVENT records

All rows use bounded, first-party/official material checked on 2026-08-14. A raw status is not a registry state or a scientific STOP.

| Row | Family signature | Native boundary / initial two-action sketch | Initial disposition | Reason |
|---|---|---|---|---|
| R01 | `NODE_CJS_COMPILE_CACHE__MODULE_GRAPH_PUBLICATION__EXIT_FLUSH__FIXED_MODULE_SEMANTICS` | in-memory compilation vs deferred on-exit disk cache flush | EXCLUDED | Same publication/recovery archetype as the R16A CPython-import family; changing runtime/cache storage is a relabel, not an independent S1 family. |
| R02 | `ITANIUM_CXA_ATEXIT__DSO_UNLOAD__DESTRUCTOR_PUBLICATION__ABI_ORDER` | register destructor at initialization vs DSO-unload execution order | EXCLUDED | Family-graph work in R16B already covered C++ once/initialization publication. This is contained ABI lifecycle elaboration, not a new mechanism. |
| R03 | `LLVM_OPENMP_LIBOMPTARGET__PLUGIN_INITIALIZATION_TEARDOWN__TARGET_ENTRY_LIFETIME` | eager runtime/plugin initialization vs first-target lazy lifetime management | NOT_ADMITTED_UNFROZEN | Official source exposes target-entry and requires-flag contracts, but the candidate action is presently a library-lifetime policy rather than a complete same-object non-controller N1/N2 construction. |
| R04 | `SYSTEMD_NOTIFY__SERVICE_READINESS_PUBLICATION__MANAGER_VISIBILITY` | service readiness notification vs manager state transition | STRUCTURAL_DROP | A service-manager readiness/restart policy is controller territory; no fixed same-object algorithmic action survived. |
| R05 | `LINUX_REQUEST_FIRMWARE__FALLBACK_LOADING__SYSFS_PUBLICATION_RECOVERY` | direct firmware acquisition vs fallback loading/publication | EXCLUDED | R16B already reviewed Linux firmware fallback family. |
| R06 | `NODE_ESM_LINK_EVALUATE__MODULE_RECORD_PUBLICATION__TOPLEVEL_AWAIT_FAILURE` | link module records before evaluation vs evaluate with failure propagation | EXCLUDED | Same module-loader partial-publication problem/action/guarantee as R01/R16A CPython import; API/runtime distinction is not a new family. |
| R07 | `LINUX_BINFMT_MISC__INTERPRETER_REGISTRATION__EXEC_COMMIT_BOUNDARY` | interpreter registration then exec handoff vs unregister/replace | STRUCTURAL_DROP | Candidate changes global registration policy, not a target-specific same-program construction; it reduces to configuration/control-plane action. |
| R08 | `LLVM_PROFILE_RAW_MERGE__COUNTER_PUBLICATION__INSTRUMENTED_RUN_RECOVERY` | raw profile write/merge versus reader-visible indexed profile | STRUCTURAL_DROP | The remaining idea is a format/emitter or batching construction, assigned to direct-construction/format lanes rather than S1 and lacks a distinct boundary mechanism. |

## Neutral source snapshot

- Node module documentation, current v26.5.1: <https://nodejs.org/api/module.html>. It states the compile cache may be enabled by API/environment, is written at process exit unless explicitly flushed, and its on-disk layout is an implementation detail.
- LLVM upstream OpenMP IR-builder interface, `main`: <https://github.com/llvm/llvm-project/blob/main/llvm/include/llvm/Frontend/OpenMP/OMPIRBuilder.h>. It fixes target-entry identity and requires-flag representation.
- LLVM upstream OpenMP source, `main`: <https://github.com/llvm/llvm-project/blob/main/llvm/lib/Transforms/IPO/OpenMPOpt.cpp>. It shows runtime-call availability is constrained after runtime linking.
- systemd container/notify protocol documentation: <https://systemd.io/CONTAINER_INTERFACE/>.

These snapshots are evidence for the screen only. No absence claim was promoted into a proposal.
