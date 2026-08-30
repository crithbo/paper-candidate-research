# Resource Gate Report

## Executive result

`resource_ready=false`.

The final harness correction proved the corrected relay is visible and functional through the frozen POSIX script path. Carcara itself remains unavailable: its only permitted clean locked offline build exited `101` in `gmp-mpfr-sys`. Under the assignment decision rule, the safe relay routes are exhausted.

## Input fidelity

- Assignment SHA-256: `DBF942B2A122E0E97A71F0B230EA0815CCB25DD8E0EC2C9A1EE66A86F38C31C3`.
- Smoke script SHA-256: `9D8BD2BC116A56C7D408BD0F588BA19FD09D6D6B1380590B287DDCC4C9A0675A`.
- Resume11 manifest: `21/21` exact.
- Corrected relay: `259,735 B`; SHA-256 `78978515A5F2A14F733A4B689272438336075B3876A878F1DB66B7341B418E8C`.
- Carcara source manifest: `72/72` exact; Cargo.lock SHA-256 `0E9C953C2C1B184511E2DFDF19D4BB7C35A6BE55140BC1A3D77179411D7C7378`.
- Locked registry copy: `8,647` files / `257,457,109 B`; relative-path/size mismatches `0`.
- Resource-root actual reparse points: `0`. Cargo created 16 internal hardlink directory entries; these are not reparse points.

## Gate 1: scripted relay smoke

Frozen `sh.exe` received the frozen script path as one direct process argument. No `-c`, inline command, or outer-shell substitution was used.

- Attempts: `1/1`.
- Exit: `0`; wall `478.971 ms`.
- stdout/stderr: empty.
- Output: `102,187 B`; SHA-256 `D4D554E209F4EF406F653AF35035119BA930D4D0BD4BDEE276A48DCC59F81195`.

## Gate 2: Carcara build

- Command: `cargo build --release --locked --offline -p carcara-cli`.
- Attempts: `1/1`; fresh target; at most 2 jobs.
- Exit: `101`; wall `30.089827 s`.
- Cargo parent CPU: `0.609375 s`. Aggregate child CPU and accurate peak RSS were not exposed by this run environment; no estimates are made.
- stdout: empty.
- stderr: `3,224 B`; SHA-256 `19B43FD44AFCD35DCBB00F09DD12CE218754375A468C0AE64804DC4CDC481D38`.
- Exact surface: the `gmp-mpfr-sys v1.6.1` build script failed to create a symlink, selected copy fallback, then panicked as unable to execute `cp -R`. It did not emit a lower-level OS error code.
- Partial target: `165` files / `144,468,397 B` logical; metadata-index SHA-256 `26EABE078917CA581E86B6FBFB3AED36465BCF1E77146864D6780511B6F792C6` (metadata integrity only).

## Resource and safety accounting

- Network: `0 B`.
- Persisted resource data before canonical-package finalization: `404,761,645 B`, below `838,860,800 B`.
- Hard wall and CPU limits: not approached.
- Source, Cargo.lock, features and tests: unchanged.
- Global/system/WSL/registry/service changes: none.
- Version/help/checker smoke: not entered.
- Claim-bearing/preclaim/science/Stage B: not entered.

## Disposition

`BLOCKED_USER_ACTION_REQUIRED__SAFE_RELAY_ROUTES_EXHAUSTED`. This is a resource/toolchain failure only and cannot support scientific PASS, STOP, reserve or archive.

