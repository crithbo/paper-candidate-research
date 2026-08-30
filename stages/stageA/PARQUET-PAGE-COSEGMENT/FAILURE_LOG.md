# Failure log

No resource or scientific failure has occurred. Prior Discovery Schannel failures are upstream provenance, not this assignment's observation and are not reused as evidence.

## Pre-claim implementation correction

- First witness reporting attempt failed in `_query_scalars`: it called `as_py()` on a one-element Arrow array rather than its scalar.
- The candidate Parquet file had already been decoded by PyArrow; no natural corpus or claim-bearing measurement had started.
- Correction: index element zero before `as_py()`. The complete witness was then rerun and passed all checks.
- Scientific revision consumed: no.

## Non-blocking acquisition failures

- `git ls-remote` and Windows `curl.exe` failed with Schannel `SEC_E_NO_CREDENTIALS`.
- The same immutable official GitHub resources were obtained through Python/OpenSSL HTTPS, with fixed commit/tag and local SHA-256. This did not block the required resource and is not scientific evidence.
- The first official crates.io transfer was short (946,175/962,010 bytes). The resumable downloader rejected it; the resumed file closed at exactly 962,010 bytes with SHA-256 `5302D4DA74D6596A1F11F9928767995B53BCA657CBEEA1E4E8C5074F8A1157DD` before extraction.
