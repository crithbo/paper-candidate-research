# Reproduction Entry

Prerequisites: Windows x86-64, the frozen corpus already present under `work/repos`, Python 3.12, and the included MinGit 2.55 toolchain. The scripts fail closed if the Git version, source tables, zlib version, manifest hashes or immutable output labels differ.

Core commands:

```powershell
$PYTHON='C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe'
$GIT=(Resolve-Path 'tools\mingit-2.55.0\cmd\git.exe')
& $PYTHON scripts\validate_git_delta_parity.py --root . --git $GIT --limit 40
& $PYTHON scripts\preflight_rss.py --root .
& $PYTHON scripts\run_pilot.py --root . --git $GIT --native --run-label <new-immutable-label>
& $PYTHON scripts\aggregate_results.py
```

Do not reuse an existing run label. `aggregate_results.py` intentionally reads only the frozen claim-bearing labels listed in its source. Reproduction with a new label must be audited before changing those labels; changing them would create a new analysis artifact, not overwrite this package.

The original final raw data are `results/codec-final-initial`, `results/codec-final-replay`, `work/codec-final-initial` and `work/codec-final-replay`.
