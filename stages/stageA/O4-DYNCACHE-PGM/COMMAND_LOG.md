# O4-DYNCACHE-PGM command log

- Working directory for all experiment commands: `<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\O4-DYNCACHE-PGM`
- Python: `<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe` (`3.12.13`)
- Per-process timestamps were not independently captured; order below is the executed session order. Exit codes and stdout are recorded verbatim in substance.

## Pre-contract input and version discovery

1. Read current OSM state with Python `urllib.request`.

   Result: `sequenceNumber=7235045`, `timestamp=2026-08-09T03:59:06Z`.

2. Read locked diff response metadata with Python `urllib.request`.

   Result: HTTP 200, `Content-Length=38400`, `Last-Modified=Sun, 09 Aug 2026 03:59:28 GMT`.

3. `git ls-remote <official-repository> HEAD` was attempted for ESA source/testbed, PGM, ALEX, and TLX.

   Result: all five failed before data transfer because the Windows Git Schannel credential provider returned `SEC_E_NO_CREDENTIALS`. No repository was cloned and no version was inferred from the failed calls.

4. Read-only GitHub REST metadata was then queried with Python `urllib.request` for each official repository's default-branch commit.

   Result: ESA source `e668899d...`, ESA bench `c3ad0ca2...`, PGM `c6fcf3d3...`, ALEX `4370da6a...`, TLX `2dd63ab8...`. Full revisions are in `BASELINE_LOCK.md` and the frozen contract.

## Contract freeze

The contract was written before any input acquisition or probe execution.

```text
Get-FileHash -Algorithm SHA256 EXPERIMENT_CONTRACT.yaml
```

Result: `E1DF8BFA3401CCE3A9A33EC47D65D243A0900C7DDA2C9566AAB1B7BFA622C953`.

## Run mode

```powershell
& '<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' acquire_osm.py --url https://planet.openstreetmap.org/replication/minute/007/235/045.osc.gz --output inputs\007-235-045.osc.gz
```

- Exit code: 0
- Output: 38,400 bytes; SHA-256 `4b09084d3f08676f152203d38ea340649c8eb34a6daf89d185baebf433ca3fe5`; XML root `osmChange`.

```powershell
& '<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' pdec_probe.py --mode exhaustive --output results\exhaustive.json
```

- Exit code: 0
- Output verdict: `NOT_FALSIFIED`.

```powershell
& '<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' pdec_probe.py --mode natural --input inputs\007-235-045.osc.gz --output results\natural.json
```

- Exit code: 0
- Output verdict: `PRELIMINARY_SUPPORT`.

## Validate mode

```powershell
& '<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' pdec_probe.py --mode exhaustive --output rerun\exhaustive.json; & '<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' pdec_probe.py --mode natural --input inputs\007-235-045.osc.gz --output rerun\natural.json
```

- Exit code: 0
- Output verdicts: `NOT_FALSIFIED`; `PRELIMINARY_SUPPORT`.

```powershell
& '<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' validate_results.py --original results --rerun rerun --output results\validation.json
```

- Exit code: 0
- Verification status: `VERIFIED`
- Reproducibility verdict: `REPRODUCIBLE`

No process crashed, timed out, was retried, or was killed. No GPU or exclusive device was used.
