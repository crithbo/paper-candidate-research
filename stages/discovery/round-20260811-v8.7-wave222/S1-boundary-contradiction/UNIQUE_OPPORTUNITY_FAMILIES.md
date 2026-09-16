# UNIQUE_OPPORTUNITY_FAMILIES

| ID | same-object contract | current action union to subtract | natural carrier / oracle | full-cost denominator |
|---|---|---|---|---|
| U01 | A fixed x86-64 function/program targeting APX, with identical result, exception, SysV/Win64 ABI as applicable, frame layout and unwind legality. | Intel APX legal encodings; LLVM X86 APX feature/instruction selection + global RA + spill/frame/prologue/epilogue + post-RA scheduling; GCC APX lowering/RA; binutils assembler/objdump legality; legal caller/callee-save choices. | Public CPU programs with integer pressure: compression, parsers, crypto, and compiler test-suite kernels. StageA oracle: compiler/assembler acceptance, objdump encoding and unwind verification, deterministic output; llvm-mca only as a later static-throughput route. | compile CPU time and RSS; object/text size; instruction/prefix bytes; spill/reload and save/restore count; static frontend/uop estimate; run-time cycles/memory when hardware becomes available.

The object excludes a different calling convention, post-link rewriter, custom assembler, or an APX-off target.
