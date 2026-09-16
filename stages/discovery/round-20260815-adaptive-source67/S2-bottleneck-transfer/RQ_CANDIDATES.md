# Pre-evidence RQ candidates

## RQ-S67-01 — Clang PCH construction

For a fixed header set, compiler version/target, translation unit semantics and object output, could a target-specific PCH serialization/index construction improve build/load/validation full cost without changing the Clang AST reader contract?

## RQ-S67-02 — JDK CDS archive construction

For a fixed class set, JDK version/options, class-loading behavior and program output, could a target-specific archive/relocation construction improve archive build/load/startup full cost without changing the CDS loader contract?

## RQ-S67-03 — OCI layer unpack/snapshot construction

For a fixed OCI image manifest/layer bytes, filesystem tree and container output, could a target-specific unpack/snapshot construction improve pull/unpack/mount/start full cost without changing the content-store/snapshotter reader contract?

The three primary RQs have fixed object/guarantee envelopes and are ready only for ordinary source closure.
