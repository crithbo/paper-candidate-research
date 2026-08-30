# RAW_SCREEN_ROW_EVENTS — Wave255

| row | family | current official anchor | result |
|---|---|---|---|
| R01 | SystemZ high/low GR32 with RIE/RXY form expansion | [SystemZInstrInfo](https://llvm.org/doxygen/SystemZInstrInfo_8cpp_source.html) | deep |
| R02 | SystemZ 12/20-bit displacement and address-temporary residency | [SystemZ source](https://llvm.googlesource.com/llvm/%2B/213e6f3f8badb97d158d77267e78f9021f3db6c4/lib/Target/SystemZ/SystemZInstrInfo.cpp) | deep |
| R03 | Hexagon/HVX dot-new/constant-extender packet legality plus RA | [LLVM packetizer](https://llvm.org/doxygen/HexagonVLIWPacketizer_8cpp_source.html) | deep |
| R04 | LoongArch PC-relative base-offset merge plus RA/frame pressure | [MergeBaseOffset](https://llvm.org/doxygen/LoongArchMergeBaseOffset_8cpp.html) | deep |
| R05 | ARM Thumb2 low-GPR narrow form plus spill/call-save | [ARM subtarget](https://codebrowser.dev/llvm/llvm/lib/Target/ARM/ARMSubtarget.cpp.html) | deep |
| R06 | microMIPS mixed-width form plus RA/frame | [compressed-ISA paper](https://pp.ipd.kit.edu/uploads/publikationen/fried23cc.pdf) | `NOT_ADMITTED_UNFROZEN` |

R06 lacked a current LLVM MIPS source/flag/pass union, so it was not promoted; that is not an absence claim.
