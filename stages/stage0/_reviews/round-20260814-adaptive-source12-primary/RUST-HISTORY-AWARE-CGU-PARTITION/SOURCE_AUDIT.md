# Source Audit — Rust history-aware CGU partition

## Discovery inputs

| File | Expected SHA-256 | Result |
|---|---|---|
| brief | `0155C1D4809C6358F2BA282AEB72B455EF4AD759C6A7E7854BFFEC08EB50FBC7` | matched |
| collision matrix | `1D582E7C1B87AF3663DFB133A252F6A9CF1282CB96FC994DCF5A747F24279564` | matched |
| discovery log | `210597048EE599C44B65639AC95C008A5BEEBF359015AEBAA5C324BA99BD8088` | matched |
| handoff | `EDEF3DC129B4931B0B825BD7E7740CFF5490486E1FDB10EFF2EBF915010A04DC` | matched |

## Authoritative current sources

1. [rustc partitioning module](https://doc.rust-lang.org/stable/nightly-rustc/rustc_monomorphize/partitioning/index.html), 1.97.1 `8bab26f4`: a CGU is a named set of `(mono-item, linkage)` pairs and is the incremental-compilation partition object.
2. [nightly partitioning source](https://doc.rust-lang.org/nightly/nightly-rustc/src/rustc_monomorphize/partitioning.rs.html), 1.99.0 `09ee43b2`: confirms `collect_and_partition_mono_items`, target checks, partition/place/merge operations and native source locus.
3. [Rust compiler development guide](https://rustc-dev-guide.rust-lang.org/backend/monomorph.html): documents two CGUs per module for stable vs volatile code and cross-crate generic behavior.
4. [rustc codegen options](https://doc.rust-lang.org/rustc/codegen-options/): documents `codegen-units`, incremental and LTO tradeoffs/defaults.
5. [Cargo profiles](https://doc.rust-lang.org/cargo/reference/profiles.html) and [Cargo configuration](https://doc.rust-lang.org/cargo/reference/config.html): document profile and environment configuration action space.
6. [RFC 1298](https://rust-lang.github.io/rfcs/1298-incremental-compilation.html): incremental compilation design/subtractor.

## Independent collision result

`CURRENT_UNION_CONFIRMED__HISTORY_OBJECTIVE_NOT_DIRECTLY_COVERED__SEARCH_BOUNDED_OPEN`.

The current native partitioner, stable/volatile split, configuration alternatives and LTO/incremental settings are all retained as fair baselines. No first-party source reviewed expresses predecessor-window cohort information as a whole item-to-CGU objective. That does not prove no paper collision; it leaves a direct collision search bounded-open. Generic partitioning and cache methods are meaningful subtractors, and the revision must prevent them from swallowing the claimed N2.
