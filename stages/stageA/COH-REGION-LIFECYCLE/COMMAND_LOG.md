# COH-REGION-LIFECYCLE Stage A Command Log

All writes were confined to `D:\project\writing\reserch\stages\stageA\COH-REGION-LIFECYCLE`. No shared project, upstream report, or registry file was written.

## Read-only source and environment checks

```powershell
gh api repos/utcs-scea/altis/commits/master --jq .sha
# 042e2926d1fe9a5ea5b3e2d659b75bf925b152cc

gh api 'repos/utcs-scea/altis/contents/src/cuda/level1/pathfinder/pathfinder.cu?ref=042e2926d1fe9a5ea5b3e2d659b75bf925b152cc'
# blob 2b90097be5dc424f56a76af5edbd6ab672029e0b, 20192 bytes

gh api 'repos/utcs-scea/altis/contents/src/cuda/level1/bfs/bfs.cu?ref=042e2926d1fe9a5ea5b3e2d659b75bf925b152cc'
# blob cee59c090f810ce3c485cdb3a611e5d1c692f9c4, 37196 bytes

gh api 'repos/utcs-scea/altis/contents/data/bfs/bfs_65536?ref=042e2926d1fe9a5ea5b3e2d659b75bf925b152cc'
# blob 66b114a7caf3fb10eeaae56b3f9734f226e4c6e5, 3166677 bytes

nvidia-smi --query-gpu=name,driver_version,memory.total,compute_cap --format=csv,noheader
# NVIDIA GeForce RTX 4070 Laptop GPU, 591.74, 8188 MiB, 8.9

python --version
# command not found; no system Python alias

nvcc --version
# command not found; no local CUDA compiler

& 'C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' --version
# Python 3.12.13
```

Network note: unauthenticated `git ls-remote` failed with Windows Schannel credential acquisition. Read-only GitHub API access succeeded; no repository was cloned or downloaded.

## Frozen canonical commands

Working directory:

```text
D:\project\writing\reserch\stages\stageA\COH-REGION-LIFECYCLE
```

Run 1:

```powershell
& 'C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' '.\PROBE_SCRIPT.py' --inputs '.\LOCKED_INPUTS.json' --output '.\results\run1'
```

- Preflight execution: exit 0, but post-run inspection found the reporting-only `distinct_mixed_plans` counter was always zero. This output was invalidated.
- Correction: changed only the mixed-plan distinct-count predicate; formulas, input grid, gate, and output schema were unchanged.
- Canonical rerun: exit 0, 0.52 s observed process duration, no stderr.

Run 2:

```powershell
& 'C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' '.\PROBE_SCRIPT.py' --inputs '.\LOCKED_INPUTS.json' --output '.\results\run2'
```

- Exit 0, 0.52 s observed process duration, no stderr.

Validate hashes:

```powershell
Get-FileHash -Algorithm SHA256 '.\results\run1\summary.json','.\results\run2\summary.json','.\results\run1\grid.csv','.\results\run2\grid.csv'
```

Validate invariants:

```powershell
& 'C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' '.\VALIDATE_SCRIPT.py'
```

- Exit 0; 11/11 mechanical checks passed; `verification_status: VERIFIED`.

## Non-executed commands

- No GH200, CUDA benchmark binary, GPU kernel, Nsight, hardware counter, PTE/fault measurement, large download, EDA tool, or Stage B experiment was run.
- No system/driver mode was changed.
- No exclusive hardware reservation was made.
