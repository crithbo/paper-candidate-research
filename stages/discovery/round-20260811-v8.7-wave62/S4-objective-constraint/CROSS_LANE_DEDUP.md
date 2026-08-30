# Cross-lane dedup boundary

Checked at assignment start against the readable current six-lane products and registry assignments. The following exact-object families are excluded from this package: S2 Wave60's Zstd, Arrow IPC, MLIR bufferization, ONNX Runtime memory placement, THP/DAMON, Parquet, Protobuf, and CDS; S5 Wave54's Pluto, FRACTAL, SBB, MemChannel, STREAMBUS, BLADE, QCON, DroidSpeak, and HCDN; S1's protocol/transaction objects; S3's route/GBWT/mesh objects; and S6's compiler/solver/data-structure constructors.

Wave62 therefore treats CXL memory tiering/allocation objects as `EXCLUDED_CROSS_LANE_S2` and online prefetch, flow balancing, and generic scheduling objects as `EXCLUDED_CROSS_LANE_S5`. A shared word such as “memory”, “latency”, or “energy” is not itself a collision; the exclusion is by exact object/action. No other lane's unread future output is represented as checked.
