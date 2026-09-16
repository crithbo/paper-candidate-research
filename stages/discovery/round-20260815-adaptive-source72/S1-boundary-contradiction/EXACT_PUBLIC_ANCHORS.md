# Exact public anchor

## S72-01 — AArch64 SME TMOP instruction exposure

- Exact anchor: current LLVM AArch64 feature table, `FeatureSME_TMOP` / `sme-tmop`. URL: <https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/AArch64/AArch64Features.td>.
- Current instruction-definition locus: LLVM `AArch64SMEInstrInfo.td`. URL: <https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/AArch64/AArch64SMEInstrInfo.td>.
- Independent current toolchain evidence: GNU binutils GAS NEWS lists `+sme-tmop` support. URL: <https://github.com/bminor/binutils-gdb/blob/master/gas/NEWS>.
- Tentative object envelope: LLVM AArch64 code generation targeting a fixed FEAT_SME_TMOP-enabled architecture and a sparse tile operation.
- Anchor question: is there a same-object compiler construction, rather than instruction/assembler exposure, that selects or composes TMOP actions with a fixed numeric/state contract?

This is an anchor only. It does not establish automatic lowering, a public carrier, an absence claim, or a research residual.
