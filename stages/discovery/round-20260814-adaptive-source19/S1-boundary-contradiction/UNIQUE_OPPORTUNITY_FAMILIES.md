# Unique opportunity families

| Signature | Exact object and fixed guarantee | Natural carrier / oracle | Strongest current union |
|---|---|---|---|
| CUDA memory synchronization domains | CUDA kernels with fixed C++ memory-model ordering | CUDA memory-model litmus kernels; CUDA semantics | domain launch attributes/mapping plus required system/device fencing |
| OpenCL SVM scope | OpenCL SVM atomics with fixed visibility/order | OpenCL atomic/SVM examples; OpenCL conformance semantics | OpenCL scope/capability and queue synchronization rules |
| RISC-V Ztso | C/C++ atomics on a Ztso target, fixed language ordering | GCC/LLVM atomic tests; assembler/disassembly | target ISA selection and current atomic mappings |
| AArch64 FPMR FP8 | AArch64 FP8 call graph, fixed FP8 values and AAPCS64 | FP8 intrinsic call loops; assembler/disassembly and ABI checks | ABI caller-save rule; compiler FPMR lowering and redundant-write avoidance |
| Wasm exception tag | Wasm module exception execution semantics | public Wasm exception modules; validator/engine result | Wasm validation/binary/runtime exception handling |
| SPARC register windows | SVR4 function call semantics | ABI/compiler test programs; assembler/unwind behavior | ABI save/restore and compiler call lowering (not fully closed here) |
