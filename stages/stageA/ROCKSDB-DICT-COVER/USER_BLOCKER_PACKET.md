# ROCKSDB-DICT-COVER User Blocker Packet

- Stage and assignment: `Stage A / STAGEA-L1-20260809-ROCKSDB-DICT-COVER-INITIAL`
- Status: `BLOCKED_USER_ACTION_REQUIRED`
- Blocker kind: `DOWNLOAD / NETWORK / DATA`
- Exact failure and timestamp: at approximately `2026-08-09T19:08:02+08:00`, the official NVD 2017 feed GET declared `Content-Length: 7,706,425` but reached EOF at `7,686,831` bytes; Python raised the explicit contract error `short download ... observed=7686831 expected=7706425` and exited `1`.
- Claim-bearing observation obtained before failure: `no`
- Scientific inference allowed: `none`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Scientific revision consumed: `no`
- Immutable failure directory: `D:\project\writing\reserch\stages\stageA\ROCKSDB-DICT-COVER`
- Incomplete file: `inputs/raw/nvd-2017.json.gz`, SHA-256 `972E334A0D7B2B8F97B95A7ACD4DEB7ED4F8F370F41ED88DE244F015ECD82E32`; it is permanently marked inadmissible.

## Exact resource needed

- Name/version/commit: official NVD CVE JSON 2.0 annual feeds `2017` through `2024`, plus the 10 frozen PyPI JSON API responses listed in `EXPERIMENT_CONTRACT.yaml`. The first blocking asset is `nvdcve-2.0-2017.json.gz` from `https://nvd.nist.gov/feeds/json/cve/2.0/nvdcve-2.0-2017.json.gz`.
- Expected size and SHA-256/signature: the blocking GET advertised exactly `7,706,425` bytes. NVD did not provide a frozen SHA-256 in the observed headers, so the complete asset's SHA-256 must be computed after a byte-complete acquisition; the existing `7,686,831`-byte partial is not acceptable.
- Required files or capabilities: a reliable HTTPS path that returns every byte, or user-provided byte-complete official assets with URL/date/provenance. Each gzip must decompress and parse as NVD JSON 2.0; each PyPI response must parse as the official package JSON schema.
- License/ownership constraints: only the named official NIST NVD and PyPI endpoints are acceptable. The package list is frozen; no replacement corpus or favorable source substitution is allowed.
- Accepted alternative forms: (a) restore a reliable HTTPS route and authorize mainline to resume the exact contract in a new directory; or (b) provide the complete named raw files with a provenance note and hashes. A mirror is acceptable only if byte identity to the official asset is independently established.

## Minimum user action

- Provide, approve, or place a complete `nvdcve-2.0-2017.json.gz` and a reliable route for the remaining frozen sources, or notify mainline that HTTPS truncation is resolved.
- Handoff method: mainline should create a **new** resume assignment rooted at `stages\stageA\ROCKSDB-DICT-COVER\resume1\`; do not overwrite this failure record.
- Safe read-only verification for the first asset: verify file length is `7,706,425`, compute SHA-256, open it with gzip, parse JSON, and confirm the top-level `vulnerabilities` array is present. The full hash becomes part of the resume freeze.

## Resume contract

- Frozen contract: `EXPERIMENT_CONTRACT.yaml` (exact SHA-256 recorded in `handoff.yaml`).
- New resume directory: `D:\project\writing\reserch\stages\stageA\ROCKSDB-DICT-COVER\resume1` or another mainline-issued clean resume subdirectory; never overwrite the initial failure package.
- First command after unblocking: a read-only asset size/hash/gzip/JSON validation, followed by a clean invocation of the same hashed converter; no candidate or baseline runs until all 20 manifest hashes are frozen.
- Resource ceiling: unchanged `<=4 GiB workspace`, `<=4 CPU-hours`, no GPU, no exclusive device, no formal large-scale experiment.

## Work already performed and cost

- Network/storage: official source clones, three verified portable tool archives, two complete NVD feeds, and one partial feed. Workspace at blocker capture: `1,286,089,846` bytes.
- CPU/device: two-thread Release compilation of pinned Zstd and pristine RocksDB completed; conservative compile/preparation use remained far below `4 CPU-hours`. No GPU or exclusive device was used. Host-wide peak RAM could not be queried and is not guessed.
- Explicitly not executed: candidate implementation; current/raw/prefix/reservoir/stratified/grid runs; bottommost compaction; SST creation; trainer invocation on natural data; dictionary/match tracing; checksums/full scans; timing/RSS/read costs; p50/p90 analysis; PASS/STOP inference.

