# RAW_SCREEN_ROW_EVENTS

| row | family | initial same-object witness | disposition |
|---|---|---|---|
| R01 | AMX tileconfig/live-range/spill/call joint construction. | Two AMX tile regions with different virtual tile live ranges are separated by a call. A hypothetical joint constructor would remap tile live ranges to reduce `ldtilecfg`/spill costs while preserving the same shapes and call behavior. | `CANDIDATE_GRADE_DEEP_REVIEW` |

The witness is used to test the residual; it does not establish that physical remapping can reduce the required configuration transitions.
