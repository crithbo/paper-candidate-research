# Source and primary-collision closure — RISC-V GP layout

## Scope and disposition

Assignment: `SOURCE-CLOSURE-RESUME-BATCH03-ITEM02-SOURCE81-S2-RISCV-GP-V1`.

Disposition: `STRUCTURAL_FATAL__DIRECT_CURRENT_UNION_OR_PRIMARY_COLLISION_OR_GENERIC_LAYOUT_KERNEL__RETURN_TO_MAINLINE`.

This is source-plus-primary-collision closure only.  It makes no clean-brief, Q2, candidate, PASS, STOP, or stage-state decision.

## Fixed object and bounded acquisition

- Pin: `llvm/llvm-project` `main` → `367b306e9c12e16621b27e606bfbb765166a6b96`.
- Frozen object: medlow, position-dependent static RISC-V ELF, one `gp`, unchanged input symbols/values/ABI/loader semantics, then stock `LLD --relax-gp`.
- Twelve counted calls were used: eight official source/spec requests, three frozen locator queries, and one primary-page opening.  Persisted official bytes total 472,470, below 48 MiB.  No clone, link, execution, Zephyr acquisition, benchmark, or claim-bearing observation occurred.
- The fixed `lld/test/ELF/riscv-relax-gp.s` route returned HTTP 404.  It is recorded as path-drift telemetry only, without replacement or absence inference.

## Current source union

Official LLVM documentation states the exact same carrier constraints: medlow code model, static non-PIC executable, one process-wide `gp`, `--relax-gp`, and a 2048-byte signed-12-bit window around `__global_pointer$`.  It also states that smaller globals are placed in `.sdata/.sbss`, that LLD lays these near `.data`, and that the small-data threshold controls eligibility (`07-RISCVUsage.html`, section “Global Pointer (GP) Relaxation and the Small Data Limit”, lines 1395–1411).

Pinned LLD source implements the relocation rewrite after testing displacement from `ctx.sym.riscvGlobalPointer` (`02-RISCV.cpp`, around lines 1011–1028); `--relax-gp` is an explicit default-off LLD option (`03-Driver.cpp` line 1556; `05-Options.td` lines 425–427).  The current linker-script pipeline controls assignment of input sections to output sections and provides section ordering/control surfaces (`03-Driver.cpp`, lines 922–930, 1556–1584, 3555–3564).

## Collision closure and structural consequence

The three frozen locator queries returned only one primary candidate meeting the RISC-V GP language condition: arXiv:2605.25602, *Code size reduction by advanced near addressing modes*.  Its primary abstract explicitly studies adding new near-addressing variants to the RISC-V ISA.  It is therefore `RELATED_ONLY` rather than a five-field same-object collision: the frozen object prohibits an ISA change.  No result omission is treated as novelty or absence.

For the frozen current-ISA action, all candidate decisions are: select one legal point, arrange/group data in the existing section/script placement surface, then use an already-native fixed-radius GP relaxation.  Once instruction encodings, one-gp semantics, values and ELF endpoint are held fixed, that decision reduces to generic one-dimensional weighted placement/window coverage (and, with size/budget objectives, packing/knapsack).  The RISC-V-specific portion is already supplied by LLD’s 2048-byte GP predicate and stock relaxation.  A data grouping/layout optimizer over that predicate is not a distinct target-specific atomic action or finite guarantee.

Thus the exact proposal is structurally absorbed either by current script/configuration actions or by the generic layout kernel; it cannot enter candidate-grade review under the frozen family signature.

## Falsifier and full cost

A separately scoped successor would have to alter its frozen action/guarantee and first prove a same-ELF plan unavailable to the current one-gp/script/relaxation union.  Any such analysis must retain object preparation, linker CPU/RSS/temp, text bytes, static-data/padding bytes, relocation/loader acceptance, GP initialization, startup, and relevant runtime accesses.  No performance or correctness claim was observed here.
