# UNIQUE_OPPORTUNITY_FAMILIES

| ID | exact object and fixed observable contract | atomic whole action / natural carrier | full-cost denominator | initial subtractor | status |
|---|---|---|---|---|---|
| U01 | One AArch64 SVE PCS program: results and externally visible AAPCS64 register/stack contract are fixed. | Compile a scalable-vector kernel with an opaque call; public SVE intrinsics kernels are the carrier. | compile time, code size, scalable spill/reload traffic, call-path latency, peak stack/RSS. | current LLVM/GCC lowering plus linker/runtime choices under the same PCS. | deep |
| U02 | One x86 process retaining the same PKRU protection outcome for all accesses and signal/call observations. | A keyed-buffer crypto/parser routine with a call around a protected region. | transition instructions, serialization/fence cost, code size, signal/runtime cost, throughput. | current compiler plus OS/runtime and explicit `WRPKRU` placement. | deep |
| U03 | One AArch64 GCS-enabled program retaining the same return/unwind legality and observable result. | C++ exception/unwind and callback programs compiled for GCS. | prologue/epilogue and unwind work, code size, stack/GCS traffic, compile time, latency. | current compiler, linker, unwinder, and architectural GCS action union. | deep |
| U04 | One WebAssembly component with identical continuation results, traps, and host-visible sequencing. | Public component-model coroutine/async examples with suspend/resume. | lowering/build cost, module size, continuation memory, resume latency, host crossing cost. | current frontend/runtime/engine stack-switching union. | deep |
| U05 | One RISC-V floating-point program with its fixed `fenv`/rounding outcome. | Numerical kernels that cross opaque helpers. | all `fcsr` transition and generated-code costs. | psABI-conforming compiler/runtime. | drop |
| U06 | One validated WebAssembly exception program with identical tag, handler, trap, and result semantics. | Official validation examples / small public Wasm modules. | module size, validation/build cost, runtime dispatch/unwind cost. | current Wasm validator/engine action union. | drop |

No family is duplicated with Wave187/190/197/205: U01 excludes SME/ZA; U02 excludes CET; U03 excludes CET and is Arm GCS; U05 excludes `vstart`; none uses AMX, MTE, or Zicfiss.
