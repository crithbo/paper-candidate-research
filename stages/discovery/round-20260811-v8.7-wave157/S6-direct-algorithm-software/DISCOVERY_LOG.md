# Discovery log

## Scope and method

This is a finite DEPTH_REDTEAM closure of Wave152's CMAF/fMP4 `NOT_ADMITTED_UNFROZEN` row.  It used the v8.7/R5-P0 baseline-residual rule: freeze the reader contract and current native whole-action union before considering a mechanism.  No R7/v8.8 production semantics were used.

## Evidence sequence

1. Fixed the object to unchanged encoded multi-track samples/timestamps and stock demux/decode semantics.
2. Consulted authoritative CMAF/BMFF-alignment material and current official FFmpeg format documentation.
3. Enumerated the documented native fragment, timing and index action interface instead of treating default muxing as baseline.
4. Constructed a minimal multi-track RAP/audio/subtitle boundary witness.
5. Found that its concrete action is expressible as current native keyframe/duration/pframe/every-frame fragmentation plus documented timing/index modes.
6. Declined to convert residual flag selection, transport/player policy, payload-changing remux, or generic segmentation into a paper mechanism.

## Decision

`COMPLETE_ZERO_PROPOSALS`.  The only examined family is a structural current-union absorption.  No conclusion rests on missing code, lack of a measured effect, available compute, or AI readiness.

## Reopening boundary

Only a newly source-pinned, complete same-object action outside the current MOV/MP4 muxer union may justify a new assignment.  It must retain the exact packet/timestamp contract and give a finite legality/oracle/full-cost closure plan.
