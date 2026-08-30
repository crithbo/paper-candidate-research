# RUST-HISTORY-AWARE-CGU-PARTITION — Version-history-aware monomorphization partitioning

## 中文摘要

- 研究机会：当前 rustc 在单体化收集后将 mono items 分入 CGU；官方开发文档说明，其增量策略为每个源码模块形成稳定（非泛型）与易变（单体化/特化）单元。公开 crate 版本链可提供比这个二分更细的、可反证的 item/change-cohort 结构。
- 为什么可能值得做：在固定 crate、features、target、Cargo profile 与程序 ABI/行为下，提出一个 **history-aware CGU partitioner**：对单体化 item 的 predecessor-window volatility、跨 crate instantiation 复用和当前 usage graph 做受约束分区，以最小化下一版本的预期重编译成本，同时限制 CGU 数、预计 LLVM 工作量和代码质量风险。它改变的是 compiler 内 `collect_and_partition_mono_items` 的 whole partition，而非选择 `codegen-units` 参数或复用缓存。
- 保留理由：当前 source 已冻结固定 partitioning hook、符号唯一性和 deterministic output-CGU ordering；公开文档暴露 `-C codegen-units`、incremental、LTO 和 profile 覆盖，但在本次有界 current-source/documentation 检索中未找到“以版本历史的 item volatility 作为 partition objective”的 current action。此为 `SEARCH_BOUNDED_OPEN`，不是首次声明。
- 下一步：Stage0 独立复核 direct collision。StageA 以20–50个 checksum-pinned crate 邻接版本，在固定 rustc/target/profile 下检验规律、静态 legality 及 full-cost Pareto。

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origins: `O3`
- Domain tags: Rust compiler; incremental compilation; monomorphization; code generation units
- Contribution route: `N2`, conditional `N3`
- Discovery date: 2026-08-14
- Discovery method revision: `V8_7_POTENTIAL_READINESS_SEPARATED`
- Discovery claim-pack mode: `OFF`
- Opportunity family ID: `RUST_CRATE_STRUCTURE_VERSIONED_CORPUS__CODEGEN_UNIT_OR_MONOMORPHIZATION_COST_MODEL__OFFLINE_COMPILER_DECISION`
- Contribution type: `COMPILER_TOOL`
- Local audit coordinates: `A2`, `C2`, `D2`, `E1`

## Research question

For checksum-pinned adjacent crate versions, can a history-aware constrained partition of rustc mono items into legal CGUs reduce full incremental rebuild cost without changing source behavior, ABI, or target/profile, and without losing the current partitioner’s code-quality boundary?

## Canonical research claim package

- Exact object and same-function/protocol/quality contract: the same crate source/version, Cargo features, dependency lockfile, rustc release/commit, target, profile, ABI and test-observable behavior; no changed reader, program, runtime input or profile-guided information.
- Natural/canonical scenario: 20–50 public crates with immutable `.crate` checksums and at least three adjacent released versions; train on predecessor windows, hold out later versions.
- Estimand/confounds: item-level volatility and cross-crate instantiation reuse conditional on crate size, modules, generic density, feature set, dependency lockfile, rustc/LLVM version, target, profile, LTO and incremental setting. Stable law threshold: held-out lower 95% confidence bound for within-cohort change concentration exceeds a stratum-preserving shuffled baseline by predeclared margin; otherwise no N3 claim.
- Intervention and atomic action: replace the fixed placement objective inside `rustc_monomorphize::partitioning::collect_and_partition_mono_items` with constrained weighted partitioning of the collected `MonoItem`/usage graph. Every item remains emitted exactly once, target-specific checks and distinct-symbol checks remain unchanged, and output CGUs remain deterministically named/sorted.
- Mechanism: predecessor volatility predicts which mono items invalidate together. Separating high-volatility from historically stable but import-coupled items can preserve reusable CGUs while bounding work imbalance; the current stable/volatile binary split has no history-weighted objective.
- Information: only prior released crate sources, their checksums/lockfiles, current source graph and the fair baseline’s inputs; no runtime profile or future source information.
- Named comparator: current rustc partitioner at stock profile defaults plus an equally informed grid over `codegen-units`, incremental and LTO legal configurations; generic PGO is excluded because its extra runtime profile information is unavailable to both sides.
- Expected effect/guarantee: exact preservation of item coverage, symbol uniqueness and observable program semantics. Algorithmic target is an exact solver for the frozen module-local bounded-CGU subproblem (or approximation with stated bound), under hard CGU-count/estimated-size constraints; performance is a falsifiable Pareto hypothesis, not a result.
- Full-cost: clean build and adjacent rebuild wall/CPU, peak RSS, incremental-cache/Cargo-target disk, temporary bytes, produced artifact size, link time, cold-start and representative runtime; include partition-analysis time and all compile phases.
- Failure/no-gain: drop if historical structure is unstable on holdout, action violates rustc legality/determinism, current union matches it, partition analysis consumes savings, or no predeclared full-cost Pareto region exists.

