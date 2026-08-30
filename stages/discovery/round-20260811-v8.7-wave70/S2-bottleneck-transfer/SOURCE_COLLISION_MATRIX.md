# Source / collision / reader-checker action matrix

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE70-PARSER-VALIDATOR-STORAGE-BOTTLENECK-MIGRATION` · **cutoff:** 2026-08-11.

| Unique family | Official current anchor | Frozen reader/checker and full-cost object | Strongest same-object action union / config check | Disposition |
|---|---|---|---|---|
| simdjson | [simdjson upstream](https://github.com/simdjson/simdjson) | JSON input accepted/rejected and accessed under current API; pad/scan/validate/index/traverse/error cost | DOM and On-Demand APIs, runtime implementation selection, structural scan/validation and traversal | selected/deferred access path is current union; no new complete parser action | `DROP` |
| FlatBuffers | [FlatBuffers upstream](https://github.com/google/flatbuffers), [releases](https://github.com/google/flatbuffers/releases) | schema-valid buffer under generated reader/verifier; build+padding+offset+verify+access cost | `FlatBufferBuilder`, generated readers, verifier and alignment/offset path | alternate physical layout changes buffer/reader contract | `DROP` |
| OpenZFS | [OpenZFS upstream](https://github.com/openzfs/zfs), [releases](https://github.com/openzfs/zfs/releases) | integrity-preserving ZFS read/send; I/O+metadata+checksum+record/encryption cost | block pointer/checksum/record semantics and current traversal path | cache/order policy is not N2; pointer representation changes object | `DROP` |
| LevelDB | [LevelDB upstream](https://github.com/google/leveldb) | lookup with comparator/corruption/snapshot semantics; read+decode+checksum+restart/index/filter cost | table block, checksum, cache, index/filter reader actions | proposed operations are reader-union choices; new block form changes SSTable | `DROP` |
| LLVM bitcode | [LLVM bitcode documentation](https://llvm.org/docs/BitCodeFormat.html) | bitcode → IR plus diagnostics; decode/verify/construct cost | reader and IR construction | action and fidelity witness unfrozen | `NOT_ADMITTED_UNFROZEN` |
| Apache Avro | [Avro upstream](https://github.com/apache/avro) | schema-resolved datum; parse+schema resolution+construct cost | schema/decoder paths | controller or changed carrier | `STRUCTURAL_DROP` |
| Cap'n Proto | [Cap'n Proto upstream](https://github.com/capnproto/capnproto) | validated message under traversal/capability safety; reader/checker cost | layout plus traversal/validation limits | tuning vs changed layout contract | `STRUCTURAL_DROP` |
| Linux fs-verity | [Linux fs-verity documentation](https://docs.kernel.org/filesystems/fsverity.html) | verified file bytes under Merkle-root integrity; I/O+tree read+hash/check cost | Merkle tree/verification path | no finite same-contract construction frozen | `NOT_ADMITTED_UNFROZEN` |
| HDF5 | [HDF5 upstream](https://github.com/HDFGroup/hdf5) | dataset read under HDF5 format/filter semantics; I/O+metadata+chunk/filter decode cost | chunk/cache/filter selection | controller/format path; excluded S6 overlap | `STRUCTURAL_DROP` |

## Deduplication and reality-check boundary

Wave48–69 and registry exclusions were applied: Wave55 network/storage-user-mode families, Wave60 Arrow/Zstd/ONNX/representation work, prior SQLite/Protobuf/ORC/RocksDB/Git/PB/CVC5 and active/terminal topics are not revived. Native APIs are not automatically treated as absorption. Direct union findings above apply only after the proposed atomic action was fixed as a native path choice; all other entries remain bounded structural or unfrozen screens, not broad absence claims.
