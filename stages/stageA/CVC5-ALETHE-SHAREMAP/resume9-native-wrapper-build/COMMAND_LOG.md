# Command Log

- Assignment: `SAFE-RECOVERY-L1-20260816-CVC5-RESUME9-NATIVE-WRAPPER-BUILD`
- Mode: resource recovery only; evidence ceiling `RESOURCE_RECOVERY_ONLY__NO_SCIENTIFIC_INFERENCE`.
- Resume5 manifest: `17/17`; resume8 manifest: `13/13`.
- Source manifest parser preflight initially expected star-formatted entries and therefore reported only a parser mismatch; the corrected canonical two-space parser validated all `72/72` files. No input drift occurred.
- Network, retry, alternate toolchain/configuration, source/lock/test changes, preclaim, science and Stage B are prohibited.

## Frozen operation

1. Copy the already validated resume5 source and locked Cargo registry into this assignment's localized resource root.
2. Use four auditable `.cmd` relay wrappers. Each calls exactly one frozen absolute native tool with `%*` and returns `%ERRORLEVEL%`.
3. Execute exactly once: `cargo build --release --locked --offline -p carcara-cli`, with at most two jobs.
4. Only on build success, execute version, help, and one frozen non-claim-bearing stock-checker smoke.

## Localization and pre-build validation

- Local-only source/cache copies completed with `robocopy /E /R:0 /W:0`; both return codes were `1` (files copied, no failure).
- Localized source: `72/72` content hashes exact; Cargo.lock exact.
- Localized registry: 8,647 files, 257,457,109 bytes, zero missing/extra/size-different entries.
- Target directory absent, so the authorized attempt is clean.
- Resource root before build: 8,724 files, 259,927,316 bytes; zero reparse points.
- One pre-build validation shell string contained a closing-parenthesis typo and produced no output or state change; a corrected read-only validation produced the figures above. It was not a build attempt.

Status: `PRE_BUILD_PASS__SINGLE_BUILD_BOUNDARY_OPEN`.

## Single build and closure

- Executed the one and only build attempt from `2026-08-16T01:20:58.2099266+08:00` through `2026-08-16T01:21:21.4476047+08:00`.
- Exact command: `cargo build --release --locked --offline -p carcara-cli`; jobs max `2`; network `0 B`.
- Cargo exit `101`; wall `23.218877 s`; Cargo process CPU `1.015625 s`.
- `gmp-mpfr-sys 1.6.1` selected the POSIX-visible `gcc-relay.cmd`, but all ABI compiler probes returned `1`. `config.log` contains the exact wrapper invocations and no compiler diagnostic text, then `could not find a working compiler`.
- No `carcara.exe` was produced. The success-only version/help/checker-smoke branch was not entered.
- Post-build source validation remained `72/72`; Cargo.lock and all four wrappers remained byte-exact.
- No retry, wrapper change, alternate compiler/configuration, network, source/lock/test change, preclaim, scientific or Stage B action was performed.

Final decision: `BLOCKED_USER_ACTION_REQUIRED__RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.
