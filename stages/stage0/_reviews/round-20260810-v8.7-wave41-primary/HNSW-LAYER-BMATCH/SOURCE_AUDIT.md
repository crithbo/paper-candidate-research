# Source and Collision Audit — HNSW-LAYER-BMATCH

## Scope and integrity boundary

- cutoff: `2026-08-10`
- role: independent Stage0 PRIMARY
- source policy: paper originals, official upstream source/docs, author artifacts
- status: `SEARCH_BOUNDED_OPEN`
- transport rule: one Git transport attempt failed with Windows Schannel `SEC_E_NO_CREDENTIALS`; this review makes no absence inference from that failure. After the mainline boundary, no further retrieval was attempted.

## Frozen Discovery provenance

All four Discovery payload entries were recomputed and matched the supplied manifest:

| File | SHA-256 |
|---|---|
| `TOPIC_BRIEF_HNSW_LAYER_BMATCH.md` | `ca7af7c3834da6de771589e50b5df54a94c0f53a1666a233d91eea0d60599ef1` |
| `SOURCE_COLLISION_MATRIX.md` | `7ee8211fabbd3f46943c6a558e097c3edb58c5c916a3c12e3642fb4fc10f0101` |
| `DISCOVERY_LOG.md` | `f61101b7529cad9368b9dfe8f38002fbe6a179d65dacd4860f17696368049f31` |
| `handoff.yaml` | `7ee6cec349b2556f917d26cb1b431609b3ae4eb415c21c4db1ce24539da96dfd` |

Discovery manifest self-hash matched `01c3b8a778cf49ef7a102cffff744d00cf6727c8a9f015b1d08be611668c4a15`.

## Current-source reality check

### hnswlib

- Official repository: <https://github.com/nmslib/hnswlib>
- Reviewed source path: <https://github.com/nmslib/hnswlib/blob/master/hnswlib/hnswalg.h>
- Discovery pin: `d9b3608...`
- Observed action surface: `M`, `maxM_`, `maxM0_`, `ef_construction_`, construction seed/insertion effects, `getNeighborsByHeuristic2`, reciprocal link insertion/pruning in `mutuallyConnectNewElement`, native `saveIndex`/`loadIndex`.
- Finding: current native action is local/incremental, but it is a strong baseline and candidate-information provenance anchor. No claim is made that every branch/config was exhaustively excluded.

### Faiss

- Official repository: <https://github.com/facebookresearch/faiss>
- Reviewed HNSW source: <https://github.com/facebookresearch/faiss/blob/main/faiss/impl/HNSW.cpp>
- Official HNSW wiki: <https://github.com/facebookresearch/faiss/wiki/Faiss-indexes#hnsw-variants>
- Discovery pin: `02dbb4e...`; current reviewed branch/release surface was newer.
- Observed action surface: local candidate search/selection and reciprocal link addition/pruning; `M`, `efConstruction`, preset levels, `keep_max_size_level0`, `prune_headroom`, similarity handling; query controls include `efSearch` and queue/termination choices.
- Finding: no reviewed current source path directly implemented layerwide connected b-matching. This is a bounded finding, not an exhaustive absence proof.

## Decisive direct subtractor

### Yang et al., PVLDB 2025

- Paper: Shuo Yang et al., “Revisiting the Index Construction of Proximity Graph-Based Approximate Nearest Neighbor Search.”
- Official paper: <https://www.vldb.org/pvldb/vol18/p1825-liu.pdf>
- DOI: <https://doi.org/10.14778/3725688.3725709>
- Author artifact: <https://github.com/xdyangsh/FastKCNA>
- Verified boundary: the paper preassigns HNSW layers and builds them globally, layer by layer; Algorithm 7 presents `OptHNSW`. The artifact documents a FastHNSW mode and states its index structure is the same as hnswlib, with a degree parameter corresponding to HNSW `M`.
- Evaluation boundary: includes Sift1M, Gist1M, Msong, Crawl, Glove and Deep1M and reports repeated CPU construction/query evaluation.
- Collision classification: `DIRECT_SUBTRACT__GLOBAL_LAYERWISE_HNSW_CONSTRUCTION`; not proven direct-fatal to an integrated connected degree-bounded b-matching guarantee.

