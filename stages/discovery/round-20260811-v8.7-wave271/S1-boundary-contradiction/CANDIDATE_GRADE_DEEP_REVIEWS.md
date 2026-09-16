# Candidate-grade deep reviews — Wave271

## D01 SPARC V9 register window — `DROP`

[Current LLVM SPARC lowering](https://llvm.org/docs/doxygen/SparcISelLowering_8cpp_source.html) states that outgoing O* registers become incoming I* registers in the callee; [current subtarget code](https://llvm.org/doxygen/classllvm_1_1SparcSubtarget.html) includes register-window spill/argument space and biased 64-bit frame pointers. [Frame lowering](https://llvm.org/doxygen/SparcFrameLowering_8cpp_source.html) exposes the nondefault leaf-procedure flag. The minimal same-object witness is leaf/save-window handling versus a nonleaf frame path, but it is a native ABI action already selected by frame lowering and ordinary RA. No target-specific exact/FPT/Pareto state space or guarantee survives beyond calling-convention/frame cost. `DROP__CURRENT_ABI_FRAME_COMPOSITION`.

## D02 AVR call frame — `DROP`

[AVR frame lowering](https://llvm.org/doxygen/AVRFrameLowering_8cpp_source.html) decides reserved call frames and materializes SP updates; [AVR register info](https://llvm.org/doxygen/classllvm_1_1AVRRegisterInfo.html) performs frame-index elimination, has callee-saved masks and a frame register; the [backend inventory](https://llvm.org/doxygen/dir_e025955df7d625b5b4f5fd3465d9c8da.html) shows the full target path. The witness (same function either needs FP/call-frame adjustment or uses the reserved frame) is legal but current target frame/RA composition already owns it. A global planner is generic frame/RA cost tuning, not a target-specific N2. `DROP__ORDINARY_FRAME_COST`.

## D03 MSP430 fixed-register/addressing seam — `NOT_ADMITTED_UNFROZEN`

[MSP430 register information](https://llvm.org/doxygen/MSP430RegisterInfo_8h_source.html) confirms a current target register layer, but this search could not freeze enough current first-party source for all constant-generator/fixed-register instruction forms, frame lowering, flags, MC/linker behaviour and a natural workload. A candidate action witness would otherwise risk being an invented instruction-selection choice. `NOT_ADMITTED_UNFROZEN`, not a science DROP.

For every deep row, intended full cost is compile CPU/RSS, text/object/relocation bytes, spills/copies/frame, ABI/unwind instructions and target static instruction cost. The finite 72-hour killer is: pin target source/config; construct one public test trace; require assembler/object/ABI/unwind legality and a strict target-specific Pareto/guarantee versus the complete union; kill on generic solver/cost tweak, union expression, changed ABI, no witness, or no strict point. It was not run.
