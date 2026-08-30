# Go unified export current-source contract

## Same-object guarantee

The fixed package’s export data must preserve the same public/deep import information, exported declarations, types, generic/inlinable bodies, escape summaries, fingerprints and matching stock importer result. The reader is unchanged. The build cache is a reproducibility/cost dimension, not a constructor selector.

## Current writer/reader/index/flag union at `076041d0…`

| component | frozen current mechanism |
|---|---|
| `cmd/compile/internal/noder/unified.go` | writes public/private roots, serializes a self-contained unified export file, uses the UIR linker to relocate/re-export dependencies, and writes a fingerprint |
| `noder/reader.go` | lazy `pkgReader` sections for packages/types/objects/bodies, cached indices and version-specific decoding |
| `internal/pkgbits/encoder.go`, `decoder.go`, `reloc.go` | section kind plus relative element index protocol; relocations are context-typed; section-relative indices are explicitly used for compactness |
| `internal/exportdata/exportdata.go` | `__.PKGDEF` archive framing, unified-format header and version acceptance/rejection |
| `cmd/go/internal/cache/cache.go` | action/output IDs and cache storage/retrieval, distinct from unified reader semantics |
| compiler README | unified export is serialized object graph with index-based lazy decode; deep vs shallow summary changes import assumptions |

Official source explanation: https://go.dev/src/cmd/compile/README.

