# CVC5 / Carcara resume9 native-wrapper resource gate

## Outcome

The single clean locked offline build failed mechanically. The `.cmd` relay paths were visible to GMP configure, so resume9 advanced beyond command-name selection, but the relay-backed trivial compiler probes all returned `1`. No compiler stderr was recorded in `config.log`; no Carcara executable was produced.

Decision: `BLOCKED_USER_ACTION_REQUIRED__RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.

## Frozen identity and continuity

- Assignment SHA-256: `8D596E8309702835D44A00F043E065A0F5677964FA9C83CBA04371EFFC42FEE0`.
- Resume5 canonical manifest: `17/17` exact; resume8 canonical manifest: `13/13` exact.
- Source manifest: `79F052442AE3FF77838AEBA558A6493FBBF0A23CB94AD7DB280B031150B7D48F`, validated `72/72` before localization and after build.
- Cargo.lock: `0E9C953C2C1B184511E2DFDF19D4BB7C35A6BE55140BC1A3D77179411D7C7378` before and after build.
- Frozen GCC: `AB37C11763FDCB3BF6F809B5D033A31EBEB77F10BA5934C72FA37287EE56144F`.

## Localized route

The new resource root contains an exact source copy and an 8,647-file, 257,457,109-byte locked registry copy. Four immutable `.cmd` wrappers forward `%*` to frozen absolute GCC, G++, AR and RANLIB paths and return `%ERRORLEVEL%`. `CC`, `CXX`, `AR` and `RANLIB` were the wrappers' POSIX-visible paths; Cargo/Rust, PATH, HOME, temporary files, cache and target were all process-local.

## Single build

The exact command `cargo build --release --locked --offline -p carcara-cli` ran once with at most two jobs and exited `101` after `23.218877 s`. `gmp-mpfr-sys` invoked:

`/d/project/writing/reserch/stages/stageA/CVC5-ALETHE-SHAREMAP/resume9-native-wrapper-build/resources/env/tool-relay/gcc-relay.cmd`

for its compile probes. Each invocation returned `1`; `config.log` then reported `could not find a working compiler`. This is a specific wrapper/autotools integration failure, not a native GCC incapacity: resume8 already established that the frozen native driver, assembler, linker and loader succeed when launched directly.

No retry or alternate wrapper was permitted. Because build failed, version/help and checker smoke were correctly not run.

## Boundary

- Claim-bearing observation: false
- Preclaim gate: not entered
- Scientific revision consumed: false
- Scientific PASS/STOP inference: none
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Stage B: false
- Network: 0 B
- System/user environment and PATH: unchanged

The minimum recovery action is a new explicit assignment authorizing one auditable POSIX-executable native relay (for example a pinned relay `.exe`) or another precisely frozen argument-preserving integration route. Resume9 must not be retried or overwritten.
