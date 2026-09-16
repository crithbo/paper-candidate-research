# Source29 current-union matrix

| family | bounded current union | result |
|---|---|---|
| Intel ESIMD ABI/lowering | documented split, accessor ABI, lowering pass, post-link and runtime setup | C0/deep: `NOT_ADMITTED_UNFROZEN`; no target-specific union-external algorithm frozen |
| MLIR-AIE DMA/lifetime | native DMA waits, locks, runtime parameter writes | controller/configuration; excluded before raw |
| XRT AIE BO ping-pong | stock sync/async/wait/ping-pong forms | current union/configuration; excluded before raw |
| SYCL command graph memory | graph buffer/accessor/memcpy/update design | LOCATOR_ONLY; action not frozen |

Bounded search used only official first-party documentation on 2026-08-14; no global novelty claim.
