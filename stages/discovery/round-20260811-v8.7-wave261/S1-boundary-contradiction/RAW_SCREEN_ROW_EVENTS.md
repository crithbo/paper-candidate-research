# RAW_SCREEN_ROW_EVENTS — Wave261

| event | observed first-party fact | consequence |
|---|---|---|
| E01 | LLVM current-head pin is `cfcdf93...`; LoongArch's `loongarch-enable-merge-offset` is hidden but defaults true. | include the pass and its nondefault disable flag in the strongest union. |
| E02 | LLVM target pipeline declares pre-RA, optimized/fast RA rewrite, pre-emit branch relaxation and final pseudo expansion; `MergeBaseOffset` recognizes PCADD_LO relocation variants. | a fair comparator must include all of those stages, not only the merge pass. |
| E03 | LoongArch ABI defines PC-relative relocation semantics and `R_LARCH_RELAX`. | fixed relocations/unwind/ABI are part of same object. |
| E04 | GCC's official documentation exposes `-mexplicit-relocs=none|always|auto`, `-mrelax`, and their build-time defaults. | macro/relaxation versus explicit relocation is already in the strongest GCC competitor. |
| E05 | binutils official patch describes relaxable `pcala12i+addi.d` and `pcalau12i+ld.d` sequences, and notes scheduling interaction. | source lineage confirms a real seam but also makes an unproved absence claim invalid. |
