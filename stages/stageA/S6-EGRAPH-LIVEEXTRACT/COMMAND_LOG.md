# S6-EGRAPH-LIVEEXTRACT Command Log

All commands ran in `<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\S6-EGRAPH-LIVEEXTRACT` unless noted. The frozen `py -3.12` command was mapped to the bundled Python 3.12.13 executable because the Windows `py` launcher had no registered runtime.

| Order | Command/action | Exit/status | Notes |
|---:|---|---|---|
| 1 | `git ls-remote https://github.com/egraphs-good/extraction-gym.git refs/heads/main` | 0 | Resolved commit `903ba0f818b50608fe20ae9e0f03c35cb27bc50a`. |
| 2 | `git clone --depth 1 --filter=blob:none --sparse ... vendor/extraction-gym` | 0 | Isolated partial clone. |
| 3 | Folder-level sparse checkout of `eggcc-bril`, `egg`, `rover` | stalled/advisory then terminated | No worktree data after >90 s; task-owned git processes and stale locks were cleaned. |
| 4 | Single-file/non-cone sparse checkout, then four lexicographic eggcc-bril files | 0 | 866,607 bytes materialized, below 5 MiB cap. |
| 5 | `py -3.12 -m unittest -v test_probe.py` | failed before execution | `py` reported no installed runtime. No test ran. |
| 6 | `...\python.exe -m unittest -v test_probe.py` | 0 | Python 3.12.13; 4/4 tests passed. |
| 7 | Initial controlled-only input lock and exploratory runs | superseded | Used to debug telemetry and public-import path; excluded from final evidence. |
| 8 | First final public run attempt | 1 | Public node id contained `:` and exposed an action-log delimiter bug before any result file was accepted. Action encoding was fixed and tests rerun. |
| 9 | `python.exe lock_inputs.py --contract EXPERIMENT_CONTRACT.yaml --output inputs/locked_instances.json` | 0 | Final lock: 401 instances; public source selected after inspecting one file. |
| 10 | `python.exe -m unittest -v test_probe.py` | 0 | Final 4/4 pass after action-log fix. |
| 11 | `python.exe probe.py --input inputs/locked_instances.json --output results/run1.json` | 0 | 401 instances; 1 controlled witness; 12.270 s; peak RSS 29,605,888 B. |
| 12 | `python.exe probe.py --input inputs/locked_instances.json --output results/run2.json` | 0 | 401 instances; 1 controlled witness; 11.536 s; peak RSS 29,458,432 B. |
| 13 | `python.exe validate.py --run1 results/run1.json --run2 results/run2.json --output results/validation.json` | 0 | `REPRODUCIBLE`; canonical SHA-256 `acdf34ff…`. |

No GPU, shared project, private data, closed solver, important device, or Stage B resource was used.
