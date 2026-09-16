# CANDIDATE_GRADE_DEEP_REVIEWS

## D01 — AArch64 SVE PCS transition construction

- Exact object / guarantee: a separately compiled AArch64 SVE program, with unchanged function results and AAPCS64-visible call behavior. SVE is distinct from the excluded SME/ZA seam.
- Minimal legal witness: a caller keeps a scalable `z`/predicate value live over an opaque call and uses it afterwards; preservation has a real scalable save/restore cost.
- Current reality check: Arm’s current ABI-AA `main` AAPCS64 source (2025Q4/2026 change history) defines SVE register and PCS material. This review did **not** freeze current LLVM and GCC source commits, every SVE PCS attribute, assembler/linker path, and runtime/unwind interaction. Therefore it cannot claim their strongest union lacks an interprocedural constructor.
- Action hypothesis: a whole-program call-region partitioner that jointly chooses legal live-range cuts, scalable save placement, and PCS-conforming boundary transitions. It is not admitted as a mechanism: the exact legal action enumeration and whether existing interprocedural register allocation/tail-call/lowering already expresses it remain unfrozen.
- Natural route / oracle / cost: public SVE intrinsic kernels; compiled-code inspection plus AAPCS64 legality and scalar/vector output equivalence; compile time, object size, scalable memory traffic, latency, stack/RSS.
- 72h finite killer: pin LLVM and GCC revisions; enumerate relevant PCS attributes/options and backend save/restore paths; if their same-information union expresses the partitioned boundary action, direct absorption; otherwise freeze a one-call witness and legality oracle.
- Six-dimensional residual: decision rule, information, resources, quality, full cost, and generalization cannot be certified before that enumeration.
- Verdict: `NOT_ADMITTED_UNFROZEN` (not DROP; not a brief).

## D02 — x86 PKRU transition construction

- Exact object / guarantee: same binary-visible ABI and the same protection-key accessibility outcome at every access, call return, and signal observation.
- Minimal legal witness: a caller writes PKRU, invokes an opaque helper, then rereads the same keyed buffer. Intel documents PKRU/PKRS changes as architecturally relevant state changes.
- Direct subtractor: explicit `WRPKRU` placement together with the current OS/runtime/compiler handling is already the whole native mechanism family for this witness.
- Structural result: any proposed cross-call “saving” action either preserves identical PKRU observations, in which case it is placement/scheduling of the existing instruction, or changes what the helper/signal may access, which changes the security/ABI contract. A compiler policy selector does not supply a new native action.
- Natural route / oracle / cost: MPK-enabled public keyed-buffer programs; architectural access-fault/result oracle; instruction/fence/serialization, signal/runtime, code size, and throughput costs.
- 72h killer: a fixed two-domain call trace shows whether the proposed transformation changes helper visibility. If it does, same-object fails; if not, it is replayable by current explicit placement.
- Verdict: `DROP__CONTRACT_CHANGE_OR_EXISTING_PRIMITIVE_PLACEMENT`; structural, not a resource inference.

## D03 — AArch64 GCS call and unwind transition construction

- Exact object / guarantee: a GCS-enabled AArch64 program preserving normal return and unwind behavior at the same public ABI boundary.
- Minimal legal witness: a callback followed by an exception/unwind transfer, with the original result and return target preserved. Arm identifies GCS as a hardware shadow-stack extension.
- Current reality check: official Arm architecture/ABI material establishes the state and compiler-facing intent, but this search did not freeze current LLVM/GCC GCS options, all linker notes, unwinder personalities, libc setjmp/longjmp, and non-default runtime paths. An absence claim is therefore impermissible.
- Action hypothesis: a whole-function/interprocedural state-transition constructor that co-optimizes GCS entries with exceptional edges without changing return/unwind semantics. This may be absorbed by compiler+unwinder tooling; no complete union has been enumerated.
- Natural route / oracle / cost: public C++ callback/exception programs; architectural GCS fault behavior plus result/unwind oracle; emitted code, GCS/stack traffic, unwind work, compile time, latency.
- 72h finite killer: pin toolchain/runtime commits and enumerate GCS codegen, linker, EH, and libc paths. Existing equivalent action means direct absorption; a counterexample must retain identical unwind trace.
- Verdict: `NOT_ADMITTED_UNFROZEN` (no brief).

## D04 — WebAssembly stack-switching continuation transition construction

- Exact object / guarantee: one component with identical returned values, traps, and host-visible sequencing through suspend/resume.
- Minimal legal witness: a component suspends a continuation at a host boundary and resumes it once; its output and ordered host effects are fixed.
- Current reality check: current first-party component-model design describes a well-defined current thread in terms of stack switching. It also shows the seam is proposal/runtime dependent. This review did not freeze a current engine, frontend, proposal feature set, and all continuation ABI paths, so it cannot assert a missing constructor.
- Action hypothesis: a continuation-layout/state-sharing constructor across component boundaries. Without a fixed engine union, it could be a generic runtime/allocator pass, which is forbidden, or already absorbed.
- Natural route / oracle / cost: public component-model async/coroutine carriers; component validation plus deterministic result/effect oracle; build time, module size, continuation bytes, resume latency, host crossing cost.
- 72h finite killer: select one conforming engine/release and feature set, enumerate continuation representation and lowering routes, then test a two-suspend trace against validation/effect equivalence. Failure to freeze this is an admission failure, not science.
- Verdict: `NOT_ADMITTED_UNFROZEN` (no brief).

## Structural drops not deepened

- D05 RISC-V `fcsr`: keeping the fixed `fenv` rounding contract across an opaque call leaves only the ABI/runtime-prescribed state transition; changing it changes numerical semantics, while reordering it is ordinary lowering/flag scheduling. `DROP__NO_UNION_OUTSIDE_WHOLE_ACTION`.
- D06 Wasm exception tags: validation fixes the control/value-stack and exception-tag contract. An emitter rewrite or runtime dispatcher change is a generic pass/patch; changing handler/trap sequencing changes the object. `DROP__NO_SAME_OBJECT_CONSTRUCTOR`.
