# .NET transport-recovery precommit

Only the two frozen GNU official routes may be called, once each. Attempts are
incremented before their calls. Platform-default TLS is retained; no certificate,
protocol, or safe-URL bypass is permitted.

## Attempt 1

- Counter before call: `1`.
- Tool: `.NET System.Net.Http.HttpClient`.
- URL: https://git.savannah.gnu.org/cgit/make.git/plain/doc/make.texi
- Destination: `resources/downloads/make.texi`.
- Guard: refuse content length above `3,145,728` bytes; stream-copy enforces the
  same maximum before writing a byte beyond the cap.
- Status after call: `ATTEMPTED_PLATFORM_DEFAULT_TLS_FAILURE__NO_BYTES_PERSISTED`.

## Attempt 2

- Counter before call: `2`.
- Tool: `.NET System.Net.Http.HttpClient`.
- URL: https://ftp.gnu.org/gnu/make/make-4.4.1.tar.gz
- Fixed permitted member if retrieval succeeds: `make-4.4.1/doc/make.texi`.
- Destination: `resources/archives/make-4.4.1.tar.gz`.
- Guard: refuse content length above `3,145,728` bytes; stream-copy enforces the
  same maximum before writing a byte beyond the cap.
- Status after call: `ATTEMPTED_PLATFORM_DEFAULT_TLS_FAILURE__NO_BYTES_PERSISTED`.

## Bounded result

Both and only the frozen official URLs were attempted once with the permitted .NET
transport and platform-default TLS. Both failed before response bytes were received.
No curl retry, certificate/protocol override, mirror, new route, extraction, build,
or scientific inference is authorized or performed.
