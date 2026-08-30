# Wave229 raw-screen row events

Frozen assignment: `DISCOVERY-S3-20260811-V8.7-WAVE229-LINUX-KALLSYMS-TOKEN-CHURN-N3-DEPTH`; cutoff 2026-08-11.  Source review only: no kernel source, `vmlinux`, `System.map`, or release artifact was downloaded or built.

| event | object / phenomenon | proposed whole action | initial witness | disposition |
|---|---|---|---|---|
| RAW_SCREEN_ROW_EVENT | same-config adjacent Linux tags: kallsyms name mapping and token stream | cross-release-stable dictionary/encoding constructor that emits a kernel-acceptable complete kallsyms section | two complete encodings must decode to exactly the same name/type/address relation with stock lookup behavior | CANDIDATE_GRADE_DEEP_REVIEW |
| RAW_SCREEN_ROW_EVENT | token-frequency skew | choose tokens with a different local frequency heuristic | source already globally counts every valid symbol and greedily constructs a token table | EXCLUDED__IN_UNION_HEURISTIC |
| RAW_SCREEN_ROW_EVENT | compressed `vmlinux`/external archive | recompress generated artifact | changes outer artifact only; not the kallsyms constructor/reader object | EXCLUDED__EXTERNAL_COMPRESSION |
| RAW_SCREEN_ROW_EVENT | incremental kernel build cache | reuse prior build products | build cache/controller, not a complete symbols representation | EXCLUDED__BUILD_CACHE |
| RAW_SCREEN_ROW_EVENT | changed `CONFIG_KALLSYMS_ALL` or architecture | compare a different selected symbol set | violates fixed mapping/same-configuration requirement | EXCLUDED__OBJECT_DRIFT |
| RAW_SCREEN_ROW_EVENT | address-base configuration | toggle pc-relative/absolute-percpu path | existing build/config pathway, not a new constructor | EXCLUDED__CONFIG_TUNING |

The sole deep-review family is not a candidate by virtue of a release series alone.
