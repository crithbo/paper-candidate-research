# RAW_SCREEN_ROW_EVENT

| ID | New family / current first-party source | Minimal legal/natural witness + native union | Result |
|---|---|---|---|
| R01 | HTTP conditional request representation boundary ([RFC 9110](https://www.rfc-editor.org/rfc/rfc9110)) | Same resource may change between ETag observation and conditional update; server precondition semantics are the union. | `NOT_ADMITTED_UNFROZEN` |
| R02 | TLS 1.3 early-data replay boundary ([RFC 8446](https://www.rfc-editor.org/rfc/rfc8446)) | 0-RTT data can be replayed; anti-replay/idempotence is protocol/application boundary. | `NOT_ADMITTED_UNFROZEN` |
| R03 | QUIC stream reset/final-size boundary ([RFC 9000](https://www.rfc-editor.org/rfc/rfc9000)) | Reset and final-size observations are independently constrained; transport semantics union. | `NOT_ADMITTED_UNFROZEN` |
| R04 | OCI image manifest/layer descriptor boundary ([OCI spec](https://github.com/opencontainers/image-spec)) | Manifest digest commits descriptors while layer extraction observes bytes/media type. | `NOT_ADMITTED_UNFROZEN` |
| R05 | Raft log commitment versus state-machine apply ([Raft paper/project](https://raft.github.io/)) | Committed entry may not yet be externally applied; consensus/apply union. | `NOT_ADMITTED_UNFROZEN` |
| R06 | OpenAPI response contract versus server runtime ([OpenAPI spec](https://spec.openapis.org/oas/latest.html)) | Declared response schema and runtime response can diverge; validator/generator wrapper only. | `NOT_ADMITTED_UNFROZEN` |
