# Source43 same-object RQ convergence

## RQ-43-01 — GFX12 global-load-to-LDS lowering

Fixed object: one versioned GFX12 AMDGPU kernel with the same global inputs, LDS-visible values, barriers and final outputs.  
Pre-evidence variants: (A) a target-specific legality-aware lowerer selecting global-to-LDS instructions plus wait/placement; (B) a bounded compile-cost/full-cost construction; (C) a conventional load/store lowering.  
Selected RQ: can (A) be frozen against current LLVM AMDGPU lowering without changing memory ordering or using a generic scheduler? The ISA source confirms the primitive, but an exact current lowering locus has not been located. It enters the bounded source-closure queue, not raw.

## RQ-43-02 — oneVPL zero-copy surface lifetime

Fixed object: one versioned decode/VPP pipeline, encoded input, decoded frames and read/write/lifetime semantics.  
Variants: (A) joint surface reservation/release constructor; (B) a bounded copy-avoidance/lifetime construction; (C) surface-pool selection.  
Selected RQ: does (A) remain outside current oneVPL surface management? No. Current rules supply locking, reference-counted surface interfaces, allocation and release transitions; the remainder is a generic pool/controller policy.

## RQ-43-03 — oneDNN grouped-memory representation

Fixed object: one fixed grouped logical tensor, values, cumulative offsets, group membership and primitive output semantics.  
Variants: (A) joint values/offsets layout constructor; (B) same grouped object with a bounded materialization guarantee; (C) format selection.  
Selected RQ: is (A) a legal native action beyond the grouped descriptor? No. The current experimental format fixes the two-buffer representation and descriptor fields; a different representation changes the reader/format, while a parameter choice is routine configuration.

S43-05 has no exact project/object/version or deterministic one-project selection rule, so it remains `LOCATOR_ONLY__RQ_BACKLOG`, not a source-closure queue item.
