# UNIQUE_OPPORTUNITY_FAMILIES

| ID | exact object / fixed guarantee | current complete action union | natural carrier and oracle | full cost |
|---|---|---|---|---|
| U01 | One AArch64 SVE PCS program at one fixed target: public calls retain AAPCS64 register/stack semantics, output values, and language exception behavior. | (1) front-end SVE PCS attribute/IR calling convention; (2) LLVM AArch64 callee-saved SVE CSR and prologue/epilogue/register-allocation lowering; (3) GCC AArch64 SVE PCS lowering and target options; (4) inlining, tail-call formation, and interprocedural optimization when legal; (5) standard linker/runtime ABI behavior. | Public Arm SVE intrinsic kernels with an opaque separately compiled helper; compiler diagnostics + ABI-aware objdump inspection + same-output run oracle. | compile time; object/code size; scalable spill/reload bytes and instructions; call-path cycles; stack footprint and peak RSS.

The public boundary is material: SVE/PST arguments or returns make full `z8–z23` and `p4–p15` preservation a PCS condition. This is distinct from the excluded SME/ZA state model.
