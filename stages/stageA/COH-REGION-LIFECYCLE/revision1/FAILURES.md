# Failure and anomaly record

## Research execution

- Probe crashes: none.
- Automatic retries: none.
- Timeout/stall/resource anomaly: none.
- Result mismatch: none.
- Negative scientific result: the fair same-information selector absorbs the candidate on all 6,912 diagnostic rows; strict candidate-only residual count is zero.

## Intake and diagnostic anomalies

1. The handoff was initially probed as `HANDOFF.md`; the frozen package uses `handoff.yaml`. The actual file was resolved before hash acceptance, and its hash matched all authoritative records. No experiment ran before resolution.
2. The first bulk minimum-entry read was truncated and rendered Chinese with the wrong default encoding. Every required file was then re-read in UTF-8 and in bounded complete chunks through EOF before task action.
3. Read-only `Get-CimInstance` environment inventory returned access denied. It was not retried. .NET runtime properties supplied the non-sensitive OS/process facts needed for replay documentation.
4. Optional YAML parser lint was unavailable because the bundled Python runtime does not contain `PyYAML` (`ModuleNotFoundError: yaml`). No package was installed and no network retry was attempted. Python AST and all JSON artifacts parse successfully; YAML files contain no tab indentation and are covered by the final byte hashes.

None of these anomalies changed the contract, formulas, threshold, object, program, action set, or result.
