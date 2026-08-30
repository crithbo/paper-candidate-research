# Candidate-grade deep reviews

## MCAP indexed chunks — STRUCTURAL_DROP

Fixed object is an MCAP file with identical schema/channel/message sequence and stock reader results. A chunk boundary jointly governs channel-message index records, chunk-time bounds, CRC and summary/index entries. Minimal witness: two channels in one time interval, with a channel introduced before messages and per-channel message offsets after the chunk. The specification requires every message to be in a chunk when Chunk Index records are used and requires exactly one Message Index per channel occurring inside it; schema/channel prerequisites are also duplicated in summary. Current grammar thus already defines the complete legal state action. Choosing chunk threshold, compression, or index omission is configuration/controller/external compression, not N2. Natural route would be a versioned public ROS/robot log; full cost is file/index bytes, write/read CPU/RSS, seek latency, temporary memory and index build time. Killer: construct witness and check grammar/reader; already absorbed.

## Matroska clustered tracks — NOT_ADMITTED_UNFROZEN

Fixed object would be a multi-track media stream read by an RFC-9559 conformant reader. Clusters share boundaries; track CodecState can change at the first requiring cluster. A witness needs two tracks with asynchronous codec initialization changes at competing cluster boundaries. Natural route: a versioned openly released multi-track media stream; costs include container bytes, mux CPU/RSS/temp, time-to-first-frame/seek and demux CPU/RSS. Current muxer flag/state union and a carrier version were not frozen, so no union-external action is asserted. 72-hour route: pin muxer source/config, enumerate lacing/cluster/codec-state paths, freeze trace, and reject if a legal action is already exposed or requires changed playback semantics.

## Avro OCF — STRUCTURAL_DROP

OCF blocks share record boundaries but schema and sync marker are file-fixed; blocks carry object count and bytes. It lacks independently evolving multi-field state. Any candidate is a block-size/codec choice or external compression. Native reader, natural event stream, byte/CPU/RSS and split-latency ledger are possible, but the required whole-state N2 does not exist.

## pcapng — NOT_ADMITTED_UNFROZEN

Interfaces and metadata state could coexist with packet-block boundaries, but the necessary current writer action catalog (all section/interface/name-resolution options) and a versioned natural packet capture trace are not frozen. The finite oracle is a stock parser plus packet/interface metadata digest; cost includes output bytes, writer/reader CPU/RSS and seek/index behavior. No action gap is admitted.

## fragmented MP4/CMAF — NOT_ADMITTED_UNFROZEN

Track-fragment timing/decode state and fragment boundaries are a plausible multi-state grammar. A complete action must preserve decoder timestamps, sample order, initialization segment and stock player semantics; full cost includes mux/demux CPU/RSS, bytes/temp, startup/seek latency. No current official muxer union or natural release trace was frozen; no brief.

## ROS 2 bag MCAP — STRUCTURAL_DROP

Storage-level shared boundaries and channel state are exactly MCAP's object. Treating it separately would rename/duplicate MCAP, prohibited by assignment.
