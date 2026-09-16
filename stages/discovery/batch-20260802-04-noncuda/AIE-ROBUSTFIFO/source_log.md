# AIE-ROBUSTFIFO source log

Search date: 2026-08-02. Query families: `MLIR AIE ObjectFIFO allocation lock`, `SDF robust buffer allocation burst`, `AIE FIFO placement scheduling`.

| Source | Type | Relevance / collision class |
|---|---|---|
| [MLIR-AIE ObjectFIFO design patterns](https://xilinx.github.io/mlir-aie/AIEDesignPatterns.html) | official documentation | executable object semantics: lowering allocates buffers and locks; deployment baseline |
| [MLIR-AIE distribute-L2 example](https://xilinx.github.io/mlir-aie/dev/programming_guide/section-2/section-2f/04_distribute_L2/) | official example | public multi-FIFO graph/artifact for first evidence |
| [MLIR-AIE repository](https://github.com/Xilinx/mlir-aie) | open artifact | compiler/emulation substrate |
| [SDF buffer minimization survey entry](https://doi.org/10.1109/TCAD.2012.2190788) | literature | methodological adjacent: deterministic buffer allocation, not yet established as direct coverage |

Search-bounded result: no source was located that simultaneously fixes AIE ObjectFIFO lock/DMA semantics and optimizes correlated bounded-burst reservations. This is not a novelty conclusion.
