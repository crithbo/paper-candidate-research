# NVPTX tcgen05 tensor-memory allocation/copy state — prebrief source closure

## Scope and decision

- Assignment: `STAGE0-P1-20260814-NVPTX-TCGEN05-TENSORMEM-ALLOC-COPY-STATE-CONSTRUCTION-PREBRIEF-CLOSURE-V8.7`
- Mode: `PREBRIEF_SOURCE_CLOSURE`; this is not a Stage 0 PASS review.
- Disposition: `NOT_ADMITTED_UNFROZEN__BOUNDED_SOURCE_OR_WITNESS_CLOSURE_INCOMPLETE`
- Confidence: `0.88`
- Stage A/B, build, test execution, and GPU use: not authorized and not performed.

The current intrinsic grammar proves that tensor-memory allocation, CTA-group choice, copy, commit/wait and barriers are target-specific protocol actions. However, the public regressions separately test allocation and copy; neither supplies two complete same-program legal plans whose allocation state changes a subsequent copy/barrier action under fixed visible semantics. Current LLVM sources expose/validate/lower caller-selected intrinsics, but this bounded audit has not established the complete producer union, a union-external action, or a non-generic finite-state guarantee. The correct prebrief result is therefore bounded unresolved, not promotion and not structural drop.

## Pinned source facts

Current LLVM pin: `ec26997e2e4606d97918a4a082c4f93ca38a6f46`.

| Evidence | Result |
|---|---|
| `IntrinsicsNVVM.td` | Defines `tcgen05.alloc.{cg1,cg2}`, shared allocation, deallocation/relinquish, commit variants with barrier pointers, wait and fence operations, and CTA-group-specialized copy operations. These are convergent/side-effecting protocol actions, not a generic allocator API. |
| `NVPTXISelLowering.cpp` | Contains tcgen05 custom lowering paths for loads/stores/asynchronous stores and extensive tcgen05 intrinsic handling. It is a lowering/legality surface, not evidence of a whole-program allocation-plus-protocol constructor. |
| `tcgen05-alloc.ll` | Official regression pins alloc/dealloc/relinquish lowering across `sm_100a`/PTX 8.6 and later target envelopes. |
| `tcgen05-cp.ll` | Official regression pins CTA-group-specific copy lowering across the same target family. |

The two tests are useful native grammar carriers, but are separate one-action functions. Combining them manually would manufacture the missing same-program witness and is prohibited.

## Non-product and current-union audit

The source supports an action skeleton in which allocation column count and CTA group determine a tensor-memory handle and protocol family. Erasing this state would remove actual native legality distinctions. Conversely, this does **not** yet show a paper kernel: current LLVM accepts explicit caller intrinsics and lowers their declared action; the audited material does not establish that LLVM chooses allocation columns or a copy/barrier schedule, nor that a proposed constructor lies outside all existing caller-side composition.

The following admission obligations remain open:

| Required closure | status |
|---|---|
| one fixed target/feature/ABI and complete native producer action union | partial |
| one public same-program allocation → copy/commit/wait/barrier witness | absent |
| two complete native-legal plans with unchanged visible values/memory ordering/CTA obligations | absent |
| static action-divergence against caller composition plus lowering | absent |
| target-specific finite state and exact/FPT/certified guarantee | absent |
| direct same-object literature/collision conclusion | `SEARCH_BOUNDED_OPEN` |

The recorded documentation 404 is only a bounded retrieval outcome, not proof of absence and not a scientific negative fact.

## Resource-localization compliance and next condition

All retained material is under this assignment's isolated resource root, with redirect preflight, canonical inventory and snapshots. The source acquisition succeeded; no resource blocker exists.

This topic can be reconsidered only through a new bounded source closure that freezes an actual combined LLVM IR/PTX carrier and two complete legal action traces, including allocation handle/column/CTA group, copy shape, commit/wait/barrier transition and the exact observable-memory contract. It must then show a target-specific frontier beyond caller-composed intrinsics and lowering. No implementation or performance result is needed for that next closure.
