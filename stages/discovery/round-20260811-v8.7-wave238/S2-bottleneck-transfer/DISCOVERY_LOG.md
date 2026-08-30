# Discovery log — S2 zero-copy reader access-path joint-layout breadth

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE238-ZEROCOPY-READER-ACCESSPATH-JOINT-LAYOUT-BREADTH`  
**Cutoff:** 2026-08-11  
**Result:** `COMPLETE_ZERO_PROPOSALS`

Frozen method: `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`; `DISCOVERY_QUALITY_MODE=OFF`. Dispatch hashes matched disk: registry `B7CCE3A37EFF694746FBA6A6C8D49073E1061C0DF2BCDAF8232AEAE19F9DBF98`, plan `C0CCD013B776FF9B8BE396C2E302C995745D16843D47F9E1A762AA0A195C2FAF`, ROLE `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.

## Six source-pinned distinct families

| Family / pin | Exact same object and stock oracle | Writer union / minimal action witness | Natural route and 72h killer | Decision |
|---|---|---|---|---|
| SafeTensors `6eb4dc9a28ebce297606e0f4836bbf28839cacef` | fixed tensor names, dtypes, shapes, byte payloads and stock safe-open/load observations | header `data_offsets`, tensor byte ranges and writer ordering; proposed name-preserving tensor permutation is generic packing unless coupled to a reader-observable constrained algorithm | versioned official model conversion/weights; compare write/open/selective-load CPU/RSS/bytes/temp | `STRUCTURAL_DROP` |
| rkyv `3814956a8e11bac7b8587e4b2cb5dde99492deee` | fixed Rust archived type/value, format features, `access` + bytecheck result | depth-first leaf-to-root archive/resolve, relative pointers, sharing and format features; profile layout lacks frozen stock-compatible action interface | public versioned Rust archive producer corpus required; archive/validate/access full cost | `NOT_ADMITTED_UNFROZEN` |
| GGUF `030ebb558a5820b444a8f836ed5cdd46c9b4bd7a` | fixed model tensor bytes, architecture metadata, quantization and GGML executor result | tensor/KV order, offsets and alignment, conversion and loader callbacks; model-output/loader contract across quantized executors not frozen | public versioned GGUF model conversion and exact executor route required | `NOT_ADMITTED_UNFROZEN` |
| OpenVDB `2ad18b6aebf69240f8db78c08c6f9bbee896c553` | fixed VDB grid values/topology and stock file reader/query result | tree/page writing, compression, delayed loading and file options; complete current writer union not closed | versioned OpenVDB asset/history plus reader oracle needed | `NOT_ADMITTED_UNFROZEN` |
| LMDB `0c8b94738866b1ba7ffac27287fd6cab83f2ade4` | fixed key/value set, duplicate semantics, transaction view and stock cursor results | B+tree page allocation/split/commit/read union; no stock verifier-focused native whole-layout action frozen | public mutation log plus reader/integrity route needed | `NOT_ADMITTED_UNFROZEN` |
| Couchbase Fleece | fixed encoded document and stock Fleece reader value | official upstream ref was not available from the source-pin query; no absence inferred | finite official source/corpus route not frozen | `NOT_ADMITTED_UNFROZEN` |

All are separate from FlatBuffers and other active/previous checked-format objects. The source-pinning query was read-only; no repository was cloned or asset downloaded.

## Candidate-grade deep reviews

### D1 — SafeTensors tensor-range order

The [official SafeTensors upstream](https://github.com/huggingface/safetensors) advertises safe, zero-copy and lazy loading, and explicitly calls out layout control. Its format makes named tensor data ranges discoverable from the header. This gives a real stock-reader object: same names, dtype, shape, byte payload and header validity. Full cost would be header build/validation, file bytes, open/selective tensor access, CPU/RSS and temporary materialization.

The only frozen layout move is permutation of tensor byte blocks while rewriting legal `data_offsets`. Its proposed objective—placing predicted next tensors together—does not change the producer/reader algorithmic problem beyond generic profile-based packing. It has no nontrivial format-specific guarantee, and either relies on an external reader policy or only reorders a set of byte extents. This is `STRUCTURAL_DROP__GENERIC_PACKING`, not a failure caused by missing implementation or results.

### D2 — rkyv archive subtree placement

rkyv's [format documentation](https://rkyv.org/format.html) specifies a deterministic depth-first leaves-to-root object order and format-control features; its [archive architecture](https://rkyv.org/architecture/archive.html) specifies serialize/resolver/resolve phases. The [validation documentation](https://rkyv.org/validation.html) adds bounds, alignment, subtree-range and ownership checks. This is a strong reader/verifier contract, and it rules out casual graph rearrangement as an equivalent object.

A potential profile-guided archived-tree arrangement would need a stock-compatible action interface that preserves relative-pointer and subtree-range validity, current format features and `access`/bytecheck acceptance. None was frozen at the source-pinned revision, and no versioned public archive corpus provides a finite same-type/mutation route. The status is `NOT_ADMITTED_UNFROZEN`; no claim says the project lacks a possible algorithm.

### D3 — GGUF mmap tensor placement

The official [GGUF specification](https://github.com/ggml-org/ggml/blob/master/docs/gguf.md) and [GGUF header/API](https://github.com/ggml-org/llama.cpp/blob/master/ggml/include/gguf.h) define header/KV/tensor-info/data layout, offsets, alignment and reader callbacks; GGUF is designed for mmap-compatible model loading. A legitimate same-object candidate must preserve tensor bytes, architecture/quantization metadata and the stock executor's observable inference contract, then fully cost conversion, metadata parse/validation, mapping/read, runtime, bytes/RSS/temp.

The action union and target guarantee remain incomplete: conversion choices, quantized tensor representation, executor/backend behavior and all loader flags must be pinned together. A raw order permutation could also change placement assumptions or reduce to generic packing. No minimal stock-oracle two-layout witness/natural versioned conversion route is closed. `NOT_ADMITTED_UNFROZEN`.

## Outcome

`PROPOSE_STAGE0: []`. No candidate meets the non-generic whole-N2 requirement. The one structural drop is SafeTensors generic packing; the other five are source/action/natural-route unfrozen, not rejected for missing implementation, result, hardware, resource or AI readiness. No experiment, benchmark, download, Stage0/A/B, automation or shared-control write occurred. State: `IDLE_REUSABLE_AWAITING_MAINLINE`.
