# CVC5-ALETHE-SHAREMAP Resource Unblock Command Log

- Lane: `CANDIDATE_EXECUTION_LANE_1`
- Assignment: `RESOURCE-UNBLOCK-L1-20260810-CVC5-R1`
- Authorization: `UNBLOCK-AUTH-20260810-R1`
- Unique write directory: `D:\project\writing\reserch\stages\stageA\CVC5-ALETHE-SHAREMAP\resume1`
- Claim-bearing: `false`
- Scientific revision consumed: `false`
- Stage B: `false`

## 2026-08-10 — intake and pre-download freeze

1. Re-read the mandatory role entry and academic-research-suite experiment/reproducibility boundary.
2. Verified the immutable blocker packet, frozen experiment contract, prior Stage A report, handoff and manifest hashes against mainline registry.
3. Confirmed `resume1` did not exist before this assignment.
4. Consulted only official MSYS2, Rust, cvc5 and Carcara first-party metadata to select a bounded portable route.
5. Created `RESOURCE_AUTHORIZATION_FREEZE.yaml` before downloading any binary or package payload.
6. No candidate, natural corpus, claim-bearing run, Stage B action, automation, system installation, global PATH edit, registry edit or service change was performed.

## 2026-08-10 — verified MSYS2 base and repository resolution

7. The in-sandbox Windows `curl.exe` attempt failed with `SEC_E_NO_CREDENTIALS`; the same frozen official GitHub release download was retried under the approved transport boundary.
8. Downloaded `msys2-base-x86_64-20260322.sfx.exe` as a temporary file, then downloaded its same-release SHA-256 sidecar. The archive is `52,820,994 B`, SHA-256 `6FE0CC8154132040E034FF4DAFACE2A4163A9D1F6EBAAA1133394BFF460BD5CF`; it exactly matches the sidecar. Authenticode status is `NotSigned`, so acceptance rests on the official sidecar and source provenance.
9. Moved the verified archive into `downloads/verified` and only then extracted it into `toolchain/msys64`. No installer registration, shortcut, uninstaller, system PATH or registry entry was created.
10. Initialized the local MSYS2 keyring and ran the two documented local-root update passes. Pacman verified repository databases and package signatures; all cache and installed files remain under `resume1/toolchain/msys64`.
11. Queried target metadata before downloading target packages. The signed repository resolves CMake `4.4.2-1`, not the earlier web-index value `4.4.0-1`, and resolves Python exactly as `3.14.7-1`. These exact values were frozen in `RESOURCE_VERSION_RESOLUTION.yaml` before target package download.

## 2026-08-10 — portable toolchain and first Carcara build attempt

12. Installed 64 exact target/transitive packages through the local-root pacman transaction. Pacman reported `261.31 MiB` download and `1,609.55 MiB` installed size; it checked keyring and package integrity before extraction. Two mirror low-speed warnings occurred, but the transaction subsequently loaded and installed the verified packages successfully.
13. Version audit: Clang `22.1.8`, CMake `4.4.2`, Ninja `1.13.2`, Rust/Cargo `1.97.0`, Python `3.14.7`, GNU Make `4.4.1`, Zip `3.0`. Process-local PATH was used only for each smoke command; no global environment was changed.
14. Compiled and ran one C++ and one Rust hello-world program. Both returned the frozen success strings. Output hashes are recorded in the source asset manifest.
15. Copied the previously verified Carcara 1.1.0 source archive into `resume1`, rechecked SHA-256 `FCD42C4ED6501B690E3F363E980B2B1403A1A7C9DF262FECC0A4C831B8960F30`, and only then extracted it under `resume1/sources`.
16. The sandboxed Cargo dependency fetch failed with Schannel `SEC_E_NO_CREDENTIALS`. Under the approved crates.io-only transport boundary, all `Cargo.lock` dependencies downloaded into `resume1/toolchain/cargo-home` and Cargo began an unchanged `--locked --release` build.
17. The first build failed in `gmp-mpfr-sys 1.6.1`: configure could not find `m4`, `cmp`, or `diff`. No executable was produced. Exact official dependencies `m4=1.4.21-1` and `diffutils=3.12-1` were frozen before download; one identical locked build retry is allowed, with any further toolchain gap causing fail-closed blocker output.

## 2026-08-10 — exact retry failure and fail-closed decision

18. Installed only the two pre-frozen bounded corrections, `m4=1.4.21-1` and `diffutils=3.12-1`, through the same local-root signed pacman transaction. Package integrity and signatures passed. No global or system installation occurred.
19. Ran the one permitted identical command: `cargo build --release --locked -p carcara-cli`, with `CARGO_HOME` and `CARGO_TARGET_DIR` confined to `resume1` and only a process-local PATH.
20. The retry terminated with Cargo exit code `101` in the unchanged dependency `gmp-mpfr-sys 1.6.1`. GMP 6.3.0 tests passed. MPFR 4.2.1 reported `TOTAL 198`, `PASS 194`, `SKIP 3`, `FAIL 1`, `ERROR 0`.
21. The exact failing test was `tsprintf.exe`, exit status `127`. Its log states: `../../gmp-src/printf/repl-vsnprintf.c:388: GNU MP assertion failed: len < total_width`. Then `make` failed on `test-suite.log`; no Carcara executable was produced.
22. Preserved exact logs: `test-suite.log` is `623 B`, SHA-256 `8DEBBD556FFE1766F89E03E35F8A57ABF3039777BBE81564F0D26B2624A38703`; `tsprintf.log` is `124 B`, SHA-256 `0CD13B186FFF6F88761EA05448C9E0FD91B2BBDBCF7B3E3B9D4948BC34AFF968`.
23. Source inspection showed that bypassing the failing dependency tests requires changing Cargo features (for example `c-no-tests`) or the build route (`use-system-libs`); neither is a mere invocation, environment, or log-reading correction. Such a change would weaken or alter the frozen resource-fidelity contract. Per the authorization and the user's follow-up, no further retry, patch, feature change, dependency expansion, or download was made.

## 2026-08-10 — cvc5 smoke and closing boundary

24. A first `Start-Process` wrapper call failed before process creation because a PowerShell environment dictionary contained the case-insensitive duplicate keys `Path` and `PATH`; its pre-created empty output files were retained. This was an invocation-only error.
25. Direct execution of the unchanged frozen cvc5 binary then passed: version exit code `0`, identifying line `cvc5 1.3.4 [git f3b21c4 on branch HEAD]`; the fixed minimal UNSAT input returned exit code `0` and `unsat`. Executable SHA-256 remained `FC71384CB2DBA76AD775CD6088DE76C3F4DB10BB1CC594FA4CFCD3110B576C3B`.
26. Final disposition is `BLOCKED_USER_ACTION_REQUIRED`, because a runnable, unmodified Carcara 1.1.0 was not established. Portable C++ and Rust compile smokes and the unmodified cvc5 smoke are resource observations only.
27. No candidate was built or executed; no Alethe proof was checked by Carcara; no natural 60-instance corpus was run; no claim-bearing observation, scientific revision, Stage B action, system installation, global PATH/registry/service modification, WSL/VM use, or write outside `resume1` occurred.
