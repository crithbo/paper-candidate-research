# Candidate-grade deep review — UOF-220-01

## Same-object contract

Input is the complete set of package payload file paths and qualified package identities for one fixed Debian snapshot/suite/component/architecture.  Output is a valid Contents index whose path→qualified-package-list relation is identical to that input.  The stock query oracle is an apt-file Contents search, with a second semantic oracle that parses rows according to the Debian repository-format table and compares the normalized relation.  This excludes changed package semantics, a different search task, deltas, a cache, and a compressor-only result.

## Current-upstream reality check (cutoff 2026-08-11)

| facet | current first-party record | union implication / contrary evidence |
|---|---|---|
| Repository object | Debian's current repository-format page defines `Contents-$SARCH.gz` as an optional two-column filename→qualified-package-list index; `Release`/`InRelease` supplies index hashes and sizes. | Output legality and natural version hash route are clear; it does **not** prescribe a unique writer representation. |
| Reader | current unstable apt-file manpage defines `search`, `list-indices`, `Acquire::IndexTargets`, optional Contents defaults, `--index-names`, and a header-parser config. | Any proposal must preserve stock reader search results under its configured Contents target; contrary evidence to an assumed fixed parser/order. |
| General constructor | current Debian apt source package `apt` 3.0.3 and current trixie `apt-ftparchive(1)` expose `contents`/`generate`, `--contents`, `--arch`, config options, cache database and generation of compressed outputs. | Existing full constructor includes scan/generation, configurable output compression and caching.  No claim is made that it lacks any specific factorization action. |
| Archive constructor | official dak project describes itself as the Debian Archive Kit that runs the Debian archive. | Current project master is a relevant strongest producer; exact deployed commit, all config, and all publication paths were not frozen.  Therefore the union is incomplete. |
| Delivery/update | repository format specifies `by-hash` and optional index-diff history/patches. | A transport-only/delta improvement is absorbed/excluded, not N3. |

No absence claim is used.  In particular, neither the apt documentation nor a prior issue establishes that current dak/apt lacks the contemplated global construction.  The review records the opposing evidence: `apt-ftparchive` already has a complete, configurable Contents-generation path and caches file information; current APT also supports hashed and diff-based index delivery.

## Six-dimensional residual check

| dimension | frozen comparison | finding |
|---|---|---|
| decision rule | deterministic complete factorization/materialization versus current dak + apt-ftparchive-capable generation | candidate action is only conceptual; current production union incomplete |
| information condition | same complete normalized path→owner relation and release metadata | plausible, but no accepted representation contract is frozen |
| complexity / resources | build, update, query, storage, RSS and verifier time | denominator specified, not observed |
| quality / guarantee | identical normalized mapping and stock reader result | must be proven by parser/oracle; no witness yet |
| full cost | package/path extraction + constructor + compression + Release hash/signature + apt-file parse/query + storage/RSS | mandatory future denominator; no cherry-picked encoded-size metric |
| generalization / no-gain | chronological 20–50 snapshots, train/held-out blocks, component/architecture/suite controls | no controlled law has been observed in Discovery |

## Conditional N3 route and finite closure

If (and only if) the controlled held-out law remains after package-count, component, architecture, suite, cadence, sampling/retention and compression confounds, the N3 contribution could be a deterministic whole-relation factorization with identical lookup semantics.  It must be compared to the complete present union, including dak's deployed path and `apt-ftparchive` configurations, rather than a hand-written serial emitter.

**20–50 snapshot plan:** choose timestamp pairs at fixed weekly/monthly spacing across at least two suites/components and two architectures; fetch only Release/InRelease and the Release-selected Contents files in Stage A; record timestamp, URL, release signature verification, SHA-256, compressed and decoded size.  Split chronologically (not randomly) and hold out later blocks.  This plan is bounded but intentionally not executed here.

**72-hour Stage A killer:** stop the candidate if any of these occurs: (1) a controlled held-out block eliminates the law; (2) stock dak/apt configuration can reproduce the complete proposed action with same information/full cost; (3) relation equivalence or stock apt-file results differ; (4) factorization's build+update+query+storage/RSS cost does not beat or otherwise improve the frozen denominator; or (5) an exact production union cannot be frozen without changing the semantic object.  This is a finite falsifier, not a claimed result.

## Paper potential and readiness

- `structural_paper_potential`: conditional `TIER_B_Q2_VIABLE` only if the controlled law and union-external complete constructor survive; a format-size report is below threshold.
- `current_evidence_readiness`: low.  No natural pair has been acquired or measured; upstream production union and minimal action witness remain open.
- `decision`: `NOT_ADMITTED_UNFROZEN`; no `PROPOSE_STAGE0` brief is issued.
