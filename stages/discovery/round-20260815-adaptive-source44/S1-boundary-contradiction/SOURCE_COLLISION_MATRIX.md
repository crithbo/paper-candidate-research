# Source44 — preliminary current union and collision matrix

| Family | Current/official locus | Current comparator | Collision status | Discovery result |
|---|---|---|---|---|
| RVV `vxrm` interprocedural transition | `SRC01` psABI, `SRC02` intrinsic semantics, `SRC03` LLVM RVV pipeline, `SRC04` LLVM physical-state source | same LLVM pipeline, ABI and fixed-point program | `SEARCH_BOUNDED_OPEN`; strongest direct paper/source collision is Stage0 debt | clean brief with debt |
| ELF IFUNC timing/form | Source02 terminal record (`SRC05`) | glibc/ld timing/config union | frozen terminal identity | known fatal |

No bounded search non-match is reported as novelty or implementation absence.
