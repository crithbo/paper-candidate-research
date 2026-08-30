# Discovery Question Cards — Source98 / S6

## S98-QC01 — libtiff strile-array construction

- Exact object: fixed TIFF pixels, tags, compression choices, and stock libtiff decoder-visible output.
- Candidate question: can a whole-writer construction jointly choose strip/tile boundaries and directory-offset placement with a target-specific guarantee beyond libtiff?
- Current reality: libtiff 4.7.2 exposes strip/tile (“strile”) array timing and writing controls, including `TIFFDeferStrileArrayWriting`, `TIFFForceStrileArrayWriting`, and `TIFFSetWriteOffset`.
- Decision: `EXCLUDED_BEFORE_RAW__GENERIC_LAYOUT_OR_READER_ACCESS_TRADEOFF`. The surviving formulation is layout/packing or changes decoder-access behavior, not a target-specific residual.

## S98-QC02 — libgit2 rename-similarity construction

- Exact object: fixed two Git trees and fixed diff/rename output semantics under stock libgit2.
- Candidate question: can a whole diff constructor jointly select similarity evidence and pairing with a target-specific guarantee beyond current rename detection?
- Current reality: `git_diff_find_options` already carries default and non-default thresholds, a rename limit, and a pluggable similarity metric; its documented default metric samples file ranges and hashes them under a bounded-memory policy.
- Decision: `EXCLUDED_BEFORE_RAW__GENERIC_MATCHING_OR_CONFIGURATION`. A residual would be matching/threshold selection rather than a native non-generic constructor.

## S98-QC03 — OpenBLAS GEMM packing/blocking

- Exact object: fixed matrices, layouts, scalar semantics, and output values under stock OpenBLAS.
- Candidate question: can a joint packing/block/kernel construction offer a target-specific formal residual?
- Current reality: the official developer manual identifies the generic GEMM kernel and its cache-level tuning parameters `Mc`, `Kc`, and `Nc`.
- Decision: `EXCLUDED_BEFORE_RAW__GENERIC_GEMM_TILING_DISPATCH`. The proposed action is a generic tiling/kernel-selection problem, expressly outside this lane's raw admission.

## S98-QC04 — PCRE2 JIT construction

- Exact object: fixed pattern, subject, matching options, and PCRE2 match result.
- Candidate question: can a JIT artifact constructor jointly select engine representations with a target-specific guarantee beyond PCRE2?
- Current reality: PCRE2 documents an optional JIT compiler, complete/partial modes, build-time JIT enablement, and interpreter fallback while preserving match semantics.
- Decision: `EXCLUDED_BEFORE_RAW__CURRENT_NATIVE_COMPILER_AND_GENERIC_AUTOMATA`. No non-generic same-object residual survived.

## Funnel result

All four Question Cards were complete enough for a bounded current-source screen and were excluded before evidence-qualified raw. No card enters a closure queue, deep review, or Stage 0 brief.
