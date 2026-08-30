# Source95 question cards and ordinary closure outcome

## S95-QC01 — Bazel Skyframe

- Exact public identity: Bazel Skyframe documentation, version 8.2.0; current official source tree `src/main/java/com/google/devtools/build/skyframe`.
- Same-object contract: fixed workspace/configuration/change trace and configured-target values; build semantics and declared dependency graph remain fixed.
- Current locus: official documentation describes SkyFunctions recursively requesting nodes, producing a DAG, and bottom-up invalidation; current repository tree is the declared source locus.
- Candidate endpoint: same-result recomputation work and memory.
- Cheapest falsifier: after the documented graph model, the proposed coupled decision has no target-native operator beyond invalidation/evaluation of dependencies.
- Direct/generic subtractor: ordinary DAG invalidation/evaluation. It covers the proposed decision vocabulary; a generic scheduler is prohibited by the assignment.
- Raw-required audit: `INCOMPLETE`: no source-supported non-generic discriminator survives. This is a structural generic-kernel exclusion, not an absence claim.
- Disposition: `EXCLUDED_BEFORE_RAW`; no closure queue needed because more source detail cannot turn the stated RQ into a target-specific action without changing it.

## S95-QC02 — Mercurial revlog

- Exact public identity: Mercurial revlog documentation; fixed public repository revision DAG/content and revlog lookup semantics.
- Same-object contract: append-only revlog persistence, exact revision reconstruction, and revision identifiers remain fixed.
- Current locus: official documentation says revlogs append data and reconstruct revisions by reading stored ranges; deltas and periodic snapshots are the representation actions.
- Candidate endpoint: write bytes, retrieval reads/latency, reconstruction memory.
- Cheapest falsifier: the claimed joint snapshot/delta-base choice is a generic delta-compression/representation-selection kernel under the same append-only constraint.
- Direct/generic subtractor: delta encoding with snapshot placement, not a Mercurial-specific semantic decision.
- Raw-required audit: `INCOMPLETE`: no source-backed target-specific discriminator apart from the generic representation problem.
- Disposition: `EXCLUDED_BEFORE_RAW`; no source queue, because changing this requires a non-generic claim not present in the frozen RQ.

## S95-QC03 — Pango layout

- Exact public identity: official Pango 1.58 rendering-pipeline documentation; fixed text, font features, attributes, width, glyph positions, and lines.
- Same-object contract: `PangoLayout` result and rendering-visible glyph positioning remain fixed.
- Current locus: official documentation separates itemization, shaping, line-breaking, justification, and rendering; `PangoLayout` performs actual breaking and justification.
- Candidate endpoint: layout latency and peak memory.
- Cheapest falsifier: preserving the exact layout reduces the suggested joint construction to generic line-breaking/justification dynamic programming; changing breaks or glyph positions changes the object.
- Direct/generic subtractor: standard constrained line-layout DP.
- Raw-required audit: `INCOMPLETE`: target-specific non-generic discriminator fails.
- Disposition: `EXCLUDED_BEFORE_RAW` on generic-kernel grounds; no current-absence assertion.

## S95-QC04 — OpenJPEG progression

- Exact public identity: OpenJPEG current `opj_compress.c`; fixed input samples, declared JPEG 2000 profile, and decoder-visible reconstruction.
- Same-object contract: no changed pixels, profile, decoder, or external format; full cost would include encode CPU/RSS, bytes, decode CPU/RSS, and access latency.
- Current locus and union: documented defaults and source options expose progression orders LRCP/RLCP/RPCL/PCRL/CPRL, progression-order changes, tile parts, layers, code-block/precinct sizes, and rate/quality controls.
- Cheapest falsifier: under a fixed decoded-output/profile contract, the proposed packet/tile plan is a standard codec rate-distortion/order decision; an access-oriented progression changes the intended access semantics or remains generic codec scheduling.
- Direct/generic subtractor: exposed progression controls plus generic rate-distortion/packet ordering.
- Raw-required audit: `INCOMPLETE`: no target-specific non-generic action/guarantee survived the explicit current action union.
- Disposition: `EXCLUDED_BEFORE_RAW` by current-union plus generic-kernel absorption.

## Summary

All four cards have `RQ_COMPLETE` but no `EVIDENCE_QUALIFIED_RAW`. No card is a clean brief, a scientific claim of novelty, or a finding about missing implementation/results/resources.
