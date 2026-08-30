# S6-JS-PREFIXBOUND Command Log

All commands ran from `D:\project\writing\reserch\stages\stageA\S6-JS-PREFIXBOUND`. No E-drive path was used.

## Environment and locked input

1. Resolved bundled Python: `C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe`.
2. Read-only pinned commit query: `git ls-remote https://github.com/gregrahn/join-order-benchmark.git refs/heads/master` → `a39603662e023e449cb2121997a5034df9e02ebf`.
3. After `EXPERIMENT_CONTRACT.yaml` was frozen:

   ```powershell
   Invoke-WebRequest -UseBasicParsing -Uri 'https://raw.githubusercontent.com/gregrahn/join-order-benchmark/a39603662e023e449cb2121997a5034df9e02ebf/4a.sql' -OutFile 'inputs\JOB_4a.sql'
   ```

   Result: exit 0; 450 bytes; SHA-256 `C80E515F37A633ADCA3AB45BBD5CBA20E760C80A71D7841B51E64154B1008065`. The sandboxed attempt failed with a TLS receive error; the approved network retry succeeded.

## Build and primary run

```powershell
& 'C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' -m py_compile run_probe.py validate_results.py
& 'C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' run_probe.py --contract EXPERIMENT_CONTRACT.yaml --output artifacts/probe_results.json
```

- Syntax check: exit 0.
- Primary probe: exit 0.
- Wall/CPU/peak memory: 224.914 s / 221.922 s / 2,189,819 B.
- Verdict emitted by executable: `NOT_FALSIFIED_WITH_PRELIMINARY_SUPPORT`.

## Reproducibility replay

Exact replay command:

```powershell
& 'C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' run_probe.py --contract EXPERIMENT_CONTRACT.yaml --output artifacts/replay_results.json
```

- Attempt 1: exit 1 after approximately 135 s, no stdout/stderr, no output file, no residual Python process. This failure was reported and not hidden.
- Controlled attempt 2: exit 0; wall/CPU/peak memory 274.631 s / 270.703 s / 2,189,819 B; scientific verdict matched the primary run.

Validation command:

```powershell
& 'C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' validate_results.py artifacts/probe_results.json artifacts/replay_results.json
```

Result: exit 0; `deterministic_fields_exact_match: true`. Only wall time, process CPU time, and peak `tracemalloc` were ignored as preregistered volatile fields.

## Monitoring

- Universal checks: process alive and CPU growth were inspected during both completed long runs.
- Hard timeout: 1,800 s per contract; not reached.
- No GPU process, shared project mutation, large download, participant data, proprietary tool, or Stage B command was used.

