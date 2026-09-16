# Discovery log — DISCOVERY-S6-20260809-V8.7-WAVE15

- Frozen date: `2026-08-09`
- Method: accepted `DISCOVERY_METHOD_V2_V8_1`, calibrated v8.6 fidelity-plan admission, and v8.7 `CURRENT_UPSTREAM_REALITY_CHECK`; the TLS-blocked two-axis v8.2r2 was not used.
- Scope: direct algorithm/software construction only. No experiment, benchmark, Stage 0/A/B directory, or controller modification was created.

## Three-pass convergence

1. **Lineage / seed distance.** LLVM bitcode has a native, self-describing abbreviation language. The closest same-object work found is BCDB's byte-alignment rewrite for *externally compressed* storage, not native abbreviation-dictionary construction. Search also covered the 2013 LLVM encoding proposal and the 2014 compression-friendly LLVM-IR thesis. No claim of global firstness is made.
2. **Current competitor union.** The deployable union is the current LLVM `llvm-as` / `WriteBitcodeToFile` writer, its current fixed `writeBlockInfo()` abbreviation family, format-legal inline abbreviations, and the user-visible `preserve-bc-uselistorder`, `bitcode-mdindex-threshold`, and `bitcode-flush-threshold` controls. The format's native reader accepts self-described abbreviations and must not use writer knowledge. The fixed family is a direct subtractor, not a straw baseline.
3. **Artifact / natural-input / execution route.** LLVM Test-Suite and upstream MLGO corpus tooling provide natural C/C++ build-derived bitcode. `llvm-dis`, `opt -verify`, `llvm-as`, and `llvm-bcanalyzer` provide a finite native-reader/IR-equivalence closure path on CPU.

## Result

One conditional `PROPOSE_STAGE0` is retained: `LLVM-BITCODE-ABBREV-PLANNER`. Its action gap is a sourced structural hypothesis, not a completed optimization result. Stage 0 must independently re-run collision search, particularly against BCDB and any unpublished/upstream abbreviation-selection work.

No excluded object was revived or reused: CVC5, Parquet, PB, Git, RocksDB, ORC, and SQLite FTS5 were excluded.
