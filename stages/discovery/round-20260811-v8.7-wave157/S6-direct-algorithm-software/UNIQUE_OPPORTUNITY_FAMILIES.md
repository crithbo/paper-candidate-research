# Unique opportunity families

## CMAF/fMP4 joint multi-track fragment-boundary/state construction

**Exact object.** One fixed sequence of already encoded video, audio, and optional subtitle samples, with their timestamps and random-access markers, written as CMAF-compatible fragmented ISO BMFF and consumed by an unchanged stock demuxer/decoder.  Decoded elementary samples, order, timestamps, and track identity are invariant.

**Natural carrier.** A version-pinned public Blender Open Movie multi-track source/encoded-stream release is a legitimate finite carrier route.  No asset was downloaded in Discovery; Stage A would record release URL, media hash, track map, and encoder-produced input packet hashes before the fidelity gate.

**Candidate whole action considered.** Jointly choose every fragment boundary, per-fragment track membership/interleave, `tfdt` bases, `trun` run layout, and optional `sidx` layout subject to the fixed sample timeline and CMAF legality.

**Why it is not unique.** The documented FFmpeg MOV/MP4 muxer union already exposes CMAF/DASH mode, keyframe/every-frame/duration/pframe fragmentation, minimum/duration cut controls, discontinuity/timestamp-offset modes and global indexing.  Under fixed samples and stock-reader semantics, the concrete boundary/state choices identified here are selections/compositions of that native action interface.  A purported residual would have to change payload placement/timeline semantics, substitute a player/transport policy, or be a global selector over the current flags—each outside this assignment.

**Outcome.** `STRUCTURAL_DROP__CURRENT_UNION_ABSORBS_IDENTIFIED_ACTION`; no brief.
