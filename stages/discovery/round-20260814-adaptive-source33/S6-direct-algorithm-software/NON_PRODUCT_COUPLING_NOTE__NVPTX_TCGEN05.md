# Assignment-local non-product coupling survival note

## Scope

This is the Source32-inherited, assignment-local check. It neither changes
the v8.7 admission rule nor supplies a complete action catalogue or Q2 proof.

| Field | Frozen assessment |
|---|---|
| opportunity | `NVPTX-TCGEN05-TENSORMEM-ALLOC-COPY-STATE-CONSTRUCTION` |
| factor A | tensor-memory allocation column count and collective-group mode |
| factor B | asynchronous copy / transaction-barrier protocol state using the allocated tensor-memory handle |
| current sequential composition | caller emits target intrinsics; current lowering validates/lower them under NVPTX target semantics; no source-closed joint constructor was established |
| shared endogenous state / cross-term | allocation handle and reserved column phase determine legal subsequent copy/barrier states; changing either factor changes the legal state graph of the other |
| source/spec loci (maximum two) | LLVM NVPTX Usage documentation; LLVM NVPTX target source directory/intrinsic lowering locus |
| state-erasure result | `UNRESOLVED_BOUNDED` |
| disposition | `NOT_READY_FOR_CLEAN_BRIEF__NON_PRODUCT_UNPROVEN` |

### Why this is not a scientific negative result

The documented target constraints make a real joint-state question plausible,
but the bounded source review has not established an immutable current native
producer union, a native two-plan witness, or a target-specific guarantee.
Those are closure debts, not evidence that the opportunity is impossible.

### Counter-control

For shared-symbol address folding, removing the NVPTX spelling leaves CSE and
address-folding decisions without an independent target-specific cross-term.
That control is therefore `COLLAPSES_TO_GENERIC` and structurally dropped.

