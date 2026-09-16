# ROCKSDB-DICT-COVER Resume1 User Blocker Packet

## Status

- Assignment: `RESOURCE-UNBLOCK-L2-20260810-ROCKSDB-R1`
- Status: `BLOCKED_USER_ACTION_REQUIRED`
- Failure stage: official source acquisition, before 20/20 raw closure and before converter smoke
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Claim-bearing observation: `false`
- Scientific revision consumed: `false`
- Stage B: `false`

## Exact blocked resource

- Asset: `nvdcve-2.0-2019.json.gz`
- Official URL: `https://nvd.nist.gov/feeds/json/cve/2.0/nvdcve-2.0-2019.json.gz`
- Required authority: official NIST NVD CVE JSON 2.0 annual feed
- Required validation: HTTP Content-Length equals actual bytes; computed SHA-256; full gzip integrity; JSON parse; nonempty `vulnerabilities`; every entry has `cve.id`; URL/retrieval time/headers/license provenance recorded
- Expected size/hash: unavailable because all three attempts retained zero body bytes and NVD supplied no independently frozen asset hash in the initial contract. Do not guess these values.

Attempts 1 and 2 ended by external process termination at zero body bytes. Attempt 3 failed before HTTP:

`curl 8.21.0 / Schannel: AcquireCredentialsHandle failed: SEC_E_NO_CREDENTIALS (0x8009030e); HTTP 000; 0 bytes.`

The asset-level three-attempt ceiling is exhausted. Zero-byte temporary files are inadmissible and were removed or retained only as an empty header audit artifact. No old partial was joined and no mirror was used.

## Work complete and incomplete

Complete and revalidated:

- NVD 2015: 4,190,045 bytes, SHA-256 `36D62C93A5F15ACDCBA69513F3CA86D44A35E10ACD44258E5A49AFE1EB24B0C0`
- NVD 2016: 5,159,096 bytes, SHA-256 `E3A4B0B68C30065FB24417DDF1240E8149B3F99F433F4A262B776090A24E930F`
- NVD 2017: 7,706,425 bytes, SHA-256 `F3569A60D9AD55B6F076ADF6DF74F67BBAE93A88AFD97D31C5A8BC1E4B4FB894`
- NVD 2018: 8,264,377 bytes, SHA-256 `6508FA9EB5E45767E3120B5D4A135799C593281D717491BBB94E715F9CF89B31`

Not complete: NVD 2019–2024 and all ten frozen PyPI JSON assets. Later assets were not attempted after the atomic NVD 2019 blocker. The required 20 canonical manifests are not closed (`0/20` in resume1).

## Minimum user action

Choose one:

1. Restore a reliable HTTPS/TLS credential path for the exact official NVD URL above, then ask mainline to issue a clean continuation that starts at NVD 2019 without overwriting `resume1`; or
2. Provide a byte-complete copy obtained from that official URL, together with its exact byte count, SHA-256, acquisition time, and provenance note. For complete resource closure, provide the remaining NVD 2019–2024 files and the ten frozen PyPI JSON responses, or restore a route that can retrieve them from their exact official URLs.

No mirror is acceptable unless byte identity to the official asset is independently established. Do not provide a Range fragment or the prior 2017 partial.

## Safe continuation boundary

A later authorized continuation may only validate/copy the supplied raw asset, continue the exact official asset list, and run the unchanged converter readability smoke after all 20 inputs close. It may not run RocksDB, Zstd training, an SST builder, a candidate, a baseline, a scientific revision, or Stage B without a separate mainline authorization.

