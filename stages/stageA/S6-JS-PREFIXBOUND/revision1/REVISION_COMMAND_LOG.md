# S6-JS-PREFIXBOUND Revision Command Log

All commands ran from `<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\S6-JS-PREFIXBOUND\revision1`. No E-drive path, network access, GPU, shared-project write or Stage B action was used.

## Frozen contract

- `REVISION_EXPERIMENT_CONTRACT.yaml` frozen before runner implementation/execution.
- SHA-256: `3F0C3E5C169060E3B3CCD1281972141F93E6A78894E670CF0287B23741310EBD`.
- Input: parent `inputs/JOB_4a.sql`, 450 bytes, SHA-256 `C80E515F37A633ADCA3AB45BBD5CBA20E760C80A71D7841B51E64154B1008065`.

## Syntax check

```powershell
& '<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' -m py_compile run_revision.py validate_replay.py
```

Exit `0`.

## Primary

```powershell
& '<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' run_revision.py --contract REVISION_EXPERIMENT_CONTRACT.yaml --output artifacts\revision_primary.json
```

Exit `0`; wall `393.632 s`; executable verdict `PRELIMINARY_SUPPORT`.

## Replay

```powershell
& '<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' run_revision.py --contract REVISION_EXPERIMENT_CONTRACT.yaml --output artifacts\revision_replay.json
```

Exit `0`; wall `300.872 s`; executable verdict `PRELIMINARY_SUPPORT`.

## Validation

```powershell
& '<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' validate_replay.py artifacts\revision_primary.json artifacts\revision_replay.json --output artifacts\replay_validation.json
```

Exit `0`; `all_nonvolatile_fields_exact_match=true`. Only the six path patterns preregistered as wall/CPU/peak volatile fields were ignored; the full cost objects were not dropped.

## Resume integrity check

After a conversation interruption, the already verified contract, scripts and three JSON artifacts were read and hash-checked from disk. Because they were complete and parseable, the expensive probe was not rerun.

