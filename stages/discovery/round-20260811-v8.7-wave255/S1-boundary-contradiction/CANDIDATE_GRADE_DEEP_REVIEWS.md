# Candidate-grade deep reviews — Wave255

## D01 SystemZ GR32/RXY — `DROP`

`expandRIEPseudo` checks high/low registers and emits a copy where required; `expandRXYPseudo` selects form from register class and offset ([current source](https://llvm.org/doxygen/SystemZInstrInfo_8cpp_source.html)). This is a legal same-object witness. Yet the full action is ordinary target register cost/form choice: fixed MachineIR/liveness is available to both the candidate and current RA; costs are compile CPU/RSS, bytes, copies, spills/frame and instruction proxy; and no new target state, restricted problem, or guarantee remains. A DP/ILP would be generic. `DROP__ORDINARY_TARGET_COST_OR_PASS_COMPOSITION`.

## D02 SystemZ displacement/address temporary — `DROP`

Current source records simple 12-bit displacement memory operations and SystemZ instruction properties include wider offsets ([source](https://llvm.googlesource.com/llvm/%2B/213e6f3f8badb97d158d77267e78f9021f3db6c4/lib/Target/SystemZ/SystemZInstrInfo.cpp), [API](https://www.llvm.org/docs/doxygen/classllvm_1_1SystemZInstrInfo.html)). The candidate “retain base iff a spill is avoided” has the same information and reduces to scalar form/RA cost. It offers neither non-generic algorithm nor stronger quality/guarantee. `DROP__NO_NONTRIVIAL_N2_RESIDUAL`.

## D03 Hexagon/HVX packet + RA — `DROP`

The current packetizer explicitly supports dot-new promotion, resource allocation and constant-extender decisions ([packetizer](https://llvm.org/doxygen/classllvm_1_1HexagonPacketizerList.html)); official HVX documentation defines slot/resource/latency rules. [Unison](https://arxiv.org/abs/1804.02452) jointly treats register allocation and scheduling and evaluates Hexagon. A same-object packet/RA construction is directly absorbed; a restricted reimplementation is not N2. `DROP__DIRECT_ALGORITHMIC_COLLISION`.

## D04 LoongArch PC-relative base-offset merge — `NOT_ADMITTED_UNFROZEN`

`LoongArchMergeBaseOffset` is a current default-enabled pass and handles PCADD_LO relocation flags ([pass](https://llvm.org/doxygen/LoongArchMergeBaseOffset_8cpp.html), [target configuration](https://llvm.org/doxygen/LoongArchTargetMachine_8cpp.html)). A base retained across a call versus merged materialization is a minimal same-object witness. It might permit a bounded joint base-lifetime/form/RA/spill DP, but this search did not close one pinned revision's exact pass ordering, all default/nondefault flags through MC/linker, and a latest direct-paper collision. Do not infer absence; no brief.

**Finite killer if rescreened:** pin LLVM; enumerate the pass/config/MC/linker union; construct one `PCADD_LO` trace; require a strict Pareto point under assembler/relocation/ABI oracle and CPU/RSS/text/relocation/spill denominator; fail on union expression, changed ABI/relocation semantics, generic solver, no Pareto point, or collision.

## D05 Thumb2 low-register narrow form — `DROP`

LLVM defines low versus high Thumb2 register constraints, and current ARM source says it prefers low registers to permit narrow encoding; the LLVM review records a minsize allocation-order change for exactly this reason ([LangRef](https://www.llvm.org/docs/LangRef.html), [source](https://codebrowser.dev/llvm/llvm/lib/Target/ARM/ARMSubtarget.cpp.html), [D56008](https://reviews.llvm.org/D56008)). Spill/call additions are ordinary cost tuning, not a target-specific joint algorithm. `DROP__CURRENT_TARGET_COST_ALREADY_MODELED`.

No candidate was rejected for absent implementation, results, hardware, resources, or AI readiness. No killer was run.
