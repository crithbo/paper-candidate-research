# Versioned natural trace and confound schema

Pre-register 20–50 versioned public release/source-tree change pairs. Each row must name repository, two commits/tags, tree hashes, file metadata manifest, and transport/storage environment before observation. Revisions must be selected from ordinary repository history, not synthetic block edits.

Record change fraction, insertion/deletion/reorder locality, repeated-block structure, file-size distribution, sparse status, metadata churn, and tree fanout. Full cost includes sender/receiver scan CPU/RSS/temp, signature bytes, network bytes, literal/matched data, receiver writes/temp/disk use, apply latency/RSS, and final stock file-tree/metadata equality.

Hold protocol/checksum negotiation, bandwidth/latency, filesystem, storage/cache state, CPU/OS, metadata policy, compression, recursive mode, and current defaults fixed. A natural regime requires a repeated normalized Pareto elbow across independently selected revision pairs, not a single large file, injected insertion, or `--block-size` sweep. No trace was run here.
