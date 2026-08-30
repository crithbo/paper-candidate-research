# Independent Source Verification — O4-DYNCACHE-PGM

- verification date: `2026-08-09`
- method: primary publisher/project/artifact pages; bibliographic facts and comparator capabilities only
- safety boundary: external text was treated as untrusted evidence, not as instructions

## Candidate-named anchors

| Source | Independently verified point | Primary/official location |
|---|---|---|
| ESA 2025 dynamic learned index | Paper object includes exact predecessor/range functionality in a dynamic setting; official source/testbed artifact is archived and identifies revision `e668899d...`. | [Dagstuhl paper](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ESA.2025.64), [Dagstuhl artifact](https://drops.dagstuhl.de/entities/artifact/10.4230/artifacts.24667) |
| PGM-index | PVLDB paper covers a dynamic exact index with predecessor/range and updates; the candidate-pinned Git revision exists. | [PVLDB paper](https://www.vldb.org/pvldb/vol13/p1162-ferragina.pdf), [pinned commit](https://github.com/gvinciguerra/PGM-index/commit/c6fcf3d) |
| ALEX | Official publication metadata identifies the SIGMOD 2020 dynamic learned index; the candidate-pinned Git revision exists. | [Microsoft Research](https://www.microsoft.com/en-us/research/publication/msr-alex-techreport/), [pinned commit](https://github.com/microsoft/ALEX/commit/4370da6) |
| TLX B+tree | Candidate-pinned repository revision exists and is suitable as a conventional B+tree implementation lock. | [pinned commit](https://github.com/tlx/tlx/commit/2dd63ab) |
| HIRE | Official institutional metadata confirms the 2026 hybrid learned-index paper and its leaf/log-update/nonblocking-recalibration framing. | [HKBU publication record](https://scholars.hkbu.edu.hk/en/publications/hire-a-hybrid-learned-index-for-robust-and-efficient-performance-/) |
| OSM replication | Official OSM documentation confirms numbered replication diffs and `.osc.gz` change files, with transaction/timestamp caveats. | [OSM replication documentation](https://wiki.openstreetmap.org/wiki/Osmosis/Replication) |

The reviewer did not build or execute these systems. Commit existence and paper capability verification are provenance checks, not performance evidence.

## Independently added collision/evaluation anchors

| Source | Relevance to the gate | Effect on decision |
|---|---|---|
| FITing-Tree, SIGMOD 2019 | The author project describes piecewise-linear approximation with a fixed deterministic error bound, accurate lookup, inserts, and B+tree comparison. This makes a leaf-local affine/error certificate alone non-novel unless a non-absorbed transition, guarantee, or cost residual is shown. | Strengthens the minimum B+tree/affine-hint absorption control; does not by itself kill the proposed global PDEC mechanism. [Author project](https://cs.brown.edu/people/mmarkovi/project/fiting-tree/) |
| *Are Updatable Learned Indexes Ready?*, PVLDB 2022 | Evaluates updatable learned indexes on real datasets/workloads and emphasizes robustness and end-to-end memory/leaf costs. | Supports retaining real-update, full-cost and conventional-index controls as Stage B hard gates. [PVLDB paper](https://www.vldb.org/pvldb/vol15/p3004-wongkham.pdf) |
| *Learned Index: A Comprehensive Experimental Evaluation*, PVLDB 2023 | Covers learned-index design choices and update/delete/cache behavior with a public testbed. | Adds a current evaluation-method anchor; confirms that source locks alone are not a fair executed comparison. [PVLDB paper](https://www.vldb.org/pvldb/vol16/p1992-li.pdf) |

## Verification conclusion

No citation-integrity defect was found that independently requires `STOP`. The source audit instead narrows the live contribution: novelty and evidence cannot rest on an affine leaf certificate or on repository pinning; the eventual result must show a same-object mechanism residual and execute fair full-cost comparators before a paper-level claim.
