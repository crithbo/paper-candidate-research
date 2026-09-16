# AIGER-DELTA-SCHEDULE Resource Unblock Report

- Assignment: `RESOURCE-STAGEA-L2-20260811-AIGER-DELTA-SCHEDULE-RESUME1-R3E`
- Authorization: `AIGER-EXACT-TOOLCHAIN-RESUME-20260811-R3E`
- Result: `BLOCKED_USER_ACTION_REQUIRED`
- `resource_ready=false`
- Claim-bearing observation: `false`
- Scientific revision consumed: `false`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`

## Provenance and license closure

All seven source/dependency archives came from official GitHub codeload exact-commit URLs, passed gzip/tar listing and extraction, and have recorded actual bytes and SHA-256 in `SOURCE_ASSET_MANIFEST.tsv`. GitHub reported the Yosys commit signature as valid; the AIGER and ABC commits are unsigned but immutable exact commit objects. Unsigned status was recorded, not treated as an error. AIGER's MIT-style/BSD exception license, Yosys ISC license, and ABC permissive copyright notice were present and hashed.

## Build and smoke outcome

| Component | Pin | Attempts | Outcome |
|---|---|---:|---|
| AIGER | `039ec1a2cc37d3093ac35c4b6df65336b346f409` | 2/2 | build passed on attempt 2; help passed; stock binary roundtrip failed |
| ABC | `6c51a9238544bce6eb300b7b1c3e5bb4215bec84` | 2/2 | both clean builds failed under unmodified source |
| Yosys | `0f2bcb94b7dc8310a52abf6eef3a7e1a9f09b552` | 0/2 | source and exact required gitlinks acquired; build not started after conjunctive gate became impossible |

AIGER attempt 1 failed only because its configure script cannot quote an absolute compiler path in its `sed` template. Attempt 2 used the same compiler through process-local PATH and built successfully. The resulting `aigtoaig.exe` is 113,152 bytes, SHA-256 `C074052C66DA92B3062EDD5A9BBD3B7CD0D4BDD29B011EC738CCBF9683257811`, and its help command exited 0. Its stock `and.aag -> and.native.aig -> and.roundtrip.aag` smoke failed: the output header contains CRLF because upstream opens a binary destination with `fopen(...,"w")`, while its reader uses binary mode and rejects the carriage return. No source change was permitted.

ABC attempt 1 failed on Windows LLP64 type selection. Attempt 2 used only the official Makefile's `ABC_USE_STDINT_H=1` and `ABC_MAKE_NO_DEPS=1` switches; it progressed further but bundled CaDiCaL then failed because `getc_unlocked`/`putc_unlocked` are undeclared on this toolchain. Both build logs are retained without modification.

## Gate disposition

The native gate is conjunctive. AIGER stock binary smoke failed and ABC exhausted both clean-build attempts, so exact native union parity cannot be reached on the approved route. Yosys build, six-AND native replay, `PRE_CLAIM_CONTRACT_FIDELITY_GATE`, HWMCC acquisition, natural runs, candidate/baseline runs, and Stage B were not started.

This is a resource/toolchain result only. It does not support or refute threshold-sensitive scheduling freedom, native-union absorption, a nontrivial N2 algorithm, natural headroom, full-cost Pareto behavior, or the retained Stage0 tier.

## Resource accounting

- Network asset bytes: `14,325,374` across seven official archives.
- Assignment directory at report pre-close: `204,022,805` bytes across `12,780` files.
- Recorded build CPU from `/usr/bin/time`: approximately `437.42` user+system seconds; wall time approximately `382.28` seconds for the four build attempts.
- GPU/exclusive device/system install/global environment mutation: none.
- Limits: 8 GiB and 6 CPU-hours; neither approached.

See `ROUTES_EXHAUSTED.yaml` and `USER_BLOCKER_PACKET.md` for the exact next action.

