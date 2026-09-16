# Candidate-grade deep reviews

## D1 LevelDB restart/prefix grouping

Fixed sorted records and stock iterator semantics; two legal group/restart placements are a static witness. Current union must include block-builder restart interval, compression, table layout and all reader-facing options. Natural route is a versioned KV trace; full cost is build/read CPU-RSS-temp-bytes/seek. Only a target-specific bounded local-search/FPT guarantee beyond native composition could qualify. Source union and direct collision are unclosed; **NOT_ADMITTED_UNFROZEN**. Killer: source-pin, enumerate all block paths/options, verify two iterator-equivalent blocks, subtract current LevelDB/index methods, reject generic packing/absorption.

## D2 LLVM GlobalMerge joint coalescing

Fixed IR/ABI/object semantics with LLVM verification/runtime oracle; legal alternate global groups provide a witness only when alignment/address observables are preserved. Full cost: compile/link CPU-RSS/temp/object size/runtime; natural carrier LLVM test suite. Candidate needs target-specific approximation/guarantee beyond current pass composition, not pass ordering or flags. Current source/default/collision closure is incomplete; **NOT_ADMITTED_UNFROZEN**. Killer: pin pass/options, two ABI-equivalent outputs, compare composition, reject semantic/address drift.

## D3 graph-tool coarsening constructor

Fixed graph/properties and query/verifier semantics; alternate coarsening partitions provide a legal witness. Natural public graph corpus; full construct/query CPU-RSS/memory cost. A retained idea needs a specific coarsening guarantee, not generic matching/solver. Upstream action union and direct collision are unclosed; **NOT_ADMITTED_UNFROZEN**. Killer: source pin, enumerate configs, oracle-equivalent witness, direct subtraction and bound statement.
