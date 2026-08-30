# Source and Collision Audit — LLVM-BITCODE-ABBREV-PLANNER

## Audit scope

- Cutoff: `2026-08-09`
- Role: independent Stage 0 PRIMARY
- Status: `SEARCH_BOUNDED_OPEN`
- Evidence policy: official current source/docs, paper originals, official repositories and author-hosted artifacts only
- Important limitation: an immutable raw fetch for the short source snapshot failed during review. This is a provenance/readiness warning and supplies no evidence of absence.

## 1. Current LLVM source reality check

### Ordinary module writer

Primary source: LLVM current `BitcodeWriter.cpp`:

https://raw.githubusercontent.com/llvm/llvm-project/main/llvm/lib/Bitcode/Writer/BitcodeWriter.cpp

The following behaviors were directly inspected:

- `ModuleBitcodeWriter::writeBlockInfo` defines an ordered hard-coded family for repeated constants, function, and value-symbol-table blocks.
- The implementation checks expected abbreviation IDs, so selected definitions and ordering affect the code space.
- The writer computes type-index width from the module.
- Other blocks install local abbreviations with `EmitAbbrev` rather than relying only on `BLOCKINFO`.
- Strings may use Char6, fixed-7, or fixed-8 encodings according to content.
- Several instruction records select abbreviations according to record shape and available fields.
- Metadata and summary paths define specialized abbreviations.
- Relevant hidden options include metadata-index threshold, flush threshold, combined-index memprof context, and use-list preservation. None is a dictionary planner.
- `WriteBitcodeToFile` routes ordinary module output through `ModuleBitcodeWriter` before symbol/string table completion.

Conclusion: the fair native baseline is a mixed static and input-sensitive family. Treating only `writeBlockInfo` as LLVM's action space would be materially unfair.

### Other writer paths

`IndexBitcodeWriter` and `ThinLinkBitcodeWriter` were inspected as separate bitcode outputs. They also contain writer-specific abbreviation choices, but their combined-index/thin-link objects are not the frozen ordinary-module `.bc` object. Generic users of `BitstreamWriter` in other LLVM tools likewise do not become same-object comparators merely because they share the container format.

No cross-record global abbreviation-dictionary/scope/assignment/ID-width planner was found in the inspected current writer paths. This is a bounded result, not a universal absence or firstness assertion.

### Snapshot caveat

The Discovery package freezes short commit `de8cb59`, and an official LLVM project log associated that snapshot with the cutoff. Main moved during review. The audit used rendered current-main source for behavioral reconstruction because retrieval of an immutable raw blob did not close. The pre-claim fidelity gate must resolve the full commit, archive source blobs and hashes, and rerun the action-space audit. A network/TLS failure does not change the scientific decision.

## 2. Format legality and semantics

Primary source: LLVM Bitcode File Format:

- https://llvm.org/docs/BitCodeFormat.html
- https://llvm.googlesource.com/llvm-project/llvm/+/refs/heads/main/docs/BitCodeFormat.md

The format documents that abbreviations are self-describing, can be selected dynamically by a producer, are scoped either to an immediate block or through `BLOCKINFO` for a block ID, receive sequential IDs beginning after reserved IDs, and interact with the abbreviation-ID width chosen at block entry. This supports legality of a file-local planner and establishes the definition-amortization and ID-width costs. It does not establish novelty or prove that a global planner is useful.

## 3. Current tool surface

- `llvm-as`: https://llvm.org/docs/CommandGuide/llvm-as.html
- `llvm-bcanalyzer`: https://llvm.org/docs/CommandGuide/llvm-bcanalyzer.html

The documented `llvm-as` interface supplies normal assembly/output controls, not a global abbreviation planner. `llvm-bcanalyzer` can dump record/block structure and size statistics, so it is a validation oracle and measurement tool rather than a constructor baseline.

## 4. Direct and methodological collision audit

### BCDB

Primary source: Nicholas Bartell, dissertation describing BCDB:

https://publish.illinois.edu/allvm-project/files/2022/01/bartell-dissertation-2021.pdf

BCDB partitions modules for database storage and rewrites bitstream fields to be byte-aligned so external Zlib/database compression becomes more effective. The source reports that raw uncompressed bitcode can become larger while externally compressed storage becomes smaller.

Classification: `DIRECT_SUBTRACTOR_FOR_GENERIC_REENCODING_CLAIMS`, but not a same-object fair baseline for minimizing raw ordinary native bitcode. It blocks claims about generic compression-friendly LLVM re-encoding or storage pipelines. If the candidate later claims external-compressed size, BCDB must become a direct comparator and the object must be re-reviewed rather than silently expanded.

### Alternative encodings and generic compression

Compression-friendly or alternative LLVM IR encodings, external Zstandard/Zlib, databases, and module splitting change the decoder, object, or storage pipeline. They are adjacent mechanisms and negative controls, not fair baseline members under the frozen native-reader/raw-byte objective.

### Same-object literature search

Bounded searches covered combinations of LLVM bitcode, abbreviation dictionary/planning/selection/optimization, `BLOCKINFO`, record assignment, PNaCl, BCDB, and current LLVM issues/source. No primary-source paper or tool was found that directly covers all of:

1. unchanged ordinary LLVM module semantics and record trace;
2. native current bitcode reader;
3. raw bitcode objective;
4. joint grammar, scope, assignment, and ID-width planning;
5. explicit writer and reader/full-cost accounting; and
6. an algorithmic or formal contribution.

Because issue/code-history coverage is bounded and current source moves, the correct novelty label is `SEARCH_BOUNDED_OPEN`, not “no prior work” or “first.”

## 5. Natural artifacts and reproducibility route

- LLVM Test-Suite Guide: https://llvm.org/docs/TestSuiteGuide.html
- MLGO documentation: https://llvm.org/docs/MLGO.html

These first-party resources make a public CPU-only natural corpus route credible. Stage A must freeze repository commits, licenses, build commands, compile flags, toolchain, module manifests, and hashes. Neither resource is evidence that the candidate has headroom.

## 6. Required current-source closure before evidence

Before the first claim-bearing observation:

1. resolve `de8cb59` to a full immutable commit and archive the relevant writer/docs blobs with hashes;
2. enumerate every abbreviation definition and assignment action reached by the ordinary module path on the frozen trace;
3. separate module, combined-index, ThinLink, and other bitstream-client objects;
4. implement the current-family subset baseline so unused-template/native-choice wins are subtracted;
5. compare the semantic record stream after abbreviation expansion, not only textual IR;
6. rerun primary-source issue/history searches at the pinned cutoff; and
7. record failed retrievals separately from scientific findings.

## 7. Source conclusions

- Current-native dynamic planner: `NOT_FOUND_IN_BOUNDED_CURRENT_SOURCE_AUDIT`
- Direct same-object paper/tool: `NOT_FOUND_IN_BOUNDED_PRIMARY_SEARCH`
- Current native mixed action family: `CONFIRMED_AND_REQUIRED_AS_BASELINE`
- BCDB collision: `METHODOLOGICALLY_IMPORTANT__OBJECT_DIFFERENT`
- Candidate action legality: `SUPPORTED_BY_FORMAT_SPEC`
- Novelty: `SEARCH_BOUNDED_OPEN`
- Resource failure inference: `NONE`
