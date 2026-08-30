# Stage A Report: S5 Occupancy-Cliff Joint Codegen R3D

## Executive decision

Recommend `BLOCKED_USER_ACTION_REQUIRED`. The resource phase materially improved the state: exact-commit `llc`, `FileCheck`, `llvm-calc-occupancy` and Clang are built, hashed and smoke-checked, and the exact ROCm examples commit is locally verified. However, `PRE_CLAIM_CONTRACT_FIDELITY_GATE` failed on the frozen minimum natural complete-MIR set. Therefore no Stage A scientific comparison ran, no revision was consumed, and neither PASS nor STOP is supported.

## Frozen object

The unchanged object is exact LLVM commit `1f112d62e1fa2c4f1a04887abd72da1ed61cf791`, GFX11/wave32, complete byte-identical pre-machine-scheduler MIR, current `GCNSchedStrategy+greedy`, and the finite existing-knob frontier followed by the same greedy allocator and MachineVerifier. Runtime is outside the evidence ceiling because no AMD GPU is used.

## Preclaim fidelity

Tool identity, exact occupancy semantics, real comparator flags and a small legality/equality witness passed. The natural set did not: unmodified full ROCm examples require a compatible host C/C++ ABI and HIP runtime declaration path. The portable Windows route is LLP64 while upstream non-MSVC HIP headers assert LP64; the MSVC route lacks the MSVC SDK; the Linux route lacks a Linux sysroot. The official RTC/device-only route preserves device code but intentionally omits host runtime APIs, so it can compile only five independent natural source directories without trimming or faking the examples. The frozen minimum is eight.

## Integrity boundary

No source, lock file or test was patched. No synthetic/regression MIR was substituted. No example was split to inflate the trace count. No fake `_MSC_VER`, HIP API, or host-code removal was used. Consequently the failure remains a resource/toolchain-data compatibility blocker rather than a mechanism observation.

## Evidence and claim ceiling

The only executed scheduling commands are the mandatory small fidelity witness. They cannot support a natural-workload claim. Evidence ceiling is `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`; claim-bearing observations are zero; scientific revision remains unconsumed.

## Authority

Stage B is forbidden and was not initialized. `pending_user_stageb_review=false`; `stageb_user_approval_id=null`; `stageb_authorized=false`. The owner does not change registry state and does not invoke R3H. Mainline should mechanically review route exhaustion and either accept the blocker or issue a new resource authorization/user-directed fallback decision.
