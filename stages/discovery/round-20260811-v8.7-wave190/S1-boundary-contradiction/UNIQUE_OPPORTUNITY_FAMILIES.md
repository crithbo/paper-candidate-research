# UNIQUE_OPPORTUNITY_FAMILIES

## U01 — Arm SME ZA cross-call state-transition construction

- **Exact object / same function:** an AArch64 C/C++ program whose externally observable scalar result, memory effects, callable AAPCS64 interface, PSTATE.SM interface, and ZA/ZT0 preservation or clobber guarantee are fixed. The atomic candidate would construct all call-boundary state transitions for the function/call-chain, not merely select an ACLE attribute.
- **State contract:** PSTATE.SM has non-streaming, streaming, and streaming-compatible interfaces. ZA has off, active, and dormant states mediated by TPIDR2_EL0; ZT0 is caller-saved and is not part of lazy save. The ABI defines normal-return and asynchronous/unwind obligations.
- **Initial action-divergence witness:** with an active ZA caller and two consecutive SME-unaware callees, a legal implementation could set up/restore a lazy save around each call or keep the same lazy-save live across both, with identical program/PCS result. This is an action witness only, not evidence that the second action is currently absent or publishable.
- **Natural carrier / oracle:** publicly compilable ACLE SME matrix kernels with ordinary helper calls; compiler IR/assembly plus AAPCS64 legality, and QEMU/LLVM differential execution when the StageA contract is closed.
- **Full cost:** compile time, emitted code size, dynamic transition/save/restore instructions, emulated runtime, peak stack/RSS, plus exception/unwind correctness. Hardware availability only bounds the ceiling.
- **Result:** unique family retained for deep review; no brief until current LLVM source/test/runtime union is commit-pinned.

