# Source45 bounded question cards

## QC-01 — X86 legal LEA repairs

- Exact object: fixed LLVM x86 MachineFunction, ABI, subtarget and observable machine semantics.
- Proposed complete action: choose legal repairs/replacements for address-generation `LEA` instructions throughout the function.
- Claim endpoint: code-quality improvement subject to compile cost, output bytes and stock machine validation; a later full-cost ledger would include CPU/RSS/temp and target-specific latency/throughput proxy.
- Stock oracle/carrier: LLVM machine verifier plus version-pinned LLVM x86 MIR/test-suite route.
- Current locus: [X86FixupLEAs.cpp](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/X86/X86FixupLEAs.cpp), official llvm-project `main`, inspected 2026-08-15. It is the current native X86 producer locus for LEA repair decisions.
- Strong comparator: current LLVM pass composition, target features and existing native repair heuristic.
- Minimum falsifier: one MIR function with two legal LEA repair outputs; if a proposal merely selects a different current repair, it fails the non-generic constructor test.
- Disposition: `DROP__DIRECT_CURRENT_ACTION_ABSORPTION`.
- Reason: no target-specific joint guarantee was named beyond the current repair action; a cost-model/heuristic variation is routine pass engineering, not a retained N2.

## QC-02 — AMDGPU operand folding

- Exact object: fixed AMDGPU MachineFunction, instruction selection result, subtarget and ISA semantics.
- Proposed complete action: choose legal downstream folds of immediate, frame-index or subregister values into machine operands.
- Claim endpoint: reduce register/materialisation pressure while preserving stock semantics; full cost is compilation CPU/RSS/temp, code bytes, occupancy/register-pressure proxy and validation.
- Stock oracle/carrier: LLVM machine verifier and a version-pinned public LLVM AMDGPU MIR/test route.
- Current locus: [SIFoldOperands.cpp](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/AMDGPU/SIFoldOperands.cpp), official llvm-project `main`, inspected 2026-08-15. The source's `FoldableDef` tracks exactly a value to fold into downstream users, including immediate/frame-index cases; the pass requires Machine SSA and loop information.
- Strong comparator: current `SI Fold Operands` pass with the complete stock machine pass composition.
- Minimum falsifier: a fixed MIR function containing two legal fold patterns; a changed policy alone is insufficient when current native folding expresses the primitive.
- Disposition: `DROP__DIRECT_CURRENT_ACTION_ABSORPTION`.
- Reason: the proposal reduces to fold-policy or pass tuning; no distinct whole action or target-specific exact/FPT/approximation guarantee survived.

## QC-03 — Thumb2 IT-block formation

- Exact object: fixed Thumb2 MachineFunction, predication/ITSTATE semantics, ABI and subtarget.
- Proposed complete action: partition consecutive compatible predicated instructions into legal IT blocks, with allowed instruction movement.
- Claim endpoint: code-size/latency quality subject to compile and verification cost; full boundary is compile CPU/RSS/temp, instruction bytes, ITSTATE semantics and stock validation.
- Stock oracle/carrier: LLVM machine verifier with version-pinned public Thumb2 MIR/test-suite programs.
- Current locus: [Thumb2ITBlockPass.cpp](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/ARM/Thumb2ITBlockPass.cpp), official llvm-project `main`, inspected 2026-08-15. `InsertITInstructions` tracks definitions/uses, creates `t2IT`, forms the mask and may move a copy; `-arm-restrict-it` limits complex blocks.
- Strong comparator: stock `Thumb2ITBlock` action plus subtarget `restrictIT` configuration.
- Minimum falsifier: one MachineBasicBlock with two legal IT decompositions. A different block mask without a new semantic/guarantee structure is a local formatting choice.
- Disposition: `DROP__DIRECT_CURRENT_ACTION_ABSORPTION`.
- Reason: the source explicitly owns IT insertion, bounded formation, movement and configuration; no independent joint target-specific residual remains.
