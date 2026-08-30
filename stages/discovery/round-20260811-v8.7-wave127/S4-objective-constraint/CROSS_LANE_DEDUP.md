# Cross-lane deduplication

The registry was checked before admission. No exact object duplicates active/terminal S4 objects (PagePack, DYNCACHE-PGM, Git/RocksDB/Parquet/ORC, CVC5, PB, HNSW, WebGraph, GIN, AIGER, Knative) or Wave113/119 rescreens.

| family | boundary check |
|---|---|
| Shoal++ | BFT DAG transaction commit, not an index, storage format, or existing S4 object |
| IMPRESS | prefix-KV storage for LLM inference, not Parquet/ORC/RocksDB |
| CLONE | edge LLM model/hardware co-design; excluded from admission as accelerator-object scope and not rewrapped |
| Juneberry | ordered RDMA request commitment for linearizable storage, not GIN/RocksDB/Git |
| WALLET | confidential serverless function construction, not Knative revision draining |
| Compass | oblivious graph-index traversal under encrypted semantic search, not HNSW's standard search interface |

This is a new breadth screen. No known active object is claimed as an available baseline or residual.
