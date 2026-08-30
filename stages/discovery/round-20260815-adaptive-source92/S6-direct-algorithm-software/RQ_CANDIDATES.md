# Source92 S6 — committed primary RQs

## S92-01 Binaryen Relooper

For a fixed CFG, module feature set, and WebAssembly validation/execution semantics, is there a Binaryen-specific structured-control constructor with a target-specific guarantee beyond the current Relooper/relooper-pass union?

Anchor: Binaryen upstream repository and its documented `ReReloop` pass. The testable counterfactual is that the apparent residual is only generic CFG structuring or pass selection.

## S92-02 Redis incremental rehash

For a fixed Redis key/update trace and command semantics, is there a complete hash-table migration construction with a target-specific tail-latency/space guarantee outside the current incremental rehash union?

Anchor: Redis upstream `dict` implementation. The testable counterfactual is that every candidate is threshold control or generic online hashing.

## S92-03 Zstd split/parse

For fixed bytes, standard Zstd frame constraints, and stock decode semantics, is there a non-generic joint block-split/parse constructor with a full compression/decompression cost guarantee?

Anchor: Zstandard official format and reference implementation. The testable counterfactual is that the proposed mechanism is standard optimal parsing or encoder configuration.

S92-04 through S92-06 were not committed: their action and endpoint contracts were insufficiently discriminated at portfolio time.
