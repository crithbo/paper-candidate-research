# Exact public anchors — Source59 S2

| RQ | Fixed object / semantics | Official anchor | Evidence role |
|---|---|---|---|
| RQ-S59-01 | Fixed ELF inputs, entry/export policy and stock dynamic-unwind behavior | GNU ld manual, accessed 2026-08-15: https://sourceware.org/binutils/docs/ld.html | ANCHOR/CURRENT |
| RQ-S59-02 | Fixed Go package/object set, target and stock runtime `findfunc`/reflection behavior | Go linker `pcln.go`, accessed 2026-08-15: https://go.dev/src/cmd/link/internal/ld/pcln.go | ANCHOR/CURRENT |
| RQ-S59-03 | Fixed ELF inputs and stock unwind/output behavior under LLD/ELF | LLVM LLD documentation, accessed 2026-08-15: https://lld.llvm.org/ | ANCHOR; current source locus in LLVM LLD ELF input-section handling |

The anchors establish only object boundaries and known stock behavior. They do not establish novelty or a paper-quality residual.
