# Depth red-team: M01

## Complete action-space subtraction

| required dimension | frozen observation | residual conclusion |
|---|---|---|
| decision rule | lld builds a compressed prefix trie from exports via radix partitioning; it writes edges/nodes after a ULEB offset fixed point | arbitrary edge factoring/node serialization is not automatically outside the native constructor |
| information condition | fixed names, addresses, flags, and ordinals | a frequency list is extra deployment/profile information and cannot be silently assumed |
| resource / complexity | lld’s explicit trie and offset iteration make link CPU/RSS and bytes first-class costs | no new complexity/guarantee is established |
| quality / guarantee | dyld and `llvm-objdump` must recognize identical exports, values, flags, and ordinals | changing reader semantics or export contract is forbidden |
| full cost | link CPU/RSS/temp + final bytes + loader lookup/startup are required | an emission-only byte count is insufficient |
| generalization / no-gain | needs multiple naturally occurring export maps and stock-reader validation | no result is claimed |

## Minimal legal action-divergence witness

For names `_bar`, `_baz`, the native implementation already shares `_ba` on a trie edge; then it serializes child offsets by a fixed point. Replacing it with a different traversal order can affect byte offsets or lookup path order, but—without a frozen legal Apple/LLVM union and an independently stated read-cost contract—it is either the existing `-exported_symbols_order` style action, ordinary emitter ordering, or an unproven altered-reader action. It is not yet a union-external N2 witness.

## Current outcome

`NOT_ADMITTED_UNFROZEN__APPLE_LD64_RELEVANT_FLAG_TO_SERIALIZATION_UNION_NOT_CLOSED`.

This is not a scientific DROP and is not caused by lack of implementation, hardware, results, or AI readiness. The LLVM half demonstrates direct overlap with the obvious factor/serialize proposal; the Apple half prevents asserting that the fair strongest union is exhaustive. Therefore neither a brief nor a `PROPOSE_STAGE0` is authorized.

## Conditional ≤72h killer after union closure

Freeze a macOS/Xcode ld64 version and its exact export-order/options; produce 20–50 fixed dylibs from public sources; compare all current-union corner actions against one specified whole constructor; verify exported names/addresses/flags with `llvm-objdump` and dyld; then measure linker CPU/RSS/temp, file bytes, and cold lookup/startup. Stop if the candidate action is expressible by the same-information union, alters the fixed export contract, or loses under the complete denominator.

