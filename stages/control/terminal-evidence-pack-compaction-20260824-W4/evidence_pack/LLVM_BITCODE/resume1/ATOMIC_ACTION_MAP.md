# WL-SLDP native atomic-action map

This map is the executable boundary for assignment
`STAGEA-L3-20260811-LLVM-BITCODE-ABBREV-PLANNER-RESUME1-V8.7`.
Every candidate decision has an ordinary LLVM bitstream action and an exact
ledger path; no candidate byte is produced by an alternative codec.

| Frozen decision | Native atomic action | Implementation | Exact cost path | Fail-closed condition |
|---|---|---|---|---|
| grammar construction | `DEFINE_ABBREV` with literal, `Fixed`, `VBR`, `Array`, `Char6`, or `Blob` operands | `generate_templates`, `choose_scalar_op` | `emit_abbrev` at the induced block `CodeLen` | no grammar matches unchanged record/blob |
| reuse current shared grammar | keep parsed BLOCKINFO definitions and inherited IDs | parsed `inherited_abbrevs` in every frontier | zero new local bits; IDs still contribute to `CodeLen` | parsed inheritance or ID is inconsistent |
| new immediate scope | emit selected definition before the first record in the leaf | `first_use_order`, `emit_planned_block` | full definition bits plus any `CodeLen` step | leaf is outside offset-safe executable domain |
| BLOCKINFO scope | capacity-neutral move of the final module VST grammar to the existing block-14 group | `capacity_neutral_vst_scope` | moved definition, replacement definition, END alignment, unchanged BLOCKINFO words | any affected instance, ID, use, or word-length invariant fails |
| legal order/locality | sort selected definitions by first matching record, then canonical grammar key; emit before records | `first_use_order` | order-specific definition stream (payload is ID-width invariant) | definition would follow a use |
| record assignment | choose inherited/local application ID or native ID 3 fallback | exact residue DP in `evaluate_selection` | code ID + exact scalar/array/blob payload | Blob has no legal grammar; literal/width mismatch |
| induced ID and code width | IDs start at 4; block `CodeLen=max(2, bit_length(3+n))` | `app_code_width` | every definition/control/record code uses that width | an installed/used ID is not representable |
| blob alignment | native VBR length, 32-bit align, padded blob bytes | frozen codec `emit_record` | DP state includes bit residue mod 32 | blob or padding differs on reparse |
| block accounting | native enter header, length word, end code, and align | `emit_tree`, `reemit` | output file byte count is authoritative | declared/consumed block words disagree |
| global coupling | exact per-leaf width-ladder frontiers convolved under one module definition budget | `exact_frontier`, `choose_global` | sum of exact aligned leaf body bits | global/per-leaf/universe bound exceeded |

Offset-bearing values such as `VSTOFFSET` and `FNENTRY` are frozen semantic
record values, not patchable metadata.  Natural execution mutates only the
final direct module VST and leaf top-level blocks after the Module.  The one
BLOCKINFO move is allowed only when its word length and all earlier IDs remain
unchanged.  Any native reader, trace, decoded-IR, or verifier failure freezes
the arm as invalid and triggers the contract's scientific STOP mechanism; it
cannot be treated as a candidate data point.

The first-use order is a real legal writer order, but with LLVM's block-fixed
`CodeLen` its permutation has no payload advantage once the selected set is
fixed.  This degeneracy is reported honestly; the scientific coupling is among
grammar set, shared/local placement, record assignment, width step, alignment,
and the global definition budget, not a fictitious variable-width ID stream.