## Named fair baselines and current-union reality

Current source/documentation pin: rustc 1.97.1 documentation released 2026-07-14 and nightly rustdocs carrying `collect_and_partition_mono_items` (2026-06-11 snapshot), checked 2026-08-14.

| Union element | Source/flags | Why it is included |
|---|---|---|
| Current mono collection/partitioning | `rustc_monomorphize::partitioning::collect_and_partition_mono_items`; `rustc_codegen_ssa::base` consumes its `MonoItemPartitions` | Native whole-CGU constructor; collector and target-specific checks must stay. |
| CGU count | `-C codegen-units`; Cargo `profile.*.codegen-units`; defaults 16 nonincremental/256 incremental | Current deployable compile-time/code-quality tradeoff. |
| Incremental construction | `-C incremental`; Cargo `profile.*.incremental` | Legal current reuse baseline; not a disqualifying cache wrapper. |
| LTO/optimization | `-C lto`, `profile.*.lto`, `-C opt-level`, Cargo profile overrides | Must hold code-quality/compile-cost conditions fairly. |
| Flags/config contrary evidence | environment profile overrides including `CARGO_PROFILE_<name>_CODEGEN_UNITS`, `..._INCREMENTAL`, `..._LTO`, `..._OPT_LEVEL` | These allow count/mode selection, but do not by themselves establish history-weighted item placement. |

Current sources: <https://rustc-dev-guide.rust-lang.org/backend/monomorph.html>, <https://doc.rust-lang.org/stable/nightly-rustc/src/rustc_monomorphize/partitioning.rs.html>, <https://doc.rust-lang.org/stable/nightly-rustc/rustc_codegen_ssa/index.html>, <https://doc.rust-lang.org/stable/rustc/codegen-options/index.html>, <https://doc.rust-lang.org/cargo/reference/profiles.html>, <https://doc.rust-lang.org/cargo/reference/config.html>.

## Minimal action-divergence witness

Consider one source module whose current volatile CGU contains two generic instantiations `g<A>` and `g<B>`. In the pinned predecessor window, `g<A>` changes whenever a dependency API changes while `g<B>` is stable and shares no required codegen-time placement constraint with `g<A>`. Current CGU-count tuning changes the number of available units but does not name this predecessor-conditioned split as a decision. The proposed constructor places them in separate, deterministically named legal CGUs subject to current size/count and unique-symbol constraints. This witness is invalid if the current source already makes exactly this historical-cost placement; that is the first StageA source/legality killer.

## Competing mechanisms

- A — current stable/volatile module partition plus `codegen-units` count is sufficient; then the candidate is absorbed.
- B — predecessor change concentration is explained entirely by crate size/features/dependency churn; then no N3 regularity supports the weighted objective.
- C — the analysis is a generic cache controller; excluded because the candidate changes compiler CGU construction before cache reuse and charges construction/rebuild cost.

## Current collision classification

- `DIRECT_FATAL`: not found within bounded official source/docs and primary Rust compiler literature search.
- `DIRECT_SUBTRACT`: current stable/volatile partitioning, CGU-count, incremental and LTO actions are mandatory union components.
- `METHODOLOGICAL_ADJACENT`: generic graph partitioning and incremental compilation literature.
- `DEPLOYMENT_BASELINE`: Cargo/rustc profile defaults and legal nondefault grid.
- `SEARCH_BOUNDED_OPEN`: no current-source claim of global novelty.

## Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`
- Finite carrier route: select 20–50 crate version triplets using crates.io package checksums and Cargo lockfiles; record archive SHA-256, crate/version, rustc commit, target and profile. No corpus was downloaded in Discovery.
- Legality oracle: stock rustc compilation, link, test suite and symbol/ABI checks; compare item coverage, CGU deterministic names and distinct-symbol checks before any performance claim.
- 72-hour killer: (1) pin current partitioning.rs; (2) validate the two-item controlled witness; (3) compute predecessor-window features on a bounded sample; (4) build current and proposed partitioner under identical configurations. Stop this mechanism if legality/equivalence fails, the law fails holdout, current union reproduces the action, or all predeclared full-cost strata lack Pareto benefit.
- Claim ceiling: no positive law, speedup, runtime effect, or approximation guarantee has been measured yet.

## Q2 sufficiency hypothesis

At minimum, this can form a compiler-tool paper if it supplies (i) a reproducible cross-version crate law, (ii) a complete legal CGU partitioning algorithm with analysis/guarantee, and (iii) full-cost comparisons against current rustc/Cargo union. It is Tier B until Stage0 verifies novelty and StageA verifies the law/action/benefit. It is not ordinary tuning: the decision variable is the membership of individual mono items in legal CGUs under history-weighted constraints, rather than an exposed scalar profile knob.
