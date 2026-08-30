# Source / collision matrix

| family | first-party/standard source | reader semantics and union result |
|---|---|---|
| MCAP | [MCAP specification](https://mcap.dev/spec) | Messages in indexed files must be in chunks; channel/index records and summary copies are reader prerequisites. Direct grammar absorption. |
| Matroska | [IETF RFC 9559](https://www.rfc-editor.org/rfc/rfc9559.html), [codec-state specification](https://www.matroska.org/technical/codec_specs.html) | Tracks/clusters/CodecState define native reader state, but no current official muxer union pinned. |
| Avro OCF | [Apache Avro specification](https://avro.apache.org/docs/%2B%2Bversion%2B%2B/specification/) | Schema-fixed records in blocks with count/bytes/sync marker; no independent field-state machine. |
| pcapng | [pcapng format documentation](https://pcapng.com/) | Interface/metadata blocks exist, but current upstream writer/config union was not frozen. |
| fragmented MP4/CMAF | ISO/standard muxer source route | Track fragment state exists, but current official writer union and carrier remain unclosed. |
| ROS 2 bag MCAP | MCAP/ROS storage route | Same format/action object as MCAP, hence deduplicated rather than re-evaluated. |

No issue/future-work statement is used as absence evidence.
