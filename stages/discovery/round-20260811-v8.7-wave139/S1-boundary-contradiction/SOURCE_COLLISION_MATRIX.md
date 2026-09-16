# SOURCE_COLLISION_MATRIX

| Object | Native current semantic/whole-action union | Classification |
|---|---|---|
| HTTP | [RFC 9110](https://www.rfc-editor.org/rfc/rfc9110) conditional/precondition semantics | Native union. |
| TLS | [RFC 8446](https://www.rfc-editor.org/rfc/rfc8446) early-data/replay semantics | Protocol/application boundary. |
| QUIC | [RFC 9000](https://www.rfc-editor.org/rfc/rfc9000) stream/reset state machine | Native union. |
| OCI | [Image spec](https://github.com/opencontainers/image-spec) manifest/layer representation | Native union. |
| Raft | [Raft](https://raft.github.io/) commit/apply semantics | Native union. |
| OpenAPI | [OAS](https://spec.openapis.org/oas/latest.html) contract boundary | Wrapper only. |
