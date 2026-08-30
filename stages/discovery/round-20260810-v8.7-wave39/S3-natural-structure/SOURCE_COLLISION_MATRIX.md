# Source / collision / action-divergence matrix — WAVE39

## Exclusion boundary

Excluded without re-entry: UST and all Wave30 lines; Wave34 `UST-SEGMENTED-FORMAT-COVER` (now independently in Stage 0); registry-active/blocked/terminal CVC5, Parquet, LLVM bitcode, Git, RocksDB, PB, S1/S4/S5, and other named terminal objects. No terminal object is renamed or revived.

## Current upstream reality and six-dimensional subtraction

| Lead | Decision rule | Information condition | Complexity / resource | Quality / guarantee | Full cost | Generalization / no-gain | Verdict |
|---|---|---|---|---|---|---|---|
| **WebGraph forest** | Choose one legal backward parent or root for each adjacency list, plus residual/interval code, jointly subject to window and reference-depth bounds. | Immutable graph order and successor lists only; fixed bounds and no measured decode-time oracle. | A bounded dynamic program/min-cost forest over legal backward edges; directory/offset construction and memory bounded by native format rules. | Exact successor-list recovery; feasibility under fixed random-access depth. Optimize a frozen compressed-size-plus-access surrogate, not claim an unproved wall-time guarantee. | Source graph scan, compressed stream, offsets, reference metadata, interval/residual code, construction time and sequential/random decode must be charged. | Expected only where nearby lists have overlapping neighborhoods but greedy chains conflict; no gain on low similarity, homogeneous easy gaps, or strict random access making all refs infeasible. | Conditional residual survives: global coupled forest differs from scalar `windowSize`/`maxRefCount` parameters and a local choice only if current compressor lacks equivalent global construction. |
| **BOLT layout** | Reorder/split hot code fragments. | Profile/CFG/size; BOLT has these. | Native profile-driven layout/splitting algorithms and flags. | Same executable, existing optimizer semantics. | Rebuild/profile/layout cost already native. | Any proposed gain tracks ordinary native layout choice. | `DROP__DIRECT_SUBTRACT`. |
| **Wasmtime cache** | Choose sharing/reuse of compile artifacts. | Module contents/cache state. | Cache-key/store policy and compiler strategy. | Safe artifact reuse needs existing serialization/cache rules; cross-module fragments require altered relocation/object semantics. | Cache lookup/storage/precompile/compile charged. | No distinct same-object region once policy is charged. | `DROP__CHANGED_OBJECT_OR_CACHE_POLICY`. |
| **Lucene postings** | Select/rebuild posting block/skip encoding. | Index statistics/query distribution. | Current codecs and per-field postings format already represent legal storage actions. | Cross-term shared blocks alter reader/index format semantics. | Index rebuild, codec metadata and query-time decode required. | Residual reduces to codec configuration or changed format. | `DROP__FORMAT_SELECTOR_OR_OBJECT_CHANGE`. |
| **HDF5 chunks** | Select chunk geometry/filter/residual path. | Dataset dimensions and values. | Existing chunk/filter/cache pipeline. | New cross-chunk representation changes HDF5 filter/chunk contract. | Read/write/filter/cache and metadata costs. | Residual is selection; no separate atomic construction isolated. | `DROP__CHUNK_CONFIG_OR_FILTER_SELECTOR`. |

## WebGraph action-divergence witness

The candidate is **not** a global choice of `windowSize` or `maxRefCount`. Consider three consecutively ordered natural-style successor lists with overlap edges `1→0` and `2→0`; a local rule can take `1→0`, exhaust the permitted chain/depth budget, then encode list 2 from scratch. A global forest may instead make list 1 a root and use `2→0`, reducing the full encoding objective while preserving every list and the same random-access constraint. The witness becomes invalid (and the proposal drops) if current BVGraph construction already enumerates this same constrained forest with the same objective and costs.

## Current-source/facet record for the retained candidate

- Frozen facet/date: published `BVGraph` API `3.6.4` plus public `master` tree, checked `2026-08-10`; `git ls-remote` for `master` was blocked by local `SCHANNEL_SEC_E_NO_CREDENTIALS`, so no mutable SHA is invented and this is not negative evidence.
- Official surface inspected: `src/it/unimi/dsi/webgraph/BVGraph.java` in the public tree; compression/recompression, gap/reference/interval/ζ coding, lazy access, offsets, `windowSize`, `maxRefCount`, `minIntervalLength`, graph version and `randomAccess()`.
- Contrary evidence: WebGraph explicitly offers several compression/access trade-offs and parameters, so any proposal that merely sets them is directly absorbed.
- Narrow absence claim: the current public API documents global bounds and a compressed graph representation, but does not itself establish an equivalent global constrained-reference-forest optimizer. This must be checked against actual pinned compressor source in Stage A; source proof of equivalence is a `DIRECT_FATAL` subtractor.
- No unsupported hidden flag is assumed unavailable. The brief's fidelity plan requires inspection of all constructor/CLI/compressor options before any claim-bearing run.
