# Candidate-grade deep review

## Mach-O `LC_DYLD_CHAINED_FIXUPS` — STRUCTURAL_DROP

### Same-object contract and native oracle

Input fixes all linked pointer locations and their rebase/bind targets, addends, dylib ordinals and executable behavior. The stock native oracle is dyld-compatible loading plus LLVM Mach-O parsing/`llvm-objdump --macho --chained-fixups`; equivalence requires the same resolved target at every fixed pointer and same loader-visible output. It cannot reorder/relocate pointers, mutate segments, or use a different loader contract.

### Current upstream reality and strongest fair union

Frozen current upstream is LLVM `main` Mach-O lld source, accessed 2026-08-11. `MachO/Options.td` defines `-fixup_chains` (“Emit chained fixups”) and `-no_fixup_chains` (“classic dyld opcodes”). `MachO/Driver.cpp` uses the last of those flags and rejects requested chains when output is non-PIC, target is not x86_64/x86_64h/arm64, or `-preload` is present. LLVM's current Mach-O object reader exposes chain targets, per-segment data, `PageStarts`, `PageOffset`, bind/rebase kind, and chained-fixups header access.

The current lld test `chained-fixups-addend.s` provides source-level branch evidence: for the same stock writer invoked with `-fixup_chains`, import representation selects `DYLD_CHAINED_IMPORT`, `DYLD_CHAINED_IMPORT_ADDEND`, or `DYLD_CHAINED_IMPORT_ADDEND64` according to addend range and is checked by `llvm-objdump`. This is a complete relevant flag/encoding union for the candidate, not just default output.

### Global action certificate test

For every fixed data page form a directed graph whose vertices are fixed-pointer offsets and whose admissible edges are the pointer-format-encodable forward next links. A chain start is required for each component/gap; no edge crosses a page. On the smallest witness, `a<b` on P has one legal edge if encodable; adding it replaces two starts with one, while Q's pointer cannot share P's chain. Thus maximal edge inclusion independently per page minimizes the number of starts. Import records are selected by their fixed symbol/ordinal/addend representability; changing their order does not create a new target mapping or a new guarantee.

There is no union-external complete global action: skipping a legal edge is dominated for start metadata; adding a forbidden edge requires changing pointer location/format or loader semantics. Optimizing placement of the pointers themselves is a different linker layout problem, and encoding a selected chain by a new routine is an emitter patch. Generic packing/ILP is expressly out of scope.

### Natural carrier, full cost, and finite falsifier

A finite natural route is a version-pinned open Darwin-targeted project with fixed object/dylib inputs; Stage A would record source revision, object hashes, target triple, deployment target and all linker flags. Full cost must include link CPU/wall/RSS, dyld/load CPU/wall/RSS, `__LINKEDIT`/fixup/import/symbol bytes, temporary storage and launch latency. It must not substitute simulator/player policy.

The 72-hour falsifier is to pin the LLVM commit, enumerate `-fixup_chains`, `-no_fixup_chains`, PIC/arch/preload and deployment-target behavior; construct the two-page witness; inspect stock output with LLVM parser and compare resolved pointer target digest. Reject immediately if a claimed action is an existing encoding branch, requires moving pointers/segments, changes loader semantics, or fails a full-cost Pareto criterion. This plan was not executed.

### Six-dimensional decision

| facet | result |
|---|---|
| decision rule | fixed geometry forces maximal legal chain edges; current linker exposes chain/classic and import variants |
| information | all pointer targets/addends are fixed; no extra same-object information |
| complexity/resource | no independent global combinatorial residual after page/range constraints |
| quality/guarantee | loader mapping remains fixed; no stronger guarantee identified |
| full cost | finite and complete but cannot rescue an absorbed action |
| generalization/no-gain | any gain requires changed layout or local encoding |

**Decision:** `STRUCTURAL_DROP__FIXED_LAYOUT_FORCES_CHAIN_GRAPH__CURRENT_LINKER_COVERS_ENCODING_BRANCHES`. This is an action-space/collision conclusion, not a result/readiness inference.
