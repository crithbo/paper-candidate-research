# Discovery Question Cards

## QC-S81-01 — GNU tar sparse-map constructor

- Exact public identity: GNU tar 1.35 manual, sparse-file and sparse-format chapters; GNU tar public upstream cgit directory reports current project activity (checked 2026-08-15).
- Fixed object / same-object contract: a single fixed sparse file with byte contents, logical size, hole locations and metadata; GNU tar sparse archive output whose stock extraction restores the same sparse-file semantics.
- Carrier kind: `NATURAL`; public sparse database/VM image files are a finite future carrier route, not acquired here.
- Contribution hypothesis: `METHOD_ALGORITHM`, N2, sparse map segment construction.
- Network-security exclusion: `PASS`.

### Current native/format union

The official manual specifies `--sparse` / `-S` sparse detection, `--hole-detection`, and format selection through `--sparse-version` / `--sparse-format`; valid PAX sparse versions include 0.0, 0.1 and 1.0, with 1.0 default. It describes sparse maps as offset/size blocks, including a map of comma-separated offset,size pairs or a newline-delimited sequence stored before data, and documents that detection can require a second file read when `SEEK_HOLE/SEEK_DATA` is unavailable.

### Minimum legal divergence and falsifier

For a fixed file whose map contains two adjacent non-null extents, a writer could encode them as one offset/size extent or as two adjacent offset/size extents while retaining reconstructed bytes and holes. This is only a run-length/interval segmentation action: it changes map-header overhead and perhaps writer/extractor parsing steps, but not a GNU-tar-specific semantic decision.

The immediate falsifier is therefore met: after excluding format-version selection (already documented native controls), the proposed action has no source-supported target-specific invariant or guarantee beyond generic interval/run representation. It cannot enter evidence-qualified raw.

### Cost / closure boundary

Relevant full cost would include sparse detection/read CPU and I/O, archive bytes, map bytes, writer and extractor CPU/RSS, temporary space, and restored file-byte/hole equality. A finite stock oracle is GNU tar extraction plus sparse extent/byte comparison. No corpus or experiment was needed because the non-generic discriminator fails before raw; this is not a resource conclusion.

### Disposition

`EXCLUDED_BEFORE_RAW__CURRENT_SPARSE_FORMAT_CONTROL_PLUS_GENERIC_INTERVAL_RUN_SEGMENTATION_KERNEL`.

中文理由：稀疏 map 的相邻 extent 拆分/合并只是通用区间或 run-length 表示；GNU tar 已提供 sparse 检测和版本/格式入口，且没有形成目标专属保证，故不进入 raw。未以实现、结果、资源或 AI readiness 为理由。
