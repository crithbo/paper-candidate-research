# Candidate-grade deep reviews

## D01 — PISA inverted-index constructor

- **Atomic union:** parse/tokenize, document/term IDs, posting accumulation, frequency/position payloads, dictionary, segment encoding and query-visible index build.
- **Semantics/cost:** identical corpus/analyzer/query semantics; charge input pass, build, encoded bytes, memory, lookup/query and result equality.
- **Witness/killer:** a repeated term across three documents shows posting ordering/codec choices, but no union-external complete constructor was named. Public collection; kill on query mismatch or a configuration/backend-only proposal.
- **Disposition:** `NOT_ADMITTED_UNFROZEN`.

## D02 — Annoy forest-index constructor

- **Atomic union:** random hyperplane/tree split selection, recursive partitioning, leaf assignment, forest serialization and search traversal.
- **Semantics/cost:** fixed vectors, metric, forest size/search-k boundary; charge tree build, RNG state, bytes, memory, query cost and recall.
- **Witness/killer:** alternative seed, split or leaf threshold lies within the native forest construction union; stricter recall changes the contract. Public vectors; kill without full build+search Pareto under frozen recall.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## D03 — MeCab double-array dictionary constructor

- **Atomic union:** lexical entry normalization, trie/double-array base-check placement, feature/value serialization and reader-visible dictionary build.
- **Semantics/cost:** fixed dictionary/source encoding and same tokenization entries; charge compilation, placement retries, dictionary bytes, memory and native lookup/tokenization equality.
- **Witness/killer:** relocating colliding trie nodes or changing packing order is an internal placement action. Public dictionary; kill on any lookup/tokenization mismatch or uncharged construction cost.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## D04 — FastBit compressed-bitmap index constructor

- **Atomic union:** value binning, bitmap materialization, compressed representation choice, storage layout and predicate evaluation are native construction/query actions.
- **Semantics/cost:** fixed column and predicate boundary; charge scan/build, bitmap bytes, memory, query evaluation and exact truth-set verification.
- **Witness/killer:** bin boundary or bitmap encoding variation is a native representation action or changes query semantics. Public column data; kill on truth-set mismatch/full-cost loss.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## D05 — libdeflate DEFLATE constructor

- **Atomic union:** LZ match finding, literal/match decisions, block boundaries, Huffman code construction, bitstream output and format conformance.
- **Semantics/cost:** same bytes and legal DEFLATE stream; charge match search, code/block construction, output bytes, CPU/memory and decompression equality.
- **Witness/killer:** alternate match, block or Huffman choice remains inside current compressor construction; mere level/strategy selection is not N2. Public files; kill if stream fails native decompression or full encode/decode/cost ledger.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## D06 — SIMDCompression integer-block constructor

- **Atomic union:** input block partitioning, codec selection, bit-width/delta transformation, SIMD packing, metadata and decode path are the native union.
- **Semantics/cost:** exactly recover one integer list; charge transforms, block metadata, bytes, encode/decode CPU, memory and sequence equality.
- **Witness/killer:** block size/codec/bit-width selection is an existing native action; a different integer domain/quality is not same object. Public postings; kill on decode mismatch or no charged size+encode+decode advantage.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## Result

Six exact objects were deep-reviewed. Five lack a union-external full action; PISA has a finite natural/fidelity route but no action certificate, hence `NOT_ADMITTED_UNFROZEN`. No outcome uses implementation/result/resource/AI readiness as a scientific negative.
