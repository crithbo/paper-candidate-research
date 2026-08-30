# Raw-screen row events

| event | family | source-led reason | disposition |
|---|---|---|---|
| RAW | CMAF/fMP4 multi-track fragment state | Wave152 left the native action union unpinned; CMAF permits fragment/track timing structures. | UNIQUE |
| REALITY_CHECK | FFmpeg MOV/MP4 muxer | Current official `ffmpeg-formats` documents `cmaf`, `dash`, `frag_keyframe`, `frag_every_frame`, duration/pframe fragmentation, `global_sidx`, and related fragment-offset/timestamp modes. | DEEP |
| COLLISION_CHECK | CMAF/BMFF construction | Authoritative CMAF material specifies fragment-track alignment/timing semantics; FFmpeg exposes the practical whole-fragment choice points. | DEEP |
| ACTION_CERTIFICATE | joint fragment-boundary/state constructor | The only concrete candidate reduces to selecting existing fragment cut/type/duration and timing/index modes for the same samples. | STRUCTURAL_DROP |

No raw item was promoted merely because an implementation or positive result is absent.
