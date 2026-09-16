# Wave220 raw-screen row events

Frozen assignment: `DISCOVERY-S3-20260811-V8.7-WAVE220-DEBIAN-CONTENTS-INDEX-CHURN-N3-DEPTH`.
Cutoff: 2026-08-11.  This is a source-only review: no Contents/Packages corpus was downloaded and no benchmark was run.

| event | unique family | first-party natural carrier | phenomenon-to-action hypothesis | preliminary action-divergence witness | disposition |
|---|---|---|---|---|---|
| RAW_SCREEN_ROW_EVENT | Debian Contents across dated Debian archive snapshots | signed `InRelease`/`Release` plus `dists/<suite>/<component>/Contents-<arch>.gz` identified by SHA-256 | adjacent snapshots may exhibit stable path ownership churn and repeated prefix locality that could permit a jointly constructed Contents representation | a whole writer would have to emit the specified mapping, remain acceptable to apt-file, and improve an explicit build/update/query/storage denominator | CANDIDATE_GRADE_DEEP_REVIEW |
| RAW_SCREEN_ROW_EVENT | Debian Packages across dated snapshots | signed `InRelease`/`Release` plus `binary-<arch>/Packages*` | package-stanza churn may be correlated with path churn | no distinct same-object construction was named beyond the existing package/index-generation union | EXCLUDED__NO_ACTION_DIVERGENCE |
| RAW_SCREEN_ROW_EVENT | Debian Sources across dated snapshots | signed release metadata plus `source/Sources*` | source-package churn may yield locality | object differs from the required path-to-binary-package Contents mapping | EXCLUDED__OBJECT_DRIFT |
| RAW_SCREEN_ROW_EVENT | APT index diffs / pdiffs | optional `<index>.diff/Index` and patch history | diff history may reduce transport | delta transport is expressly excluded and is not a new whole Contents constructor | EXCLUDED__DELTA_TRANSPORT |
| RAW_SCREEN_ROW_EVENT | apt-file local cache | apt-file reads configured downloaded Contents targets | query reuse may reduce response latency | cache/controller action, not a writer/index constructor | EXCLUDED__CACHE_WRAPPER |
| RAW_SCREEN_ROW_EVENT | compression-level variation | repository index compression variants | smaller bytes could reduce transfer/storage | compression flag only; no new mapping constructor or law | EXCLUDED__ORDINARY_TUNING |

Screen result: one unique family advanced.  No raw item is a paper candidate merely because the release archive is versioned.
