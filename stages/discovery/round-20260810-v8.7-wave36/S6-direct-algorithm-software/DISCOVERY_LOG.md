# Algorithmic-residual deep review — S6 Wave36

Assignment: `DISCOVERY-S6-20260810-V8.7-WAVE36-ALGORITHMIC-RESIDUAL`  
Frozen cutoff: `2026-08-10`  
Source set: Wave32 only. This review does not alter Wave32.

## Method and selection

Three nonterminal Wave32 near-misses were re-opened solely as fresh residual reviews: SPIR-V ID construction (action space not frozen), Brotli meta-block construction (controller/selector risk), and JVM constant-pool assignment (fidelity/action space not frozen). No STOP object is revived. The review uses accepted Discovery v2/v8.1 plus v8.6 finite-fidelity admission and v8.7 current-upstream reality check; the TLS-blocked two-axis v8.2r2 method is not used.

For each row, the existing action space is treated as a strong baseline, not as a reason to reject a distinct algorithm. Rejection is only for a same-object no-gain/direct-absorption finding, a trivial/parameter-only residual, or failure to state a finite, auditable fidelity route.

## Six-dimensional residual review

| Object | Decision rule and two mechanisms | Information and complexity/resource | Quality / same-function and full cost | Natural carrier; generalization and no-gain boundary | Result |
|---|---|---|---|---|---|
| **A fixed SPIR-V binary module with its value/ID graph unchanged** | **M1 (current):** `CompactIdsPass` renumbers IDs and their uses. **M2 (hypothesis):** whole-module use/def ordering plus ID assignment to reduce encoding cost. | Both see the complete module graph. The hypothetical global ordering can be polynomial, but has no meaningful binary-cost objective under the standard word encoding. | Same function would be validator acceptance and identical module semantics. Full cost includes rewriting every ID use and running the native validator. SPIR-V IDs occupy fixed 32-bit words: lowering a numeric ID does not shrink an operand. | Natural carrier: compiler-emitted SPIR-V modules; native oracle: `spirv-val`. This conclusion generalizes to ID operands encoded as fixed words. No-gain: only a different representation/codec or a performance-only consumer effect could benefit, which changes the frozen object/denominator. | `DROP_SAME_OBJECT_NO_GAIN_AND_CURRENT_COMPACTION`: M2 has no retained cost residual, while M1 already covers remapping. No Stage A route. |
| **One Brotli-compatible lossless stream for a fixed natural byte sequence** | **M1 (current):** quality/mode/window/block controls, current `BrotliSplitBlock`, clustering, and `BrotliStoreMetaBlock`. **M2 (hypothesis):** a time-budgeted joint segmentation/context-clustering constructor rather than a selector over existing quality settings. | Both use the full input and match-history information. M2 would need an explicit finite state/cost model; a broad beam/solver that merely selects encoder configurations is prohibited. Resource denominator would be compression CPU, memory, final bytes, and decoder compatibility. | Same function is bitstream decoding to the exact byte sequence under RFC 7932. Full cost must include model construction, search, entropy-code emission, and any decompression cost. | Natural carrier could be a public text/source/web corpus; native oracle is the RFC decoder. No-gain: if M2 is only a quality/mode/`lgwin`/`lgblock` chooser, or cannot beat M1 at equal encoder budget, it is not a paper mechanism. | `DROP_NO_FINITE_NONTRIVIAL_ACTION_SPECIFICATION`: current source confirms all three construction facets, while M2 remains an unfrozen generic search family rather than one complete atomic algorithm. This is not a claim that a future concrete joint algorithm is impossible. |
| **One JVM `.class` file with bytecode/control-flow semantics unchanged** | **M1 (current):** normal constant-pool interning/insertion during class writing. **M2 (hypothesis):** global constant-pool index assignment to keep high-frequency loadable constants in one-byte `ldc` slots. | M2 needs the whole class and use frequencies. The only width-sensitive decision is membership in the first 255 loadable constant-pool indices; after accounting for class-file restrictions, the direct objective is frequency ranking, not a new hard construction problem. | Same function is JVM verification/loading plus identical bytecode behavior. Full cost includes reindexing every reference, stack-map/attribute preservation, class writer time, and byte length. | Natural carrier: ordinary `.class` files in public Java artifacts; native oracle: JVM verification. No-gain: long/double slot rules and all non-`ldc` references do not create the proposed variable-width saving; global rewriting cannot turn this simple priority choice into N2. | `DROP_TRIVIAL_RESIDUAL__NO_NONTRIVIAL_N2`: a frequency ordering is insufficiently novel; any extension that changes bytecode, attributes, or semantics is out of object. |

## Current-upstream reality check

Frozen current revision checks were performed without download or execution:

- SPIRV-Tools HEAD `388f5af1a6d4a4df4ab9bf69a1817255952e6ef1`: current `source/opt/compact_ids_pass.cpp` contains `CompactIdsPass`; `source/val/validate.cpp` contains validation.
- Brotli HEAD `8e10eeb3378f6c459dbaf033ca6727e9816afccb`: `c/include/brotli/encode.h` exposes `BrotliEncoderSetParameter`; current sources contain `BrotliSplitBlock` in `c/enc/block_splitter.c` and `BrotliStoreMetaBlock` in `c/enc/brotli_bit_stream.c`. The checked parameter surface includes quality, mode, window and block controls; no absence claim is made.
- JVM semantics are frozen against [JVMS §4](https://docs.oracle.com/javase/specs/jvms/se25/html/jvms-4.html). The official ASM upstream endpoint was reachable, but an exact revision/source-symbol record sufficient to make an implementation-absence claim was not obtained; this review makes none.

## Outcome

`COMPLETE_ZERO_PROPOSALS`.

None of the three reviews yields a grounded brief. The SPIR-V and JVM rows are same-object no-gain/nontriviality failures. Brotli has natural semantics and a conceivable future route, but not a named, finite joint constructor distinct from the full current construction union; promoting it would violate the no-wrapper/no-opaque-solver rule. No experiments, downloads, benchmarks, or downstream directories were created.
