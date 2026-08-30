# Source / collision / action-space matrix

Frozen cutoff: `2026-08-09`. Sources below are primary papers, official upstream documentation, or official upstream source.

| Object and source | Frozen factual role | Same-object action space | Classification / disposition |
|---|---|---|---|
| LLVM bitcode format, current official documentation: <https://llvm.org/docs/BitCodeFormat.html> | Abbreviations are self-described; different files may define different sets; readers must not know writer abbreviations. `BLOCKINFO` and inline scope are native legal mechanisms. | choose legal abbreviation grammar, scope, definition order, and record-to-abbreviation assignment while retaining the decoded IR | `ACTION_GAP_HYPOTHESIS`; candidate is only the complete costed constructor over this native interface |
| LLVM current `BitcodeWriter.cpp`, upstream main mirror `de8cb59` observed 2026-08-09, source path: <https://raw.githubusercontent.com/llvm/llvm-project/main/llvm/lib/Bitcode/Writer/BitcodeWriter.cpp> | `writeBlockInfo()` creates a fixed hand-written family and asserts expected IDs (notably lines 3764–4041 in observed source). Some widths depend on type count; this is not a universal dictionary search. | fixed emitted templates plus dynamic type-width; `preserve-bc-uselistorder`; hidden `bitcode-mdindex-threshold=25`, `bitcode-flush-threshold=512`; `combined-index-memprof-context`; no discovered option selects a file-specific abbreviation dictionary | `DEPLOYMENT_BASELINE` and `DIRECT_SUBTRACT`; configuration search is excluded as routine tuning |
| `llvm-bcanalyzer`, current official command guide: <https://llvm.org/docs/CommandGuide/llvm-bcanalyzer.html> | Reads bitcode and exposes encoding statistics. | native structural audit, not a constructor | `NATIVE_ORACLE` |
| LLVM Test-Suite: <https://llvm.org/docs/TestSuiteGuide.html>; MLGO corpus utilities: <https://llvm.org/docs/MLGO.html> | Public natural build-derived bitcode corpus routes. | module corpus and recorded build commands | `NATURAL_INPUT` |
| Bartell, *Optimizing Whole Programs for Code Size* (2021): <https://publish.illinois.edu/allvm-project/files/2022/01/bartell-dissertation-2021.pdf> | BCDB rewrites bit fields to byte-align them for external compression/storage, and has different full-cost/objective assumptions. | byte-alignment plus external compressor/database pipeline | `DIRECT_SUBTRACT`; retain only raw native-bitcode abbreviation planning, with no wrapper/decompressor/database substitution |
| Lindfors, *Compression-friendly Encoding for LLVM Intermediate Representation* (2014): <https://aaltodoc.aalto.fi/items/7ebe69a7-7968-4c11-8b87-b6db30db614a> | Earlier alternate/compression-friendly encoding exploration. | encoding redesign rather than a current-native reader-compatible abbreviation planner | `METHODOLOGICAL_ADJACENT` |
| LLVM 2013 encoding proposal: <https://groups.google.com/g/llvm-dev/c/2eNOU1MVCuY> | Historical proposal for smaller bitcode; not evidence of current absence. | alternative encoding/compression pipeline | `HISTORICAL_ONLY_NOT_ACTION_GAP_EVIDENCE` |

## Frozen action-gap certificate

`llvm-as` can emit only the source-coded abbreviation templates and width choices above. The proposed action is not a choice among those flags: it takes the full decoded record stream and constructs a file-local legal set of `DEFINE_ABBREV` / `BLOCKINFO` or inline definitions, jointly assigning each record to an abbreviation or fallback, with definition bits, abbreviation-ID width growth, alignment, writer time, and reader time in the objective. The official format explicitly permits the resulting self-described action and says the reader must not encode writer-specific knowledge. Therefore the action is outside the observed current deployable writer union, subject to Stage 0 re-checking the pinned source.

## Explicit drops

- Calling current `automerge`-like controls, `preserve-bc-uselistorder`, or writer flush thresholds a new encoder: `DROP_ROUTINE_CONFIGURATION`.
- Wrapping bitcode in zstd/BCDB/RocksDB or requiring a new decompressor: `DROP_CHANGED_NATIVE_READER_OR_EXTERNAL_PIPELINE`.
- Reordering IR/program semantics or comparing only compressed container size: `DROP_CHANGED_OBJECT_OR_INCOMPLETE_COST`.
