# ROCKSDB-DICT-COVER Resume3 command log

- Assignment: `RESOURCE-STAGEA-L3-20260811-ROCKSDB-DICT-COVER-RESUME3-R3B`
- Authorization: `ROCKSDB-NVD-OFFICIAL-API-RECOVERY-20260811-R3B`
- Working root: `<LEGACY_LOCAL_PROJECT_ROOT>`
- Unique write directory: `<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\ROCKSDB-DICT-COVER\resume3`
- Stage B: `false`

## Intake and continuity

1. Read the complete frozen `AGENTS.md`, `plan.md`, `registry.yaml`, `ROLE_CANDIDATE_OWNER.md`, academic-research-suite router and experiment-agent execution/reproducibility materials.
2. Read resume2 report, blocker, contract, command log, asset manifest, acquisition/recomputation records, handoff and hash manifest; read the inherited Stage A contract/report/comparator and applicable templates.
3. Recomputed control hashes: 4/4 PASS.
4. Recomputed immutable package manifests: initial 25/25 PASS, resume1 19/19 PASS, resume2 23/23 PASS.
5. Confirmed no inherited claim-bearing observation and no consumed scientific revision.

## Official-source contract audit

Official NVD documentation checked on 2026-08-11 specifies CVE API 2.0 pagination by `startIndex`, maximum/default `resultsPerPage=2000`, a maximum 120-consecutive-day date range, 5 requests per rolling 30 seconds without an API key, and recommended six-second sleeps. This run freezes 6.2 seconds between starts and enforces both the per-request spacing and rolling-window cap. Official PyPI documentation confirms the project route `GET /pypi/<project>/json`; the inherited project-level endpoints remain unchanged and are frozen by exact response bytes, SHA-256, timestamp and headers.

## Pre-network code freeze

- Resource contract SHA-256: `3485A83E82DC906A754B580EF3158750D5F5340F99B71473976F162356BD3D39`
- NVD API route script SHA-256: `5843B2366FEA978AD34A8F9D70A817FEDD537B91037EA8A0E7D95B7B1CB416F9`
- NVD range fallback script SHA-256: `DEC51DB2ABAAE6ECD65C65C96FBBC0773C8D182F9565FAB8E9A2B2B4C4E51D35`
- PyPI route script SHA-256: `E4A923FC3E7571170BB92D217EDD4DF0A414BE57B7FC963AD1CA5A06AA9FB384`
- Resource smoke/manifest script SHA-256: `D70BD6ED4D025AD33C24EF37BE3F9EE8ED64FE0F6F30BD567A2EA58B2FBF3BF9`
- AST parse: 6/6 PASS.
- Runtime: bundled Python 3.12.13; fallback client: curl 8.21.0 Schannel.
- Topic bytes at freeze: `1,370,958,174`; limit `6,442,450,944`.

Authorized first resource command (not a scientific experiment):

`<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe scripts\acquire_nvd_api.py`

No RocksDB, Zstd trainer, candidate, comparator, SST or Stage B command is permitted until the resource gate and then PRE_CLAIM_CONTRACT_FIDELITY_GATE pass.

## Route 1 result

The official API route started once and made one request for the first 2019 120-day window. HTTP declared `Content-Length=7,654,053`; EOF arrived at `7,636,388` bytes, short by `17,665`. The inadmissible partial SHA-256 is `767A0BB42E06DD196BF2F73A06243F2F10CC643957A63950F46B50A7E136EFC5`. The route terminated with `COMPLETE_TRANSFER_OR_SCHEMA_OBSTRUCTION`; no automatic retry, parity result, 2023/2024 acquisition, or scientific observation occurred.

## Route 2 result

The triggered stable-ETag curl/Range route started once. Its first official request returned no body because curl/Schannel failed with `SEC_E_NO_CREDENTIALS (0x8009030e)`. The route terminated as `MECHANICAL_TRANSFER_FAILURE`; no annual-feed byte was obtained.

## Route 4 trigger and code freeze

Route 2's mechanical TLS failure unlocked the final NVD alternate route. Windows `BitsTransfer` 2.0.0.0 and `Start-BitsTransfer` with `CustomHeaders` are present. Before Route 4 network access, an official HEAD + exact `Content-Length`/ETag probe and BITS `If-Match` full-transfer implementation was frozen:

- `scripts/acquire_nvd_bits.py`: `B3BF7F3B4801919360CA6E1F9E6C8FA466DD98E0EA60E1303E817CC67929B0C6`
- `scripts/download_bits.ps1`: `8F6AE39D702C53597DDF3918165C4350929936C2B729179B7B2F5336295CCBE0`
- Python AST and PowerShell parser: PASS.

## Route 4 result and stop boundary

The official HEAD for the 2023 annual feed succeeded at `2026-08-11T08:45:36Z` and reported `Content-Length=20,145,900`, `ETag="80e993256129dd1:0"`, and `Last-Modified=Tue, 11 Aug 2026 07:15:11 GMT`. The immediately following BITS `If-Match` transfer failed synchronously before a body file was created: `Start-BitsTransfer` raised `System.NullReferenceException`. A read-only BITS job listing then returned `E_ACCESSDENIED`; no download body or confirmed live job exists.

All three approved routes capable of closing the blocking NVD asset are therefore exhausted. Route 3 (ten PyPI responses) stayed locked because its frozen precondition, closed NVD 2023–2024 assets, is false; it is not an alternative NVD recovery route. Resource PASS is false. Unmodified converter smoke, 20-manifest closure, PRE_CLAIM_CONTRACT_FIDELITY_GATE, RocksDB, Zstd, candidate, baselines, SST, equality, full-cost and p50/p90 were not started.

## Packaging commands

After reports and handoff are frozen, the canonical manifest is built and verified with:

`<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe scripts\build_hash_manifest.py`

`<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe scripts\verify_hash_manifest.py`
