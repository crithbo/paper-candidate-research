# Validation report

## Scope

The package validator checks:

- every mandatory Stage A/reserve delivery file exists;
- frozen original, scope-correction, PRIMARY handoff/manifest and confirmation handoff/manifest hashes still match;
- all seven acquired primary-source records match their frozen byte counts and SHA-256 values;
- the pre-claim gate, reserve decision, no-observation/no-revision fields, Stage B prohibition and idle lane state agree across the contract, results, report and handoff;
- the final hash manifest has exact membership and every listed digest matches.

## Expected scientific boundary

- Claim-bearing observation: `false`
- Scientific revision consumed: `false`
- Stage B authorized: `false`
- Decision: `RESERVE_RECOMMENDED_WITH_USER_RESEARCH_REQUEST`
- Lane: `IDLE_REUSABLE_AWAITING_MAINLINE`

## Command

```powershell
& 'C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' .\scripts\validate_package.py
```

Final acceptance requires exit code 0, `checks_passed: true`, `failure_count: 0`, and no mutation after manifest generation.
