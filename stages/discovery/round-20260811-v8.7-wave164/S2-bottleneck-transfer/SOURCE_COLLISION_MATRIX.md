# Native bottleneck-migration constructor breadth — source and collision matrix

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE164-NATIVE-BOTTLENECK-MIGRATION-CONSTRUCTOR-BREADTH`  
**Cutoff:** 2026-08-11. Technical anchors are official specifications, upstream documentation, or upstream source repositories.

| Family | Current official anchor | Bottleneck migration and strongest union | Decision |
|---|---|---|---|
| Iceberg | [specification](https://iceberg.apache.org/spec/?h=snapshot), [performance docs](https://iceberg.apache.org/docs/latest/performance/) | data-file pruning moves work to manifest metadata; manifest-list + manifest + inclusive-projection scan constructor | `DROP`: same plan absorbed; stronger skip changes correctness/format |
| LLVM ThinLTO | [LLVM ThinLTO blog](https://blog.llvm.org/2016/06/thinlto-scalable-and-incremental-lto.html), [ThinLTO docs](https://releases.llvm.org/5.0.2/tools/clang/docs/ThinLTO.html) | frontend work shifts to thin-link/index/import/cache; combined-index/import/backend/cache union | `DROP`: whole constructor already current; flags are tuning |
| rustc incremental | [incremental guide](https://rustc-dev-guide.rust-lang.org/queries/incremental-compilation-in-detail.html), [overview](https://rustc-dev-guide.rust-lang.org/overview.html) | compilation shifts to persisted graph/cache reconstruction; red-green + promotion + CGU union | `DROP`: same plan absorbed; divergence risks invalidation soundness |
| Parquet page index | [page-index specification](https://parquet.apache.org/docs/file-format/pageindex/) | page I/O/decode shifts to index lookup; ColumnIndex + OffsetIndex + reader union | `NOT_ADMITTED_UNFROZEN`: no complete same-format action named |
| Arrow IPC | [Apache Arrow upstream](https://github.com/apache/arrow) | decode shifts to framing/dictionary/buffer validation; IPC reader union | `NOT_ADMITTED_UNFROZEN`: only reader/representation routes named |
| OpenDAL | [layers docs](https://opendal.apache.org/docs/python/api/layers/), [upstream](https://github.com/apache/opendal) | operation cost shifts to retry/cache/layer composition; accessor/layer union | `NOT_ADMITTED_UNFROZEN`: only policy/layer composition named |

## Reality and collision notes

The current official action/configuration surfaces are included in the comparators. Older LLVM documentation identifies the established ThinLTO mechanism only; it is not an absence claim. No issue, future-work statement, old documentation, or specification freedom is used to infer a missing action. The three drops follow from complete current whole-action collision or required semantic change; the other three lack a frozen complete action-divergence witness.

## Six-dimensional audit summary

For every deep row, the decision rule, equal information condition, resource/complexity accounting, quality/guarantee, full cost and no-gain region were tested. The denominators include all construction and downstream costs named in the log; no local metadata/cache/copy gain counts alone. `PROPOSE_STAGE0: []`.
