# Resource Unblock Report — CVC5-ALETHE-SHAREMAP resume1

## Outcome

`resource_ready: false`. The authorized recovery partially succeeded but did not establish a runnable, unmodified Carcara 1.1.0. The correct disposition is `BLOCKED_USER_ACTION_REQUIRED`, with no scientific inference.

| Component | Result | Evidence |
|---|---|---|
| Portable Windows C/C++ toolchain | READY | Clang 22.1.8 version plus compile/run smoke passed |
| Portable Windows Rust toolchain | READY | rustc/Cargo 1.97.0 version plus compile/run smoke passed |
| Frozen cvc5 1.3.4 | READY | Commit-identifying version and minimal UNSAT smoke passed; executable hash unchanged |
| Carcara 1.1.0 | NOT READY | Unmodified locked build stopped in `gmp-mpfr-sys` MPFR test; no executable produced |
| Candidate/checker fidelity | NOT RUN | Prohibited until resource closure |
| Natural 60-instance corpus | NOT RUN | Prohibited until full preclaim gate |

## Exact blocking failure

After the first configure failure, the only bounded correction was the pre-frozen installation of signed `m4=1.4.21-1` and `diffutils=3.12-1`. The one identical retry of `cargo build --release --locked -p carcara-cli` reached the unchanged `gmp-mpfr-sys 1.6.1` test path and failed:

- GMP 6.3.0 test suites passed.
- MPFR 4.2.1: `TOTAL 198`, `PASS 194`, `SKIP 3`, `FAIL 1`, `ERROR 0`.
- Failed test: `tsprintf.exe`, exit status `127`.
- Exact diagnostic: `../../gmp-src/printf/repl-vsnprintf.c:388: GNU MP assertion failed: len < total_width`.
- Cargo exit code: `101`; no `carcara.exe` was produced.
- `test-suite.log`: SHA-256 `8DEBBD556FFE1766F89E03E35F8A57ABF3039777BBE81564F0D26B2624A38703`.
- `tsprintf.log`: SHA-256 `0CD13B186FFF6F88761EA05448C9E0FD91B2BBDBCF7B3E3B9D4948BC34AFF968`.

Disabling the tests or switching dependency linkage requires a Cargo feature/build-route change, not an invocation or environment correction. That is outside the frozen authorization and would weaken the fidelity basis. No further build attempt was made.

## Provenance and resource accounting

- MSYS2 base archive: official same-release SHA-256 sidecar exact match; `52,820,994 B`.
- Signed pacman transaction: 64 target/transitive packages; pacman reported `261.31 MiB` downloaded and `1,609.55 MiB` installed. The two bounded correction packages added about `0.62 MiB` download and `2.09 MiB` installed.
- Locked Cargo registry payload: 46 crates, `12,919,583 B` of crate archives.
- Approximate network payload: `383,044,231 B`, below the `2 GiB` authorization ceiling. The Carcara archive was copied from the prior verified local package and was not downloaded again.
- Closing measurement before report/manifest creation: `resume1` held 73,772 files and `2,951,814,432 B`; the complete topic held 81,157 files and `3,255,571,946 B` (`3.032 GiB`), below the `4 GiB` topic ceiling.
- CPU: cumulative build/smoke use remained below `4 CPU-hours`. An exact aggregate process-tree CPU value was not retained across short-lived child processes, so no false precision is claimed.
- GPU/exclusive device use: none.

## Safety and evidence ceiling

- System installation or mutation: `false`.
- Global PATH, registry, service, WSL, VM, or container changes: `false`.
- Writes outside `resume1`: `false`.
- Candidate build or execution: `false`.
- Claim-bearing observation: `false`.
- Scientific revision consumed: `false`.
- Stage B: `false`; user approval ID remains `null`.

Evidence ceiling: `RESOURCE_RECOVERY_PARTIAL__PORTABLE_TOOLCHAIN_AND_CVC5_SMOKE_ESTABLISHED__CARCARA_1_1_0_UNAVAILABLE__NO_SCIENTIFIC_INFERENCE`.

The previously established native-threshold-family replay remains prior evidence; this recovery assignment neither reran nor extended it. This packet supports no scientific PASS, STOP, reserve, or archival decision.

