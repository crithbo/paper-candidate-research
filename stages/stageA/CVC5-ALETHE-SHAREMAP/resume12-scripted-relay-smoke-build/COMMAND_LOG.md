# Command Log

- Assignment: `SAFE-RECOVERY-L1-20260816-CVC5-RESUME12-SCRIPTED-RELAY-SMOKE-BUILD`.
- Mode: resource recovery only; no claim-bearing/preclaim/Stage B.
- Resume11 canonical manifest: `21/21` exact.
- Resume5 source manifest: `72/72` exact; registry cache `8,647` files / `257,457,109 B`.
- Network, retries, variants, inline outer-shell substitution, and further relay/harness correction are prohibited.

Sequential gates: frozen `sh.exe` + hash-frozen script direct argument once → clean locked offline Carcara build once, jobs≤2. Any failure exhausts the authorized safe relay routes.

Materialized the eight required resource directories, an exact read-only relay copy, and the frozen trivial source. No network or system/global mutation occurred.

Status: `READY_FOR_SCRIPTED_RELAY_SMOKE`.

Final pre-smoke fidelity check: assignment, script, relay, trivial source and frozen `sh.exe` hashes all exact; resource-root reparse points `0`. The script will be passed as one direct process argument, with no `-c`, inline command, or outer-shell substitution.

Status: `PRE_SMOKE_INPUT_FIDELITY_PASS`.

## Gate 1 — scripted relay smoke

- Attempt: `1/1`.
- Invocation: frozen `sh.exe` with the frozen script path as its sole direct process argument; no `-c`, inline command, or outer-shell substitution.
- Started: `2026-08-16T01:53:48.3766914+08:00`.
- Finished: `2026-08-16T01:53:48.8556623+08:00`.
- Wall: `478.971 ms`; timeout: false; exit: `0`.
- stdout/stderr: empty.
- Output: `102,187 B`; SHA-256 `D4D554E209F4EF406F653AF35035119BA930D4D0BD4BDEE276A48DCC59F81195`.
- Result: `PASS`.

Status: `RELAY_SMOKE_PASS__LOCALIZING_FROZEN_BUILD_INPUTS`.

## Frozen build-input localization

- Source copy: one `robocopy /E /R:0 /W:0`, exit `1` (successful copy), wall `148.438 ms`.
- Registry copy: one `robocopy /E /R:0 /W:0`, exit `1` (successful copy), wall `10,972.113 ms`.
- Localized source: `72/72` content hashes exact, `2,469,505 B`; Cargo.lock exact.
- Localized locked registry: `8,647` files, `257,457,109 B`, matching frozen input.
- Resource-root reparse points: `0`.

Status: `BUILD_INPUTS_LOCALIZED_AND_REVALIDATED__READY_FOR_ONE_BUILD`.

## Gate 2 — clean locked offline Carcara build

- Attempt: `1/1`.
- Exact command: `cargo build --release --locked --offline -p carcara-cli`.
- Fresh target invariant: target absent before launch.
- Process-local controls: offline Cargo, assignment-local Cargo home/target/home/temp, relay-backed `CC/CXX/AR/RANLIB`, at most 2 jobs.
- Started: `2026-08-16T01:56:40.0204477+08:00`.
- Finished: `2026-08-16T01:57:10.1102746+08:00`.
- Wall: `30.089827 s`; Cargo parent CPU: `0.609375 s`. Aggregate child CPU and accurate peak RSS were not exposed; no estimates are made.
- Exit: `101`; stdout empty; stderr `3,224 B`, SHA-256 `19B43FD44AFCD35DCBB00F09DD12CE218754375A468C0AE64804DC4CDC481D38`.
- Exact failure surface: `gmp-mpfr-sys v1.6.1` build script panicked as unable to execute `cp -R` after its symlink fallback. No lower-level OS error code was emitted.
- Partial target at failure: `165` files, `144,468,397 B` logical.
- Result: `FAILED__SAFE_RELAY_ROUTES_EXHAUSTED`.

## Closed downstream work

- Version/help/checker smoke: not entered because build failed.
- Retry/variant/further correction: none.
- Network: `0 B`.
- Claim-bearing/preclaim/science/Stage B: not entered.
