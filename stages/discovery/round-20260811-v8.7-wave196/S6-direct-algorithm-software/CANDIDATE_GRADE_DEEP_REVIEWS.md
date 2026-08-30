# Candidate-grade deep review

## LLVM DWARF DIE / abbreviation global planner — NOT_ADMITTED_UNFROZEN

### Same-object contract and native oracle

Input is a fixed LLVM IR/source program and debug configuration; output is DWARF that decodes to the same DIE hierarchy, tags, attributes, values, references, and version-valid forms. `llvm-dwarfdump --verify`, structural DIE comparison, and ordinary DWARF consumers are the stock oracle. Changing debug information, reader behavior, object format, or applying an external compressor is outside the object.

### Current upstream reality and strongest executable union

Current LLVM source renderings establish these native actions:

1. `DIE::generateAbbrev`/`DIEAbbrevSet::uniqueAbbreviation` builds and deduplicates a declaration by the complete structural profile: tag, child flag, and each attribute/form/implicit-constant datum.
2. `DIEAbbrev::Emit` serializes one declaration; `AsmPrinter::emitDwarfAbbrev` emits its code and the declaration; DIE emission uses the assigned abbreviation code. Both declaration/code paths use DWARF's variable-length integer representation where applicable.
3. The writer has different debug modes and unit organization routes. Before a residual could be claimed, the source-pinned review must enumerate abbreviation-set lifetime and assignment for compile units, type units, split-DWARF, and all relevant `-g*`/DWARF-version/debug-type options, including defaults and non-default paths.

This known union is already a strong same-object subtractor for exact declaration deduplication. It is not honest to call the union complete from rendered source excerpts alone, so no implementation-absence claim is made.

### Action-divergence witness and its limit

Construct a single legal abbreviation table with 128 or more distinct declarations and two declarations with unequal use counts. Reassign two positive declaration codes across the ULEB one-byte/two-byte boundary and rewrite every DIE reference. The decoded DIE tree is unchanged, but the byte cost can change. This is a minimal native-legal encoding witness, subject to regenerating a valid table and preserving the reserved zero code.

It is insufficient for admission: if the only proposal is assigning shorter codes to higher-frequency declarations, it is ordinary frequency sorting. A viable N2 must additionally prove that a joint scope/dictionary/code choice has a nontrivial combinatorial structure, is not already expressible by LLVM's full current union, and retains the same output semantics.

### Natural carrier, full cost, and finite Stage A killer

- Natural route: version-pinned LLVM Test-Suite C/C++ debug builds, supplemented only by ordinary public open-source C/C++ packages already accepted by the Stage-A assignment.
- Full-cost ledger: debug writer CPU/wall/RSS/temp; object and `.debug_abbrev`/`.debug_info` bytes; `llvm-dwarfdump --verify` CPU/RSS; stock parser/debugger lookup/read cost; build and conversion overhead. Byte savings alone are not a claim.
- 72-hour falsifier: (i) pin an LLVM commit and enumerate all abbreviation-set allocation, code assignment, unit-scope, and relevant compiler flags; (ii) construct and validate the finite >127-declaration witness using native LLVM output/rewrite paths; (iii) compare decoded DIE trees and run `llvm-dwarfdump --verify`; (iv) STOP the candidate if the complete union already expresses the planner, if all effect is weighted code sorting, if natural inputs do not expose the required state, or if semantic equality cannot be mechanically checked.

### Fidelity closure plan and ceiling

`FINITE_FIDELITY_GAP`: the frozen object, legal witness, stock oracle, denominator, and a finite source/validation route are specified. The remaining gap is the exhaustive current-union/source collision closure and a formal, non-routine N2 statement. Therefore no Stage 0 brief is proposed. Structural paper potential is unassessed rather than rejected; current evidence readiness is insufficient for admission.
