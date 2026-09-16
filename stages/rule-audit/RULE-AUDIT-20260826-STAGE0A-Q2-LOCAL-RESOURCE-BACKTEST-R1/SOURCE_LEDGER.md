# Source Ledger

本表只用于 PACKER 定位身份和 artifact；EXECUTOR 不得看到题名、venue、URL 或最终结果。

| Case | Primary publication/source | Public artifact or implementation | Resource note |
|---|---|---|---|
| HNSW | https://arxiv.org/abs/1603.09320 | https://github.com/nmslib/hnswlib | header-only/Python, low risk |
| ANN-Benchmarks | https://arxiv.org/abs/1807.05614 | https://github.com/erikbern/ann-benchmarks | use direct small runner, no Docker |
| egg | https://arxiv.org/abs/2004.03082 | https://github.com/egraphs-good/egg | Rust, bounded tests |
| cvc5 | https://cvc5.github.io/publications.html | https://github.com/cvc5/cvc5 | Windows binary/build preflight |
| Carcara | https://link.springer.com/chapter/10.1007/978-3-031-30823-9_19 | https://github.com/ufmg-smite/carcara | Rust, small proof corpus |
| Source compression | https://www.sciencedirect.com/science/article/pii/S0164121225000974 | https://github.com/acubeLab/PPC_utils4BigData | small public sample only |
| PGM-index | https://pgm.di.unipi.it/ | https://github.com/gvinciguerra/PGM-index | header-only C++, low risk |
| ALEX | https://arxiv.org/abs/1905.08898 | https://github.com/microsoft/ALEX | repository documents Windows CMake |
| Pythia | https://github.com/CMU-SAFARI/Pythia | same | Stage 0/routing control only |
| Berti | https://github.com/agusnt/Berti-Artifact | same | Stage 0/routing control only |
| BOLT | https://arxiv.org/abs/1807.06735 | https://github.com/llvm/llvm-project/tree/main/bolt | Stage 0/routing control only |
| A Mess | https://arxiv.org/abs/2405.10170 | https://github.com/bsc-mem/Mess-2.0 | Stage 0/routing control only |
| WebGraph alternate | https://arxiv.org/abs/1011.5425 | https://github.com/vigna/webgraph | small Java graph |
| Alive2 alternate | https://web.ist.utl.pt/nuno.lopes/pubs.php?id=alive2-pldi21 | https://github.com/AliveToolkit/alive2 | only with localized LLVM/Z3 |

Venue/quartile evidence must be pinned by PACKER for the publication year. Current or 2026 quartile alone is not a substitute for the historical gold label. Top-conference equivalence must be stated explicitly rather than silently treated as a journal quartile.

