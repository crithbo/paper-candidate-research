# Unique opportunity family

## MATROSKA-CLUSTER-CUE-JOINT-STATE

The candidate would jointly choose multi-track Cluster boundaries, lacing/block ordering, cue locations and SeekHead layout while preserving fixed encoded packets/timestamps and stock demux output. It is not retained: Matroska's own current implementation recommendations and official mkclean already express the reader-visible Cues/layout/keyframe regrouping actions that the proposed witness needs. What remains is a parameter choice or a post-mux wrapper.
