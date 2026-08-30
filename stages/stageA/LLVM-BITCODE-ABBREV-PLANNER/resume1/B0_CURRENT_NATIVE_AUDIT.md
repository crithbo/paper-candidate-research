# B0 current-native action, flag, and source audit

## Frozen versions and scope

- Executable native writer/reader: LLVM 22.1.8, commit
  `ca7933e47d3a3451d81e72ac174dcb5aa28b59d1`.
- Current-upstream absence audit: LLVM `main`, commit
  `a1194be1baefa99d20a09bd04b16056be0ab7225`.
- Ordinary-object route: `llvm-as` calls `WriteBitcodeToFile` on one Module,
  preserves use-list order, emits the ordinary raw `BC C0 DE` stream, and then
  writes the native symtab/strtab.  Index-only and ThinLink writers produce
  different objects and are excluded from B0 for this frozen exact object.
- All executable arms use the release writer/reader.  The current commit is a
  source-level collision/absence check, not an executable surrogate.

The audit is bounded to the pinned public source blobs listed in the continuity
manifest and `inputs/PINNED_HEADER_MANIFEST.tsv`.  The machine-readable
callsite inventory is in `results/B0_ACTION_CALLSITES.tsv`; flag evidence is in
`results/B0_FLAG_CALLSITES.tsv`.

## Complete native action family for B0

The current writer constructs a mixed static and input-sensitive grammar.  For
the ordinary Module route, its full realizable family consists of:

1. fixed `BLOCKINFO_BLOCK` definitions selected by writer source for block IDs;
2. immediate block-local definitions emitted at fixed writer callsites;
3. a block-header code width fixed on block entry, hence chosen large enough
   for every inherited and local application abbreviation ID in that block;
4. source-selected literals, `Fixed(n)`, `VBR(n)`, `Array`, `Char6`, and `Blob`
   operand encodings;
5. source/input-conditioned record-shape choices, including distinct type,
   metadata, instruction, value-symbol, summary, string, and blob forms;
6. explicit abbreviation assignment where a writer callsite supplies an ID,
   and native `UNABBREV_RECORD` fallback where it does not;
7. source-fixed emission order: BLOCKINFO groups and their definitions, local
   definitions at their callsites, records in semantic writer order, then
   `END_BLOCK` and 32-bit alignment;
8. exact native accounting for every definition, record code, abbreviation ID,
   operand payload, array/blob length, blob padding, block header, `END_BLOCK`,
   block-length word, and alignment bit.

At the pinned commits the mechanical inventory found the following source
callsites (the counts are audit evidence, not independent action counts):

| commit role | BLOCKINFO defs | local defs | enter block | record emits | blob | backpatch |
|---|---:|---:|---:|---:|---:|---:|
| release executable | 26 | 47 | 21 | 115 | 1 | 2 |
| current cutoff | 27 | 47 | 21 | 117 | 1 | 2 |

Current-only callsite differences include a constants-block BLOCKINFO grammar,
`GUIDListAbbrev`, and records for `FS_PERMODULE_PROFILE`,
`MODULE_CODE_ASM_PROPERTY`, and `MODULE_CODE_GUIDLIST`.  The release has the
removed RelBF abbreviation/record route.  They are version differences, not
candidate residual actions.

No global grammar/scope/order/assignment planner, exact subset optimizer, or
ID-width step-aware objective was found in these pinned sources.  This is a
bounded source-level absence statement only; it is not a claim that no such
work exists outside the frozen source/current-literature search.

## Flags and same-trace strata

The following options/defaults are part of the complete route audit.  Any flag
that can change the Module or expanded record trace is frozen identically within
an experimental stratum and is not a candidate action.

| option/control | frozen ordinary default | classification |
|---|---|---|
| `llvm-as -module-hash` | false | changes emitted records; fixed false |
| `llvm-as -data-layout` | empty | can change Module/records; fixed empty |
| `llvm-as -disable-verify` | false | verification control; fixed false |
| `ShouldPreserveUseListOrder` | true | can change use-list records; fixed true |
| optional summary `Index` | null | non-null changes object/records; fixed null |
| API `GenerateHash`/`ModHash` | false/null | changes records; fixed |
| `preserve-bc-uselistorder` | true | internal route control; fixed |
| `bitcode-mdindex-threshold` | 25 | trace/record selection; fixed per version |
| `bitcode-flush-threshold` | 512 | buffering/ordering behavior; fixed |
| `combined-index-memprof-context` | build-dependent debug default | summary/index route; outside ordinary object |
| `write-relbf-to-summary` | false in release, removed at cutoff | summary route; outside ordinary object |

Output filename, force-terminal, diagnostic printing, and disable-output flags
do not create alternate ordinary grammar actions.  Module splitting/merging,
ThinLink/index writers, external compression, another reader, and another LLVM
commit are not members of B0 because they change the frozen object or codec
path.

## Comparator interpretation

- **B0:** byte-for-byte native current writer output at the executable commit.
- **B1:** exact oracle over subsets, legal scope/availability, ordering, and
  record assignment using only grammars already emitted by B0 for the frozen
  trace.  It may remove unused B0 definitions but cannot synthesize a grammar.
- **B2:** greedy bounded planner over the same candidate grammar/scope/action
  universe and limits as WL-SLDP, scored with exact net native bits.
- **B3:** exhaustive tiny-instance ceiling only; never a scalable comparator.

All arms retain the same raw-native denominator and are checked by the same
unmodified release reader, canonical expanded trace, decoded IR equality, and
`opt -passes=verify`.  BCDB/external compression remains a subtractor/control
and is not substituted for raw-native B0--B2.

## Audit conclusion for the pre-claim gate

The action and flag surface is enumerated sufficiently for a bounded Stage A
gate.  This section does not itself pass the gate: native writer parity,
candidate atomic mapping, the exact common-denominator cost path, and the
ID-width witness must also pass before any natural claim-bearing run.
