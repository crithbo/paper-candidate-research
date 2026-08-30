# UNIQUE_OPPORTUNITY_FAMILIES — Wave255

| ID | exact same object / guarantee | strongest current union | natural carrier, oracle, full-cost |
|---|---|---|---|
| U01 | SystemZ MachineIR, target/ABI, values/exceptions | ISel, SystemZ hints, greedy/PBQP RA, coalescing/spills, frame/scavenging, post-RA expansion, MC | LLVM SystemZ tests; verifier/assembler/ABI; CPU/RSS, bytes, copies, spills/frame |
| U02 | SystemZ load/store address and result, relocation/ABI | U01 plus offset opcode/form and frame-index elimination | same; instruction/bytes and address-temp pressure |
| U03 | Hexagon/HVX MachineIR, packet semantics and ABI | ISel, RA, scheduler, packetizer, dot-new/const-extender, MC | LLVM Hexagon tests; packet legality/assembler; CPU/RSS, packets, spills, bytes |
| U04 | LoongArch PC-relative reference, target ABI/result | ISel, MergeBaseOffset, RA/spill, expansion, frame, MC/linker | LLVM LoongArch tests; assembler/relocation; CPU/RSS, bytes, spills/frame |
| U05 | Thumb2 function, ABI and observable values/exceptions | ISel, low-register allocation order, RA/spill, frame, MC | LLVM ARM tests; assembler/ABI; CPU/RSS, text bytes, spills/frame |
| U06 | microMIPS function/ABI/mode result | current union unfrozen | no source-pinned route yet |

R01/R02 use distinct legality primitives but share a final SystemZ rejection: neither supports a separate target-specific algorithmic residual.
