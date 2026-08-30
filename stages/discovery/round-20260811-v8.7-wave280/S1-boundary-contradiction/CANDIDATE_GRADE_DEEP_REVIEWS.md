# Candidate-grade deep review — Wave280

## Current upstream reality

[LLVM `SMECallAttrs`](https://llvm.org/doxygen/AArch64SMEAttributes_8h_source.html) defines `requiresSMChange`, `requiresLazySave`, `requiresPreservingZT0` and `requiresPreservingAllZAState`; lazy save is precisely guarded by caller/callee ZA-interface conditions. The [LLVM SME lazy-save review](https://reviews.llvm.org/D133900) exposes `SMSTART`, `SMSTOP` and `RESTORE_ZA`, and explains why frame-index calculations cannot be inserted across the mode transition/call boundary. [AArch64 FrameLowering](https://llvm.org/doxygen/AArch64FrameLowering_8cpp_source.html) and [PrologueEpilogue](https://llvm.org/doxygen/AArch64PrologueEpilogue_8cpp_source.html) include scalable save/frame/CFI and SME-hazard paths.

[Arm ACLE](https://arm-software.github.io/acle/main/acle.html) makes these attributes ABI-visible and describes calls as optimization hints to avoid unnecessary save/restore. The official [AAPCS64](https://kib.kiev.ua/x86docs/ARM/abi-aa/aapcs64.pdf) includes ZA save-buffer rules. GCC's original [SME attribute patch](https://gcc.gnu.org/pipermail/gcc-patches/2022-November/605912.html) states that distinct ZA contexts use the ABI's cooperative lazy-saving scheme, with full save/restore available.

## Forced-witness and N2 test

The tempting witness is a ZA-using streaming caller invoking a private-ZA callee: a lazy save path and a full-save path can both be ABI legal. It is **not** a forced divergence witness. The current LLVM/GCC unions already enumerate exactly this interface-derived choice, and the ABI permits both. A candidate whole-trace scheduler cannot be forced to choose a different action using the same information without either reselecting an existing interface/action, changing an attribute/ABI guarantee, or becoming a generic register/frame allocator.

No target-specific state quotient, finite transition algorithm, approximation guarantee or no-gain boundary independent of that existing action table was certified. The contribution would be ordinary cost policy/flag selection, generic RA, or wrapper control.

**Decision:** `DROP__CURRENT_SME_CALLBOUNDARY_LAZYSAVE_FRAME_UNION_ABSORBS_OBJECT`. This is a direct union/guarantee decision, not a claim about implementation, results, hardware, resources or AI readiness.

## Finite 72-hour killer

Any future new object must pin current LLVM/GCC and Arm PCS; provide one public SME caller/callee trace whose same attributes force a candidate whole-trace action not expressed by `SMECallAttrs` plus call/frame union; pass assembler/disassembler, machine verifier and PCS/CFI object checks; and show a strict Pareto/guarantee under compile CPU/RSS, code bytes, save-buffer/frame/scalable spill, transitions and runtime. Kill on current-union expression, changed interface/ABI, generic solver/cost policy, failed oracle, or no strict point. No execution occurred.
