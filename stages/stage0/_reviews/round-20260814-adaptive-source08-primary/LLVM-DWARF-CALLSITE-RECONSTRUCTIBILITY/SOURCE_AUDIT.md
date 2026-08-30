# Source and Collision Audit — LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY

## Scope and method

Independent source-reality check performed 2026-08-14. Only official LLVM upstream documentation/source, public LLVM review/test material, and primary compiler literature were used. No source build, benchmark, candidate implementation, or test execution was run.

| Source | Status | Finding | Role in decision |
|---|---|---|---|
| [LLVM `InstrRefDebugInfo`](https://llvm.org/docs/InstrRefDebugInfo.html) | current official doc, LLVM main checked as `e72ba6cf366a3180cbf5a8690d9e50665880ab76` | debug instructions are unlinked during RA; after RA, `LiveDebugValues` joins value and physical-location SSA, using copy/spill/restore recognition and target hooks. | strongest current propagation baseline; disproves a “LLVM cannot track spills” premise. |
| [LLVM source-level debug documentation](https://llvm.org/docs/SourceLevelDebugging.html) | current official doc | documents `DW_OP_LLVM_entry_value`, its current single-register limitation, `LiveDebugValues` introduction for unmodified parameters, and `AsmPrinter` call-site use. | bounds legal expression space; rules out an emitter-only novelty claim. |
| [current `LiveDebugValues.cpp`](https://llvm.org/doxygen/LiveDebugValues_8cpp_source.html) and [InstrRef implementation](https://www.llvm.org/docs/doxygen/InstrRefBasedImpl_8cpp_source.html) | current official source | current implementations select VarLoc/InstrRef propagation; the implementation uses physical-location quality/dataflow after code layout. | subtractor, not proof of allocation-time planning. |
| [current `DwarfDebug.cpp`](https://llvm.org/doxygen/DwarfDebug_8cpp_source.html) | current official source | `collectCallSiteParameters` and related machinery use forwarded-register worklists and clobbered register units to create call-site parameter entries. | exact call-site DWARF baseline. |
| [LLVM call-site implementation review D60716](https://reviews.llvm.org/D60716) | upstream archival primary implementation record | explains call-site parameter and entry-value construction, including x86 MIR test coverage. | confirms native semantics/test path, not an allocation-time optimizer. |
| [Unison paper](https://arxiv.org/abs/1804.02452) | primary research source | generic combinatorial register allocation and scheduling can be a high ceiling. | generic-oracle subtractor only; it lacks the LLVM/DWARF same-object claim. |

## Current action-union audit

1. **Pre/through allocation:** LLVM's normal target allocator, coalescing, copy insertion, spill/reload and frame decisions are the complete production action family to baseline. The inspected sources do not expose a call-site-reconstructibility objective in this family.
2. **Post allocation:** `LiveDebugValues` propagates value-to-location information; it recognizes copies and target-provided spill/restore operations, and invalidates clobbered locations. This is mandatory baseline functionality.
3. **DWARF emission:** `DwarfDebug` can build call-site parameter descriptions and entry-value forms. It is an emitter/analysis subtractor.
4. **Non-default surface:** instruction referencing vs VarLoc, target entry-value support, and debug-entry-values emission must be swept as a finite configuration dimension. Selecting a favorable setting is not a contribution.

## Direct-collision conclusion

`SEARCH_BOUNDED_OPEN`. No source inspected supplies all of: fixed same pre-RA MIR; allocation-time selection over native retain/move/spill/rematerialization actions; call-site reconstructibility Pareto objective; target-specific exact/FPT/certified frontier; and equal full-cost guarantee. Conversely, a proposal limited to tracking/emitting a value after the allocator is directly absorbed by current LLVM and must stop.

## Source integrity notes

- No absence claim is based on a network failure. The LLVM main ref was queried read-only and resolved to `e72ba6cf366a3180cbf5a8690d9e50665880ab76`.
- Public sources establish current baseline behavior, not a positive candidate result.
- No research source was used to assert a publication quartile; Q1/Q2 calibration is qualitative and separately bounded.

