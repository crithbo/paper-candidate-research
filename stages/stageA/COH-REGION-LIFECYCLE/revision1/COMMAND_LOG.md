# Command and execution log

## Scope declaration

- Only this `revision1` directory was written.
- Initial candidate and gate artifacts were read-only.
- No GH200 B0–B3 hardware experiment, GPU command, CUDA tool, Nsight tool, EDA tool, large download, exclusive resource, or Stage B command was executed.

## Frozen-input preflight

PowerShell `Get-FileHash -Algorithm SHA256` was applied to the six required inputs. Candidate `HASH_MANIFEST.sha256` was mechanically checked at 17/17 entries; gate manifest was checked at 8/8. Exact results are in `INPUT_FREEZE.md`.

## Canonical replay 1

Working directory:

```text
D:\project\writing\reserch\stages\stageA\COH-REGION-LIFECYCLE\revision1
```

Command:

```powershell
& 'C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' '.\REVISION_PROBE.py' --inputs '..\LOCKED_INPUTS.json' --domain '.\SOURCE_BOUNDED_DOMAIN.json' --output '.\results\run1'
```

- Exit code: `0`
- Observed process duration: `0.473 s`
- stdout/stderr: empty
- Retry: none

## Canonical replay 2

```powershell
& 'C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' '.\REVISION_PROBE.py' --inputs '..\LOCKED_INPUTS.json' --domain '.\SOURCE_BOUNDED_DOMAIN.json' --output '.\results\run2'
```

- Exit code: `0`
- Observed process duration: `0.518 s`
- stdout/stderr: empty
- Retry: none

## Validation

```powershell
& 'C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' '.\VALIDATE_REVISION.py'
```

- Exit code: `0`
- Observed process duration: `0.334 s`
- Checks: `16/16`
- Status: `VERIFIED`

## Output identity

| Artifact | Run 1 SHA-256 | Run 2 SHA-256 | Match |
|---|---|---|---|
| `summary.json` | `FA290B1AC03F0A4E04A23F5FDCD2444CF5D0E11F68658045E716B7933E6D3D02` | same | yes |
| `selector_control.csv` | `B55C68AE647196FD1B1F45070A8E3760DF2B963A46A20F16659AD46F185017F2` | same | yes |
| `run_manifest.json` | `05151CEFC74415C826B44B12B4431049281FE44C9D9611C529AEAD3D313890E1` | same | yes |

