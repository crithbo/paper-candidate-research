# Unique object — Wave280

**Exact object:** fixed AArch64 SME/SME2 call graph, function types/attributes, MachineIR/liveness, CPU/features, ABI, PSTATE.SM/PSTATE.ZA/ZT0 state, ZA save buffer, observable values/exceptions, code and unwind semantics.

**Current strongest union:** Arm ACLE/AAPCS64 contract; LLVM function/call attributes and `SMECallAttrs`; call lowering with SMSTART/SMSTOP/lazy save/restore/ZA/ZT0 transitions; generic RA/coalescing/spills; AArch64 scalable frame, callee-save and CFI; MC/assembler; GCC SME attribute/call-lowering implementation. Flags/attributes include shared/private/agnostic ZA, streaming/streaming-compatible interface and relevant SME feature target selection.

**Natural finite route:** LLVM SME CodeGen tests (including lazy-save call tests) and Arm ACLE SME examples; assembler/disassembler, LLVM machine verifier, PCS/CFI/object oracle. Full cost: compile CPU/RSS, text/object bytes, ZA save-buffer/frame/scalable spill terms, calls/mode transitions, static instruction counts and CPU runtime on an SME-capable route. No route was run.
