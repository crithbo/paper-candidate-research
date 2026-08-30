# Source / collision / compute-to-metadata action matrix

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE92-COMPUTE-TO-METADATA-BOTTLENECK-TRANSFER` · **cutoff:** 2026-08-11.

| Family | Official current anchor | Frozen object / full cost | Current action union / configuration facet | Disposition |
|---|---|---|---|---|
| Iceberg manifests/catalog | [Iceberg upstream](https://github.com/apache/iceberg), [REST catalog OpenAPI](https://github.com/apache/iceberg/blob/main/open-api/rest-catalog-open-api.yaml), [releases](https://github.com/apache/iceberg/releases) | same table load/scan/commit; catalog+metadata+manifest+data+validation | full metadata response; `If-None-Match`; snapshot default `all`; catalog/FileIO implementation | path/selection/cache action only; new layout changes contract | `DROP` |
| LLVM ThinLTO | [LLVM ThinLTO documentation](https://llvm.org/docs/ThinLTO.html), [LLVM upstream](https://github.com/llvm/llvm-project) | same binary/diagnostics; compile+summary/index+import/codegen+link | summary/index, partition/import and cache pipeline | no distinct output-preserving whole construction fixed | `DROP` |
| Cargo fingerprints | [Cargo upstream](https://github.com/rust-lang/cargo), [current fingerprint issue/source discussion](https://github.com/rust-lang/cargo/issues/9971) | same build/check and invalidation correctness; fingerprint+rustc+artifact+diagnostic cost | `.fingerprint`, dep-info/mtime and dependency-output checks, build layout | local metadata policy; global sound construction unfrozen | `DROP` |
| Btrfs checksums/tree | [Linux Btrfs documentation](https://www.kernel.org/doc/html/v6.15/filesystems/btrfs.html) | CoW filesystem result; I/O+tree+checksum+persist+repair | data/metadata checksums, scrub, read/write verification and tree paths | controller/checksum choice or changed on-disk invariant | `DROP` |
| XFS metadata | [XFS algorithms/data structures](https://www.kernel.org/pub/linux/utils/fs/xfs/docs/xfs_filesystem_structure.pdf) | XFS metadata/recovery result | B+tree checksum format/path | construction+repair fidelity unfrozen | `NOT_ADMITTED_UNFROZEN` |
| Bazel action cache | [Bazel remote caching documentation](https://bazel.build/remote/caching) | reproducible build outputs; analysis+cache+execution+output cost | action/cache identity and cache controls | controller/correctness-contract change | `STRUCTURAL_DROP` |
| Nix narinfo | [Nix manual](https://nix.dev/manual/nix/latest/) | same store realization and integrity | narinfo/store metadata protocol | catalog policy or changed store object | `STRUCTURAL_DROP` |
| HDFS NameNode | [HDFS architecture guide](https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-hdfs/HdfsDesign.html) | namespace/file outcome; metadata+I/O+consistency cost | namespace metadata/operation path | invariant and construction unfrozen | `NOT_ADMITTED_UNFROZEN` |
| ext4 journal | [ext4 documentation](https://www.kernel.org/doc/html/latest/filesystems/ext4/index.html) | recovery-correct filesystem result | journal/checksum/recovery path | controller or changed on-disk/recovery contract | `STRUCTURAL_DROP` |

## Deduplication and current-reality boundary

Wave55 user-mode storage, Wave60 representation, Wave70 parser/storage, Wave80 lifetime, Wave87 verifier/materialization and registry active/terminal objects are excluded. Current native configuration is not automatic absorption; deep drops occur only where the concrete proposed action reduces to current metadata/path policy or would change the artifact/reader/invariant. No broad implementation-absence conclusion is made.
