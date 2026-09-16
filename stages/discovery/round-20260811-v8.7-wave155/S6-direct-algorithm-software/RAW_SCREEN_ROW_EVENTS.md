# Raw screen row events

| event | result | evidence |
|---|---|---|
| official semantics | pass | RFC 9559 plus Matroska current technical Cues/notes/implementation recommendations checked. |
| natural carrier | pass | Blender officially maintains open-movie releases; a versioned multi-track MKV release is a finite public carrier route. |
| current construction union | partial / sufficient subtractor | Official spec recommendations define cluster limits/layouts; mkclean is official Matroska tooling that front-loads Cues, reorders elements and optionally remuxes clusters at keyframe boundaries with matching audio/subtitle blocks. |
| minimal witness | absorbed | Video keyframe plus audio/subtitle blocks has competing cluster/cue positions; native recommendation and mkclean cover the named legal regrouping action. |
| decision | STRUCTURAL_DROP | Remaining variants are a muxer threshold/configuration or mkclean-like postprocess/remux, both excluded; no union-external whole constructor named. |
