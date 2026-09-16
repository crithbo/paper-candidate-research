# Raw screen row events

| family | shared-boundary / finite state | result |
|---|---|---|
| MCAP chunk writer | Chunk boundary shared across schema/channel/message records; channel-index state | `STRUCTURAL_DROP`: indexed readers require all messages in chunks and exact per-channel index records; remaining chunk size/compression is config/controller. |
| Matroska cluster writer | Cluster boundary across tracks; per-track CodecState | `NOT_ADMITTED_UNFROZEN`: reader grammar supports state changes, but current muxer whole-action union/natural trace not frozen. |
| Avro object container | Block boundary shared by records; schema/sync fixed state | `STRUCTURAL_DROP`: no independent per-field evolving state; only block size/codec. |
| pcapng writer | Section boundary across interfaces/packets; interface/name-resolution state | `NOT_ADMITTED_UNFROZEN`: official reader/writer action union and natural trace not frozen. |
| fragmented MP4/CMAF | Fragment boundary across tracks; per-track decode/time state | `NOT_ADMITTED_UNFROZEN`: format grammar known but current muxer action union and precise natural trace unclosed. |
| ROS 2 bag MCAP storage | Topic/channel state and bag chunk boundaries | `STRUCTURAL_DROP`: same MCAP format object; would duplicate MCAP, not a distinct family. |
