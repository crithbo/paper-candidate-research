# Raw screen row events

| Row | Unique family | Frozen same-function/guarantee boundary | Official first-party anchor | Raw result |
|---:|---|---|---|---|
| 01 | Rekor shared inclusion-proof verification | Fixed bundle set and signed tree head; accept only if every artifact/signature/inclusion proof verifies. | [Sigstore overview](https://docs.sigstore.dev/), [Rekor overview](https://docs.sigstore.dev/logging/overview/) | `DEEP_DIVE_REQUIRED` |
| 02 | OpenSSL alternate-chain construction | Fixed target, trust store, untrusted intermediates and verification parameters; build/validate an acceptable X.509 chain. | [X509_verify_cert](https://docs.openssl.org/3.4/man3/X509_verify_cert/), [verification options](https://docs.openssl.org/3.4/man1/openssl-verification-options/) | `DEEP_DIVE_REQUIRED` |
| 03 | TUF delegated-role traversal | Fixed metadata snapshot and target name; accept only a threshold-valid delegated metadata path. | [TUF specification](https://theupdateframework.github.io/specification/latest/) | `DEEP_DIVE_REQUIRED` |
| 04 | PostgreSQL SSI abort selection | Fixed concurrent serializable transaction history; preserve serializability/abort semantics. | [PostgreSQL Serializable docs](https://www.postgresql.org/docs/current/transaction-iso.html), [SSI implementation record](https://wiki.postgresql.org/wiki/Serializable) | `STRUCTURAL_DROP` |
| 05 | SQLite WAL snapshot validation | Fixed WAL/read transaction state; preserve snapshot isolation and reader-visible rows. | [SQLite WAL](https://www.sqlite.org/wal.html) | `STRUCTURAL_DROP` |
| 06 | WebAssembly validator control-stack checking | Fixed Wasm bytes; return spec-valid/invalid with identical validation guarantee. | [WebAssembly specification](https://webassembly.github.io/spec/core/valid/index.html) | `STRUCTURAL_DROP` |
| 07 | etcd transactional compare execution | Fixed compare set and request; atomically choose success/failure branch with linearizable semantics. | [etcd transaction API](https://etcd.io/docs/) | `STRUCTURAL_DROP` |
| 08 | HTTP/2 flow-control update scheduling | Fixed compliant stream/connection state; preserve protocol flow-control and delivery semantics. | [RFC 9113](https://www.rfc-editor.org/rfc/rfc9113) | `STRUCTURAL_DROP` |

`RAW_SCREEN_ROW_EVENT=8`; repeat/rescreen=`0`. The S2/S4 active-assignment objects and Wave51 families were excluded before this screen. No interface embargo or unpinned absence claim was used.
