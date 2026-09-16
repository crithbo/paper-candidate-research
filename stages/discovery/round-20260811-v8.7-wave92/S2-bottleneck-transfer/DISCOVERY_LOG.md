# Discovery log — S2 compute-to-metadata bottleneck transfer

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE92-COMPUTE-TO-METADATA-BOTTLENECK-TRANSFER`  
**Cutoff:** 2026-08-11 · **result:** `COMPLETE_ZERO_PROPOSALS`

## Frozen admission method

Accepted method: `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`; revision `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__discovery-six-lanes-direct-20260811__p1-shadow-not-authoritative`; `DISCOVERY_QUALITY_MODE=OFF`. v8.8/R7 shadow/dormant semantics are not used.

For compute-to-metadata transfer, the same-object denominator includes original computation plus metadata/index/checksum/catalog construction, persistence, lookup/validation, and final reader/query/link/build/filesystem outcome. A catalog refresh, cache, checksum choice, or configuration policy is not a complete N2 action.

## R5-P0 funnel ledger

| Event | Opportunity family | Classification |
|---|---|---|
| raw-01 | Iceberg manifest/catalog planning after compute-efficient scan | unique; deep reviewed |
| raw-02 | Iceberg ETag/snapshot selection | repeat raw-01 | `EXCLUDED` |
| raw-03 | LLVM ThinLTO summary/index after parallel compilation | unique; deep reviewed |
| raw-04 | LTO cache pruning | repeat raw-03 | `EXCLUDED` |
| raw-05 | Cargo incremental fingerprint/build metadata after fast rustc work | unique; deep reviewed |
| raw-06 | Cargo target-directory layout | repeat raw-05 | `EXCLUDED` |
| raw-07 | Btrfs checksum/metadata tree after fast data path | unique; deep reviewed |
| raw-08 | Btrfs scrub scheduling | repeat raw-07 | `EXCLUDED` |
| raw-09 | XFS B+tree metadata checksums | unique |
| raw-10 | Bazel action cache/analysis metadata | unique |
| raw-11 | Nix store narinfo/catalog metadata | unique |
| raw-12 | HDFS NameNode namespace metadata | unique |
| raw-13 | ext4 journal checksum metadata | unique |
| raw-14 | LevelDB/RocksDB table index | prior Wave70/terminal storage families | `EXCLUDED` |

Counts: `raw_row_events=14`; `repeat_rescreen_events=5`; `unique_opportunity_families=9`; `candidate_grade_deep_reviews=4`; `grounded_briefs=0`.

## Candidate-grade deep reviews

### Apache Iceberg manifests / REST catalog — `DROP`

**Exact object:** an Iceberg table load/scan/commit result under current table metadata and snapshot semantics. **Information:** table identifier, catalog state and metadata files; **full cost:** catalog request, metadata/manifest list load, manifest planning, data scan and result/commit validation. The first-party REST OpenAPI defines table loading, full metadata in the response, ETag `If-None-Match`, and snapshot parameter default (`all`). Current upstream/release material exposes catalog and manifest behavior. The residual after data scan acceleration is catalog/manifest work, but the screened actions—ETag reuse, snapshot selection, metadata/caching path and catalog implementation choice—are native policy/configuration. A new manifest layout or catalog contract changes readers/engines or table semantics. No finite same-table whole metadata construction outside that union was frozen.

### LLVM ThinLTO summary/index — `DROP`

**Exact object:** program binary and diagnostics for a fixed ThinLTO link, retaining symbol/link/optimization semantics. **Information:** IR modules and linker inputs; **full cost:** compile, summary/index generation and distribution, import/codegen, link and output validation. Current LLVM source/docs expose the ThinLTO summary/index pipeline and cache configuration. The apparent residual after parallel code generation is summary/index work. Caching, partition/import selection and index path configuration are not automatic absorption by name, but the atomic action found here was only choosing/reusing them. A changed summary representation must preserve cross-module import and diagnostic/output semantics; no distinct complete construction or bounded quality/complexity witness was fixed.

### Cargo fingerprint/build metadata — `DROP`

**Exact object:** `cargo` build/check output and invalidation correctness for a fixed package graph. **Information:** manifests, source/dependency files, toolchain/config and existing target state. **Full cost:** fingerprint/mtime/dependency comparison, rustc invocation, artifact/index I/O and final diagnostics/artifacts. Current upstream material documents `.fingerprint`, dependencies/build-script layout, `-C incremental` boundaries, and the fingerprint logic’s output/dependency and dep-info/source mtime comparisons. The post-compiler residual is metadata invalidation. Its candidate action was reweighting/choosing fingerprint or build-directory path handling, which is a controller/local implementation choice. A globally different construction would require a precise invalidation-soundness contract across filesystem semantics; it was not frozen. No DROP is based on unavailability of a trace or implementation.

### Btrfs checksum / metadata tree — `DROP`

**Exact object:** Btrfs read/write/scrub result under CoW, data-and-metadata checksum and fault-tolerance semantics. **Information:** extent/metadata tree and block data; **full cost:** data I/O, tree operations, checksum calculation/verification, persistence and repair path. Official Btrfs documentation lists checksums on data and metadata, online scrub, read/write metadata verification, indexed directories and CoW structures. The residual after fast data path is checksum/tree metadata work. The reviewed actions—checksum algorithm selection, scrub/cache policy and tree traversal scheduling—are controllers/configuration. A modified checksum/tree layout would alter on-disk/repair guarantees. No same-format whole construction plus finite fidelity closure was identified.

## Bounded screens

| Family | Disposition |
|---|---|
| XFS metadata checksum | `NOT_ADMITTED_UNFROZEN`: exact filesystem/repair invariant plus union-external metadata construction not jointly frozen. |
| Bazel action cache | `STRUCTURAL_DROP`: cache eviction/lookup policy is controller; changed action identity risks build correctness. |
| Nix narinfo metadata | `STRUCTURAL_DROP`: catalog/cache selection, or a changed store protocol. |
| HDFS NameNode metadata | `NOT_ADMITTED_UNFROZEN`: namespace consistency and a finite same-object construction not frozen. |
| ext4 journal checksum | `STRUCTURAL_DROP`: checksum/journal policy or changed recovery/on-disk contract. |

## Integrity and conclusion

Deep rows use first-party source/spec/release material and freeze the final object, information set and full-cost denominator. Bounded screens do not claim implementation absence. Natural carriers are available in principle (Iceberg test tables, LLVM/Cargo suites, Btrfs selftests/images), but no StageA killer can be defined before a whole-action gap exists. Missing implementation, positive results, resources, downloads or AI readiness did not cause any DROP. No experiment, benchmark, large download, automation, Stage0/A/B or shared control mutation occurred.

`PROPOSE_STAGE0: []`; handoff state `IDLE_REUSABLE_AWAITING_MAINLINE`.
