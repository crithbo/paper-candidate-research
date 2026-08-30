# O4-DYNCACHE-PGM revision command log

- Working directory: `D:\project\writing\reserch\stages\stageA\O4-DYNCACHE-PGM\revision1`
- Python: bundled runtime Python 3.12.13
- Execution: CPU only; no external baseline build, network download, GPU, or exclusive device

## Contract freeze

`REVISION_EXPERIMENT_CONTRACT.yaml` was created before probe execution.

```text
SHA256 30573F7275434C9241DB4925FC2CA74EF1130CEE256B4F921F44D31A70CD94CE
```

## Original execution

```powershell
& 'C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' revision_probe.py --mode exhaustive --output results\exhaustive.json
```

- Exit code: 0
- Result: `STOP_RECOMMENDED`

```powershell
& 'C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' revision_probe.py --mode natural --input ..\inputs\007-235-045.osc.gz --output results\natural.json
```

- Exit code: 0
- Result: `STOP_RECOMMENDED`

## Replay A

```powershell
& 'C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' revision_probe.py --mode exhaustive --output replay_a\exhaustive.json; & 'C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' revision_probe.py --mode natural --input ..\inputs\007-235-045.osc.gz --output replay_a\natural.json
```

- Exit code: 0
- Results: `STOP_RECOMMENDED`, `STOP_RECOMMENDED`

## Replay B

```powershell
& 'C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' revision_probe.py --mode exhaustive --output replay_b\exhaustive.json; & 'C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' revision_probe.py --mode natural --input ..\inputs\007-235-045.osc.gz --output replay_b\natural.json
```

- Exit code: 0
- Results: `STOP_RECOMMENDED`, `STOP_RECOMMENDED`

## Validation

```powershell
& 'C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' validate_revision.py --original results --replay-a replay_a --replay-b replay_b --output results\validation.json
```

- Exit code: 0
- Verification: `VERIFIED`
- Reproducibility: `REPRODUCIBLE`

No command crashed, timed out, was retried, or was killed.
