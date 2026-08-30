# RAW_SCREEN_ROW_EVENTS

Assignment: `DISCOVERY-S3-20260811-V8.7-WAVE263-ANDROID-DEX-VERSIONAWARE-LAYOUT-DELTA-N2N3-CLOSURE`  
Cutoff: 2026-08-11. Official-source review only; no APK, DEX, build, benchmark, or experiment was downloaded or run.

| Event | Evidence | Witness-first conclusion | Funnel state |
|---|---|---|---|
| R1: format legality | The AOSP DEX format uses indexed tables and an aligned data area; offsets reference data. | `string_id`, `type_id`, `proto_id`, `field_id`, and `method_id` ordering is part of reference semantics/format invariants and is not an action. In contrast, a writer can regenerate offsets while placing data atoms. | `UNIQUE_OPPORTUNITY_FAMILY` |
| R2: native action | Current ART `dexlayout` calls `LayoutStringData`, `LayoutClassDefsAndClassData`, and `LayoutCodeItems` before `DexWriter::Output`; its output path reopens the result and performs an IR content comparison that ignores layout offsets. | A native, stock-reader-compatible layout action already exists. Any candidate must strictly dominate a complete current layout union, not claim novelty from reordering alone. | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R3: counterevidence | `dexlayout` assigns profile-derived hot/startup/sometimes/unused categories; ReDex has feedback-directed class layout; ART has dexpreopt/compiler-filter configuration. | Profile-guided per-version layout, D8/R8 production, dexlayout, dex2oat and ReDex are mandatory subtractors. None shown here is predecessor-aware for simultaneous final-DEX and delta cost. | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R4: minimal divergence | Two adjacent logical DEX versions can retain a common set of string-data/class-data/code-item atoms while a current version receives only its current profile category ordering. | A predecessor-aware choice can deliberately retain a legal older-adjacent atom neighborhood when its new-version profile bucket admits multiple ties; that changes the next DEX/delta tradeoff without changing any class/method/code/debug meaning. | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R5: natural route | Official AOSP release/tag source plus release-built APK/JAR DEX artifacts is a versioned natural carrier. | A finite, hash-pinned 20–50 adjacent-tag route can test whether the tie-set/reuse condition recurs under held-out product/module strata. No such law is claimed to have been observed. | `STAGE0_BRIEF` |
