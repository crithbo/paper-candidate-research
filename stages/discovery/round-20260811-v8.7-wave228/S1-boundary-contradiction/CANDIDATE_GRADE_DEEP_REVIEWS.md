# Candidate-grade deep review — D01

## Revision-pinned current mapping

| LLVM stage at `de8cb59` | APX-relevant role | closure status |
|---|---|---|
| target/subtarget and instruction selection | `X86.td` defines `FeatureEGPR`, `FeatureNDD`, `FeaturePPX`, `FeatureNF`, `FeatureCCMP`, `FeatureZU`, and `FeatureCF`; the source explicitly notes CF is non-default for APXF. Instruction descriptions select only legal APX forms under these features. | feature/form presence confirmed; exact alternative-selection policy not fully enumerated |
| register classes and allocation | X86 register descriptions supply the allocatable GPR universe; LLVM exposes greedy global RA and PBQP RA. Coalescing and spill decisions feed the selected forms. | action stages confirmed; EGPR/REX2/EVEX size-cost propagation to every decision remains unproved |
| frame, callee-save and unwind | PEI inserts prologue/epilogue and eliminates abstract frame references; the ABI/frame/unwind contract remains fixed for this object. | legality path confirmed; detailed APX-specific save cost table not frozen |
| post-RA | pseudo expansion and post-RA scheduling act after allocation. | confirmed; cannot retroactively establish that pre-RA choice has globally optimal encoding cost |
| MC/assembler | LLVM MC emits the selected legal encoding; binutils APX support is an independent legality/objdump subtractor. | encoding legality is checkable; no source proof of a global code-size model shared upstream |

## Complete local encoding table for W

| alternative | legal preconditions | semantic/ABI result | local benefit | mandatory cost |
|---|---|---|---|---|
| A: EGPR + REX2 legacy form | APX EGPR enabled; instruction admits extended register operand. | identical. | keeps a live value in a register; can avoid load/store or copy. | REX2 byte and any form-specific constraints. |
| B: EVEX APX NDD form | NDD and required extended-EVEX form enabled; instruction has legal NDD encoding. | identical. | non-destructive destination can avoid a copy and exposes three operands. | longer EVEX encoding; target/frontend cost must be charged. |
| C: legacy GPR destructive form | legal legacy register/form. | identical. | shorter legacy encoding where pressure permits. | copy to retain input, or a spill/reload under pressure. |
| D: spill/reload or callee-save | normal frame, ABI and unwind rules. | identical if metadata/state are correct. | frees a register/avoids prefix. | memory traffic, code bytes, frame/save/restore and unwind effects. |

This is complete for the small witness at the action-class level. It is intentionally not a claim that all opcode-specific encodings or all program contexts have been enumerated.

## Action-gap decision

The proposed N2 would need a structured algorithm that jointly chooses A–D across a whole function under a fixed code-size/front-end budget. It cannot be admitted merely by changing an X86 register-cost scalar, toggling APXF subfeatures, composing existing passes, or introducing a generic ILP.

At the pinned revision, APX forms and the ordinary complete compiler chain are positively present. However, first-party material inspected here does not close the crucial source question: whether prefix/form byte cost and uop/front-end cost are represented at all allocator/coalescer/spill and instruction-selection decision boundaries, or whether a proposed structured constructor creates an atomic decision absent from their composition. The complete same-information union therefore remains unclosed. No absence claim and no direct-absorption claim is made.

## Finite fidelity closure / 72-hour killer

1. Materialize revision `de8cb59` without changing this contract, enumerate `+apxf` and subfeatures (`egpr`, `ndd`, `ppx`, `nf`, `ccmp`, `zu`, `cf`) and identify defaults/non-defaults.
2. For W and a finite LLVM test-suite pressure set, trace form selection, allocation/coalescing, spills, callee-save/frame/unwind, post-RA and MC byte emission.
3. Verify every candidate action using LLVM assembly acceptance, binutils objdump legality/bytes, and unwind metadata; use deterministic output only after the same-object fidelity gate.
4. If a joint action is reproducible by this fixed LLVM union, `DROP__DIRECT_ABSORPTION`; if a non-generic action remains, freeze an algorithm and fair full-cost comparator before any Stage0 proposal.

No execution was performed. Hardware availability can cap dynamic evidence but cannot determine this admission decision.

## Verdict

`NOT_ADMITTED_UNFROZEN__PINNED_LLVM_JOINT_COST_PROPAGATION_NOT_CLOSED`.

The object has a finite closure route and a natural carrier, but lacks an established union-external complete N2 action today. No brief is emitted.
