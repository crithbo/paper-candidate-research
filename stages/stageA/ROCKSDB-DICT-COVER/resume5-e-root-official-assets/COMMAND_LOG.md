# ROCKSDB-DICT-COVER resume5 command log

## Scope

- Assignment: `STAGEA-L2-20260825-ROCKSDB-DICT-COVER-RESUME5-E-ROOT-OFFICIAL-ASSETS`
- Initial context SHA-256: `702F888EC2F0B5C3C7D7529A14D5D6CD1D378E1E3B49D53608C1470ECDF8E631`
- Bootstrap ACK accepted SHA-256: `E05A1B7BF669F4B1B10E86F40F79DF8BEEF873E8C02507B503FD140139D522B2`
- Expansion addendum SHA-256: `2441B0DDC597E829E9FAA5175D6E3EA49C93D4C0AD9FB1516E84CDEBA3044C7C`
- Expansion ACK SHA-256: `11D0A687E55A2FB90DE76C3CE231637CFB932955291583228F0901A6DEE62DC6`
- Claim/evidence ceiling: resource validation only; no scientific inference.

## Redirect and containment preflight

The owner created the eight standard resource directories under the exact frozen resource root. The root and its descendants had zero reparse points at preflight and final validation.

Each resource-producing process set only process-local values:

```text
TEMP=resources/tmp
TMP=resources/tmp
TMPDIR=resources/tmp
PYTHONPYCACHEPREFIX=resources/cache/pycache
PYTHONNOUSERSITE=1
PIP_CACHE_DIR=resources/cache/pip
DOTNET_CLI_HOME=resources/cache/dotnet-home
NUGET_PACKAGES=resources/cache/nuget
```

Bundled Python: `<LOCAL_USER_HOME>/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe`, version `3.12.13`. A temporary-file preflight created `resources/tmp/redirect-preflight-azcj08pc.tmp`, confirming that the launched process resolved its temp path under the resource root.

No WSL, system installation, global PATH/environment/registry change, TLS/access bypass, unofficial mirror, or cross-topic write occurred.

## Frozen converter

The E-root frozen converter source and assignment-local copy both hashed to:

`E93D8D7A7AB47B2A65751064F5114FCD9E919813F2A7F810123FDCAF7FD7E244`

Copy destination: `resources/src/prepare_manifests.py`.

## Executed resource-only commands

All Python invocations used `-B` and the process-local redirect map above.

1. Static AST parse of `resources/src/acquire_official_assets.py` followed by exactly one execution:

   `python.exe -B resources/src/acquire_official_assets.py`

   Helper SHA-256: `7E3F7F0FE49298273FB7A22BBAC701777513F93ED83103F20930F58AF0B18B5E`.
   Result: 12 attempts, 12 complete, 0 failed, 0 retries, 0 followed redirects, 67,013,806 response-body bytes.

2. Static AST parse of `resources/src/validate_and_build_manifests.py` followed by exactly one execution:

   `python.exe -B resources/src/validate_and_build_manifests.py`

   Helper SHA-256: `4E44555D180FC212F06F6B7BE05371F0FF1385D6F86D2DB05553B2B447FF12C9`.
   Result: 12/12 asset validation and converter read smoke passed; the frozen converter denominator exposed the bounded 12/20 manifest gap.

3. After MAINLINE issued and authorized the expansion addendum, static AST parse of `resources/src/acquire_nvd_expansion.py` followed by exactly one execution:

   `python.exe -B resources/src/acquire_nvd_expansion.py`

   Helper SHA-256: `BF535FB1762E2DE98BFDD022BC45207BE813DD46E3CA9FE8A02EEF74F1C08D6C`.
   Result: 8 added attempts, 8 complete, 0 failed, 0 retries, 0 followed redirects, 84,645,559 added response-body bytes.

4. Static AST parse of `resources/src/validate_expansion_and_close_manifests.py` followed by exactly one execution:

   `python.exe -B resources/src/validate_expansion_and_close_manifests.py`

   Helper SHA-256: `B41F25424A94A54DC17CEC98A877C98EC6BA366691986F72A369B459248A5AEA`.
   Result: NVD 2015–2024 gzip/JSON/schema/year identity passed, all 10 PyPI identity checks remained accepted, converter read smoke passed 20/20, and final manifest closure passed 20/20.

## Budget and attempt accounting

- Total official assets: `20/20 complete`.
- Attempts: `20/20`, exactly one per asset.
- Retries: `0`.
- Followed redirects: `0`.
- Response-body network bytes: `151,659,365 / 1,073,741,824`.
- Resource-root logical bytes before handoff: `213,840,717 / 4,294,967,296`.
- Measured process CPU: `71.578125 / 7200 seconds` across the four primary commands.
- Measured primary-command wall time: `1717.376 seconds`; first request to final validation elapsed time: `2295.275 / 14400 seconds`.
- Other short preflight, hashing, and report-generation CPU/wall telemetry was not provided as one exact aggregate and is not estimated.

## Explicitly not executed

- RocksDB, Zstd, candidate, comparator, baseline, SST creation, PRE_CLAIM gate, claim-bearing experiment, scientific PASS/STOP/RESERVE, state transition, Stage B, or cleanup.

## Cleanup visibility note

Owner-side `Win32_Process` command-line enumeration was denied by the OS. A generic bundled Python process was visible but could not be attributed from permitted telemetry. No owner-launched acquisition or validation session remained open. MAINLINE must independently satisfy its zero-active-process gate before deleting any proposed leaf. The owner performed no deletion.
