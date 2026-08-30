# Source / collision / action matrix

| Family | Current official source reality | Current strongest union and decisive check | Result |
|---|---|---|---|
| LLVM coroutine frame | LLVM docs specify common ABI offsets, three entry functions, frame lifecycle, destroy/exception semantics and named lowering passes. | Comparator is the full current Clang+LLVM coroutine pipeline, not an individual pass. Need source-pinned enumeration to test any joint construction. | NOT_ADMITTED_UNFROZEN |
| LLVM EH cleanup | LLVM/Clang documents expose cleanup scopes, landing pads/funclets, table formats and personality-driven unwind. | The apparent residual collapses to generic CFG/table compaction under these current semantic primitives. | STRUCTURAL_DROP |
| Wasm exception tag | Official spec supplies semantics, reference interpreter and tests; WABT documents exception support under an explicit flag. | No single current engine/compiler union is frozen; no target-specific construction identified. | NOT_ADMITTED_UNFROZEN |
| AArch64 GCS debugger seam | Current LLDB doc describes GCS registers, control-stack allocation, expression wrapper push and restore behavior. | Contribution would be debugger/emulator support or wrapper repair, not a same-program compiler/runtime N1/N2. | STRUCTURAL_DROP |
| futex2 waitv | Kernel doc fixes array bounds, expected-value comparison, atomic rollback on mismatch and wake/timeout/signal outcomes. | Changing registration/order is synchronization policy/scheduling and cannot retain a distinct target-specific construction under the fixed atomic contract. | STRUCTURAL_DROP |
| PAuth | Current Clang doc and historical registry coverage. | Existing architecture-state family. | EXCLUDED |
| ShadowCallStack | Current Clang doc and historical registry coverage. | Contained shadow-stack ABI/state family. | EXCLUDED |

No current-absence claim was used to prove a retained action gap. `SEARCH_BOUNDED_OPEN` is confined to the two finite-closure rows and does not assert firstness.
