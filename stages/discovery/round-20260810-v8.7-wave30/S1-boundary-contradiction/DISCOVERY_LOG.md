# Discovery log — S1 boundary / contradiction, Wave 30

**Assignment:** `DISCOVERY-S1-20260810-V8.7-WAVE30`  
**Cutoff:** 2026-08-10  
**Method:** accepted v2/v8.1 + calibrated v8.6 fidelity-plan admission + v8.7 current-upstream reality check.

## Scope

Discovery only. No download, implementation, experiment, benchmark, Stage 0/A/B creation, control-file mutation, or Stage-B authorization occurred. The target is structural paper potential, not present readiness; missing implementation, result, or AI readiness was never used as a rejection reason. Wave29 S2 objects (HyCache, IRHash, ByteCheckpoint, ODRP, Juneberry, FlacIO, GogetaFS, GraCE, Syncopate, VTC, MPK, Obscura), S6 formatter/serializer-only construction, all active/blocked/terminal objects, and S1 mobile reserve were excluded.

## Ten independent contribution genealogies screened

| # | Genealogy / boundary | Decision after same-object and union subtraction |
|---:|---|---|
| 1 | FUSE daemon ↔ kernel request/reply transition via io_uring | Drop: current interface remains partial; a `/dev/fuse` fallback is wrapper space, not a full same-FUSE action. |
| 2 | io_uring SQ/CQ ownership ↔ DBMS buffer manager | Drop: remaining actions are native flag/batching choices; current DBMS study already covers the architectural use cases. |
| 3 | WebAssembly Component canonical ABI lift/lower ↔ producer memory ownership | Drop: shared-everything ABI is producer-toolchain design/future route, not a frozen current same-object action; no finite natural closure contract. |
| 4 | WebAssembly async canonical ABI ↔ task cancellation/borrowed resources | Drop: current specification already makes cancellation and resource-lifetime contracts explicit; no new atomic action beyond runtime policy was established. |
| 5 | RISC-V ISA ↔ LLVM IR/hardware cross-level semantics | Drop: 2026 ITree work is the direct current mechanism; any extension found here was a paper-specific case-study variation, not an independent residual. |
| 6 | Dafny verifier ↔ compiler proof guarantee | Drop: current 2025 verified VCG/compiler work changes the language subset/object; a proposed extension would be a future-work replay without a frozen same-object competitor contract. |
| 7 | MLIR effect interfaces ↔ transformation legality | Excluded: prior S1 object already eliminated by Ratte/DESIL/equivalence-verifier union. |
| 8 | Iceberg delete vectors ↔ readers/scan planning | Excluded/absorbed: overlaps active Parquet natural carrier and current native DV actions. |
| 9 | Arrow IPC producer ↔ streaming consumer buffers | Excluded: Wave14 current-source check invalidated the issue-only full-copy absence premise. |
| 10 | cvc5 proof emitter ↔ external checker | Excluded: active blocked CVC5 object; no renamed proof-format route allowed. |

## Result

`COMPLETE_ZERO_PROPOSALS`. The broad sweep produced genuine interface tensions, but none yielded a fair strongest-union-external N1/N2/N3 with a frozen same object and finite natural fidelity route. No absence claim was made from issues, old documents, or future-work text; therefore no new `CURRENT_UPSTREAM_REALITY_CHECK` absence certificate was needed. There are no retained candidates and hence no retained-candidate fidelity status.

## Primary sources

1. [FUSE-over-io_uring design documentation](https://cdn.kernel.org/doc/html/latest/filesystems/fuse/fuse-io-uring.html) and [FUSE technical documentation](https://docs.kernel.org/filesystems/fuse/index.html) (official kernel docs).
2. [Linux io_uring UAPI](https://github.com/torvalds/linux/blob/master/include/uapi/linux/io_uring.h), [kernel implementation](https://github.com/torvalds/linux/blob/master/io_uring/io_uring.c), and [liburing manual](https://github.com/axboe/liburing/blob/master/man/io_uring_setup.2) (upstream source/docs).
3. [High-Performance DBMSs with io_uring: When and How to use it](https://arxiv.org/abs/2512.04859) (original paper).
4. [WebAssembly Component Model](https://github.com/WebAssembly/component-model), [Canonical ABI explainer](https://github.com/WebAssembly/component-model/blob/main/design/mvp/Explainer.md), and [concurrency design](https://github.com/WebAssembly/component-model/blob/main/design/mvp/Concurrency.md) (official specification sources).
5. [Interaction Tree Semantics for RISC-V](https://arxiv.org/abs/2605.04933) and [Verified VCG and Verified Compiler for Dafny](https://arxiv.org/abs/2512.05262) (original papers).
6. [Ratte](https://www.doc.ic.ac.uk/~afd/papers/2025/ASPLOS-Ratte.pdf), [DESIL](https://xgdsmileboy.github.io/files/paper/oopsla25.pdf), [Practical Formal Verification for MLIR Programs](https://arxiv.org/abs/2605.01124), [Apache Iceberg releases](https://github.com/apache/iceberg/releases), [Arrow Rust upstream source](https://github.com/apache/arrow-rs), and [cvc5 documentation](https://cvc5.github.io/docs/) (primary collision sources).
