# Source / collision matrix — Wave280

| facet | primary source | result |
|---|---|---|
| ABI state | [Arm ACLE](https://arm-software.github.io/acle/main/acle.html); [AAPCS64](https://kib.kiev.ua/x86docs/ARM/abi-aa/aapcs64.pdf) | streaming/ZA interfaces and save buffer are native contract |
| LLVM call decision | [SMECallAttrs source](https://llvm.org/doxygen/AArch64SMEAttributes_8h_source.html); [lazy-save review](https://reviews.llvm.org/D133900) | mode change, lazy save, ZT0 and ZA preservation are current actions |
| LLVM frame | [Frame lowering](https://llvm.org/doxygen/AArch64FrameLowering_8cpp_source.html); [PrologueEpilogue](https://llvm.org/doxygen/AArch64PrologueEpilogue_8cpp_source.html) | scalable spills, CFI and SME hazards are included |
| GCC competitor | [GCC SME patch](https://gcc.gnu.org/pipermail/gcc-patches/2022-November/605912.html) | cooperative lazy save and full save/restore are same-object choices |
| papers | no verified primary paper was found that adds a different SME call-boundary joint N2 | bounded search is not novelty proof; current union absorption is decisive |
