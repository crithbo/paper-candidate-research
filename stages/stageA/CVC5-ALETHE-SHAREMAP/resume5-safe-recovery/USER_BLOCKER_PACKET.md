# User blocker packet — Carcara resume5

## What failed

The authorized one-shot offline build reached the native GMP compiler test but every `gcc` probe returned exit 1. The earlier Windows-path quoting failure is fixed; this is a distinct mechanical failure. The retained configure log contains no compiler stderr, so another blind build would not be auditable and is forbidden by the consumed 1/1 attempt.

## What did not run

No Carcara binary exists. Version/help, stock checker smoke, preclaim fidelity, candidate execution, natural corpus and claim-bearing work were not run. No scientific revision was consumed and no scientific inference is permitted.

## Minimum unblock action

Issue a new immutable resume assignment and directory that consume resume5 read-only and authorize, before any build, exactly one non-claim-bearing compiler diagnostic in the same MSYS2 child environment. The diagnostic should compile and link a trivial C program through `sh` with the exact `PATH`, `CC=gcc`, `AR=ar`, target location and flags recorded by GMP, while retaining stdout/stderr and loader status. Based on that evidence, authorize at most one separately frozen clean offline build route; do not authorize a blind retry.

Acceptable bounded alternatives are:

1. the same frozen source/lock/Rust/GCC with a mechanically corrected process-local MSYS2 environment demonstrated by the diagnostic; or
2. an official or reproducibly built, unmodified Carcara 1.1.0 Windows binary for commit `5d817d86bd18ea2a850a580d602f17f36959ee99`, with source/build provenance, license, exact SHA-256, version/help and stock-checker smoke.

Expected network for route 1 is 0 B. A new route must freeze its own storage/CPU/wall limits and may not reuse or overwrite resume5's consumed target. Source, Cargo.lock, tests and features must remain unchanged. System installation, WSL and global changes remain unnecessary and unauthorized.

## Evidence locations

- Build log: `resources/logs/carcara-clean-build.combined.log` (`71DBC0354F6554BE3FCA3111CA10D7169F9DE0971E98A1C407BD36628A7AD720`)
- GMP configure log: `resources/build/carcara-target/release/build/gmp-mpfr-sys-7107cdddf71b20a3/out/build/gmp-build/config.log` (`A7FE0A9A6723513034A5676A6E6EBA8E331FB92030B044D800B7AAB9808990B6`)
- Build-tree metadata index: `resources/logs/build-target-metadata-index.tsv` (`EAB73DB853C8C912E056168A5756A76ED97202D99E66E737E3BDFB69FE2A72A9`)

Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.

