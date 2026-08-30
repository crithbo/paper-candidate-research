# Source / collision matrix

| first-party/standard source | current semantic/action fact | collision consequence |
|---|---|---|
| [RFC 9559](https://www.rfc-editor.org/rfc/rfc9559.html) | A playable Matroska needs Tracks and Clusters; track/lacing constraints are standardized. | Stock-reader guarantee boundary. |
| [Matroska Cues](https://www.matroska.org/technical/cues.html) and [specification notes](https://www.matroska.org/technical/notes.html) | CuePoint links absolute time, track and cluster position; proper seek must account for selected tracks and RAPs. | Current cue/keyframe state semantics. |
| [implementation recommendations](https://www.matroska.org/technical/matroska_implement.html) | Recommends ≤5 seconds/≤5MB per cluster and explicit muxer/streaming/Cues-at-front layouts. | Strong writer-layout union; a fixed threshold sweep is not N2. |
| [official mkclean](https://www.matroska.org/downloads/mkclean.html) | Reorders Cues to front, removes extra seek lists, and can remux cluster blocks to start at a keyframe with matching audio/subtitle blocks. | Direct same-object construction subtractor, though it is post-mux and hence cannot itself be rebranded as candidate. |
| [Blender releases](https://www.blender.org/download/releases/) | All Blender releases available; open-movie assets give a public versioned multi-track media route. | Natural carrier route. |

No missing-current-implementation claim is made. Exact source pin for a named general-purpose muxer would be required only if a surviving action depended on its absence; this one is already absorbed by published native layout/remux actions.
