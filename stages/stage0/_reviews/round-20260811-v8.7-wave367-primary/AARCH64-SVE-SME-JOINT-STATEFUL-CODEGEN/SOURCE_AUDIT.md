# AARCH64-SVE-SME-JOINT-STATEFUL-CODEGEN — current source and collision audit

## Status

- Cutoff: 2026-08-11
- Evidence class: first-party LLVM/Arm specification and original-paper sources
- Latest-collision result: `SEARCH_BOUNDED_OPEN`
- Transport policy: no failed fetch is interpreted as evidence of absence.

## First-party current reality check

| Source | Observation | Stage 0 consequence |
|---|---|---|
| [LLVM AArch64 SME support](https://www.llvm.org/docs/AArch64SME.html) | ACLE SME attributes map to LLVM IR and ABI lowering; mode transition can alter vector length, zero FP/AdvSIMD/SVE registers and change instruction legality. LLVM inserts relevant transitions around calls before RA. | Refutes an unconstrained “mode lifetime” action model. Any candidate must respect attributes and all live Z/P transfer restrictions. |
| [LLVM SME source: attributes](https://llvm.org/doxygen/AArch64SMEAttributes_8cpp_source.html) | Streaming and streaming-compatible attributes are mutually exclusive; ZA interface attributes are mutually exclusive. | Attributes/interfaces are part of the frozen object, not a candidate knob. |
| [LLVM SME peephole](https://www.llvm.org/docs/doxygen/SMEPeepholeOpt_8cpp.html) | Current target has `aarch64-sme-peephole-opt`, including start/stop and streaming-mode logic. | Current pass composition must be in the strongest union; a local transition rewrite is absorbed. |
| [AAPCS64](https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst) | Defines N/S/SC PSTATE.SM interfaces; private/shared/agnostic ZA interfaces; lazy-save, TPIDR2 and asynchronous-control constraints. | Required state includes ABI obligations, not just register pressure. |
| [ACLE](https://arm-software.github.io/acle/main/acle.html) | `SMSTART`/`SMSTOP` control streaming; switching invalidates Z/P state; SME calls/intrinsics have streaming-context constraints. | Confirms no same-object witness may carry scalable state illegally through a transition. |
| [LLVM MachineSMEABI source surface](https://llvm.org/docs/doxygen/MachineSMEABIPass_8cpp.html) | LLVM has a dedicated Machine SME ABI pass. | Mandatory same-object baseline component; gate must map its actual action catalog. |

The official LLVM documentation snapshot identifies itself as LLVM `23.0.0git`; the revision must replace that observation pin with a concrete source commit and action-table hash before any candidate claim.

## Direct-paper and method boundary

1. [Noor et al. (2025), *Improving compiler support for SIMD offload using Arm Streaming SVE*](https://arxiv.org/abs/2506.02233): a direct broad compiler-method neighbor for automatic SSVE offload, loop transforms and cost models. It does not verify the frozen same-LLVM MIR, SME-ABI transition/lazy-save/RA frontier.
2. [Remke & Breuer (2024), *Hello SME!*](https://conferences.computer.org/sc-wpub/pdfs/SC-W2024-6oZmigAQfgJ1GhPL0yE3pS/555400b443/555400b443.pdf): SME kernel and JIT code generation with microarchitectural measurements. It is a substantial natural-domain subtractor but changes the generator/object and is not a stock LLVM AAPCS64 action-equivalent collision.
3. [LLVM, *Register Allocation Deconstructed*](https://llvm.org/pubs/2009-04-SCOPES-RegisterAllocationDeconstructed.html): establishes the generic RA kernel (assignment, coalescing and spilling) that cannot be relabelled target-specific without the SME ABI state.

## Evidence / inference split

- **Evidence:** current LLVM already lowers attribute-mandated transitions and contains a dedicated ABI pass and an SME peephole; Arm specifications impose mode/ZA/lazy-save legality.
- **Inference:** a bounded joint frontier might remain only for a real pair of ABI-permitted native traces whose interaction with Z/P spill placement is not reproduced by the complete union.
- **Not claimed:** that such a pair, guarantee, natural benefit, or current-source absence has already been established.
