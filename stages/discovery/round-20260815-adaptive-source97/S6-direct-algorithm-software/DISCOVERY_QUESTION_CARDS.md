# Source97 Question Cards

## S97-QC01 — Lua table migration

- Exact identity/current locus: Lua 5.4.8 `ltable.c`; fixed program/input trace and table-visible values.
- Current native actions: the source declares array and hash parts, computes an optimal array size from integer-key occupancy, uses a chained scatter hash with Brent variation, and rehashes/reinserts entries.
- Proposed endpoint/full cost: operation latency, allocation/RSS and migration work under language semantics.
- Falsifier: the purported action is the ordinary hybrid-hash resize/rehash decision already embodied by `computesizes` and `rehash`; a new formulation would be generic hash-table policy.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_ACTION_AND_GENERIC_HASH_KERNEL`.

## S97-QC02 — libxml2 dictionary

- Exact identity/current locus: official libxml2 `dict.h` reference; fixed XML document and DOM/SAX observations.
- Current native actions: dictionaries are interned-string pools; lookup adds absent names, sub-dictionaries inherit read-only strings, and the API exposes usage/limit/size.
- Proposed endpoint/full cost: parser CPU/RSS and dictionary bytes.
- Falsifier: every stated action is generic string interning/deduplication; changing name identity/storage contract changes the parser object.
- Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_STRING_DICTIONARY_KERNEL`.

## S97-QC03 — ImageMagick quantization

- Exact identity/current locus: ImageMagick official adaptive spatial-subdivision quantization documentation; fixed pixels and palette/decode quality contract.
- Current native action: color reduction is explicitly an adaptive spatial-subdivision tree over RGB; the public algorithm anchors the same problem.
- Proposed endpoint/full cost: quantization CPU/RSS, palette bytes, output bytes, decode and error/quality boundary.
- Falsifier: a new tree/palette choice is generic color quantization/clustering, while changing palette/error semantics changes the object.
- Disposition: `EXCLUDED_BEFORE_RAW__DIRECT_CURRENT_ALGORITHM_OR_GENERIC_CLUSTERING`.

## S97-QC04 — FFTW plan construction

- Exact identity/current locus: FFTW 3.3.11 planner-flags/wisdom documentation; fixed transform dimensions/layout/precision and numerical values.
- Current union: `ESTIMATE`, `MEASURE`, `PATIENT`, `EXHAUSTIVE`, `WISDOM_ONLY`, wisdom import/export, and planner measurement/search are documented modes.
- Proposed endpoint/full cost: planning CPU/RSS/wisdom bytes plus transform execution cost.
- Falsifier: this is the native planner/search/cache tradeoff, not an atomic target-specific construction; a claim based on plan measurements needs execution evidence outside this Discovery assignment.
- Disposition: `EXCLUDED_BEFORE_RAW__PLANNER_CONTROLLER_OR_CURRENT_UNION_ABSORPTION`.

All cards are same-object RQs, but none passes the non-generic discriminator. No current-absence claim, resource inference, or novelty inference is made.
