# User blocker packet

- Assignment: `SAFE-RECOVERY-L3-20260815-ROCKSDB-NVD-PYPI-RESUME4`
- State: `BLOCKED_USER_ACTION_REQUIRED`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Claim-bearing observation: none
- Scientific revision consumed: no
- Stage B: false

## Exact blocker

The single allowed request for `https://nvd.nist.gov/feeds/json/cve/2.0/nvdcve-2.0-2023.json.gz` failed during the platform-default TLS handshake before HTTP response headers. The surfaced exception was: `The SSL connection could not be established, see inner exception.` No response body was received, no complete asset was persisted, and the temporary partial path was cleared.

## Work not started

NVD 2024, all ten PyPI JSON requests, NVD gzip/JSON/schema checks, PyPI schema/identity checks, converter read smoke, 20-manifest construction, PRE_CLAIM gate, RocksDB, Zstd, candidate, baselines, SST and all claim-bearing work were not started.

## Minimum recovery action

Mainline should issue a new immutable resume assignment after either:

1. confirming that ordinary platform-default HTTPS from the execution environment can reach the two official NVD annual-feed URLs, or
2. staging byte-complete official NVD 2023/2024 responses and the ten official PyPI project JSON responses in a newly authorized directory with URL, acquisition UTC, response headers, exact bytes and SHA-256.

Any resumed route must retain official sources, platform-default TLS, the same 12 assets, one-attempt accounting, the unmodified converter hash, and the existing scientific boundary. Mirrors, certificate bypass, version/object substitution, system installation and Stage B remain unacceptable.

