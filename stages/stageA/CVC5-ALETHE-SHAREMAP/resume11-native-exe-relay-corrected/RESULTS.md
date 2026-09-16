# Results

## Outcome

Decision: `BLOCKED_USER_ACTION_REQUIRED__RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.

The corrected native relay compiled successfully on its sole allowed compile attempt. The next sequential gate did not produce a native observation: the outer PowerShell harness failed to parse while constructing the sole POSIX command, before any child process was created. The assignment forbids correction, retry, or variant after any gate failure, so the Carcara build was not entered.

## Sequential gate results

| Gate | Attempts | Result | Evidence |
|---|---:|---|---|
| Corrected relay compile | 1/1 | PASS | exit 0; 448.571 ms; 259,735 B; SHA-256 `78978515A5F2A14F733A4B689272438336075B3876A878F1DB66B7341B418E8C` |
| POSIX relay smoke | 1/1 harness; 0 native invocations | FAILED_CLOSED | PowerShell parser error before `ProcessStartInfo`; no `sh.exe`, relay, GCC, or loader process started |
| Carcara clean locked offline build | 0/1 | NOT ENTERED | upstream gate failed |
| Version/help/checker smoke | 0 | NOT ENTERED | build not run |

## Boundaries

- Network bytes: `0`.
- Carcara source/cache were not copied into this assignment because the build gate was never reached.
- Claim-bearing observation: `false`.
- PRE_CLAIM_CONTRACT_FIDELITY_GATE: `NOT_ENTERED`.
- Scientific revision consumed: `false`.
- Stage B: `false`.
- System/user environment, global PATH, registry, services, WSL: unchanged.
- Scientific PASS/STOP inference: prohibited and not made.

## Evidence ceiling

`RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.

