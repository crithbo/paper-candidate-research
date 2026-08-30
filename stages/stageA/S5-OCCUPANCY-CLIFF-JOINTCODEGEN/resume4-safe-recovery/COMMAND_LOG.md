# Command Log

- Assignment: `SAFE-RECOVERY-L2-20260815-S5-GFX11-MIR-RESUME4`
- Scope: resource and route recovery only until the frozen pre-claim gate passes.
- Root: `D:\project\writing\reserch`

## Control and read-only preflight

1. Verified the user-supplied control-table and assignment hashes.
2. Fully read `AGENTS.md`, `plan.md`, `registry.yaml` mechanically, the matching candidate-owner rule, resource-localization rule, inventory template, Stage A/blocker/handoff templates, and the academic-research-suite experiment workflow.
3. Read only the assigned S5 resume3 immutable package and its exact-tool/natural-input records. No APX, RVV, PPC, or other candidate material was read.
4. Confirmed the frozen natural-input gate requires 8--16 complete natural pre-scheduler MIR objects from at least eight source directories; five directories reached device IR and one reached complete MIR in resume3.

## Resource-localization preflight

5. Created the unique `resources/` root and its eight standard subdirectories.
6. Froze process-local redirects, safety envelope, external read-only inputs, retention, and cleanup ownership in `RESOURCE_LOCALIZATION_FREEZE.yaml` before any download, extraction, copy, compilation, or generated-resource action.

## Exact-tool and source checks

7. Recomputed SHA-256 for exact `clang`, `llc`, `FileCheck`, and `llvm-calc-occupancy`; all four matched `TOOL_MANIFEST.tsv`.
8. Reused the previously accepted official ROCm examples commit `269e9068d6fd6e68b1cc5a76eb77744f88af42ec` read-only. Source-level hashes for the selected eight files are frozen in `NATURAL_MIR_MANIFEST.tsv`.

## Portable sysroot route

9. A sandboxed HTTPS HEAD request failed with `SEC_E_NO_CREDENTIALS`; the required approved out-of-sandbox read-only HEAD succeeded. The exact minirootfs `Content-Length` was 3,698,422 B.
10. Downloaded the official SHA sidecar and minirootfs once. The upstream expected SHA-256 `41F73E...FE081` matched the downloaded archive; tar path audit found 516 entries and zero unsafe paths.
11. Full extraction was not retried after Windows tar rejected Unix symlink creation. No old evidence was touched.
12. Downloaded the official v3.24 x86_64 APK index (528,228 B), selected `musl-dev 1.2.6-r2` (3,421,233 B, MIT) and `libc++-dev 22.1.3-r0` (1,818,523 B, Apache-2.0), verified exact byte counts and package metadata, then extracted only regular development headers into `resources/env/alpine-musl-sysroot`.

## Natural MIR closure

13. Exact Clang command family: `clang --target=x86_64-alpine-linux-musl --sysroot=<assignment env> -resource-dir=<exact build resource dir> -stdlib=libc++ -x hip --cuda-device-only --offload-arch=gfx1100 -nogpulib [-nogpuinc and exact compiler/runtime includes where required] -std=c++17 -O2 -S -emit-llvm <unmodified source> -o <resources/build/natural-ir/*.ll>`.
14. Failed preflight command forms and their exact classes are listed in `FAILURE_RECORD.yaml`; failed outputs were not counted.
15. Combined four immutable accepted resume3 IR objects with four newly derived exact-commit IR objects, yielding eight distinct natural source directories without splitting any example.
16. Exact MIR command family: `llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1100 -mattr=+wavefrontsize32,-wavefrontsize64 -O2 -stop-before=machine-scheduler -verify-machineinstrs <IR> -o <MIR>`.
17. All eight primary MIR generations exited 0 and each contained one machine function.
18. Exact verifier replay command family: `llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1100 -mattr=+wavefrontsize32,-wavefrontsize64 -run-pass=none -verify-machineinstrs <MIR> -o NUL`; 8/8 exited 0.
19. Repeated the exact MIR derivation into `resources/build/replay2`; 8/8 SHA-256 values matched the primary outputs.

## Prohibited work not executed

20. Candidate corpus runs: 0. Baseline corpus runs: 0. Claim-bearing observations: 0. Scientific revision consumption: false. Stage B: false. No APX/RVV/PPC input was read.

## Closing control drift observation

21. At assignment start, `plan.md` and `registry.yaml` matched the frozen control-table hashes `7C0C4E...E96C21` and `14FF7B...AA99`. During closing validation, the mainline-owned files had changed to `BBE167...60889B` and `428576...AB04D`. They were not reread or modified after drift and did not affect this frozen assignment. `AGENTS.md`, role rule, resource-localization rule, control table, and assignment file still matched their frozen hashes.
