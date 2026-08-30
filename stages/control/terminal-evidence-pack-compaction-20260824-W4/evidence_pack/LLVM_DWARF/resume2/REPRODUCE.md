# Reproduction guide

## Boundary

Reproduction is restricted to this resume2 package, the exact read-only resume1 assets named in `RESUME1_EVIDENCE_REUSE.yaml`, and the 15 bitcodes copied under `resources/src/frozen_corpus`. Do not enumerate or substitute any other corpus. Do not rerun the frozen 3,072-arm union; verify and reuse its resume1 result hash.

## Environment

Use process-local redirects before every command:

```powershell
$root = 'D:\project\writing\reserch\stages\stageA\LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY\resume2'
$env:TEMP = "$root\resources\tmp"
$env:TMP = "$root\resources\tmp"
$env:TMPDIR = "$root\resources\tmp"
$env:XDG_CACHE_HOME = "$root\resources\cache"
$env:PYTHONPYCACHEPREFIX = "$root\resources\cache\pycache"
```

Use the workspace-managed Python recorded in `RESOURCE_INVENTORY.yaml`. Exact LLVM tools and the Linux SysV runner are read-only resume1 inputs whose hashes are frozen in `RESUME1_EVIDENCE_REUSE.yaml`.

## Canonical steps

1. Verify the assignment, resume1 evidence, current-union result, natural freeze and all 15 copied bitcodes against the manifest and reuse file.
2. Treat `NATURAL_CORPUS_RESULTS.json` as the canonical run04 paired natural result. Do not reuse runs 01–03; they are retained under `resources/logs/` as invalidated non-evidence.
3. Recompute descriptive statistics only with `scripts/summarize_results.py` if audit requires it; it must not change the denominator or rerun native experiments.
4. Reproduce the sole-positive executed behavior control with `scripts/run_site02_behavior.py`. Both arms must have identical harness/linkage treatment, all 3 warmups and 30 measured runs must exit zero, and stdout/stderr must remain empty.
5. Do not interpret `SITE02_BEHAVIOR_EQUIVALENCE.json` as evidence; its byte-identity requirement was intentionally invalidated as over-strong.
6. Verify every `HASH_MANIFEST.sha256` entry line-by-line before accepting the package.

The package makes no native-cycle claim. Blinkenlights wall time is control-only and OS/app overhead unavailable from this environment must not be estimated.
