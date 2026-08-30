# Current Action and Frontier Audit — LLVM DWARF Call-Site Revision 1

## Pinned current source boundary

| Component | Current role | Why it is included |
|---|---|---|
| LLVM main `e72ba6cf366a3180cbf5a8690d9e50665880ab76` | frozen upstream | one immutable revision contract |
| `LiveDebugVariables` | maintains debug values through allocation where applicable | eliminates claims about untracked ordinary moves/spills |
| instruction-reference lifecycle | unlinks debug instructions during RA then reconnects post-RA value/location information | prevents treating a metadata representation gap as an allocation gap |
| `LiveDebugValues` VarLoc or InstrRef, fixed compatible mode | tracks copies, stack transfers, restores and clobbers after allocation | strongest same-object propagation comparator |
| `DwarfDebug::collectCallSiteParameters` | backward forwarding-register / clobbered-unit interpretation and parameter emission | defines the true call-site expression grammar/action boundary |
| x86 SysV target hooks | register aliases, callee-save rules, copy/spill recognition and frame/CFI actions | binds state legality to the target, not generic RA |

Sources: [instruction referencing](https://llvm.org/docs/InstrRefDebugInfo.html), [source-level debugging](https://llvm.org/docs/SourceLevelDebugging.html), [DwarfDebug](https://llvm.org/doxygen/DwarfDebug_8cpp_source.html), [LiveDebugValues](https://llvm.org/doxygen/LiveDebugValues_8cpp_source.html), and [call-site implementation review D60716](https://reviews.llvm.org/D60716).

## Complete action catalog for the declared bounded class

| Action | Native source / legality | Recognizer outcome | Frontier role |
|---|---|---|---|
| caller-saved allocation/copy | normal x86 RA and COPY | usable only if DwarfDebug can legally interpret the source; computed `RAX` witness source is not | low-code-cost branch |
| first use of a CSR | RA selects CSR; SysV save/restore/CFI required | direct CSR source can be represented by legal call-site breg expression | preserve branch |
| spill/reload to fixed frame location | normal allocation/frame action; stack base/offset must be legal | recognizable when current target expression path accepts the base/location | preserve alternative |
| simple target-recognized rematerialization | existing target/DWARF grammar only | usable only if described by current expression grammar | optional branch |
| entry value | fixed option and grammar, register-only/current limitations | only unmodified formal/register case | comparator action, not rescue for `%sum` |
| unavailable | current legal fallback | emits no valid parameter value | baseline/no-gain state |

Actions explicitly excluded: a debug-only postprocessor, non-native value store, changed source/ABI, arbitrary symbolic expression, generic RA/CP/ILP as the method, and alternative debug modes silently composed into one baseline.

## Why Plan A is not metadata-only and why Plan B separates

The call is the same in both plans. Plan A's allocated physical source is caller-saved `RAX`; it is a computed value whose backward defining arithmetic is outside the current call-site loaded-value/entry-value action grammar. Plan B's source is callee-saved `RBX`; its saving and restoring change native code, CFI and physical resource use, and the current grammar can encode it as `DW_OP_breg`. This is a full plan distinction at the same pre-RA MIR—not a request for DwarfDebug to emit a richer string after identical machine code.

The fixed call is in a non-entry MBB. This prevents current source's entry-MBB-only entry-value trial from being treated as a Plan A rescue; moving it to the entry block invalidates the witness.

## Frontier soundness sketch

The state tuple preserves every future premise used by the declared action catalog:

| Future premise | State component retained |
|---|---|
| physical register overlap and call clobber | `L`, `A` |
| whether CSR use is ABI/unwind legal | `A`, `F` |
| whether a stack source is addressable/legal | `L`, `F` |
| whether DwarfDebug can follow an argument backwards | `Q` |
| whether `DW_OP_entry_value` is legal | `E` |
| all Pareto comparisons | `C` |

Consequently, equivalent states have the same legal successor set and add the same declared incremental cost. Induction over ordered cuts proves exact frontier preservation for the restricted bounded-cut class. The proof does not cover arbitrary CFG-wide RA, arbitrary expressions, unbounded stack identities or alternate debug modes; those are intentionally outside the claim.

## Current-union action map

| Candidate claim part | Current union behavior | Residual disposition |
|---|---|---|
| track an existing move/spill/restore | LiveDebugValues / hooks already do it | absorbed |
| emit existing call-site parameter/entry expression | DwarfDebug already does it | absorbed |
| choose CSR/spill/copy before allocation for computed call-site value under Pareto cost | no such fixed-object current objective/guarantee shown in current source | retained only for bounded certificate |
| solve arbitrary RA via CP/ILP | generic ceiling | excluded |

## No-gain / falsifier map

- If a chosen legal configuration causes the current allocator to generate Plan B's full coordinate, the point is not counted.
- If a computed caller-saved source becomes currently expressible by a legal current DwarfDebug transfer, Plan A is no longer the witness.
- If the call is moved to the entry MBB, the changed entry-value action grammar invalidates this witness.
- If the only separation is a changed debug record after identical native code, the revision fails under `BELOW_Q2_STOP__METADATA_ONLY_OR_GENERIC_RA_OR_CURRENT_UNION_ABSORPTION`.
- If `w` is unbounded or the state requires arbitrary stack identity, no FPT guarantee is claimed and the candidate must not generalize the result.
