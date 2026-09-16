# Wave251 raw-screen row events

Assignment `DISCOVERY-S3-20260811-V8.7-WAVE251-OPENJDK-JIMAGE-VERSIONAWARE-LAYOUT-DELTA-N2-CLOSURE`; cutoff 2026-08-11.  This is source/specification review only: no OpenJDK tag, image, module archive or benchmark was downloaded or run.

| event | proposed action | current-union test | disposition |
|---|---|---|---|
| RAW_SCREEN_ROW_EVENT | predecessor-aware complete class-resource order list for the stock `order-resources` plugin | current plugin executes an input list but source does not select a list from predecessor image/delta cost | CANDIDATE_GRADE_DEEP_REVIEW |
| RAW_SCREEN_ROW_EVENT | alternate compression level/filter | `--compress={0,1,2}` and filter are stock plugin configuration | DROP__ORDINARY_TUNING |
| RAW_SCREEN_ROW_EVENT | stock image followed by VCDIFF only | external delta wrapper; no jimage constructor change | DROP__DELTA_WRAPPER |
| RAW_SCREEN_ROW_EVENT | jlink linkable-runtime `ResourceDiff` | current code records packaged-module↔same-version optimized-resource diffs | baseline/config facet, not a cross-version layout constructor |
| RAW_SCREEN_ROW_EVENT | content/module selection or strip plugins | changes logical resource/module set or flags only | DROP__OBJECT_DRIFT_OR_TUNING |
| RAW_SCREEN_ROW_EVENT | opaque global packing/ILP | no specified legal ordering algorithm or bounded guarantee | DROP__GENERIC_ILP |
