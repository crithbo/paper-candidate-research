# Candidate-grade deep review — MATROSKA-CLUSTER-CUE-JOINT-STATE

## Same object / union

Input is a fixed sequence of encoded video/audio/subtitle blocks with fixed track identities, timestamps and codec state. Output is a Matroska file accepted by stock demuxers with identical decoded packet sequence/timing. Current fair union includes standard Tracks/Clusters/blocks/lacing/CodecState/Cues/SeekHead grammar, documented best layouts, cluster time/size guidance, and official mkclean's same-object Cues/element/keyframe-aligned remux actions.

## Minimal legal multi-track witness

At a video random-access point, audio packets straddle the timestamp and a subtitle update requires a changed CodecState. Two legal layouts can either begin the Cluster at the video RAP and carry matching audio/subtitle blocks, or place the cue/cluster transition later with a different SeekHead/Cues placement. Both decode to identical payload/times but differ in seek/startup metadata and bytes.

This is not divergent. The official recommendation supplies Cues-at-front versus conventional layouts and specific cluster-size guidance. Official mkclean can front-load Cues and remux Cluster blocks to start a boundary at a keyframe with matching audio/subtitle blocks—the exact coordinated action in the witness. A “better” algorithm that chooses among those layouts is a selector/parameter policy; a new remux pass is a prohibited postprocessor.

## Carrier, oracle, cost and killer

Carrier route: a specific versioned Blender open-movie multi-track MKV, frozen by release URL/hash after authorization. Oracle: stock Matroska demuxer packet/frame timestamp and track-state digest, plus parser conformance. Full cost: container/index bytes, mux/demux CPU/wall/RSS, temporary bytes, time-to-first decodable frame, random-seek latency, and complete remux cost. No measurement was performed.

72-hour killer: pin a release and a current muxer; produce the three-track witness without changing payload; enumerate current writer flags plus mkclean layouts; compare reader digest and complete cost. Reject if every legal construction reduces to existing cluster sizing/layout/Cues/keyframe remux action. Static source/spec evidence already satisfies the action-side predicate.

## Verdict

`STRUCTURAL_DROP`: no whole-action N1/N2 remains after same-object native layout/remux union. This is unrelated to code availability, results, resource or AI readiness.
