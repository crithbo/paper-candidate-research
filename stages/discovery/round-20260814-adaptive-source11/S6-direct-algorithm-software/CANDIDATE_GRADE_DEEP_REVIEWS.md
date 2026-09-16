# Candidate-grade deep reviews

## D1 — SFrame compiler-frame-layout / Linux user-unwind construction

**Exact object.** Fix a user-space program, its ABI-visible calls, unwind behavior and ELF/SFrame contract.  The stock oracle is SFrame-aware user-stack unwinding (or the specified frame-pointer fallback), not a changed binary ABI or a different reader.

**Current source reality.** Current 2025 Linux upstream work describes deferred user-space unwinding and SFrame support; it explicitly identifies frame pointers as the current broadly available route and the format/architecture boundary as a difficulty.  The source-backed action family spans compiler emission of frame/unwind metadata and kernel/user-space SFrame consumption.  This is evidence of an interface boundary, not an absence claim about every compiler emitter or configuration.

**Legal two-plan skeleton.** The same call graph can use two ABI-legal frame layouts whose regenerated SFrame rows decode to the same caller sequence.  The witness has to regenerate metadata offsets and preserve the stock unwinder result; merely deleting frame pointers or changing stack contents is illegal.

**Subtraction.** No target-specific non-generic algorithm/guarantee was identifiable after subtracting SFrame's prescribed encoding and ordinary compiler frame lowering. A “joint layout planner” is generic frame/register allocation or, if it changes unwind representation/reader, a changed object. Source union is also not boundedly closed across GCC/Clang and Linux consumer configurations.

**Decision.** `NOT_ADMITTED_UNFROZEN__NO_TARGET_SPECIFIC_GUARANTEE_BEYOND_GENERIC_FRAME_ALLOCATION`. A future narrow task could pin one compiler, one SFrame version and one consumer, but current incompleteness is not scientific failure.

**Finite route.** Public ELF binaries compiled with a frozen SFrame-enabled toolchain; oracle compares stock unwind traces. Full cost would include compilation, emitted metadata/bytes, load/unwind CPU/RSS and any frame-size cost. The 72-hour killer is a minimal two-layout binary whose candidate either fails stock unwinding or reduces to current legal SFrame encoding.

## D2 — GCC AArch64 IRA callee-save/frame construction

**Exact object.** Fix input RTL, AArch64 target/ABI, observable function behavior and emitted assembly/link behavior. The target hook is allowed to trade register-save and frame-allocation cost only while preserving the ABI.

**Current source reality.** The 2025 GCC upstream patch introduces a target hook to scale callee-saved-register cost and references the AArch64 frame-allocation cost. This confirms a local current action/configuration boundary; it does not establish that current IRA lacks a whole joint allocator.

**Legal two-plan skeleton.** A function with one live range crossing a call can legally allocate it to a callee-saved register and save/restore it, or spill/reload it through the frame. Both follow the same ABI and have distinct register/frame actions.

**Subtraction.** A claimed joint RA/frame algorithm is standard target-aware register allocation. No AArch64-specific bounded state, approximation/FPT theorem or security/debug contract was found that escapes the existing IRA/frame cost model. A hook coefficient sweep is explicitly insufficient.

**Decision.** `STRUCTURAL_DROP__TARGET_AWARE_REGISTER_ALLOCATION_GENERIC_KERNEL`. This says nothing about the feasibility of implementation.

**Natural/full-cost route.** GCC testsuite/SPEC-like public C workloads, assembly/ABI oracle, and allocation/compile CPU-RSS, frame/code bytes, spill/load and call costs. The finite killer is a one-call live-range witness where the prospective action is represented by existing IRA choices plus the target cost hook.

