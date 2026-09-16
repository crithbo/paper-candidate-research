# ROCKSDB-DICT-COVER Resource Unblock Report

## Material Passport

- Origin Skill: academic-research-suite / experiment-agent
- Origin Mode: validate
- Origin Date: 2026-08-10
- Verification Status: ANALYZED
- Version Label: resource_unblock_v1

## Outcome

- Assignment: `RESOURCE-UNBLOCK-L2-20260810-ROCKSDB-R1`
- Authorization: `UNBLOCK-AUTH-20260810-R1`
- Disposition: `BLOCKED_USER_ACTION_REQUIRED`
- `resource_ready: false`
- `claim_bearing: false`
- `scientific_revision: false`
- `stageB: false`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`

The 20-member frozen natural-manifest population did **not** close. Four raw assets are byte-complete and locally readable; the official NVD 2019 asset exhausted its three clean attempts before any body byte was retained. No later source was attempted after that atomic blocker.

## Frozen input continuity

The accepted initial package recomputed `25/25 PASS`. Its key hashes matched the registry and handoff:

- Contract: `8B578D63EE6DC515DB60E6D5A7D29AECEE35EAFF816AF7D800888C9746CEDC70`
- Blocker packet: `CFDC394809DCEDCAA36E6EE655FF64C10CD7AE420F6A98CC97B7382002ECDA09`
- Initial handoff: `B33826868E661C0229FD9C2170892F8F436C2C68EBE370012774D9D75B1FACD0`
- Initial manifest: `7DF818674F8458A23340495C9B6F3B8B13C870F36A66DE563662D65E864BCF45`
- Frozen converter: `E93D8D7A7AB47B2A65751064F5114FCD9E919813F2A7F810123FDCAF7FD7E244`

The inadmissible old NVD 2017 partial was neither copied nor concatenated. NVD 2015/2016 were copied only after their complete accepted bytes and SHA-256 values revalidated.

## Asset closure

| Asset | Provenance | Content-Length / bytes | SHA-256 | Readability |
|---|---|---:|---|---|
| NVD 2015 | accepted initial complete asset | 4,190,045 / 4,190,045 | `36D62C93A5F15ACDCBA69513F3CA86D44A35E10ACD44258E5A49AFE1EB24B0C0` | gzip + NVD JSON 2.0 PASS |
| NVD 2016 | accepted initial complete asset | 5,159,096 / 5,159,096 | `E3A4B0B68C30065FB24417DDF1240E8149B3F99F433F4A262B776090A24E930F` | gzip + NVD JSON 2.0 PASS |
| NVD 2017 | direct official HTTPS | 7,706,425 / 7,706,425 | `F3569A60D9AD55B6F076ADF6DF74F67BBAE93A88AFD97D31C5A8BC1E4B4FB894` | full gzip stream; 17,104 CVEs; schema PASS |
| NVD 2018 | direct official HTTPS | 8,264,377 / 8,264,377 | `6508FA9EB5E45767E3120B5D4A135799C593281D717491BBB94E715F9CF89B31` | full gzip stream; 17,817 CVEs; schema PASS |
| NVD 2019 | official URL only | no body | unavailable | BLOCKED after 3 clean attempts |
| NVD 2020–2024 | frozen official URLs | not started | unavailable | not started after blocker |
| 10 PyPI JSON assets | frozen official URLs | not started | unavailable | not started after blocker |

The authoritative row-level inventory is `SOURCE_ASSET_MANIFEST.tsv`.

## New blocker

Target URL:

`https://nvd.nist.gov/feeds/json/cve/2.0/nvdcve-2.0-2019.json.gz`

Attempts 1 and 2 opened a new zero-byte temporary target but the Python process was externally terminated before an HTTP body or exception record existed. They are recorded only as resource-attempt failures; no source behavior is inferred. Attempt 3 used curl 8.21.0 with Schannel and failed before HTTP with:

`curl: (35) schannel: AcquireCredentialsHandle failed: SEC_E_NO_CREDENTIALS (0x8009030e)`

`HTTP_CODE=000`, `SIZE_DOWNLOAD=0`. The three-attempt ceiling is exhausted. No Range request, mirror, old partial, corpus substitution, or fourth attempt was used.

## Converter and toolchain smoke

The frozen converter hash was checked before both resource commands. Its manifest-construction/readability smoke was **not started** because the raw population did not close; this prevents a partial 4-member population from being misreported as the frozen 20-member corpus. RocksDB, Zstd, SST creation, trainers, candidates, baselines, and natural claim-bearing runs were never invoked.

Resume1 canonical manifest status is `0/20`; the initial accepted package still contains the two earlier canonical manifests, but that does not close the required 20-member population.

## Resource cost

- Official response-body bytes retained or observed: `15,970,802 / 1,073,741,824` (`1.487%` of the network ceiling).
- Network attempts: `5` total response attempts: NVD 2017 PASS, NVD 2018 PASS, and three NVD 2019 failures. Reused NVD 2015/2016 cost zero network bytes.
- Resume directory before report finalization: `25,353,443` bytes.
- Topic directory before report finalization: `1,311,494,653` bytes, below 4 GiB.
- Acquisition wall window with persisted timestamps: NVD 2017/2018 from `2026-08-10T06:33:34Z` through `06:37:31Z`; the two abrupt NVD 2019 attempts and final 0.412-second curl failure followed.
- Exact CPU accounting was not recoverable after the two abrupt process terminations. No compilation, trainer, SST, benchmark, GPU, or exclusive-device work occurred; the executed path was download, gzip/JSON parsing, hashing, and local finalization only, well inside the 4 CPU-hour authorization.

## Scientific boundary

There is no candidate, baseline, compression, equality, full-cost, residual, PASS, STOP, reserve, or archive observation. The scientific state remains unchanged and no scientific revision is consumed.

## Required next action

See `USER_BLOCKER_PACKET.md`. Mainline should not continue Stage A from this directory. A later user-unblocked assignment must preserve this record and re-enter at the NVD 2019 asset gate.

