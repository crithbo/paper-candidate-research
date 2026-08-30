# Discovery log — S2 verification / copy / materialization bottleneck

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE87-VERIFICATION-COPY-MATERIALIZATION-BOTTLENECK`  
**Cutoff:** 2026-08-11 · **result:** `COMPLETE_ZERO_PROPOSALS`

## Frozen method and object contract

Method: `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`; revision `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__discovery-six-lanes-direct-20260811__p1-shadow-not-authoritative`; `DISCOVERY_QUALITY_MODE=OFF`. This package does not apply v8.8/R7 shadow/dormant semantics.

Admission requires a whole same-format, same-reader/checker, same-information action. Full cost includes source/carrier movement, copy/materialization, validation/verification, construction, reader consumption, and any required error/fidelity path. Zero-copy flags, cache selection, pipeline controller, or a format substitution are not N2.

## R5-P0 funnel ledger

| Event | Family | Classification |
|---|---|---|
| raw-01 | rkyv archived representation/checking after zero-copy deserialization | unique; deep reviewed |
| raw-02 | rkyv alignment/check-archive configuration | repeat raw-01 | `EXCLUDED` |
| raw-03 | OpenSSL X.509 chain parse/verify materialization | unique; deep reviewed |
| raw-04 | OpenSSL provider boundary copy avoidance | repeat raw-03 | `EXCLUDED` |
| raw-05 | WABT WebAssembly decode/validate/interpreter materialization | unique; deep reviewed |
| raw-06 | WABT proposal enable/disable flags | repeat raw-05 | `EXCLUDED` |
| raw-07 | LLVM lld ELF input parse/materialization | unique; deep reviewed |
| raw-08 | LLVM DWARF input materialization | repeat raw-07 | `EXCLUDED` |
| raw-09 | libxml2 XML parse/schema-validation trees | unique |
| raw-10 | libarchive format reader/copy/materialization | unique |
| raw-11 | Apache Xerces DOM/SAX validation construction | unique |
| raw-12 | CBOR decoder/validator materialization | unique |
| raw-13 | FlatBuffers reader/verifier | prior Wave70 object | `EXCLUDED` |
| raw-14 | simdjson parser/index | prior Wave70 object | `EXCLUDED` |
| raw-15 | protobuf/rkyv-like archive handling | prior Wave60/70 objects | `EXCLUDED` |

Counts: `raw_row_events=15`; `repeat_rescreen_events=6`; `unique_opportunity_families=8`; `candidate_grade_deep_reviews=4`; `grounded_briefs=0`.

## Candidate-grade deep reviews

### rkyv archived representation and validation — `DROP`

**Exact object:** a Rust value serialized to the rkyv archived carrier and safely accessed under rkyv validation semantics. **Information:** source value/schema and archived bytes; **full cost:** serialization/construction, any copy/alignment handling, validation, zero-copy access and error path. Upstream describes rkyv as zero-copy deserialization via archived variants suitable for pointer-independent access; its current release material records copy optimizations. The apparent transferred bottleneck is validating/alignment/materializing archived data after copying is removed. The screened action—choose pointer cast versus `check_archive`/validation path or alter archived layout—is respectively a safety-path choice or a new carrier/reader contract. No same-archive, same-checker global construction with a finite quality/safety witness was frozen.

### OpenSSL X.509 verification materialization — `DROP`

**Exact object:** X.509/TLS verification result with OpenSSL chain, ASN.1, signature, provider and error semantics. **Full cost:** certificate bytes, ASN.1 parse/materialization, chain building, signature verification, policy checks and result/error delivery. Current official OpenSSL source documents the full TLS/crypto/X.509 toolkit and release/manual surfaces. A proposal to eliminate copying across provider/parser boundaries cannot be considered N2 without preserving the precise ownership, provider ABI and error semantics. No union-external whole chain-verification construction was named; caching/selection is controller-like and a new certificate representation changes the carrier. This is an action-contract drop, not a claim that verification performance is solved.

### WABT decode/validate/interpreter materialization — `DROP`

**Exact object:** a WebAssembly binary accepted/rejected and, where applicable, interpreted under supported proposal flags and spec fidelity. **Full cost:** binary read/decode, validation, internal construction, interpreter use and diagnostics. The official WABT project exposes `wasm-validate`, decoder/interpreter tools, and a table of proposal flags with defaults and binary/text/validation support. A selective materialization or proposal-flag action is already a native path/configuration; replacing the internal form without changing behaviour was not fixed as a whole algorithm. Any changed instruction/feature/diagnostic contract breaks same-object. No finite divergence witness was available.

### LLVM lld ELF input materialization — `DROP`

**Exact object:** lld output and diagnostics for a given ELF input/link invocation. **Full cost:** file read/memory buffer, ELF section/property parsing, symbol/IR-object materialization, linking and diagnostics. Current lld source records `MemoryBufferRef` input handling and ELF input/attribute parsing. The hypothesized residual after fast I/O is materialization of sections/symbols/metadata. A lazy/cached representation selection is a local reader policy; a new object representation requires proving all linker diagnostics, symbol/section and input-remapping semantics. No full same-invocation construction, quality condition or finite fidelity closure was frozen.

## Bounded screens

| Family | Result |
|---|---|
| libxml2 XML/schema | `STRUCTURAL_DROP`: tree/SAX selection or cache is controller-like; changed tree/validation representation alters reader/validator contract. |
| libarchive | `NOT_ADMITTED_UNFROZEN`: an exact archive/member/checksum contract and union-external construction were not fixed together. |
| Apache Xerces | `STRUCTURAL_DROP`: DOM/SAX materialization choice is native reader policy; new tree changes exposed object. |
| CBOR decoder/validator | `NOT_ADMITTED_UNFROZEN`: no exact canonical/noncanonical carrier and checker guarantee was frozen. |

## Evidence integrity and outcome

Deep reviews use first-party upstream repositories and official documentation/source. The bounded rows are not current-absence claims. Natural carriers exist in principle (rkyv tests/archives, OpenSSL certificate suites, WebAssembly spec/WABT test inputs, LLVM ELF inputs), but no StageA killer is declared because the necessary prior whole-action witness failed. Missing implementation, core result, resource access, artifact download or AI readiness was not a DROP reason. No experiment, benchmark, download, automation, Stage0/A/B or shared-file mutation occurred.

`PROPOSE_STAGE0: []`; state after handoff: `IDLE_REUSABLE_AWAITING_MAINLINE`.
