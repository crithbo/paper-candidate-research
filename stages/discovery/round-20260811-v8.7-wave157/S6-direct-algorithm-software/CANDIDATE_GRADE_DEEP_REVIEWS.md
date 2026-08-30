# Candidate-grade deep review

## CMAF/fMP4 joint multi-track fragment-state constructor — STRUCTURAL_DROP

### Same-object contract

Input is a fixed ordered packet stream for the same elementary tracks, including video random-access points and audio/subtitle timestamps.  Output is an ISO-BMFF fragmented file satisfying CMAF-compatible muxing constraints.  Equality is stock-demux packet identity/timing/track mapping plus successful stock decode; byte equality is not required.  The object is neither an ABR policy nor a re-encoder.

### Current upstream reality and strongest executable union

Frozen current-upstream evidence is the official FFmpeg `ffmpeg-formats` manual retrieved 2026-08-11, current `master` documentation surface, with source locus `libavformat/movenc.c` to be commit-pinned before any later claim relying on implementation absence.  This review makes no such absence claim.  The documented MOV/MP4 muxer action union includes:

| action family | current native interface / semantics |
|---|---|
| container mode | `movflags=cmaf`, `dash`, `default_base_moof` |
| fragment boundary | `frag_keyframe`, `frag_every_frame`, duration and minimum-duration controls; DASH `frag_type` includes automatic/every-frame/duration/pframe behavior |
| timeline/fragment state | `frag_discont`, negative composition-time-offset handling, `omit_tfhd_offset` |
| index | `global_sidx` and fragment/index layout choices |
| output contract | MOV/MP4 writer, consumed by FFmpeg/libavformat demux/decode path |

The fairness comparator is the complete documented native union, not one default command line.  A future reopening must pin the exact FFmpeg commit and enumerate every relevant default/non-default muxer option; documentation from an old Doxygen release is not used as absence evidence.

### Small legal action-divergence witness, and its resolution

Consider one video RAP at 2.0 s, audio samples spanning that point, and a subtitle event overlapping the adjacent interval.  Two legal files can cut the next `moof` at the RAP or at a duration-driven eligible boundary, while `traf/tfdt/trun` encode the corresponding per-track sample runs and `sidx` can index the resulting fragments.  This establishes that the standard has multiple legal whole-file actions, but it does **not** establish a residual: FFmpeg's keyframe and duration/pframe/every-frame fragmentation interface already expresses the identified cut family; its CMAF/DASH/index/timing flags express the named state variants.

No supported witness was found for a complete joint constructor outside that union while retaining the fixed payload/timeline and stock reader.  “Optimize the choice among these modes” is a selector/configuration problem, prohibited here.  Repacking samples or changing interleave in a way that alters decoder-visible timing would change the object; player start-up/seek policy is not a writer algorithm.

### Six-dimensional residual check

| facet | result |
|---|---|
| decision rule | proposed global boundary/state selection collapses to existing native fragment/action controls |
| information | fixed input samples/timestamps give no additional same-object information advantage |
| complexity/resource | no union-external algorithmic primitive was identified |
| quality/guarantee | CMAF legality and reader-visible timing are already preserved by the native modes |
| full cost | a valid later denominator would include bytes (`moof`/`mdat`/`sidx`), mux and demux CPU/wall/RSS, temporary storage, time-to-first-decodable sample, and seek; it cannot redeem an absorbed action |
| generalization/no-gain | any gain claim is presently a flag-selection result, not a transferable N2 constructor |

### Finite Stage-A falsifier retained for audit

If a later source revision motivates reopening, within 72 hours: pin FFmpeg commit and all MOV/DASH muxer flags; freeze a small three-track public carrier; enumerate the legal two-boundary witness; check native demux packet/timestamp identity and decode; and reject immediately if the proposal is representable as native modes, requires re-encoding/reader changes, or has no joint full-cost Pareto criterion.  This is not an authorized experiment and was not run.

### Decision

`STRUCTURAL_DROP__CURRENT_UNION_ABSORBS_IDENTIFIED_ACTION`.  This is a collision/action-space decision, not a negative empirical result and not an inference from readiness.
