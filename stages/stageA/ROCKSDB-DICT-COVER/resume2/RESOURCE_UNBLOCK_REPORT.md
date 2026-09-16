## Material Passport

- Origin Skill: experiment-agent
- Origin Mode: run/validate
- Origin Date: 2026-08-11
- Verification Status: ANALYZED
- Version Label: rocksdict_resource_resume2_v1

# ROCKSDB-DICT-COVER Resume2 Resource Report

- Assignment: `RESOURCE-STAGEA-L3-20260811-ROCKSDB-DICT-COVER-RESUME2-R2BC`
- Authorizations: `RESOURCE-UNBLOCK-SMALL-BATCH-20260811-R2B` and `STAGEA-AUTO-RESUME-AFTER-RESOURCE-PASS-20260811-R2C`
- Decision: `BLOCKED_USER_ACTION_REQUIRED`
- Resource ready: `false`
- Claim-bearing observation: `false`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Scientific revision consumed: `false`
- Stage B: `false`

## Frozen resource execution

Before network access, resume2 froze the exact six NVD 2019–2024 routes and ten PyPI JSON routes, required HTTP/length/hash/time/provenance/license/gzip/JSON/schema/unmodified-converter smoke checks, byte-zero attempts, and a maximum of two clean attempts per route. Contract SHA-256 is `0B07A62F8259C2571203F83BE3B05E353D5A4F2BF7A2B6310E4060669C4571CD`; acquisition script SHA-256 is `CB3052B671751E3D012A8C764109B452B121F537BF6CE9C56792093D2B266ADA`.

Old initial and resume1 packages remained read-only and independently verified `25/25` and `19/19`. No old partial, Range request, mirror, corpus substitution, system install or global environment modification was used.

## Closed official assets

Each of these exact official assets returned HTTP 200, matched its response `Content-Length`, passed SHA-256, full gzip decompression, full JSON parsing, every-entry NVD `cve.id` schema validation, timestamp/provenance capture and the frozen NVD data-license disposition.

| Asset | Bytes | SHA-256 | CVEs | Retrieval completed UTC |
|---|---:|---|---:|---|
| nvd-2019 | 10,171,125 | `7106AD65484B53C0E400F59DFF7A350CF7A63BBB11BD8FFD37EE3435D68953E6` | 17,619 | 2026-08-11T04:58:58Z |
| nvd-2020 | 13,960,211 | `645B6399945F08FEA8693456056BEA8F1837BC973D41176014FCF99F6283C047` | 21,060 | 2026-08-11T05:01:10Z |
| nvd-2021 | 16,852,651 | `E3600406245A4626E5BEFEDA3F6E7BFCB7806F1B8BE7BF62895D55B5395AC595` | 23,437 | 2026-08-11T05:03:50Z |
| nvd-2022 | 18,333,784 | `D9568EB4A189076CE06D020C27908EDD76E3C4A40F048297D8A175AB8E826AD6` | 27,523 | 2026-08-11T05:06:49Z |

These four assets are resource facts only. Population-wide unmodified converter smoke was not started because the required 16-asset resource population did not close.

## Atomic blocker

Asset: `nvd-2023`  
Official route: `https://nvd.nist.gov/feeds/json/cve/2.0/nvdcve-2.0-2023.json.gz`

Both byte-zero clean attempts received HTTP 200 with the same official headers: `Content-Length=20,145,689`, `Last-Modified=Sat, 08 Aug 2026 07:15:10 GMT`, `ETag="013bea5527dd1:0"`.

| Attempt | Actual bytes | Short bytes | Inadmissible partial SHA-256 | Completed UTC |
|---|---:|---:|---|---|
| 1 | 20,129,232 | 16,457 | `6329532C213674958762BE1BA18123A5B520099816C4DEFC8154DBA336791B84` | 2026-08-11T05:10:01Z |
| 2 | 20,130,584 | 15,105 | `7A4689E6F9E33FCCC326A3C51EED4DC9C5E0470DBDC42A6F7B457036E56DC799` | 2026-08-11T05:14:35Z |

Both partials were hash-recorded as inadmissible and removed. The two-attempt ceiling is exhausted. The process stopped immediately; NVD 2024 and all ten PyPI routes were not started.

## Validation and cost accounting

- Resource wall window: `990 s` (`2026-08-11T04:58:05Z` to `05:14:35Z`).
- Exact response-body bytes recomputed from terminal attempt events: `99,577,587`.
- Closed-asset bytes: `59,317,771`; failed partial bytes observed then removed: `40,259,816`.
- The script's persisted budget counter is `139,837,403` because both failed partial responses were conservatively charged twice by the error path. `RESOURCE_RECOMPUTATION.json` preserves and corrects this non-scientific accounting defect without modifying the frozen script or retrying a route.
- Topic bytes after failure and before reporting: `1,370,879,188`; resume2 bytes: `59,359,449`, below 6 GiB.
- Exact process CPU was not captured and is not invented. No compiler, RocksDB, trainer, SST, benchmark, GPU or exclusive device ran.

## Scientific boundary

`RESOURCE_PASS` was not reached. Therefore the automatic Stage A continuation condition was false. PRE_CLAIM_CONTRACT_FIDELITY_GATE, production lifecycle, comparators, candidate, equality, full-cost and p50/p90 analysis were not started. This resource failure supplies no support or negative evidence about the scientific mechanism.

The actionable continuation is in `USER_BLOCKER_PACKET.md`. Resume2 is immutable after handoff; any future continuation requires a new mainline-issued resume directory.
