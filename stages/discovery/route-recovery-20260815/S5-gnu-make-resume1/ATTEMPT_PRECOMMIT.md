# Frozen network attempt precommit

Attempt counter is incremented before every call. The independent addendum permits
at most three calls, the first of which is the GNU Savannah cgit raw manual source.

## Attempt 1

- Counter before call: `1`.
- Source: https://git.savannah.gnu.org/cgit/make.git/plain/doc/make.texi
- Source role: current official manual source locus.
- Write destination: `resources/downloads/make.texi`.
- Method: `curl.exe --fail --location --max-time 60 --max-filesize 3145728` with
  process-local `TEMP`, `TMP`, and `TMPDIR` set under `resources/tmp`.
- Budget consequence: bounded below the 3 MiB per-addendum download limit; no build
  or experiment and no alternative source route unless this route fails.
- Status after call: `ATTEMPTED_TLS_CREDENTIALS_FAILURE__NO_BYTES_PERSISTED`.

## Attempt 2

- Counter before call: `2`.
- Source: https://ftp.gnu.org/gnu/make/make-4.4.1.tar.gz
- Source role: frozen GNU official release-archive fallback; only member
  `make-4.4.1/doc/make.texi` may be read if retrieval succeeds.
- Write destination: `resources/archives/make-4.4.1.tar.gz`.
- Method: `curl.exe --fail --location --max-time 60 --max-filesize 3145728` with
  process-local `TEMP`, `TMP`, and `TMPDIR` under `resources/tmp`.
- Budget consequence: bounded by the addendum's 3 MiB limit; no extraction unless
  this official archive is obtained and remains within the stored-byte budget.
- Status after call: `ATTEMPTED_TLS_CREDENTIALS_FAILURE__NO_BYTES_PERSISTED`.

## Bounded-stop decision

Both independent, frozen GNU official routes reached the same local Schannel
credential failure before any response bytes were received. The addendum does not
authorize a TLS-policy bypass, an unofficial mirror, or a new source route. One
numerical attempt remains, but no distinct authorized route remains; it is left
unexecuted rather than repeating an identical credential failure.