## Additional first-party or original-source anchors

### Original HNSW

- Paper: Yu. A. Malkov and D. A. Yashunin, “Efficient and Robust Approximate Nearest Neighbor Search Using Hierarchical Navigable Small World Graphs,” IEEE TPAMI.
- DOI: <https://doi.org/10.1109/TPAMI.2018.2889473>
- Role: exact object, standard construction/search and quality-shape anchor.

### Graph-based ANN optimization / reverse connection

- Author-hosted paper: <https://nicsefc.ee.tsinghua.edu.cn/nics_file/pdf/ffb3b2b1-990d-487b-b979-7c4fe6cd536f.pdf>
- Reviewed contribution boundary: reverse connection enhancement and degree/connectivity-aware graph-search optimization.
- Role: subtracts simple reciprocal-connectivity and degree-balancing claims; not verified as exact connected b-matching on frozen HNSW layers.

### Generic b-matching graph construction

- Fujiwara et al., “Efficient Algorithm for the b-Matching Graph,” KDD 2020: <https://dl.acm.org/doi/10.1145/3394486.3403146>
- Role: direct method-kernel subtractor for b-matching-based high-dimensional graph construction.

### b-Suitor

- Manne and Halappanavar, “New Effective Multithreaded Matching Algorithms,” SIAM Journal on Scientific Computing.
- DOI: <https://doi.org/10.1137/15M1026304>
- Role: scalable approximate b-matching/algorithmic control; any candidate guarantee must identify its added HNSW constraint rather than rebrand matching.

### ANN-Benchmarks

- Aumüller, Bernhardsson and Faithfull, “ANN-Benchmarks: A Benchmarking Tool for Approximate Nearest Neighbor Algorithms,” Information Systems.
- DOI: <https://doi.org/10.1016/j.is.2019.02.006>
- Official artifact: <https://github.com/erikbern/ann-benchmarks>
- Role: reproducibility and matched-quality evaluation anchor, not an algorithm collision.

## Adjacent construction families

The already reviewed source set also contained or identified parallel/batch ANN construction such as ParlayANN/ParlayHNSW, PiPNN, CAGRA, and HNSW merge work. They subtract broad claims about batch, parallel or global graph building. On the bounded reviewed evidence they do not establish the exact fixed-layer, fixed-candidate-graph connected b-matching action and native HNSW guarantee. They remain `SEARCH_BOUNDED_OPEN` rather than evidence of absence.

## Collision synthesis

| Claim fragment | Status | Reason |
|---|---|---|
| First global/layerwise HNSW construction | `ABSORBED` | FastHNSW/FastKCNA, PVLDB 2025 |
| Batch/offline HNSW construction | `ABSORBED_OR_HEAVILY_SUBTRACTED` | FastHNSW plus adjacent parallel/batch work |
| Degree-capped selection by generic b-matching | `METHOD_KERNEL_ABSORBED` | b-matching graph and b-Suitor genealogy |
| Connectivity improvement via reverse links | `HEAVILY_SUBTRACTED` | native reciprocal logic and prior graph-ANN optimization |
| Integrated same-information connected degree-bounded selector with capacity-respecting repair and nontrivial guarantee | `SEARCH_BOUNDED_OPEN` | not directly covered in obtained sources, but not yet defined/proved distinct by candidate |

## Source-correct claim ceiling

The candidate may claim only a new integrated algorithm/guarantee after explicitly comparing against FastHNSW and generic b-matching plus fair repair. It may not claim first global HNSW construction, first layerwise builder, first batch HNSW, first degree-constrained ANN graph, or current performance superiority.

