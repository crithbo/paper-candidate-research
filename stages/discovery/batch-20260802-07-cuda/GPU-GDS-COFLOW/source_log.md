# Source log — GPU-GDS-COFLOW

| ID | Source | Type | Verified relevance | Boundary |
|---|---|---|---|---|
| S1 | https://docs.nvidia.com/gpudirect-storage/index.html | NVIDIA official docs, accessed 2026-08-02 | GDS/cUFile moves data directly between storage and GPU memory and documents deployment constraints. | Does not establish this policy or a speedup. |
| S2 | https://docs.nvidia.com/gpudirect-storage/overview-guide/index.html | NVIDIA official overview, accessed 2026-08-02 | Documents batch API fixed-overhead amortization, asynchronous batches, CUDA-stream semantics, dynamic offsets/sizes, and fallback. | Forms the strongest API baseline. |
| S3 | https://github.com/rapidsai/cudf | Official RAPIDS source, accessed 2026-08-02 | Public CUDA implementation exposes `read_parquet` and GPU dataframe operations. | Confirms object availability, not a coflow residual. |
| S4 | https://docs.rapids.ai/api/cudf/nightly/cudf/io/io/ | RAPIDS docs, accessed 2026-08-02 | Documents Parquet/JSON I/O and that supported decompression may use nvCOMP or internal implementations. | Decoder choice must be held fixed in fair comparison. |
| S5 | https://github.com/apache/tpch-dbgen | Public benchmark generator | Provides reproducible TPC-H input generation. | The exact Parquet conversion and query subset need freezing in Stage 0. |

Search terms: `GPUDirect Storage cuFile batch CUDA stream parquet cuDF nvCOMP query scheduling`; `GPU parquet compressed-column I/O compute overlap`; `GDS batch selectivity row group`. Search-bounded results found no identical joint-decision source; this is an open residual, not an assertion of absence.
