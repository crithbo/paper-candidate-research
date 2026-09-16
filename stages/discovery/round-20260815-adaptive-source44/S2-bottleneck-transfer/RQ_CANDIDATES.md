# RQ candidates

## RQ01 — HIP virtual-address-stable dynamic device buffer

Fixed object: a HIP virtual address range, logical byte sequence, device-visible addresses and access permissions.  Candidate contribution route: an online physical-handle segmentation and remap constructor that preserves that virtual range and bounds remap/copy recourse under versioned allocation changes.  Counterfactual: if its only content is choosing `hipMemCreate`/`hipMemMap` calls or a generic allocator policy, it is not admitted.

## RQ02 — Vulkan device-generated command preprocess construction

Fixed object: one command sequence, execution set, indirect layout and resulting GPU-visible draw/dispatch behavior. Candidate route: a protocol-preserving constructor jointly selecting token layout and preprocess-buffer placement. Counterfactual: if the extension's declared layout/memory requirements already express the whole decision, this is configuration rather than N2.

## RQ03 — HIP captured graph allocation-node lifecycle

Fixed object: one captured graph, node dependencies, kernel/memory effects and completion behavior. Candidate route: a graph-owned allocation/copy construction. Counterfactual: if node creation/update/dependency APIs express it, the residual is a generic graph policy and is not admitted.

The same-object versions above were frozen before the current-source outcomes. No RQ was rewritten after evidence.
