# ROCKSDB-DICT-COVER Resume3 user blocker packet

- Stage and assignment: `Stage A resource gate / RESOURCE-STAGEA-L3-20260811-ROCKSDB-DICT-COVER-RESUME3-R3B`
- Status: `BLOCKED_USER_ACTION_REQUIRED`
- Blocker kind: `DOWNLOAD / NETWORK / TOOLCHAIN`
- Claim-bearing observation obtained before failure: `no`
- Scientific inference allowed: `none`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Scientific revision consumed: `no`
- Stage B: `false`
- Immutable failure directory after handoff: `D:\project\writing\reserch\stages\stageA\ROCKSDB-DICT-COVER\resume3`

## Exact blocker

1. Official NVD API 2.0 first parity page: declared `7,654,053` bytes, received `7,636,388`, short `17,665`; partial SHA-256 `767A0BB42E06DD196BF2F73A06243F2F10CC643957A63950F46B50A7E136EFC5` and inadmissible.
2. Exact annual-feed curl/Range fallback: zero body bytes; Schannel `SEC_E_NO_CREDENTIALS (0x8009030e)`.
3. Official HEAD + BITS `If-Match`: HEAD succeeded, then BITS raised `System.NullReferenceException` before a body file existed. The HEAD observed 2023 `Content-Length=20,145,900`, `ETag="80e993256129dd1:0"`, `Last-Modified=Tue, 11 Aug 2026 07:15:11 GMT` at `2026-08-11T08:45:36Z`.

## Exact resources still needed

- Byte-complete official NVD 2023 and 2024 CVE JSON 2.0 annual feeds, or a reliable official API path whose 2019–2022 ID sets and canonical CVE content match the frozen annual feeds and which then yields complete 2023–2024 data.
- The ten unchanged official project-level PyPI JSON responses for `boto3`, `botocore`, `django`, `pandas`, `numpy`, `scipy`, `tensorflow`, `torch`, `matplotlib`, and `scikit-learn`.
- Every supplied asset must include official URL, acquisition UTC, exact bytes, SHA-256, response Content-Length/ETag/Last-Modified when present, provenance, license/data disposition, full gzip/JSON/schema validation, and must pass the frozen unmodified converter read smoke.

Annual-feed headers are mutable. The 2023 size/ETag above is an observed recovery-time value, not a timeless expected hash. A future file must be validated against its own official acquisition headers.

## Minimum user action

Provide all twelve open official assets with the metadata above to mainline, or restore a reliable HTTPS/BITS environment and authorize a new immutable resume directory. Do not place files into or overwrite `resume3`. A mirror is unacceptable unless byte identity to the exact official response is independently established.

Safe read-only verification examples after mainline stages supplied files in a new directory:

- `Get-FileHash -Algorithm SHA256 <asset>`
- bundled Python full `gzip.open(...); json.load(...)` plus all-entry `cve.id` validation
- the unchanged converter at `stages\stageA\ROCKSDB-DICT-COVER\scripts\prepare_manifests.py`, hash `E93D8D7A7AB47B2A65751064F5114FCD9E919813F2A7F810123FDCAF7FD7E244`

## Approved finite recovery envelope

- Authorization: `ROCKSDB-NVD-OFFICIAL-API-RECOVERY-20260811-R3B`
- Applicable NVD routes exhausted: API 2.0, curl stable-ETag Range, BITS `If-Match` (`3/3`).
- Conditional PyPI route: unstarted and locked; it cannot solve the NVD blocker.
- Total high-level attempts: `3/4` maximum; no route was retried.
- Candidate owner reserve action: forbidden and not invoked.
- Resume entry: a mainline-issued new resume directory carrying the same scientific contract and new resource authorization.

## Work performed and cost

- Exact response-body bytes: `7,636,388`.
- Topic bytes before reporting: `1,378,614,232`, below 6 GiB.
- Claim-bearing CPU: zero; exact resource-process CPU not captured and not invented.
- Explicitly not executed: PyPI route, converter smoke, 20-manifest closure, preclaim gate, RocksDB, Zstd trainer, candidate, baselines, SST, equality, full cost, p50/p90, scientific PASS/STOP/reserve/archive and Stage B.
