# Reproduce

The canonical result directory is immutable after handoff. Replay these commands in an isolated copy of `resume1`; the PowerShell scripts intentionally pin `$ResumeRoot` and must be adjusted only to that copy's absolute path, without changing commit, target, inputs, arms or bounds.

```powershell
$Python = '<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe'
& $Python scripts\zcmp_frontier_planner.py selftest --max-w 4 --out runs\replay\tiny_oracle.json
powershell -NoProfile -ExecutionPolicy Bypass -File scripts\make_pregreedy_modules.ps1
& $Python scripts\screen_natural_mir.py --input-dir runs\natural\pregreedy_modules --eligible-dir runs\replay\eligible --out runs\replay\CANONICAL_ELIGIBILITY.json --max-w 4 --module-manifest runs\natural\modules\MODULE_FREEZE.json
powershell -NoProfile -ExecutionPolicy Bypass -File scripts\prepare_eligible_single_function.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File scripts\run_natural_pilot.ps1
& $Python scripts\analyze_natural_pilot.py
```

Expected decisive values:

- exact LLVM commit: `ba5bccfe01368f76e74d6ff4c35f1330e155b4ba`;
- canonical screen: 23 modules, 273 functions, 5 initial eligible;
- exact single-function retained denominator: 4;
- native candidate/current-union pass: 11/11 and 72/72;
- useful residual: 0/4;
- paired text/frame p50 and p90: all zero;
- `ANALYSIS.json` SHA-256: `00AB57FFA1FE76F924CAB26F3E5CF5A0C1F936802DBEBB7E1871CD1CF8AEAE87`.

To verify the frozen package without rerunning experiments, recompute every line of `HASH_MANIFEST.sha256` and require 53/53 matches (54/54 after this reproduction file is included in the final manifest).
