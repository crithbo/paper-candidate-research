# Rule freeze

- assignment_id: `DISCOVERY-S6-20260811-V8.7-WAVE157-CMAF-MULTITRACK-FRAGMENT-STATE-DEPTH-REDTEAM`
- rules_revision: `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__discovery-six-lanes-direct-20260811__p1-shadow-not-authoritative`
- `DISCOVERY_QUALITY_MODE=OFF`; this is a v8.7/R5-P0 depth red-team, not an R7/v8.8 production decision.
- Frozen date: 2026-08-11.  Only official/primary sources were used.  No candidate build, media download, mux, decode, or benchmark was run.
- Scope: fixed encoded multi-track samples and timestamps; ISO-BMFF/CMAF-compatible output; stock demux/decode-visible samples and timing.  Transport/player policy, re-encoding/remuxing changed payloads, external compressors, generic segmentation/ILP, and flag sweeps are out of scope.
