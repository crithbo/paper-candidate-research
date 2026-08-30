# RAW_SCREEN_ROW_EVENTS — Wave271

| row | fresh target/ABI seam | witness-first result |
|---|---|---|
| R01 | SPARC V9 register-window O*/I* call transition, frame bias and leaf procedure | deep |
| R02 | AVR call-frame reservation, FP/SP choice and frame-index materialization | deep |
| R03 | MSP430 constant-generator/fixed-register addressing and call-preserve spill | deep |
| R04 | AArch32 ARM↔Thumb interworking veneer/call state and late frame unwind | screened; no complete joint action |
| R05 | Lanai delay-slot/call-frame fixed-register boundary | screened; no current natural/collision closure |
| R06 | XCore resource/call-state and instruction-form boundary | screened; no current natural/collision closure |

R04--R06 remain raw only, rather than using an interface absence or a synthetic form as a candidate.
