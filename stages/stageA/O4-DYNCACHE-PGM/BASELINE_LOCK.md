# O4-DYNCACHE-PGM baseline and collision lock

- Verification date: 2026-08-09 (Asia/Shanghai)
- Method: official publication pages plus read-only GitHub repository metadata; no baseline code was downloaded, built, or benchmarked in Stage A.
- Collision state: `SEARCH_BOUNDED_OPEN_WITH_DIRECT_SUBTRACT`

| Role | Primary source | Frozen source revision | Stage A disposition |
|---|---|---|---|
| Strongest same-object theorem/artifact | [Gæde et al., ESA 2025](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ESA.2025.64) | `Sgelet/DynamicLearnedIndex@e668899dab95046384f68723e53e0aacbad32feb`; `Sgelet/LearnedIndexBench@c3ad0ca2e0149fd2be070b37ba57b12a447bbf71` | Official paper page lists both artifacts. Mandatory executable comparator in any authorized Stage B. |
| Contiguous fully dynamic learned-index baseline | [Ferragina and Vinciguerra, PGM-index, PVLDB 2020](https://www.vldb.org/pvldb/vol13/p1162-ferragina.pdf) | `gvinciguerra/PGM-index@c6fcf3d34e55eb0061b01e2f49dfcbdb711f1407` | Same exact predecessor/range/update family; mandatory deployment baseline. |
| Adaptive learned-index baseline | [Ding et al., ALEX, SIGMOD 2020](https://arxiv.org/abs/1905.08898) | `microsoft/ALEX@4370da6aa8b509fdc9b0d2c49faa0624b0078589` | Mandatory deployment baseline. |
| Conventional ordered-index baseline | [TLX repository](https://github.com/tlx/tlx) | `tlx/tlx@2dd63ab839909f0b43cd02108a1869c4670b2c8e` | `tlx::btree`; mandatory exact B+tree baseline. |
| Latest systems subtractor | [Zhang et al., HIRE, PACMMOD 2026](https://doi.org/10.1145/3786657) | DOI record; no executable revision frozen | Subtracts hybrid leaves, log-based updates, tail stability, and nonblocking cost-driven recalibration. It is not evidence for PDEC's page certificate or dual-version bound. |

The current search did not identify a primary source that simultaneously provides a page-local affine certificate, a charged per-update page-touch cap, exact predecessor/output-sensitive range semantics, and a fixed dual-version peak-space cap. This is a bounded search observation, not a global novelty claim.
