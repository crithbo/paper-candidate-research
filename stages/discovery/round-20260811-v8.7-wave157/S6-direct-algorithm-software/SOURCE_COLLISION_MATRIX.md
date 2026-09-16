# Source and collision matrix

| source (primary/official) | frozen role | supported fact | collision effect |
|---|---|---|---|
| FFmpeg, [Formats Documentation](https://www.ffmpeg.org/ffmpeg-formats.html), retrieved 2026-08-11 | current native writer interface | MOV/MP4 muxer documents CMAF/DASH modes, fragment-keyframe/every-frame/duration behavior, `global_sidx`, and fragment timing/offset controls. | Directly absorbs the identified fragment cut/index/timing action families. |
| FFmpeg source, [`libavformat/movenc.c`](https://git.ffmpeg.org/gitweb/ffmpeg.git/blob/HEAD:/libavformat/movenc.c), current-master locus | reality-check source locus | Source location for the MOV/MP4 muxer; a future absence assertion must pin its commit and flags. | No absence is asserted in this package. |
| ETSI, [3GPP TS 26.234 v9.6.0](https://www.etsi.org/deliver/etsi_ts/126200_126299/126234/09.06.00_60/ts_126234v090600p.pdf) | authoritative fragment semantics | Addresses movie-fragment track alignment/timing and `sidx` relationship. | Confirms the witness remains an ISO-BMFF/CMAF-format construction, not a new reader object. |
| Blender, [Release archive](https://www.blender.org/download/releases/) | public natural-carrier route | Versioned public releases are available for a reproducible open-media carrier route. | Provides a finite carrier route only; no performance result is claimed. |

**Latest-collision conclusion (2026-08-11).** The collision is current native action absorption, not merely related literature.  No direct paper collision is needed once the proposed complete action is already expressible by the fair same-object executable union.
