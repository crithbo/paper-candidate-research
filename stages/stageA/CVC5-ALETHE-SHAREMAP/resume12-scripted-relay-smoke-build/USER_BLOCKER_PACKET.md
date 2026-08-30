# User Blocker Packet

## State

`BLOCKED_USER_ACTION_REQUIRED__SAFE_RELAY_ROUTES_EXHAUSTED__RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.

The relay/harness issue is closed: the hash-frozen scripted smoke passed. The remaining blocker is the frozen Carcara dependency build path.

## Exact blocker

- Stage: sole clean locked offline Carcara build.
- Package: `gmp-mpfr-sys v1.6.1`.
- Exit: `101`.
- Failure: after symlink creation failed and the build script selected copy fallback, it panicked while attempting to execute `cp -R`.
- Exact log: `resources/logs/carcara-build.stderr.log`, SHA-256 `19B43FD44AFCD35DCBB00F09DD12CE218754375A468C0AE64804DC4CDC481D38`.
- Lower-level OS error code: not emitted; no narrower cause is asserted.

## Completed reusable evidence

- Corrected relay executable SHA-256: `78978515A5F2A14F733A4B689272438336075B3876A878F1DB66B7341B418E8C`.
- Frozen direct-script relay smoke: PASS, output SHA-256 `D4D554E209F4EF406F653AF35035119BA930D4D0BD4BDEE276A48DCC59F81195`.
- Source `72/72`, Cargo.lock, and locked registry path/size parity all pass.

## Routes exhausted

The assignment authorized exactly one scripted relay smoke and one Carcara build. Both attempts are consumed. It forbids further PATH changes, harness/relay corrections, alternate tools, dependency/feature/version changes or retries. No autonomous safe route remains.

## Minimum user/mainline action if recovery continues

A new immutable authorization must provide one of the following exact, independently hashable resources:

1. a portable process-local POSIX-compatible Windows build environment proven able to execute the unchanged `gmp-mpfr-sys 1.6.1` symlink/copy path, with exact tool versions, hashes, license, placement and one-attempt budget; or
2. an unmodified Carcara 1.1.0 Windows executable built from commit `5d817d86bd18ea2a850a580d602f17f36959ee99`, with provenance, SHA-256, size, license and reproducible build attestation sufficient for frozen version/help/checker smoke.

Any WSL/system installation, global environment mutation, dependency modification, or different Carcara/GMP version requires explicit new authority. Resume12 must remain immutable.

No scientific or stage disposition is requested.

