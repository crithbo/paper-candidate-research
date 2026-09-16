# PIM-REDUCECHAIN source log

Search date: 2026-08-02. Query families: `PIM GEMV partial sum reduction placement`, `AiM simulator Ramulator2`, `PIM LLM row scheduling reduction`.

| Source | Type | Relevance / collision class |
|---|---|---|
| [Ramulator 2.0](https://github.com/CMU-SAFARI/ramulator2) | open artifact | cycle-accurate DRAM substrate and trace frontend |
| [AiM Simulator](https://github.com/arkhadem/aim_simulator) | open artifact | GDDR6 AiM simulation built on Ramulator2 |
| [RH+](https://arxiv.org/abs/2606.05511) | paper | `DIRECT_SUBTRACT` for row-hit/stride scheduling; excluded from this object's claim |
| [Newton/PIM GEMV mapping evidence](https://past.date-conference.com/proceedings-archive/2026/DATA/1597.pdf) | paper | adjacent architecture/mapping evidence; reduction semantics require audit |

Search-bounded result: no direct source located for the proposed command-aware, precision-constrained reduction-boundary selection. Stage 0 must check actual simulator support before implementation.
