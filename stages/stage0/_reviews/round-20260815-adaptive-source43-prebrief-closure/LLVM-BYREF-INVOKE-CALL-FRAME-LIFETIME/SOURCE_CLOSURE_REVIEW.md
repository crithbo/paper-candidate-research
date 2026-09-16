# LLVM byref/invoke call-frame lifetime: prebrief source closure

## Disposition

`NOT_ADMITTED_UNFROZEN__BOUNDED_SOURCE_OR_CARRIER_CLOSURE_INCOMPLETE`

This is a prebrief disposition, not a Stage 0 scientific STOP and not an authorization for Stage A or B.

## Frozen identity and single closure question

- Assignment: `STAGE0-P1-20260815-LLVM-BYREF-INVOKE-CALL-FRAME-LIFETIME-PREBRIEF-CLOSURE-V8.7`.
- Official first-success default-branch pin: LLVM `10b4fa5b79eb9d27b4928ad82afa3847762bc72f` (2026-08-14 UTC commit metadata).
- Required object remains one public fixed LLVM `byref`-parameter `invoke` function, with one fixed target ABI and unchanged normal/exceptional value identity, lifetime, unwind and visible-value semantics.
- Closure question: whether a target-specific construction of `byref` storage and call-frame lifetime across `invoke` can be stated against the current LLVM union rather than being ordinary stack coloring, frame packing, or generic EH lowering.

## What the current primary sources establish

| Source retained locally | Current-source finding | Comparator role |
| --- | --- | --- |
| `Attributes.td:109` | `ByRef` is a type parameter attribute. | Native IR action grammar fragment. |
| `Verifier.cpp:2118-2217,4177-4182` | `byref` is mutually exclusive with several ABI attributes, has sized-type/size checks, and is included in ABI-attribute matching. | Proves that ABI compatibility is part of the same-object contract. |
| `llvm/test/Verifier/byref.ll` | Official verifier test exercises type, incompatibility and `musttail` ABI-mismatch cases for `byref`. | Real checker path, but no `invoke` carrier. |
| `StackColoring.cpp:9-13,74-92,152-178,719-727` | LLVM has CFG-aware lifetime-marker stack-slot merging, conservative escaped-alloca and EH-related handling. | Strong generic lifetime/frame subtractor; it is not evidence of a `byref+invoke` target-specific whole action. |

The retained verifier test has `byref` declarations and ABI/musttail checks, but no `invoke` instruction. The retained source does not identify a target ABI lowering locus, a public same-function `byref+invoke` carrier, or an object/unwind reader that distinguishes two complete target-legal plans.

## Closure decision

The frozen object cannot yet be represented as an auditable finite problem without changing its ABI or weakening its endpoint. In particular, the following mandatory items remain unfrozen:

1. One target triple, calling convention and target lowering source locus that accepts a `byref` argument at an `invoke` call site;
2. One public same-function carrier containing both the `byref` call contract and normal and exceptional successors, with a stock verifier, object and unwind-reader path;
3. The complete target-specific call-lowering, frame, unwind and non-default action catalog for that carrier; and
4. A minimal two-plan witness showing a difference beyond the existing generic lifetime/stack-coloring/frame union while preserving all normal and exceptional paths.

The missing items are not treated as current-source absence. The six authorized official acquisition attempts are exhausted; the LangRef URL returned HTTP 404, which is logged as a locator failure only. No candidate implementation, compilation, benchmark, or claim-bearing run was performed.

## Current-union attack and claim ceiling

The present evidence supports neither a direct-absorption claim nor a residual claim. Generic stack coloring already merges disjoint slots using CFG/lifetime information and applies conservative treatment to escaped allocas and EH-related conditions. Any successor must prove a target-ABI-specific action not expressible as that current union; merely selecting a lifetime boundary, packing slots, or reordering normal/EH lowering is structurally a generic subtractor-covered design.

Accordingly the route is not yet eligible for a full Stage 0 paper-potential review. It may be reconsidered only as a newly frozen prebrief assignment that preserves the exact object and provides the four missing source/carrier closures above. This disposition makes no inference from missing hardware, implementation, performance result, or retrieval failure.

## Resource and reproducibility record

All resource-producing activity used assignment-local `resources/` with process-local `TEMP`, `TMP`, `TMPDIR` and `XDG_CACHE_HOME` redirection. Six of six bounded official requests were attempted; five files were retained, one HTTP 404 was retained in the acquisition log. No system configuration, installation, build, cache outside the assignment, or source-tree modification occurred.
