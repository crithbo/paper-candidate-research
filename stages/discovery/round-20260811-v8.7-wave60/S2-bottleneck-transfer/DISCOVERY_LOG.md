# Discovery log — S2 memory hierarchy / representation

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE60-MEMORY-HIERARCHY-REPRESENTATION`  
**Lane:** `S2-bottleneck-transfer` · **cutoff:** 2026-08-11  
**Outcome:** `COMPLETE_ZERO_PROPOSALS`

## Frozen admission rule

Method: `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`; revision `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__discovery-six-lanes-direct-20260811__p1-shadow-not-authoritative`; `DISCOVERY_QUALITY_MODE=OFF`. v8.8/R7 shadow/dormant semantics and repair-vector decision authority were not used.

The atomic action must be a complete same-object/same-information construction whose cost denominator includes construction, representation conversion, movement, and steady-state work. A cache/prefetch/allocator choice or a native configuration interface is neither an automatic absorption finding nor a new action: it is admitted only if a finite witness fixes a different end-to-end construction and guarantee.

## R5-P0 funnel

| Event | Opportunity family | Result |
|---|---|---|
| raw-01 | Zstd encoder window/block representation after compute improvements | unique; deep review |
| raw-02 | Zstd decompression buffer/window representation | repeat of raw-01 | `EXCLUDED` |
| raw-03 | Arrow IPC metadata/body representation after in-memory columnar execution | unique; deep review |
| raw-04 | Arrow Flight zero-copy transport | repeat of Wave55 Arrow boundary | `EXCLUDED` |
| raw-05 | MLIR one-shot bufferization: allocation/copy representation | unique; deep review |
| raw-06 | LLVM vector lowering register/memory representation | unique |
| raw-07 | ONNX Runtime graph memory pattern / prepacked initializer placement | unique; deep review |
| raw-08 | ONNX Runtime execution-provider arena/mempool | repeat of raw-07 | `EXCLUDED` |
| raw-09 | Linux transparent huge-page / page-table translation | unique |
| raw-10 | Linux DAMON reclaim/placement after compute optimization | unique |
| raw-11 | jemalloc size-class/slab metadata representation | unique |
| raw-12 | Apache Parquet page decoding/encoding representation | unique |
| raw-13 | Protobuf arena / wire serialization representation | unique |
| raw-14 | OpenJDK CDS archive / mapped representation | unique |

Counts: `raw_row_events=14`; `repeat_rescreen_events=3`; `unique_opportunity_families=10`; `candidate_grade_deep_reviews=4`; `grounded_briefs=0`.

## Candidate-grade deep reviews

### Zstd encoder/decoder representation — `DROP`

Exact object: a losslessly compressed Zstandard frame decoded to the original byte stream, including encoded size, encoder/decoder work, window storage and I/O. The first-party format specification fixes independent frames, block structure, window semantics and optional checksum; it explicitly defines the window-memory/ratio trade-off. The current reference implementation exposes compression level/fast modes, `--long`, dictionaries, block and decoder-memory controls. A proposal to retune/choose these controls is ordinary parameter selection. A proposal to replace the frame/block representation either changes the standardized on-wire object or needs a new codec with its own full baseline/quality contract. No same-frame, whole-construction divergence witness was frozen. This is neither an implementation-readiness decision nor a claim that compression research is exhausted.

### Arrow IPC representation — `DROP`

Exact object: an Arrow IPC exchange that preserves Arrow schema, arrays and IPC semantics, with full cost of array construction, metadata/body serialization, copies and readback. Arrow’s first-party project describes its columnar in-memory representation and IPC serialization for heterogeneous/process communication. The possible residual after columnar execution is metadata/layout movement, but a candidate that selects buffers/dictionaries/zero-copy transport is a path choice. A new physical representation would require a different IPC carrier or a new reader/format guarantee. No finite action witness established a distinct representation that preserves the exact object rather than changing its interchange contract. Thus the full same-object action is not admission-ready.

### MLIR one-shot bufferization — `DROP`

Exact object: lowered program semantics with the same aliasing/mutation legality; full cost includes analysis, alloc/copy insertion, generated code and runtime memory traffic. Current MLIR source records one-shot bufferization’s analysis followed by alloc/copy insertion to make lowerings correct, and documents vector representation/lowering. An allocator/copy-placement schedule alone is not rejected merely as a compiler hook; it fails because no new global constructor or proof/quality delta was frozen beyond the existing bufferization analysis-and-lowering union. A finite natural corpus can be named (MLIR test-suite modules), but the needed proposition is not yet a different whole action; `DROP` avoids treating an implementation-local patch as N2.

### ONNX Runtime memory pattern / prepacked initializer placement — `DROP`

Exact object: an ONNX model’s inference outputs under the same graph/operator semantics; denominator is model-load/graph-transform, allocation, initialization/transfer and inference execution. Current first-party source exposes memory-pattern enablement, CPU arena enablement, graph memory optimizer configuration, external prepacked initializer storage/mapping, and execution-provider allocation paths. It also documents default values (memory pattern and CPU arena enabled; external prepack disabled). These controls make a policy-only proposal directly absorbed. A new cross-node global construction could in principle be different, but this pass did not freeze one with an information condition and bounded quality/overhead guarantee outside that union. It is therefore dropped for absent action divergence, not for lacking hardware or results.

## Bounded screens

| Family | Residual after prior optimization | Status and reason |
|---|---|---|
| LLVM vector lowering | register/memory traffic after vector compute | `NOT_ADMITTED_UNFROZEN`: vector representation/lowering does not yet yield a distinct same-semantics global constructor. |
| Linux THP/page translation | page-table/TLB cost after CPU throughput | `STRUCTURAL_DROP`: promotion/reclaim policy is controller/tuning absent a new exact virtual-memory action. |
| Linux DAMON | metadata/access monitoring after reclamation | `STRUCTURAL_DROP`: monitoring/reclaim selection is a controller formulation. |
| jemalloc slabs | allocator metadata/cache cost | `NOT_ADMITTED_UNFROZEN`: a new layout would require a finite allocation-guarantee object, not yet fixed. |
| Parquet decode | decode materialization and page representation | `STRUCTURAL_DROP`: belongs to excluded S6 format/index terrain; not cross-lane revived. |
| Protobuf arena/wire | construction/serialization allocation cost | `STRUCTURAL_DROP`: arena selection changes allocation policy only; new wire form changes object. |
| OpenJDK CDS | startup mapping cost after compilation | `STRUCTURAL_DROP`: archive/mapping choices are runtime policy and overlaps excluded Wave52 archival terrain. |

## Evidence integrity and conclusion

All four deep rows were anchored in first-party current source/specification/release material; the six remaining rows are bounded screens rather than absence claims. Natural carriers were available in principle (Zstd corpus/frames, Arrow IPC fixtures, MLIR tests, ONNX models), but no StageA plan was emitted because no proposal passed the prior action-gap gate. No failure was attributed to an unavailable implementation, result, resource, download, benchmark, or AI readiness. No experiment, benchmark, download, Stage 0/A/B directory, automation, or shared control file was created.

`PROPOSE_STAGE0: []`. The lane returns `IDLE_REUSABLE_AWAITING_MAINLINE`.
