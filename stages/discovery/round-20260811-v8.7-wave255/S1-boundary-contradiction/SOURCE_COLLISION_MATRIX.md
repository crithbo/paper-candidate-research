# Source / collision matrix — Wave255

| family | current official evidence | primary subtractor | outcome |
|---|---|---|---|
| SystemZ GR32/RXY | [SystemZ source](https://llvm.org/doxygen/SystemZInstrInfo_8cpp_source.html), [register API](https://llvm.org/docs/doxygen/structllvm_1_1SystemZRegisterInfo.html) | [Combinatorial RA/scheduling](https://arxiv.org/abs/1804.02452), generic only | current action reduces proposal to normal target cost/pass composition: `DROP` |
| SystemZ offset | [current LLVM source](https://llvm.googlesource.com/llvm/%2B/213e6f3f8badb97d158d77267e78f9021f3db6c4/lib/Target/SystemZ/SystemZInstrInfo.cpp) | same generic counterevidence | no target-specific N2 residual: `DROP` |
| Hexagon/HVX | [packetizer](https://llvm.org/doxygen/HexagonVLIWPacketizer_8cpp_source.html), [Qualcomm manual](https://docs.qualcomm.com/doc/80-N2040-54/80-N2040-54.pdf) | [Unison original paper](https://arxiv.org/abs/1804.02452) | same RA/scheduling problem evaluated on Hexagon: `DROP` |
| LoongArch | [MergeBaseOffset](https://llvm.org/doxygen/LoongArchMergeBaseOffset_8cpp.html), [current target machine](https://llvm.org/doxygen/LoongArchTargetMachine_8cpp.html) | no closed direct-paper result | complete source union and collision unresolved: `NOT_ADMITTED_UNFROZEN` |
| Thumb2 | [LangRef](https://www.llvm.org/docs/LangRef.html), [ARM source](https://codebrowser.dev/llvm/llvm/lib/Target/ARM/ARMSubtarget.cpp.html), [LLVM review](https://reviews.llvm.org/D56008) | [compressed-ISA RA](https://pp.ipd.kit.edu/uploads/publikationen/fried23cc.pdf) | current source already models low-register narrow encoding: `DROP` |
| microMIPS | [compressed-ISA RA](https://pp.ipd.kit.edu/uploads/publikationen/fried23cc.pdf) | same | current LLVM union not frozen: `NOT_ADMITTED_UNFROZEN` |

Search refreshed 2026-08-11. Bounded searching is not a novelty conclusion.
