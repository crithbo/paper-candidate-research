# Command Log — CVC5 Carcara clean recovery R3C1

- Lane: `CANDIDATE_EXECUTION_LANE_1`
- Assignment: `RESOURCE-STAGEA-L1-20260811-CVC5-ALETHE-SHAREMAP-RESUME3-R3C1`
- Authorization: `CVC5-CARCARA-CLEAN-RECOVERY-20260811-R3C1` + R3A + R3H
- Unique write directory: `<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\CVC5-ALETHE-SHAREMAP\resume3`
- Stage B: `false`
- Claim-bearing at resource phase: `false`
- Scientific revision consumed: `false`

## Intake and freeze

1. Fully read the frozen assignment entry files and the frozen candidate-owner rule; verified all four entry hashes.
2. Read the academic-research-suite experiment runner and reproducibility protocols. Deterministic artifacts require exact hashes; process runs require timeout and output capture.
3. Read only the registered CVC5 blocker/resource packages and the R3A bootstrap registrations. `resume3` did not exist at entry.
4. Verified resume1 source archive SHA-256 `FCD42C4ED6501B690E3F363E980B2B1403A1A7C9DF262FECC0A4C831B8960F30`, resume2 handoff `328E8554773697C4CB0E677A6C17B130267D97099666469003498125528C8469`, and resume2 manifest `A75DCA035F1817F474B63F79D73A88EFADB0E8F47E9F2E468C2ADA97D3F71F71`.
5. Recorded post-entry candidate-owner role drift (`9660…3FDC` frozen at entry; `AAF3…BD6` later observed) without importing the newer rule.
6. A first optional registry chunk-hash audit used a PowerShell API unavailable in this runtime and produced empty chunk hashes; a corrected read-only audit using `SHA256.Create().ComputeHash` covered all 1,023,895 bytes in 16 chunks. No task artifact or scientific execution was affected.
7. Created this immutable directory and wrote `RESOURCE_AUTHORIZATION_FREEZE.yaml` before any network payload, extraction, or build.

## Exact Rust 1.72 and source closure

8. The first sandboxed request to the frozen Rust official sidecar URL failed with Schannel `SEC_E_NO_CREDENTIALS`; the tool-authorized retry to the same `static.rust-lang.org` URL succeeded. No alternate domain was used.
9. Downloaded `rustup-init.exe` and its official sidecar. The executable is `14,417,054 B`, SHA-256 `03DBAAE1D33A4D220BD0D202E5092955DAE859C119074192CA513F8C4713FFF7`, exactly matching the sidecar. Authenticode is `NotSigned`; acceptance rests on the official URL and exact sidecar.
10. Installed Rust solely under `resume3/toolchain` with `--no-modify-path`, minimal profile, host `x86_64-pc-windows-gnu`, toolchain `1.72.0`. No global PATH, registry, service, WSL, VM or system installation was changed.
11. Version smoke passed: rustc `1.72.0 (5680fa18f 2023-08-23)`, Cargo `1.72.0 (103a7ff2e 2023-08-15)`. The real toolchain binaries have SHA-256 `0968EB36…ED77` and `E91B95EC…8D2F`; Rust/Cargo MIT and Apache license files were retained in the toolchain.
12. Copied the verified Carcara source archive from read-only resume1. Archive SHA-256 remained `FCD42C4…0F30`; extracted source has 72 files and tree digest `A2D1D25C…35E3`, exactly equal to the resume1 verified tree. `Cargo.lock` is `0E9C953C…7378`; source license is Apache-2.0, SHA-256 `62C7A1E3…636A`. All 72 source files were marked read-only.
13. Copied only the prior Cargo registry cache into the local Cargo home as R3A bootstrap reuse. No old binary or scientific fact was imported.

## Build-route accounting

14. An initial optional process wrapper failed before cargo process creation because PowerShell exposed duplicate case-insensitive `Path/PATH` keys. The proposed WMI process-tree monitor was also access-denied. Empty stdout/stderr files were retained; target directory did not exist. This was invocation-only and did not consume a build.
15. A `Start-Process -UseNewEnvironment` self-test reproduced the same pre-process duplicate-key failure. The final wrapper therefore used direct `cmd.exe` execution, process-local variables, a hard bounded call and complete combined logs. Peak process-tree RSS/CPU could not be measured without inventing precision; wall times and storage are exact.
16. Clean build 1 executed `cargo build --release --locked --offline -p carcara-cli` with Rust 1.72 and the R3A CLANG64 bootstrap. It failed before compilation because Cargo 1.72 could not resolve locked package `log` from the reused Rust 1.97 registry metadata. Exit `101`, wall `0.318 s`, log SHA-256 `F98994E3…C620`; no build1 target directory was created.
17. Exercised the one purely mechanical correction: `cargo fetch --locked` from official crates.io with Cargo 1.72 sparse metadata. One transient timeout for `gmp-mpfr-sys 1.6.1` was retried by Cargo and succeeded. Exit `0`, wall `61.397 s`, log SHA-256 `E27558E6…FA41`. Source tree and `Cargo.lock` hashes remained exact and unchanged.
18. Clean build 2 used a new empty `carcara-target-build2` and the same unchanged source/lock/tests. Compilation started, then Rust GNU build-script links failed because the authorized CLANG64 linker contains neither `libgcc_eh` nor `libgcc`. Exact diagnostics: `lld: error: unable to find library -lgcc_eh` and `lld: error: unable to find library -lgcc`. Exit `101`, wall `4.041 s`, log SHA-256 `9A73B26F…8066`.
19. Read-only audits found no `libgcc*.a` in either the reused CVC5 MSYS2 root or the registered R3A LLVM-MinGW tree. No third build, toolchain installation, target change, Cargo feature change, dependency/test bypass or source patch was attempted.
20. `carcara.exe` count is zero. Version/help/checker smoke, full preclaim gate, candidate and natural 60-instance runs therefore remain prohibited and were not executed.

## Terminal boundary

21. Both authorized clean-build slots are exhausted. Disposition: `BLOCKED_USER_ACTION_REQUIRED__ROUTES_EXHAUSTED__R3H_RECOMMENDED` with `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.
22. Scientific revision consumed: `false`; claim-bearing observation: `false`; Stage B: `false`; registry/shared-control writes: none.
