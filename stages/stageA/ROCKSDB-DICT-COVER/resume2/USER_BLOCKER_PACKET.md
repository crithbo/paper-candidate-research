# ROCKSDB-DICT-COVER Resume2 User Blocker Packet

- Stage and assignment: `Stage A resource gate / RESOURCE-STAGEA-L3-20260811-ROCKSDB-DICT-COVER-RESUME2-R2BC`
- Status: `BLOCKED_USER_ACTION_REQUIRED`
- Blocker kind: `DOWNLOAD / NETWORK / DATA SHORT READ`
- Exact failure: on 2026-08-11T05:14:35Z, the second and final byte-zero GET of the official NVD 2023 feed ended at `20,130,584` bytes while HTTP declared `Content-Length: 20,145,689`; short by `15,105` bytes.
- Claim-bearing observation obtained before failure: `no`
- Scientific inference allowed: `none`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Scientific revision consumed: `no`
- Immutable failure directory: `<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\ROCKSDB-DICT-COVER\resume2`
- Stage B: `false`

## Exact resource needed

- Blocking asset: official NIST NVD CVE JSON 2.0 annual feed `nvdcve-2.0-2023.json.gz`.
- Official URL: `https://nvd.nist.gov/feeds/json/cve/2.0/nvdcve-2.0-2023.json.gz`.
- Observed official size: `20,145,689` bytes; `Last-Modified=Sat, 08 Aug 2026 07:15:10 GMT`; `ETag="013bea5527dd1:0"`.
- Complete-file SHA-256: unknown because neither official response was byte-complete; do not infer it from either partial.
- First inadmissible partial: `20,129,232` bytes, SHA-256 `6329532C213674958762BE1BA18123A5B520099816C4DEFC8154DBA336791B84`.
- Second inadmissible partial: `20,130,584` bytes, SHA-256 `7A4689E6F9E33FCCC326A3C51EED4DC9C5E0470DBDC42A6F7B457036E56DC799`.
- Required validation: exact length, SHA-256, full gzip stream, full JSON parse, nonempty `vulnerabilities`, valid `cve.id` for every entry, official URL/time/headers/provenance, and NVD attribution status.
- Still unstarted after the atomic blocker: NVD 2024 and the ten frozen PyPI JSON responses listed in `RESOURCE_CONTRACT.yaml`.

## Minimum user action

Provide one of the following to mainline:

1. A byte-complete copy fetched from the exact official NVD 2023 URL, with exact bytes, SHA-256, acquisition timestamp and provenance, plus a reliable route for NVD 2024 and the ten frozen PyPI URLs; or
2. A reliable HTTPS path capable of returning the complete exact official assets, followed by explicit mainline issuance of a new immutable resume directory.

For the least further interaction, provide all twelve still-open assets: NVD 2023–2024 and the ten frozen PyPI JSON responses. A mirror is acceptable only if byte identity to the official response is independently established. Neither recorded partial nor any Range fragment is acceptable.

## Safe continuation boundary

- Do not place new files in or overwrite `resume2`; mainline must issue `resume3` or another new immutable directory.
- A continuation may reuse the four closed NVD 2019–2022 assets only after rechecking their exact hashes and metadata.
- First action after unblocking: validate the complete NVD 2023 official asset, then close the remaining frozen resource list and run the unchanged converter read smoke.
- RocksDB, Zstd training, candidate, baselines and SST execution remain forbidden until the full resource gate passes and PRE_CLAIM_CONTRACT_FIDELITY_GATE then passes.
- Limits remain 6 GiB topic storage and 4 cumulative CPU-hours; no system install, global environment mutation, Stage B, automation or formal project.

## Work already performed and cost

- Closed in resume2: official NVD 2019–2022, `4/16` new assets.
- Exact response-body bytes: `99,577,587`; wall time `990 s`.
- Topic storage before reporting: `1,370,879,188` bytes.
- Explicitly not executed: NVD 2024, all PyPI routes, unmodified population smoke, manifest construction, RocksDB, Zstd trainer, candidate, comparator, SST, equality, full-cost, p50/p90, scientific PASS/STOP/reserve/archive, and Stage B.
