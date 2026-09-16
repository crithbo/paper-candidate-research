# Source77 primary RQs

## RQ-01 — LLVM indexed instrumentation profile construction

- Frozen object: fixed instrumented program/binary, raw profiles and compiler-use semantics.
- RQ: Can a same-profile, producer-side indexed representation/merge algorithm improve merge+load+PGO full cost with a target-specific guarantee beyond `llvm-profdata`'s documented merge, weighting, layout, thread and format actions?
- Boundary: no changed profile counts/meaning, binary correlation semantics, profile consumer or external cache controller.
- Primary route: official `llvm-profdata` manual and instrumentation-profile format. Fallback only for transport: current official LLVM source.
- Result: `EXCLUDED_BEFORE_RAW__DOCUMENTED_MERGE_FORMAT_LAYOUT_THREAD_CONFIGURATION_WITHOUT_N2_SKELETON`.

## RQ-02 — GNU archive symbol-index construction

- Frozen object: fixed archive member object files, symbols and stock linker/archive reader semantics.
- RQ: Can a joint member/layout/symbol-index constructor give a target-specific same-archive lookup guarantee beyond native `ar`/index construction, without generic packing or a custom reader?
- Boundary: same members, ABI/link result and stock reader; no member reordering-only claim, format swap, custom linker, or packing solver.
- Primary route: current GNU `ar` manual. Fallback only for transport: current binutils source.
- Result: `EXCLUDED_BEFORE_RAW__GENERIC_ARCHIVE_PACKING_AND_NATIVE_INDEX_SHELL`.

## RQ-03 — GCC gcov record merge/check construction

- Frozen object: fixed instrumented source/binary and coverage semantics, including stock gcov report result.
- RQ: Does a same-coverage gcov record construction offer a non-controller aggregation/verification guarantee after instrumentation cost shifts to data handling?
- Boundary: no sampled/partial coverage, changed report meaning, generic compression, or post-processing wrapper.
- Primary route: official GCC gcov data-files manual, then current `gcov-tool` documentation/source. Fallback only for transport: official GCC source.
- Result: `LOCATOR_ONLY__CURRENT_NATIVE_ACTION_CATALOGUE_AND_NON_GENERIC_CONSTRUCTION_NOT_FROZEN`.

Selective/pre-RQ nomination: NONE (feature is OFF; direct primary routes reachable).
