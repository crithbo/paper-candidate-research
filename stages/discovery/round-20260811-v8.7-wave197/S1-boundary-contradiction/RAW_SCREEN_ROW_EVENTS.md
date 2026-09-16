# RAW_SCREEN_ROW_EVENTS

| Row | Event | Primary evidence | Minimum action witness | Disposition |
|---|---|---|---|---|
| R01 | RVV `vstart` + FOF + trap/restart call-state seam, narrowed from Wave187 general V state | current RISC-V ratified V spec; July 2026 RISC-V psABI; RVV intrinsic spec; current GCC/LLVM/QEMU upstream entrypoints | An interrupted vector load can restart the same instruction at hardware-provided `vstart`; a FOF load may instead reduce `vl` after a later synchronous fault. | `CANDIDATE_GRADE_DEEP_REVIEW` |

The witness is native and legal, but it does not itself establish a compiler-controlled action gap.

