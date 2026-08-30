# ROCKSDB-DICT-COVER Resume3 routes exhausted

- Assignment: `RESOURCE-STAGEA-L3-20260811-ROCKSDB-DICT-COVER-RESUME3-R3B`
- Authorization: `ROCKSDB-NVD-OFFICIAL-API-RECOVERY-20260811-R3B`
- Conclusion scope: resource mechanics only
- Claim-bearing observation: `false`
- Scientific revision consumed: `false`

| Frozen route | Trigger | Started | Terminal result | Response body bytes | Mechanical evidence |
|---|---|---:|---|---:|---|
| Route 1: official NVD CVE API 2.0 | always first | yes | `COMPLETE_TRANSFER_OR_SCHEMA_OBSTRUCTION` | 7,636,388 | first 2019 page declared 7,654,053 bytes and ended 17,665 bytes short; partial SHA-256 `767A0BB42E06DD196BF2F73A06243F2F10CC643957A63950F46B50A7E136EFC5` |
| Route 2: curl stable-ETag HTTP Range | Route 1 obstruction | yes | `MECHANICAL_TRANSFER_FAILURE` | 0 | curl/Schannel `SEC_E_NO_CREDENTIALS (0x8009030e)` before body |
| Route 4: official HEAD + BITS `If-Match` | Route 2 mechanical failure | yes | `MECHANICAL_TRANSFER_FAILURE` | 0 | official HEAD passed; `Start-BitsTransfer` raised `System.NullReferenceException` before body |
| Route 3: ten official PyPI project JSON responses | NVD 2023–2024 closed | no | `LOCKED_PRECONDITION_FALSE` | 0 | not a substitute for the blocking NVD asset; starting it would violate the frozen route order |

All approved routes applicable to the blocking NVD asset are exhausted (`3/3`). The global ceiling was respected (`3/4` high-level attempts started). The unused fourth slot is the conditionally ordered PyPI batch, not an additional NVD recovery method.

The latest successfully observed official 2023 HEAD at `2026-08-11T08:45:36Z` was:

- URL: `https://nvd.nist.gov/feeds/json/cve/2.0/nvdcve-2.0-2023.json.gz`
- `Content-Length`: `20,145,900`
- `ETag`: `"80e993256129dd1:0"`
- `Last-Modified`: `Tue, 11 Aug 2026 07:15:11 GMT`

These headers are provenance facts, not a closed asset. Annual feeds are mutable; a future supplied file must be validated against its own acquisition-time official headers and full SHA-256/gzip/JSON checks.

Disposition requested from mainline: retain Stage A as `BLOCKED_USER_ACTION_REQUIRED`, preserve this immutable resume package, release the lane, and do not infer scientific PASS/STOP/reserve/archive. The candidate owner does not invoke the separately registered reserve fallback.
