# Results

## Outcome

Decision: `BLOCKED_USER_ACTION_REQUIRED__SAFE_RELAY_ROUTES_EXHAUSTED__RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.

The harness-only correction succeeded: the fixed script was passed directly to frozen `sh.exe`, and the corrected native relay compiled, linked, and loaded the trivial executable. The sole authorized Carcara build then failed in the `gmp-mpfr-sys v1.6.1` custom build step. No retry or route expansion is permitted.

## Sequential gates

| Gate | Attempts | Result | Evidence |
|---|---:|---|---|
| Scripted relay smoke | 1/1 | PASS | exit 0; 478.971 ms; output SHA-256 `D4D554E209F4EF406F653AF35035119BA930D4D0BD4BDEE276A48DCC59F81195` |
| Clean locked offline Carcara build | 1/1 | FAIL | exit 101; 30.089827 s; `gmp-mpfr-sys` could not execute `cp -R` after symlink fallback |
| Version/help/checker smoke | 0 | NOT ENTERED | build failed |

## Contract boundaries

- Frozen source: `72/72` hashes exact; Cargo.lock exact.
- Frozen registry: `8,647` files, exact relative-path/size comparison with upstream; mismatch count `0`.
- Network: `0 B`.
- Build jobs: at most `2`.
- System/global environment changes: `false`.
- Claim-bearing observation: `false`.
- PRE_CLAIM_CONTRACT_FIDELITY_GATE: `NOT_ENTERED`.
- Scientific revision consumed: `false`.
- Stage B: `false`.
- Scientific PASS/STOP inference: none.

Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.

