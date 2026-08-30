# Discovery log — DISCOVERY-S6-20260809-V8.7-WAVE16

- Frozen cutoff: `2026-08-09`.
- Method: accepted discovery v2/v8.1 plus calibrated v8.6 fidelity-plan admission and v8.7 `CURRENT_UPSTREAM_REALITY_CHECK`; the blocked two-axis v8.2r2 was not used.
- No experiment, benchmark, Stage 0/A/B directory, or modification outside this assignment was made.

## Screened object: Lean `.olean` compacted heap region

Lean's current official documentation states that `.olean` contains a serialized environment and compacted heap region, and that the representation is designed for direct memory mapping. It also provides `leanchecker` as a kernel replay tool. The source reality check used current Lean release tag `v4.31.0` (official release documentation) and a current upstream-main source snapshot observed 2026-08-09 at `src/runtime/compact.cpp` and `src/Lean/Environment.lean`.

The observed compactor keeps a max-sharing hash table and routes constructors, arrays, strings, scalar arrays, tasks, promises, and other immutable compactable objects through `save_max_sharing`; its reader has a mapped-at-base fast path that skips the structural fixup walk. The source therefore absorbs the apparent direct candidate “add term/object sharing to `.olean`”. A more compact pointer encoding is not a residual: current `.olean` stores an in-memory image and the existing reader maps/fixes its native pointer representation. Replacing it needs a different reader/format and violates same-object/native-reader semantics.

## Result

`COMPLETE_ZERO_PROPOSALS`. No current-absence claim is used as a novelty conclusion. Existing maximum sharing is a direct current-source absorption fact; format replacement is explicitly dropped rather than relabeled as N2.
