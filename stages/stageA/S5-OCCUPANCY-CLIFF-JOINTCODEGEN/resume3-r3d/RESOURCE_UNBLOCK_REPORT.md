# Resource Unblock Report

## Decision

`PARTIAL_RESOURCE_PASS__STAGEA_NOT_READY`. Exact LLVM claim tools and the frozen official ROCm corpus asset are ready, but the natural complete-MIR portion of the preclaim fidelity gate remains blocked. The assignment therefore hands off as `BLOCKED_USER_ACTION_REQUIRED`, not as a resource or scientific PASS.

## Closed resources

- Exact LLVM commit `1f112d62e1fa2c4f1a04887abd72da1ed61cf791`: official codeload archive verified and GitHub signature valid.
- Exact `llc`, `FileCheck`, `llvm-calc-occupancy` and Clang: built without source patches, hashed and smoke-checked.
- Official ROCm examples commit `269e9068d6fd6e68b1cc5a76eb77744f88af42ec`: archive, commit provenance and MIT license verified.
- Official HIP/CLR headers: immutable commits, archives and MIT provenance verified.
- Small real GFX11/wave32 scheduling witness: exact baseline and all frozen variants MachineVerifier-legal.

## Open resource gate

The frozen minimum of 8–16 complete natural pre-scheduler MIR objects from at least eight source directories is not closed. Five independent directories emitted valid natural device IR under semantics-preserving portable routes; only the small witness proceeded to complete exact MIR. Full examples require a compatible Linux or MSVC host ABI/sysroot. The Windows MinGW, MSVC-target, Linux-target and RTC routes and their exact failures are recorded in `ROUTES_EXHAUSTED.yaml` and `FAILURE_RECORD.yaml`.

## Cost and limits

- Official download bytes: 328,925,998
- Measured configure/build wall time: 2,312.358 seconds
- Conservative two-job CPU upper bound: 1.285 CPU-hours
- Directory size before final text/manifest: 5,674,061,442 bytes (5.2844 GiB)
- GPU/exclusive device: none
- Clean builds: 2/2
- Source patches/system installs/global environment changes: 0/0/0

## Boundary

`resource_ready=false` means Stage A is not ready, even though the exact tools are individually ready. `claim_bearing=false`, `scientific_revision=false`, `stageb_authorized=false`, `pending_user_stageb_review=false`, and `stageb_user_approval_id=null`.
