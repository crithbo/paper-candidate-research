# AARCH64-SVE-SME-JOINT-STATEFUL-CODEGEN — Q1/Q2 comparator matrix

## Calibration

The candidate is, at most, a narrow compiler-backend `TIER_B_Q2_VIABLE` N2 direction. Q1 parity is not plausible at this stage: the object is one target/ABI boundary and has no evidence beyond a bounded static route.

| Comparator | Object/action/information | Result of independent comparison |
|---|---|---|
| Current LLVM AArch64 SME lowering | Same LLVM IR and AAPCS64 contract; attribute lowering, SMSTART/SMSTOP, MachineSMEABI, RA and SME peephole | Mandatory strongest union. It absorbs any claim that merely emits required transitions or performs a local start/stop cleanup. |
| AAPCS64 + ACLE | Same externally visible SM/ZA contract | Hard legality boundary. Function/callsite attributes fix interfaces; mode/ZA changes cannot be freely moved across calls or vector values. |
| GCC AArch64 SME/SME2 support and early RA | Different compiler pipeline but similar target feature action | Method/deployment subtractor. It prevents calling target-specific pre-RA handling novel by itself; it is not a same-LLVM-MIR complete-frontier baseline. |
| Noor et al., *Improving compiler support for SIMD offload using Arm Streaming SVE* (2025) | Broad automatic SSVE offload, loop transforms and cost-model direction | Direct broad-method subtractor. It narrows all claims to fixed existing LLVM SME ABI/MIR action selection; it does not establish the required same-object trace certificate. |
| Remke & Breuer, *Hello SME!* (SC-W 2024) | SME kernel/JIT code generation and microarchitecture evaluation | Natural SME code-generation neighbor, but different JIT/kernel object and information/action model; not a stock LLVM ABI/RA collision. |
| Generic combinatorial RA/scheduling | Abstract register assignment/spill/scheduling | Kernel subtractor. A gate result expressed only as generic DP/ILP/RA is `BELOW_Q2_STOP`. |

## Current union required by the gate

- fixed IR attributes and all required AAPCS64 N/S/SC and private/shared/agnostic ZA transitions;
- LLVM SME attribute handling, call lowering, `MachineSMEABI`, `aarch64-sme-peephole-opt`, standard RA/scavenger/spill/frame, post-RA scheduling and assembler/linker path;
- `+sve`, `+sme`, applicable optimization-level and pass-control variants that retain the same object; and
- same-information local transition/spill rules plus an exhaustive tiny-MIR oracle, the latter as validator rather than a deployment baseline.

## Paper-shape conditions

| Criterion | Status | Consequence |
|---|---|---|
| Same object | Conditional | Must retain attributes/ABI, vector-length restrictions and stock tools. |
| Candidate-only N2 | Unclosed | Need a concrete ABI-permitted two-action witness and non-generic joint recurrence. |
| Direct collision | No direct fatal established | `SEARCH_BOUNDED_OPEN`; current LLVM absorbs broad/lower-level fragments. |
| Natural evidence/full cost | Finite route only | Stage A, not a Stage 0 STOP condition. |
| Q2 decision | `REVISE_ONCE` | Gate must close before PASS. |
